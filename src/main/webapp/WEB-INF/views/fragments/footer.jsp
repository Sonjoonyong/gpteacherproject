<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .footer-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
    }

    .copyright {
        text-align: center;
        flex-grow: 1;
        margin-left: 92px;
    }

    .footer-button-container {
        text-align: right;
    }

</style>
<!-- Footer -->
<footer class="border-top dark-mode">
    <div class="container">
        <div class="row">
            <div class="col-12 mt-3 text-center">
                <img src="/images/logo.png" height="50px">
            </div>

            <div class="col-12 footer-content">
                <div class="copyright">
                    © 2023 Copyright:
                    <a id="suaandaje" class="dark-mode-text" href="#">수아와아재들</a><br/>
                    <a>All Rights Reserved.</a>
                </div>
                <div class="footer-button-container">
                    <button id="dark-mode-toggle">Dark Mode</button>
                </div>
            </div>
        </div>
    </div>
</footer>