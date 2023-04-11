package com.sooaz.gpt.domain.learning;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Component
public class PerspectiveClient {

    // 구글 Perspective API 키 설정
    @Value("${google.perspective.api.key}")
    private String perspectiveApiKey;

    private final RestTemplate restTemplate = new RestTemplate();

    // 구글 Perspective API 키 반환
    public String getPerspectiveApiKey() {
        return perspectiveApiKey;
    }

    // 구글 Perspective API의 URL 반환
    private String getApiUrl() {
        return "https://commentanalyzer.googleapis.com/v1alpha1/comments:analyze?key=" + perspectiveApiKey;
    }

    // 주어진 텍스트의 부적절한 점수 반환
    public double getProfanityScore(String text) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        JSONObject requestJson = new JSONObject();
        requestJson.put("comment", new JSONObject().put("text", text));
        requestJson.put("requestedAttributes", new JSONObject().put("TOXICITY", new JSONObject()));
        requestJson.put("languages", Arrays.asList("en"));

        HttpEntity<String> requestEntity = new HttpEntity<>(requestJson.toString(), headers);

        String response = restTemplate.postForObject(getApiUrl(), requestEntity, String.class);
        JSONObject responseJson = new JSONObject(response);
        double profanityScore = responseJson.getJSONObject("attributeScores").getJSONObject("TOXICITY").getJSONObject("summaryScore").getDouble("value");

        return profanityScore;
    }

    // 텍스트에 대한 요청 본문 생성
    private Map<String, Object> createRequestBody(String text) {
        Map<String, Object> requestBody = new HashMap<>();
        Map<String, Object> comment = new HashMap<>();
        comment.put("text", text);
        requestBody.put("comment", comment);

        Map<String, Object> requestedAttributes = new HashMap<>();
        Map<String, Object> attribute = new HashMap<>();
        attribute.put("scoreType", "PROBABILITY");
        requestedAttributes.put("TOXICITY", attribute);
        requestBody.put("requestedAttributes", requestedAttributes);

        return requestBody;
    }

    // 응답에서 부적절한 점수 추출
    private double extractProfanityScore(Map<String, Object> response) {
        Map<String, Object> attributeScores = (Map<String, Object>) response.get("attributeScores");
        Map<String, Object> toxicity = (Map<String, Object>) attributeScores.get("TOXICITY");
        Map<String, Object> summaryScore = (Map<String, Object>) toxicity.get("summaryScore");
        return (double) summaryScore.get("value");
    }
}
