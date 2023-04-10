package com.sooaz.gpt.domain.learning.speaking;


import com.sooaz.gpt.domain.learning.OpenAiClient;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SpeakingController {

    @Autowired
    private OpenAiClient OpenAiClient;

    @GetMapping("/gpt/correction")
    public String getCorrect() {
        return "correction";
    }



    //*********************************************************************************************
    //*********************************************************************************************
    @PostMapping("/gpt/correction")
    public String correct(
            @RequestParam String userScript,
            Model model
    ) throws IOException {

        List<JSONObject> messages = new ArrayList<>();

        // 과거 이력 프롬프트에 추가 - 유저 스크립트*****************************************************
        //*********************************************************************************************
        JSONObject priorPrompt = new JSONObject();
        priorPrompt.put("role", "user");
        priorPrompt.put("content", OpenAiClient.SPEAKING_INSTRUCTION_PREFIX + OpenAiClient.EXAMPLE_SCRIPT);
        messages.add(priorPrompt);

        // 과거 이력 프롬프트에 추가 - 교정 스크립트*****************************************************
        //*********************************************************************************************
        JSONObject priorResponse = new JSONObject();
        priorResponse.put("role", "assistant");
        priorResponse.put("content", OpenAiClient.EXAMPLE_SENTENCE_JSON_ARRAY.toString());
        messages.add(priorResponse);

        // 교정 지시문 + 유저 스크립트 프롬프트 설정*****************************************************
        //*********************************************************************************************
        JSONObject message = new JSONObject();
        message.put("role", "user");
        String prompt = OpenAiClient.SPEAKING_INSTRUCTION_PREFIX + userScript;
        message.put("content", prompt);
        messages.add(message);

        // ************************************분할 요청***********************************************
        //*********************************************************************************************
        String responseText = OpenAiClient.chat(messages).trim();

        // ************************************문장 개수에 따른 처리************************************
        //*********************************************************************************************
        JSONArray splitScript = new JSONArray();
        try {
            if (responseText.startsWith("[")) { // 문장이 2개 이상 -> JSON 배열로 반환됨
                splitScript = new JSONArray(responseText);
            } else if (responseText.startsWith("{")) { // 문장이 1개 -> JSON 객체로 반환됨
                splitScript.put(new JSONObject(responseText));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("userScript", userScript);
        model.addAttribute("splitScript", splitScript);

        return "correction";
    }
    //================================================================================================


    @GetMapping("/gpt/whisper")
    public String getSttForm() {
        return "whisper";
    }

    @ResponseBody
    @PostMapping("/gpt/whisper")
    public String transcript(
            @RequestParam MultipartFile audio
    ) throws IOException {
        String script = OpenAiClient.transcript(audio);
        return script;
    }


}
