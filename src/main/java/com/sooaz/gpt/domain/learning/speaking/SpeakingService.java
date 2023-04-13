package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;



@Service
@RequiredArgsConstructor
public class SpeakingService {
    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;
    private final OpenAiClient openAiClient;


    private String INSTRUCTION = "i have to practice speaking for \"%s\" test. please give me one question (sentences related to the \"%s\" test).";
    
    private String USER_TALK_INSTRUCTION = "This is my talk : \"%s\"\n" +
            "\n" +
            "First, answer to my talk.\n" +
            "Second, correct my talk.\n" +
            "Third, let me know the explanation for the correction.\n" +
            "\n" +
            "Give me response in JSON file like below :\n" +
            "{ answer : \"your answer\",\n" +
            "corrected : \"corrected version of my talk\",\n" +
            "explanation : \"explanation for correction\" }";;

    public String initSpeaking(SpeakingDTO speakingDTO){

        String initialInstruction = getInitialInstruction(speakingDTO);

        String assistantQuestion = openAiClient.chat(initialInstruction);

        return assistantQuestion;
    }

    public String transcript(String userTalk){

        String userTalkInstruction = String.format(USER_TALK_INSTRUCTION, userTalk);

        //String assistantAnswer = openAiClient.(userTalkInstruction);

        return userTalkInstruction;
    }

    private String getInitialInstruction(SpeakingDTO speakingDTO){
        //지시문 설정
        return String.format(
                INSTRUCTION,
                speakingDTO.getTOPIC()
        );
    }

    /*public String talk() {
       // return ;
    }*/
}