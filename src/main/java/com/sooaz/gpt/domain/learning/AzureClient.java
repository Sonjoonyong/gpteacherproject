package com.sooaz.gpt.domain.learning;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.sound.sampled.*;
import java.io.*;
import java.net.URL;
import java.util.Arrays;
import java.util.Base64;
import java.util.UUID;

@Component
@Slf4j
@RequiredArgsConstructor
@PropertySource("classpath:/application.properties")
public class AzureClient {

    @Value("${azure.api.key}")
    private String API_KEY;

    public Integer pronunciationAssessment(String directory, MultipartFile multipartFile, String script) {

        String result = "";
        long uploadFinishTime = System.currentTimeMillis();

        try {
            String filePath = directory + UUID.randomUUID();
            File wav = new File(filePath);
            multipartFile.transferTo(wav);
            File newWav = convertWav(directory, wav);

            // build pronunciation assessment parameters
            String pronAssessmentParamsJson = "{\"ReferenceText\":\"" + script + "\"," +
                    "\"GradingSystem\":\"HundredMark\"," +
                    "\"Dimension\":\"Comprehensive\"," +
                    "\"EnableMiscue\":\"True\"," +
                    "\"Granularity\": \"Word\"}";
            byte[] pronAssessmentParamsBase64 = Base64.getEncoder().encode(pronAssessmentParamsJson.getBytes("utf-8"));
            String pronAssessmentParams = new String(pronAssessmentParamsBase64, "utf-8");

            // build request (when re-run below code in short time, the connect can be cached and reused behind, with lower connecting time cost)
            URL url = new URL("https://eastus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-us");
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setChunkedStreamingMode(0);
            connection.setRequestProperty("Accept", "application/json;script/xml");
            connection.setRequestProperty("Content-Type", "audio/wav; codecs=audio/pcm; samplerate=16000");
            connection.setRequestProperty("Ocp-Apim-Subscription-Key", API_KEY);
            connection.setRequestProperty("Pronunciation-Assessment", pronAssessmentParams);
            connection.setRequestProperty("Connection", "close");

            FileInputStream fis = new FileInputStream(newWav);
            OutputStream os = connection.getOutputStream();
            int read = -1;
            byte[] buff = new byte[4096];
            while ((read = fis.read(buff)) != -1) {
                os.write(buff, 0, read);
            }

            fis.close();
            os.flush();
            os.close();
            wav.delete();


            // 결과 수신
            result = new BufferedReader(new InputStreamReader(connection.getInputStream()))
                    .lines()
                    .reduce((a, b) -> a + b)
                    .get();

            long getResponseTime = System.currentTimeMillis();
            log.info("\nPronunciation Latency: " + (getResponseTime - uploadFinishTime) + "ms");
            log.info("Pronunciation assessment result: \n{}", result);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        JSONObject resultJson = new JSONObject(result);
        String status = resultJson.getString("RecognitionStatus");

        if(status.equals("Success")) {
            JSONObject nBest = resultJson
                    .getJSONArray("NBest")
                    .getJSONObject(0);

            int accuracyScore = nBest.getInt("AccuracyScore");
            int FluencyScore = nBest.getInt("FluencyScore");
            int CompletenessScore = nBest.getInt("CompletenessScore");
            int PronScore = nBest.getInt("PronScore");

            int totalScore = (accuracyScore + FluencyScore + CompletenessScore + PronScore) / 4;
            result = String.valueOf(totalScore);
        } else {
            result = "0";
        }

        return Integer.parseInt(result);
    }

    public File convertWav(String directory, File wav) {

        final AudioFormat AUDIO_FORMAT = new AudioFormat(
                16_000,
                16,
                1,
                true,
                false
        );

        try {
            // Audio To Byte
            FileInputStream fis = new FileInputStream(wav);
            BufferedInputStream bis = new BufferedInputStream(fis);

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buff = new byte[4096];
            int read = -1;
            while ((read = bis.read(buff)) != -1) {
                baos.write(buff, 0, read);
            }
            baos.flush();
            byte[] audioBytes = baos.toByteArray();
            System.out.println("audioBytes.length = " + audioBytes.length);

            // format .wav -> .wav
            AudioInputStream originalAis = AudioSystem.getAudioInputStream(new ByteArrayInputStream(audioBytes));
            AudioInputStream formattedAis = AudioSystem.getAudioInputStream(AUDIO_FORMAT, originalAis);
            AudioInputStream lengthAddedAis = new AudioInputStream(formattedAis, AUDIO_FORMAT, audioBytes.length);

            ByteArrayOutputStream baos2 = new ByteArrayOutputStream();
            AudioSystem.write(lengthAddedAis, AudioFileFormat.Type.WAVE, baos2);
            byte[] newAudioBytes = baos.toByteArray();

            String newFilePath = directory + UUID.randomUUID() + ".wav";
            FileOutputStream fos = new FileOutputStream(newFilePath);
            fos.write(newAudioBytes);

            File newWav = new File(newFilePath);
            wav.delete();

            return newWav;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
