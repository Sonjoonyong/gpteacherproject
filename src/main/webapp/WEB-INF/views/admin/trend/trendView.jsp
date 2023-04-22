<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>User Trends</title>

    <link rel="stylesheet" href="/css/base.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>
</head>
<body>

<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/adminMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h1 class="h3 my-5" style="color: #5DB99D;">사용자 통계</h1>

            <h2 class="my-3" style="color: #2F4858;">월별 사용자 분석</h2>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>년도</th>
                    <th>월</th>
                    <th>가입자</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${monthlyUserCounts}" var="monthlyUserCount">
                    <tr>
                        <td>${monthlyUserCount.year}</td>
                        <td>${monthlyUserCount.month}</td>
                        <td>${monthlyUserCount.count}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div>
                <canvas id="monthlyUserCountsChart" width="400" height="200"></canvas>
            </div>
            <h2 class="my-3" style="color: #2F4858;">연령별 사용자 분석</h2>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>연령대</th>
                    <th>사용자</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ageGroupCounts}" var="ageGroupCount">
                    <tr>
                        <td>${ageGroupCount.ageGroup}</td>
                        <td>${ageGroupCount.count}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div>
                <canvas id="ageGroupCountsChart" width="400" height="200"></canvas>
            </div>
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<script>
    // 막대 그래프
    const monthlyUserCounts = JSON.parse('${monthlyUserCountsJson}');
    const monthlyUserCountsLabels = monthlyUserCounts.map(({ year, month }) => `${year}-${month}`);
    const monthlyUserCountsData = monthlyUserCounts.map(({ count }) => count);

    const ctx1 = document.getElementById('monthlyUserCountsChart').getContext('2d');
    const monthlyUserCountsChart = new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: monthlyUserCountsLabels,
            datasets: [{
                label: '월별 가입자',
                data: monthlyUserCountsData,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // 원 그래프
    const ageGroupCounts = JSON.parse('${ageGroupCountsJson}');
    const ageGroupCountsLabels = ageGroupCounts.map(({ ageGroup }) => ageGroup);
    const ageGroupCountsData = ageGroupCounts.map(({ count }) => count);

    const ctx2 = document.getElementById('ageGroupCountsChart').getContext('2d');
    const ageGroupCountsChart = new Chart(ctx2, {
        type: 'pie',
        data: {
            labels: ageGroupCountsLabels,
            datasets: [{
                data: ageGroupCountsData,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        }
    });
</script>
