package com.sooaz.gpt.domain.learning;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Slf4j
@PropertySource("classpath:/application.properties")
@Component
public class NcpTtsClient {

    @Value("${ncp.api.key.id}")
    private String NCP_API_KEY_ID;
    @Value("${ncp.api.key}")
    private String NCP_API_KEY;
    private String API_URL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";

    public void tts(String requestText, HttpServletResponse response) {
        try {
            String text = URLEncoder.encode(requestText, "UTF-8");
            URL url = new URL(API_URL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", NCP_API_KEY_ID);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", NCP_API_KEY);

            // post request
            String postParams = "speaker=clara&volume=0&speed=0&pitch=0&format=mp3&text=" + text; // clara

            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                OutputStream outputStream = response.getOutputStream();
                while ((read = is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer res = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    res.append(inputLine);
                }
                br.close();
                log.error("res = {}", res);
            }
        } catch (Exception e) {
            log.error("e = ", e);
        }
    }
}
