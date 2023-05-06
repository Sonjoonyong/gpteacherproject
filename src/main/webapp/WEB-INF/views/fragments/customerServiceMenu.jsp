<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--사이드바-->
<div class="col-md-3" id="sidebar">
    <div class="row text-center" style="margin-top: 57px;margin-left: -71px;"><h3>고객센터</h3></div>
    <div class="row" style="margin-top: 15px;">
        <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button " id="noticeMenu" type="button" onclick="location.href='${pageContext.request.contextPath}/help/notice/list'">
                        공지사항
                    </button>
                </h2>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button " id="faqMenu" type="button" onclick="location.href='${pageContext.request.contextPath}/help/faq/list'">
                        자주 묻는 질문
                    </button>
                </h2>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button " id="questionMenu" type="button" onclick="location.href='${pageContext.request.contextPath}/help/question/list'">
                        문의 사항
                    </button>
                </h2>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const currentURL = window.location.href;
        let selectMenu = document.getElementById('questionMenu');

        if (currentURL.includes('notice')) {
            selectMenu = document.getElementById('noticeMenu');
        } else if(currentURL.includes('faq')) {
            selectMenu = document.getElementById('faqMenu');
        }

        selectMenu.style.backgroundColor = '#CFEAE2';
    });
</script>