package com.sooaz.gpt.domain.learning;

import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
@Slf4j
@PropertySource("classpath:/application.properties")
public class OpenAiClient {

    private final String URL_CHAT = "https://api.openai.com/v1/chat/completions";
    private final String URL_TRANSCRIPT = "https://api.openai.com/v1/audio/transcriptions";

    @Value("${openai.api.key}")
    private String API_KEY;

    public static JSONObject userMessage(String prompt) {
        JSONObject message = new JSONObject();
        message.put("role", "user");
        message.put("content", prompt);
        return message;
    }

    public static JSONObject assistantMessage(String prompt) {
        JSONObject message = new JSONObject();
        message.put("role", "assistant");
        message.put("content", prompt);
        return message;
    }

    // 단순 프롬프트 대화
    public String chat(String userPrompt) {
        List<JSONObject> messages = new ArrayList<>();
        JSONObject message = userMessage(userPrompt);
        messages.add(message);
        return chat(messages, 0);
    }
    public String chat(String userPrompt, double temperature) {
        List<JSONObject> messages = new ArrayList<>();
        JSONObject message = userMessage(userPrompt);
        messages.add(message);
        return chat(messages, temperature);
    }

    public String chat(List<JSONObject> messages) {
        return chat(messages, 0);
    }

    public String chat(List<JSONObject> messages, double temperature) {

        String responseText = "";

        try {
            // HTTP 통신 설정
            HttpURLConnection con = (HttpURLConnection) new URL(URL_CHAT).openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json");
            con.setRequestProperty("Authorization", "Bearer " + API_KEY);

            // 요청 옵션 설정
            JSONObject prompt = new JSONObject();
            prompt.put("model", "gpt-3.5-turbo-0301"); // required - ChatGPT 3.5 모델 - 현재 공개된 모델
            prompt.put("messages", messages); // required - 요청 프롬프트(과거 대화 이력 포함)
            prompt.put("temperature", temperature); // optional - 0 ~ 2 (클수록 답변이 랜덤해짐)

            /**
             * temp
             */
            for (JSONObject message : messages) {
                log.info("message.toString() = {}", message.toString());
            }

            // HTTP 요청
            con.setDoOutput(true);
            con.getOutputStream().write(prompt.toString().getBytes());

            // 결과 수신
            String output = new BufferedReader(new InputStreamReader(con.getInputStream()))
                    .lines()
                    .reduce((a, b) -> a + b)
                    .get();

            System.out.println("Chat output = " + output);

            // 수신한 JSON에서 응답 메시지 파싱
            responseText = new JSONObject(output)
                    .getJSONArray("choices")
                    .getJSONObject(0)
                    .getJSONObject("message")
                    .getString("content");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return responseText;
    }

    // Speech To Text(whisper API)
    public String transcript(String directory, MultipartFile audio) {

        String script = "";

        try {
            String fileName = UUID.randomUUID() + ".webm";
            String filePath = directory + fileName;
            File audioFile = new File(filePath);
            audio.transferTo(audioFile);

            // HTTP 통신 설정
            URL url = new URL(URL_TRANSCRIPT);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);

            String LINE_FEED = "\r\n";
            String boundary = "----" + UUID.randomUUID();
            con.setRequestProperty("Authorization", "Bearer " + API_KEY);
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            OutputStream outputStream = con.getOutputStream();
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, StandardCharsets.UTF_8), true);

            // request body
            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"file\"; filename=\"" + audioFile.getName() + "\"").append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.flush();

            FileInputStream inputStream = new FileInputStream(audioFile);
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();

            writer.append(LINE_FEED);
            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"model\"").append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.append("whisper-1").append(LINE_FEED);

            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"language\"").append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.append("en").append(LINE_FEED);

            writer.append("--" + boundary + "--").append(LINE_FEED);

            writer.close();

            // 결과 수신
            String output = new BufferedReader(new InputStreamReader(con.getInputStream()))
                    .lines()
                    .reduce((a, b) -> a + b)
                    .get();

            log.info("output = {}", output);

            JSONObject jsonObject = new JSONObject(output);
            script = jsonObject.getString("text");

            audioFile.delete();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return script;
    }
}


