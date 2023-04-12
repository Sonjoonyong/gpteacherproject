package com.sooaz.gpt.domain.learning;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

@Component
@PropertySource("classpath:/application.properties")
public class TtsClient2 {
    @Value("${tts.client.id}")
    private String ttsCLIENT_ID;
    @Value("${tts.client.secret}")
    private String ttsCLIENT_SECRET;

    public void tts(String assistantTalk, HttpServletResponse response){

        String clientId = "ttsCLIENT_ID";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "ttsCLIENT_SECRET";//애플리케이션 클라이언트 시크릿값";

        try {

            String text = URLEncoder.encode(assistantTalk, "UTF-8");
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
            wr.writeBytes(postParams); // tts에 text입력
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode(); //네이버에서 받은 결과

            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                OutputStream outputStream = response.getOutputStream(); // text입력 결과를 view 페이지로 전달

                while ((read =is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer responseBuffer = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    responseBuffer.append(inputLine);
                }
                br.close();
                System.out.println(responseBuffer.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }

    }



}

