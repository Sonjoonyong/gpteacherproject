<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리 페이지</title>

    <link rel="stylesheet" href="/css/base.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>

    .select-container {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
        height: 100px;
    }

    .select-container .form-select {
        width: 280px;
        font-size: 30px;
        border: 0.1px solid #2F4858;
        border-radius: 5px;
        padding: 5px 10px;
        color: white;
        text-align: center;
        background-color: #716FAA;
    }

    .wrapper {
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 5px;
        margin-bottom: 50px;
    }

    .table-hover thead th {
        font-size: 16px;
        font-weight: bold;
        background-color: #716FAA;
        color: white;
        padding: 8px;
    }

</style>
    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/adminMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h1 class="h3 my-5" style="color: #716FAA;">사용자 통계</h1>
                <div class="wrapper">
                    <div class="select-container">
                        <select id="chartSelector" class="form-select mb-4">
                            <option value="monthly" selected>월별 가입자 분석</option>
                            <option value="ageGroup">연령별 사용자 분석</option>
                        </select>
                    </div>

                    <div id="monthlyUserAnalysis" class="chart-container">
                        <div>
                            <canvas id="monthlyUserCountsChart" width="400" height="200"></canvas>
                        </div>
                        <table class="table table-hover" style="margin-top: 50px">
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

                    </div>

                    <div id="ageGroupAnalysis" class="chart-container" style="display:none;">
                        <div>
                            <canvas id="ageGroupCountsChart" width="400" height="200"></canvas>
                        </div>
                        <table class="table table-hover" style="margin-top: 50px">
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
                    </div>
                </div>
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<script>
    // 막대 그래프
    const monthlyUserCounts = JSON.parse('${monthlyUserCountsJson}');

    const sortedMonthlyUserCounts = monthlyUserCounts.sort((a, b) => {
        if (a.year === b.year) {
            return a.month - b.month;
        }
        return a.year - b.year;
    });

    const filledMonthlyUserCounts = [];
    const currentYear = new Date().getFullYear();
    for (let year = sortedMonthlyUserCounts[0].year; year <= currentYear; year++) {
        for (let month = 1; month <= 12; month++) {
            const existingMonthData = sortedMonthlyUserCounts.find(item => item.year === year && item.month === month);
            if (existingMonthData) {
                filledMonthlyUserCounts.push(existingMonthData);
            } else {
                filledMonthlyUserCounts.push({ year: year, month: month, count: 0 });
            }
        }
    }

    const uniqueMonthsSet = new Set();
    filledMonthlyUserCounts.forEach(({ month }) => uniqueMonthsSet.add(month));
    const monthlyUserCountsLabels = Array.from(uniqueMonthsSet).sort((a, b) => a - b);
    const monthlyUserCountsData = filledMonthlyUserCounts.map(({ count }) => count);

    const ctx1 = document.getElementById('monthlyUserCountsChart').getContext('2d');
    const monthlyUserCountsChart = new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: monthlyUserCountsLabels,
            datasets: [{
                label: '월별 가입자',
                data: monthlyUserCountsData,
                backgroundColor: '#CFEAE2',
                borderColor: '#5DB99D',
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

    const chartSelector = document.getElementById('chartSelector');
    const monthlyUserAnalysis = document.getElementById('monthlyUserAnalysis');
    const ageGroupAnalysis = document.getElementById('ageGroupAnalysis');

    chartSelector.addEventListener('change', (e) => {
        if (e.target.value === 'monthly') {
            monthlyUserAnalysis.style.display = 'block';
            ageGroupAnalysis.style.display = 'none';
        } else {
            monthlyUserAnalysis.style.display = 'none';
            ageGroupAnalysis.style.display = 'block';
        }
    });
</script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>
