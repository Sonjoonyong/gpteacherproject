package com.sooaz.gpt.domain.learning;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ttsClient {

    public static void main(String[] args) {

        String clientId = "ttsCLIENT_ID";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "ttsCLIENT_SECRET";//애플리케이션 클라이언트 시크릿값";
        @Value("${tts.client.id}")
        private String ttsCLIENT_ID;

        @Value("${tts.client.secret}")
        private String ttsCLIENT_SECRET;

        public String chat(?????) {
            List<JSONObject> messages = new ArrayList<>();
            JSONObject message = userMessage(userPrompt);
            messages.add(message);
            return chat(messages).get(0).getString("text");
        }

        try {
            String text = URLEncoder.encode("만나서 반갑습니다.", "UTF-8"); // 13자
            String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";

            //HTTP
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");

            //헤더
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            String postParams = "speaker=nara&volume=0&speed=0&pitch=0&format=mp3&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();


            int responseCode = con.getResponseCode(); //네이버에서 받은 결과
            BufferedReader br;

            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                String tempname = Long.valueOf(new Date().getTime()).toString(); // 랜덤한 이름으로 mp3 파일 생성
                File f = new File(tempname + ".mp3");
                f.createNewFile();
                OutputStream outputStream = new FileOutputStream(f);
                while ((read =is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
