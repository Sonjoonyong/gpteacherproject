const dialogueRandomTopicBtn = document.querySelector('#dialogueRandomTopic');

dialogueRandomTopicBtn.onclick = () => {
    const request = new XMLHttpRequest();

    request.onload = () => {
        const result = JSON.parse(request.response);
        const myRole = result.my_role;
        const gptRole = result.gpt_role;
        const place = result.place;
        const situation = result.situation;
        const option = result['option'];

        document.querySelector('input[name=place]').value = place;
        document.querySelector('input[name=userRole]').value = myRole;
        document.querySelector('input[name=assistantRole]').value = gptRole;
        document.querySelector('input[name=situation]').value = situation;
        document.querySelector('input[name=option]').value = option;
    }

    request.open("get", "/learning/dialogue/random")
    request.setRequestHeader("Accept", "application/json; charset=utf-8");
    request.send();
}