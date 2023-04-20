                                                      document.querySelector('#startAudio').addEventListener("click", () => {
    let assistantTalk = document.getElementsByClassName('question')[0].innerText;
    ttsAjax(assistantTalk);
})

function ttsAjax(assistantTalk) {
    let request = new XMLHttpRequest();

    let urlSearchParams = new URLSearchParams();
    urlSearchParams.append("assistantTalk", assistantTalk);

    request.onload = () => {
        console.log(request.response);
        let audioURL = URL.createObjectURL(request.response);
        let audio = new Audio(audioURL);
        audio.play();
    }

    request.open("GET", "/learning/dialogue/tts?" + urlSearchParams.toString());
    request.responseType = "blob";
    request.send();
}
