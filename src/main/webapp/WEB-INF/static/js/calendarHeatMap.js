// var data = [{
//     "date":"2023-04-10",
//     "total":"2"
// }, {
//     "date":"2023-04-09",
//     "total":"10"
// }, {
//     "date":"2023-03-11",
//     "total":"15"
// }, {
//     "date":"2023-04-05",
//     "total":"21"
// }]

/* globals d3 */

var calendarHeatmap = {

    settings: {
        gutter: 5,
        item_gutter: 1,
        width: 1000,
        height: 200,
        item_size: 10,
        label_padding: 40,
        max_block_height: 20,
        transition_duration: 500,
        tooltip_width: 250,
        tooltip_padding: 15,
    },


    /**
     * Initialize
     */
    init: function(data, container, color, handler) {
        // Set calendar data
        calendarHeatmap.data = data;

        // Set calendar container
        calendarHeatmap.container = container;

        // Set calendar color
        calendarHeatmap.color = color || '#16967A';

        calendarHeatmap.selected = {};

        // Set handler function
        calendarHeatmap.handler = handler;

        // No transition to start with
        calendarHeatmap.in_transition = false;

        // Create html elementsfor the calendar
        calendarHeatmap.createElements();

        // Draw the chart
        calendarHeatmap.drawYearOverview();
    },


    /**
     * Create html elements for the calendar
     */
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

            var dayIndex = Math.round((moment() - moment().subtract(1, 'year').startOf('week')) / 86400000);
            var colIndex = Math.trunc(dayIndex / 7);
            var numWeeks = colIndex + 1;

            calendarHeatmap.settings.width = container.offsetWidth < 1000 ? 1000 : container.offsetWidth;
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

    /**
     * Draw year overview
     */
    drawYearOverview: function() {
        // Define start and end date of the selected year
        var start_of_year = moment(calendarHeatmap.selected.date).startOf('year');
        var end_of_year = moment(calendarHeatmap.selected.date).endOf('year');

        // Filter data down to the selected year
        var year_data = calendarHeatmap.data.filter(function(d) {
            return start_of_year <= moment(d.date) && moment(d.date) < end_of_year;
        });

        // Calculate max value of the year data
        var max_value = d3.max(year_data, function(d) {
            return d.total;
        });

        var color = d3.scaleLinear()
            .range(['#ffffff', calendarHeatmap.color || '#16967A'])
            .domain([-0.15 * max_value, max_value]);

        var calcItemX = function(d) {
            var date = moment(d.date);
            var dayIndex = Math.round((date - moment(start_of_year).startOf('week')) / 86400000);
            var colIndex = Math.trunc(dayIndex / 7);
            return colIndex * (calendarHeatmap.settings.item_size + calendarHeatmap.settings.gutter) + calendarHeatmap.settings.label_padding;
        };
        var calcItemY = function(d) {
            return calendarHeatmap.settings.label_padding + moment(d.date).weekday() * (calendarHeatmap.settings.item_size + calendarHeatmap.settings.gutter);
        };
        var calcItemSize = function(d) {
            if (max_value <= 0) { return calendarHeatmap.settings.item_size; }
            return calendarHeatmap.settings.item_size * 0.75 + (calendarHeatmap.settings.item_size * d.total / max_value) * 0.25;
        };

        calendarHeatmap.items.selectAll('.item-circle').remove();
        calendarHeatmap.items.selectAll('.item-circle')
            .data(year_data)
            .enter()
            .append('rect')
            .attr('class', 'item item-circle')
            .style('opacity', 0)
            .attr('x', function(d) {
                return calcItemX(d) + (calendarHeatmap.settings.item_size - calcItemSize(d)) / 2;
            })
            .attr('y', function(d) {
                return calcItemY(d) + (calendarHeatmap.settings.item_size - calcItemSize(d)) / 2;
            })
            .attr('rx', function(d) {
                return calcItemSize(d);
            })
            .attr('ry', function(d) {
                return calcItemSize(d);
            })
            .attr('width', function(d) {
                return calcItemSize(d);
            })
            .attr('height', function(d) {
                return calcItemSize(d);
            })
            .attr('fill', function(d) {
                return (d.total > 0) ? color(d.total) : 'transparent';
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
        var month_labels = d3.timeMonths(start_of_year, end_of_year);
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
                return d.toLocaleDateString('en-us', { month: 'short' });
            })
            .attr('x', function(d, i) {
                return monthScale(i) + (monthScale(i) - monthScale(i - 1)) / 2;
            })
            .attr('y', calendarHeatmap.settings.label_padding / 2);

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
                calendarHeatmap.items.selectAll('.item-circle')
                    .transition()
                    .duration(calendarHeatmap.settings.transition_duration)
                    .ease(d3.easeLinear)
                    .style('opacity', function(d) {
                        return (moment(d.date).day() === selected_day.day()) ? 1 : 0.1;
                    });
            })
            .on('mouseout', function() {
                if (calendarHeatmap.in_transition) { return; }

                calendarHeatmap.items.selectAll('.item-circle')
                    .transition()
                    .duration(calendarHeatmap.settings.transition_duration)
                    .ease(d3.easeLinear)
                    .style('opacity', 1);
            });
    }
};