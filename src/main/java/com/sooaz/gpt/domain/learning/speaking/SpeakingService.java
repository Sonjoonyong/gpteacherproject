package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.*;
import java.util.regex.Pattern;


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
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //준용님파트

    // 사용자 답변 평가
    public String evaluateAnswer(@RequestParam("answer")String answer, @RequestParam("question")String question) throws IOException {

        StringBuilder responseBuilder = new StringBuilder();

        // 문장 분할에 정규식 패턴 사용
        Pattern sentencePattern = Pattern.compile("(?<!\\b(?:[Dd]r|[Mm]r|[Mm]rs|[Mm]s|[Pp]rof|[Ss]t))\\b[.!?]\\s+(?=[A-Z])");
        List<String> sentences = Arrays.asList(sentencePattern.split(answer));

        // 각 문장을 간결하고 문장이 흐트러지지 않게 교정 요청
        for (String sentence : sentences) {
            //String prompt = "chatGPT, there are rules to follow when correcting English sentences. If you want me to correct an English sentence, please provide it and specify that you only want the portion of the sentence after 'answer:' to be corrected. If there is no issues, you must output the portion of the sentence after 'answer:' as requested. answer:"+sentence;
            String prompt = "this is my sentence : \n" +sentence+
                    "First, make correct my sentence, focusing on grammer, structure and punctuation\n"+
                    "Second, let me know the explanation for the correction.\n"+
                    "give me response in JSON file like below :\n"+
                    "{sentence : \"my sentence\", \n" +
                    "corrected : \"corrected version of my sentence\",\n" +
                    "explanation : \"explanation for my correction\"}";
            String response = openAiClient.chat(prompt);

            if (responseBuilder.length() > 0) {
                responseBuilder.append(" ");
            }
            responseBuilder.append(response.trim());
        }

        return responseBuilder.toString();
    }

    // 원본 답변과 수정된 답변의 분석 데이터를 가져옴
    public JSONArray getAnalysisData(String answer, String correctedAnswer) throws IOException {
        JSONArray analysis = new JSONArray();

        // 문장 분할에 정규식 패턴 사용
        Pattern sentencePattern = Pattern.compile("(?<!\\b(?:[Dd]r|[Mm]r|[Mm]rs|[Mm]s|[Pp]rof|[Ss]t))\\b[.!?]\\s+(?=[A-Z])");
        List<String> originalSentences = Arrays.asList(sentencePattern.split(answer));
        List<String> correctedSentences = Arrays.asList(sentencePattern.split(correctedAnswer));

        int minLength = Math.min(originalSentences.size(), correctedSentences.size());

        // 각 문장과 해당 수정된 문장을 비교
        for (int i = 0; i < minLength; i++) {
            String original = originalSentences.get(i).trim();
            String corrected = correctedSentences.get(i).trim();

            // 원문과 정정된 문장이 동일하지 않을 경우 교정 이유에 대한 설명을 받음
            String explanation = null;
            if (!original.equals(corrected)) {
                explanation = getCorrectionExplanation(original, corrected).trim();
            }

            // 각 문장 비교에 대한 JSON 객체를 생성하여 분석에 추가
            JSONObject item = new JSONObject();
            item.put("original", original);
            item.put("corrected", corrected);
            item.put("explanation", explanation);

            analysis.put(item);
        }

        return analysis;
    }

    // 원문과 교정된 문장의 차이에 대한 간결한 설명 구하기
    public String getCorrectionExplanation(String original, String corrected) {
        String prompt = String.format("Explain the difference between the original sentence and the corrected sentence in a concise manner:\n\nOriginal: %s\nCorrected: %s", original, corrected);
        return openAiClient.chat(prompt);
    }

}
