package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
@RequiredArgsConstructor
public class SpeakingService {
    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;
    private final OpenAiClient openAiClient;


    private String INSTRUCTION = "i have to practice speaking for \"%s\" test. please give me one question (sentences related to the \"%s\" test).";


    public String initSpeaking(SpeakingDTO speakingDTO) {

        String initialInstruction = getInitialInstruction(speakingDTO);

        String assistantQuestion = openAiClient.chat(initialInstruction);

        return assistantQuestion;
    }




    private String getInitialInstruction(SpeakingDTO speakingDTO) {
        //지시문 설정
       // openAiClient.transcript(MultipartFile); //stt

        return String.format(
                INSTRUCTION,
                speakingDTO.getTOPIC(),
                speakingDTO.getTOPIC() //dTO를 매개변수로 받음,"%s"가 두개니까
        );
    }


}