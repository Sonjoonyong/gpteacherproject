<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 학습이력</title>

    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/calendarHeatMap.css">

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h3 class="h3 my-5" style="color: #5DB99D;">학습 관리</h3>
            <div>
                <h4 class="my-3" style="color: #2F4858">최근 학습</h4>
                <c:forEach var="learning" items="${learnings}">
                    <div class="row p-2 sentence justify-content-center">
                        <div class="row g-0 learning my-1 align-items-end justify-content-between shadow rounded-3 p-3" id="learning_${learning.id}">
                            <div class="row">
                                <div class="row col-12 col-md-4">
                                    <div class="col-10 col-md-5 fw-bold" style="color: #2A6976">${learning.learningType}</div>
                                    <c:if test="${not empty learning.learningTestType}">
                                        <div class="col-10 col-md-4 fw-bold rounded-1" style="color: #ffffff; background-color: darkcyan">${learning.learningTestType}</div>
                                    </c:if>
                                </div>
                                <div class="col-12 col-md-6" style="color: #373737">
                                    <fmt:formatDate value="${post.communityPostWritedate}" pattern="yyyy.MM.dd"/>
                                </div>
                                <div class="col-12 col-md-2">
                                    <div class="row g-0">
                                        <button class="col-1 col-md-5 btn ms-md-auto" onclick="toggleLearningLikeAjax(this)">
                                            <i class="like bi bi-heart${not empty learning.learningLike && learning.learningLike == '1'.charAt(0) ? '-fill' : ''}"></i>
                                        </button>

                                        <button class="col-1 col-md-5 btn" onclick="toggleLearningDeleteAjax(this)">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row rounded-2 px-3 py-2 my-3 shadow" style="color: #7054ff; background-color: #7B61FF30">
                                <div class="col-10 col-md-2"> Question </div>
                                <div class="col-10 col-md-8">"${learning.learningTopic}"</div>
                            </div>
                            <div class="row">
                                <div class="col-10 col-md-4" style="color: rgb(35, 28, 181);">
                                    <c:if test="${not empty learning.averageAccuracy}">
                                        평균 발음 정확도: ${learning.averageAccuracy}%
                                    </c:if>
                                </div>
                                <div class="col-10 col-md-4" style="color: rgb(35, 28, 181);">
                                    문장수: ${learning.sentenceCount}
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div>
                <h4 class="my-3" style="color: #2F4858">연간 학습</h4>
                <div id="calendar"></div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<script src="/js/toggleLikeAjax.js"></script>
<script src="/js/toggleDeleteAjax.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.10.2/d3.min.js" charset="utf-8"></script>
<script src="/js/calendarHeatMap.js"></script>

<script>
    (function () {
        // Initialize random data for the demo
        var now = moment().endOf('day').toDate();
        var time_ago = moment().startOf('day').subtract(10, 'year').toDate();
        var example_data = d3.timeDays(time_ago, now).map(function (dateElement, index) {
            return {
                date: dateElement,
                details: Array.apply(null, new Array(Math.floor(Math.random() * 15))).map(function(e, i, arr) {
                    return {
                        'name': 'Project ' + Math.ceil(Math.random() * 10),
                        'date': function () {
                            var projectDate = new Date(dateElement.getTime());
                            projectDate.setHours(Math.floor(Math.random() * 24));
                            projectDate.setMinutes(Math.floor(Math.random() * 60));
                            return projectDate;
                        }(),
                        'value': 3600 * ((arr.length - i) / 5) + Math.floor(Math.random() * 3600) * Math.round(Math.random() * (index / 365))
                    }
                }),
                init: function () {
                    this.total = this.details.reduce(function (prev, e) {
                        return prev + e.value;
                    }, 0);
                    return this;
                }
            }.init();
        });

        // Set the div target id
        var div_id = 'calendar';

        // Set custom color for the calendar heatmap
        var color = '#16967A';

        // Handler function
        var print = function (val) {
            console.log(val);
        };

        // Initialize calendar heatmap
        calendarHeatmap.init(example_data, div_id, color, print);
    })();
</script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>
</body>
</html>
