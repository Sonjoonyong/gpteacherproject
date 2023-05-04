<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Writing</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../../fragments/bootstrapCss.jsp" %>

    <style>
        .container {
            max-width: 768px;
        }

        .example {
            font-weight: lighter;
            background-color: #F4F2FF;
            color: #7B61FF;
            width: 600px;
            margin: 0 auto;
        }

        .divider {
            border-bottom: 1px solid rgba(0, 0, 0, 0.08);
            margin-top: 40px;
            margin-bottom: 40px;
        }

        .topic-button {
            margin-inline: 20px;
            border-radius: 20px;
            font-weight: bold;
            background-color: #E9E9E9;
            color: #373737;
            border: none;
            margin-top: 20px;
        }

        .topic-button.selected {
            background-color: #5DB99D;
            color: white;
        }
    </style>

</head>
<body>

<%@ include file="../../fragments/header.jsp" %>
<section class="container d-flex flex-column">
    <div class="row flex-grow-1 align-content-start">

        <h3 class="row d-flex justify-content-center" style="color: #5DB99D; margin-top: 15px; margin-bottom: 15px">TOPIC</h3>

        <form action="/learning/writing" method="post" id="customTopicForm" class="row d-flex justify-content-center">
            <div class="form-option text-center">
                <input type="hidden" name="topicType" value="customTopic">
                <label for="customTopic" class="text-center mb-2">주제를 직접 입력하여 글쓰기를 연습합니다.</label><br>
                <input type="text" id="customTopic" name="customTopic" placeholder="주제를 영어로 입력해주세요."
                       class="col-12 col-md-8 py-2 rounded-3 border mx-auto text-center" maxlength="300"
                       style="text-align: center; margin-top: 40px"/>
                <div class="text-center example" style="margin-top: 15px">ex) The effects of social media on mental
                    health
                    and interpersonal relationships.
                </div>
            </div>
            <div class="row justify-content-center mt-5">
                <input type="button" value="작성한 주제로 시작" onclick="checkProfanity(); return false;"
                       class="btn btn-success shadow my-3 border-0 py-2 rounded-3"
                       style="width: 200px; background-color: #5DB99D">
            </div>
        </form>

        <div class="divider"></div>

        <form action="/learning/writing" method="post" class="row d-flex justify-content-center">
            <div class="form-option text-center">
                <input type="hidden" name="topicType" value="predefinedTopic">
                <label class="text-center my-3">또는, 주제를 보기에서 선택하여 글쓰기를 연습합니다.</label><br>
                <input type="hidden" id="selectedTopic" name="predefinedTopic">
                <div class="mt-3">
                    <button type="button" id="politicsBtn" onclick="selectTopic('POLITICS')"
                            class="btn btn-outline-secondary topic-button">정치
                    </button>
                    <button type="button" id="societyBtn" onclick="selectTopic('SOCIETY')"
                            class="btn btn-outline-secondary topic-button">사회
                    </button>
                    <button type="button" id="economyBtn" onclick="selectTopic('ECONOMY')"
                            class="btn btn-outline-secondary topic-button">경제
                    </button>
                    <button type="button" id="entertainmentBtn" onclick="selectTopic('ENTERTAINMENT')"
                            class="btn btn-outline-secondary topic-button">연예
                    </button>
                    <button type="button" id="sportsBtn" onclick="selectTopic('SPORTS')"
                            class="btn btn-outline-secondary topic-button">스포츠
                    </button>
                </div>
                <div id="exampleTopics" class="text-center example mt-3"></div>
            </div>
            <div class="row justify-content-center mt-5">
                <input type="submit" value="선택한 주제로 시작" class="btn btn-success shadow my-3 border-0 py-2 rounded-3"
                       style="width: 200px; background-color: #5DB99D">
            </div>
        </form>

    </div>

    <div class="row">
        <div class="text-center" style="margin-top: 80px; margin-bottom: 40px">
            <img src="/images/step_first.png" alt="Step First" style="max-width: 100%;">
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    function selectTopic(topic) {
        var exampleDiv = document.getElementById('exampleTopics');
        var hiddenInput = document.getElementById('selectedTopic');
        var topicButtons = document.getElementsByClassName('topic-button');

        var exampleTopics = {
            'POLITICS': 'ex) How do political ideologies shape public policies?',
            'SOCIETY': 'ex) The impact of social networking on privacy and personal relationships.',
            'ECONOMY': 'ex) The role of central banks in managing inflation and economic growth.',
            'ENTERTAINMENT': 'ex) How the rise of independent filmmakers is changing the film industry.',
            'SPORTS': 'ex) The influence of technology on sports performance and training.'
        };

        exampleDiv.innerHTML = exampleTopics[topic];
        hiddenInput.value = topic;

        for (var i = 0; i < topicButtons.length; i++) {
            if (topicButtons[i].id === topic.toLowerCase() + 'Btn') {
                topicButtons[i].classList.add('selected');
            } else {
                topicButtons[i].classList.remove('selected');
            }
        }
    }

    selectTopic('POLITICS');

    function checkProfanity() {
        let request = new XMLHttpRequest();

        let form = document.getElementById('customTopicForm');
        let topic = form.querySelector('#customTopic').value;

        let formData = new FormData();
        formData.append('text', topic);

        request.onload = () => {
            let profanity = request.response.profanity;
            console.log(profanity);
            if (profanity == "true") {
                document.getElementById('customTopic').value = '';
                Swal.fire({
                    icon: 'error',
                    title: '부적절한 문장입니다.',
                    text: '바른 말을 사용해 주세요.'
                });
            }
            if (profanity == "false") {
                form.submit();
            }
        }

        request.open("POST", "/learning/sentence/profanity", true);
        request.responseType = "json";
        request.send(formData);
    }
</script>

<%@ include file="../../fragments/footer.jsp" %>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>