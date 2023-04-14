package com.sooaz.gpt.domain.learning.writing;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

@Service
public class WritingService {

    // 의존성 주입
    @Autowired
    private OpenAiClient openAiClient;

    // 주어진 주제에 대한 질문을 생성
    public String generateQuestion(String topic) throws IOException {
        // 각 주제에 대한 프롬프트 목록 정의
        List<String> phrasesPolitics = Arrays.asList("voting", "elections", "presidents", "mayors", "local government", "citizenship", "national holidays", "laws", "rights", "leaders");
        List<String> phrasesSociety = Arrays.asList("family", "friendship", "school", "work", "hobbies", "neighborhood", "celebrations", "transportation", "shopping", "travel");
        List<String> phrasesEconomy = Arrays.asList("saving money", "budgeting", "grocery shopping", "finding a job", "starting a business", "renting a house", "buying a car", "taking a loan", "paying taxes", "investing");
        List<String> phrasesEntertainment = Arrays.asList("children's movies", "pop music", "bestselling books", "animated films", "comedies", "reality TV shows", "cooking shows", "romantic novels", "board games", "puzzles");
        List<String> phrasesSports = Arrays.asList("playing soccer", "swimming", "jogging", "yoga", "hiking", "dancing", "skating", "jump rope", "exercise routines", "team sports");

        List<String> promptTemplates = Arrays.asList("Generate a simple question about %s", "Generate an easy question about %s", "Generate a basic question about %s");

        // 주제에 따라 적절한 목록에서 무작위 프롬프트 선택
        Random random = new Random();
        String phrase;
        switch (topic) {
            case "Politics":
                phrase = phrasesPolitics.get(random.nextInt(phrasesPolitics.size()));
                break;
            case "Society":
                phrase = phrasesSociety.get(random.nextInt(phrasesSociety.size()));
                break;
            case "Economy":
                phrase = phrasesEconomy.get(random.nextInt(phrasesEconomy.size()));
                break;
            case "Entertainment":
                phrase = phrasesEntertainment.get(random.nextInt(phrasesEntertainment.size()));
                break;
            case "Sports":
                phrase = phrasesSports.get(random.nextInt(phrasesSports.size()));
                break;
            default:
                phrase = topic;
                promptTemplates = Arrays.asList(
                        "Generate a simple question related to %s",
                        "Generate an easy question related to %s",
                        "Generate a basic question related to %s"
                );
                break;
        }

        String promptTemplate = promptTemplates.get(random.nextInt(promptTemplates.size()));
        String prompt = String.format(promptTemplate, phrase);

        // 선택한 프롬프트를 사용하여 ChatGPT를 기반으로 질문 생성
        String questions = openAiClient.chat(prompt);

        String[] questionList = questions.split("\n");
        String question = questionList[random.nextInt(Math.min(3, questionList.length))];

        // 앞에 숫자가 붙는 것을 삭제
        question = question.replaceAll("^\\d+\\.", "").trim();

        return question;
    }

    // 사용자 답변 평가
    public String evaluateAnswer(String userAnswer, String question) throws IOException {
        StringBuilder responseBuilder = new StringBuilder();

        // 문장 분할에 정규식 패턴 사용
        Pattern sentencePattern = Pattern.compile("(?<!\\b(?:[Dd]r|[Mm]r|[Mm]rs|[Mm]s|[Pp]rof|[Ss]t))\\b[.!?]\\s+(?=[A-Z])");
        List<String> sentences = Arrays.asList(sentencePattern.split(userAnswer));

        // 각 문장을 간결하고 문장이 흐트러지지 않게 교정 요청
        for (String sentence : sentences) {
            String prompt = "Please provide a concise correction for the following sentence, focusing on grammar, structure, and punctuation, without changing the user's original content or intention, even if it may be factually incorrect. Ensure that commas are not changed to periods: " + sentence;
            String response = openAiClient.chat(prompt);

            if (responseBuilder.length() > 0) {
                responseBuilder.append(" ");
            }
            responseBuilder.append(response.trim());
        }

        return responseBuilder.toString();
    }

    // 원본 답변과 수정된 답변의 분석 데이터를 가져옴
    public JSONArray getAnalysisData(String originalAnswer, String correctedAnswer) throws IOException {
        JSONArray analysis = new JSONArray();

        // 문장 분할에 정규식 패턴 사용
        Pattern sentencePattern = Pattern.compile("(?<!\\b(?:[Dd]r|[Mm]r|[Mm]rs|[Mm]s|[Pp]rof|[Ss]t))\\b[.!?]\\s+(?=[A-Z])");
        List<String> originalSentences = Arrays.asList(sentencePattern.split(originalAnswer));
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
