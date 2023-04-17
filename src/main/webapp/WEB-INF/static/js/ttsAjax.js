let audio;

function ttsAjax(assistantTalk) {
    audio && audio.pause();

    let request = new XMLHttpRequest();

    let urlSearchParams = new URLSearchParams();
    urlSearchParams.append("assistantTalk", assistantTalk);

    request.onload = () => {
        let audioURL = URL.createObjectURL(request.response);
        audio = new Audio(audioURL);
        audio.play();
    }

    request.open("GET", "/learning/dialogue/tts?" + urlSearchParams.toString());
    request.responseType = "blob";
    request.send();
}
