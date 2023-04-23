//참고 문서 : https://github.com/g1eb/calendar-heatmap
var calendarHeatmap = {

    settings: {
        gutter: 3,
        width: 800,
        height: 200,
        item_size: 10,
        label_padding: 40,
        transition_duration: 500
    },

    init: function(data) {
        calendarHeatmap.data = data;            // Set calendar data
        calendarHeatmap.container = 'calendar'; // Set calendar container
        calendarHeatmap.color = '#16967A';      // Set calendar color
        calendarHeatmap.in_transition = false;  // No transition to start with

        calendarHeatmap.createElements();       // Create html elements for the calendar

        calendarHeatmap.drawYearOverview();     // Draw the chart
    },

    createElements: function() {
        if (calendarHeatmap.container != null) {
            // Access container for calendar
            var container = document.getElementById(calendarHeatmap.container);
            if (!container || container.tagName != "DIV") {
                throw 'Element not found or not of type div';
            }
            if (!container.classList.contains('calendar-heatmap')) {
                //If the element being passed doesn't have the right class set then set it.
                container.classList.add('calendar-heatmap');
            }
        } else {
            // Create main html container for the calendar
            var container = document.createElement('div');
            container.className = 'calendar-heatmap';
            document.body.appendChild(container);
        }

        // Create svg element
        var svg = d3.select(container).append('svg')
            .attr('class', 'svg');

        // Create other svg elements
        calendarHeatmap.items = svg.append('g');
        calendarHeatmap.labels = svg.append('g');

        // Calculate dimensions based on available width
        var calcDimensions = function() {

            var dayIndex = Math.round((moment() - moment().subtract(1, 'year').startOf('week')) / 86400000); //총 일 수
            var colIndex = Math.trunc(dayIndex / 7);
            var numWeeks = colIndex + 1; //총 주 수

            calendarHeatmap.settings.width = container.offsetWidth;// > 1000 ? 1000 : container.offsetWidth;
            calendarHeatmap.settings.item_size = ((calendarHeatmap.settings.width - calendarHeatmap.settings.label_padding) / numWeeks - calendarHeatmap.settings.gutter);
            calendarHeatmap.settings.height = calendarHeatmap.settings.label_padding + 7 * (calendarHeatmap.settings.item_size + calendarHeatmap.settings.gutter);
            svg.attr('width', calendarHeatmap.settings.width)
                .attr('height', calendarHeatmap.settings.height);

            calendarHeatmap.drawYearOverview();

        };
        calcDimensions();

        window.onresize = function(event) {
            calcDimensions();
        };
    },

    drawYearOverview: function() {
        // Define start and end date
        var start_of_year = moment().subtract(1, 'year').startOf('week').toDate(); //1년전 오늘이 있는 주의 일요일부터
        var end_of_year = moment().endOf('day').toDate(); //오늘까지
        console.log(start_of_year);
        // Filter data down to the selected year
        var year_data = calendarHeatmap.data.filter(function(d) {
            return start_of_year <= moment(d.date) && moment(d.date) < end_of_year;
        });

        // Calculate max value of the year data
        var max_value = d3.max(year_data, function(d) {
            return d.total;
        });

        var color = d3.scaleLinear()
            .range(['#c5e5de', calendarHeatmap.color || '#16967A'])
            .domain([1, max_value]);

        var calcItemX = function(d) { //좌표상 x 구하기
            var date = moment(d.date);
            var dayIndex = Math.round((date - moment(start_of_year).startOf('week')) / 86400000);
            var colIndex = Math.trunc(dayIndex / 7);
            return colIndex * (calendarHeatmap.settings.item_size + calendarHeatmap.settings.gutter) + calendarHeatmap.settings.label_padding;
        };
        var calcItemY = function(d) {
            return calendarHeatmap.settings.label_padding + moment(d.date).weekday() * (calendarHeatmap.settings.item_size + calendarHeatmap.settings.gutter);
        };
        var calcItemSize = function() {
            return calendarHeatmap.settings.item_size;
        };

        //calendarHeatmap.items.selectAll('.item-rect').remove();
        calendarHeatmap.items.selectAll('.item-rect')
            .data(year_data)
            .enter()
            .append('rect')
            .attr('class', 'item item-rect')
            .style('opacity', 0)
            .attr('x', function(d) {
                return calcItemX(d) + (calendarHeatmap.settings.item_size - calcItemSize()) / 2;
            })
            .attr('y', function(d) {
                return calcItemY(d) + (calendarHeatmap.settings.item_size - calcItemSize()) / 2;
            })
            .attr('width', function() {
                return calcItemSize();
            })
            .attr('height', function() {
                return calcItemSize();
            })
            .attr('rx', 2)
            .attr('ry', 2)
            .attr('fill', function(d) {
                return (d.total == 0 || d == null) ? '#f3f3f3' : color(d.total);
            })
            .transition()
            .delay(function() {
                return (Math.cos(Math.PI * Math.random()) + 1) * calendarHeatmap.settings.transition_duration;
            })
            .duration(function() {
                return calendarHeatmap.settings.transition_duration;
            })
            .ease(d3.easeLinear)
            .style('opacity', 1)
            .call(function(transition, callback) {
                if (transition.empty()) {
                    callback();
                }
                var n = 0;
                transition
                    .each(function() {++n; })
                    .on('end', function() {
                        if (!--n) {
                            callback.apply(this, arguments);
                        }
                    });
            }, function() {
                calendarHeatmap.in_transition = false;
            });

        // Add month labels
        var month_labels = d3.timeMonths(moment(start_of_year).startOf('month'), end_of_year);
        console.log(month_labels);
        var monthScale = d3.scaleLinear()
            .range([0, calendarHeatmap.settings.width])
            .domain([0, month_labels.length]);
        calendarHeatmap.labels.selectAll('.label-month').remove();
        calendarHeatmap.labels.selectAll('.label-month')
            .data(month_labels)
            .enter()
            .append('text')
            .attr('class', 'label label-month')
            .attr('font-size', function() {
                return Math.floor(calendarHeatmap.settings.label_padding / 3) + 'px';
            })
            .text(function(d) {
                return d.toLocaleDateString('ko-KR', { month: 'long' });
            })
            .attr('x', function(d, i) {
                return monthScale(i) + (monthScale(i) - monthScale(i - 1)) / 2;
            })
            .attr('y', calendarHeatmap.settings.label_padding / 2)
            .on('mouseenter', function(d) {
                if (calendarHeatmap.in_transition) { return; }

                var selected_month = moment(d);
                calendarHeatmap.items.selectAll('.item-rect')
                    .transition()
                    .duration(calendarHeatmap.settings.transition_duration)
                    .ease(d3.easeLinear)
                    .style('opacity', function(d) {
                        return moment(d.date).isSame(selected_month, 'month') ? 1 : 0.1;
                    });
            })
            .on('mouseout', function() {
                if (calendarHeatmap.in_transition) { return; }

                calendarHeatmap.items.selectAll('.item-rect')
                    .transition()
                    .duration(calendarHeatmap.settings.transition_duration)
                    .ease(d3.easeLinear)
                    .style('opacity', 1);
            });

        // Add day labels
        var day_labels = d3.timeDays(moment().startOf('week'), moment().endOf('week'));
        var dayScale = d3.scaleBand()
            .rangeRound([calendarHeatmap.settings.label_padding, calendarHeatmap.settings.height])
            .domain(day_labels.map(function(d) {
                return moment(d).weekday();
            }));
        calendarHeatmap.labels.selectAll('.label-day').remove();
        calendarHeatmap.labels.selectAll('.label-day')
            .data(day_labels)
            .enter()
            .append('text')
            .attr('class', 'label label-day')
            .attr('x', calendarHeatmap.settings.label_padding / 3)
            .attr('y', function(d, i) {
                return dayScale(i) + dayScale.bandwidth() / 1.75;
            })
            .style('text-anchor', 'left')
            .attr('font-size', function() {
                return Math.floor(calendarHeatmap.settings.label_padding / 3) + 'px';
            })
            .text(function(d) {
                return moment(d).format('dddd')[0];
            })
            .on('mouseenter', function(d) {
                if (calendarHeatmap.in_transition) { return; }

                var selected_day = moment(d);
                calendarHeatmap.items.selectAll('.item-rect')
                    .transition()
                    .duration(calendarHeatmap.settings.transition_duration)
                    .ease(d3.easeLinear)
                    .style('opacity', function(d) {
                        return (moment(d.date).day() === selected_day.day()) ? 1 : 0.1;
                    });
            })
            .on('mouseout', function() {
                if (calendarHeatmap.in_transition) { return; }
            });
    }
};