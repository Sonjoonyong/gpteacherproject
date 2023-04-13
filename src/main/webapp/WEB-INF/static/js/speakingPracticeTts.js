document.querySelector('#startAudio').addEventListener("click",() => {
    let assistantQuestion = "${assistantQuestion}";
    ttsAjax(assistantQuestion);
})

function ttsAjax(assistantQuestion) {
    let request = new XMLHttpRequest();

    let urlSearchParams = new URLSearchParams();

    urlSearchParams.append("assistantQuestion", assistantQuestion);

    request.onload = () => {
        console.log(request.response);
        let audioURL = URL.createObjectURL(request.response);
        let audio = new Audio(audioURL);
        audio.play();
    }

    request.open("GET", "/learning/speaking/tts?" + urlSearchParams.toString());
    request.responseType = "blob";
    request.send();
}