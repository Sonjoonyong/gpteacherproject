package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;


@Service
@RequiredArgsConstructor
public class SpeakingService {
    private final OpenAiClient openAiClient;


    private String INSTRUCTION = "i have to practice speaking for \"%s\" test. please give me one question (sentences related to the \"%s\" test).";


    public String initSpeaking(SpeakingDTO speakingDTO){

        String initialInstruction = getInitialInstruction(speakingDTO);

        String question = openAiClient.chat(initialInstruction);

        return question;
    }

    private String getInitialInstruction(SpeakingDTO speakingDTO){
        //지시문 설정
        return String.format(
                INSTRUCTION,
                speakingDTO.getTOPIC(),
                speakingDTO.getTOPIC()
        );
    }



}
