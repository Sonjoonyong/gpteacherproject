package com.sooaz.gpt.global.security;

import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Component
@PropertySource("classpath:/application.properties")
@Slf4j
public class GoogleOauthClient {

    @Value("${oauth.google.client.id}")
    private String CLIENT_ID;
    @Value("${oauth.google.client.secret}")
    private String CLIENT_SECRET;

    public JSONObject getAccessToken(String code) {
        final String API_URL = "https://oauth2.googleapis.com/token";
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("client_id", CLIENT_ID);
        paramMap.put("client_secret", CLIENT_SECRET);
        paramMap.put("code", code);
        paramMap.put("grant_type", "authorization_code");
        paramMap.put("redirect_uri", "http://localhost:8080/user/login/oauth");

        try {
            StringBuilder paramSb = new StringBuilder();
            Set<Map.Entry<String, String>> entries = paramMap.entrySet();
            for (Map.Entry<String, String> entry : entries) {
                paramSb.append(URLEncoder.encode(entry.getKey(), StandardCharsets.UTF_8));
                paramSb.append("=");
                paramSb.append(URLEncoder.encode(entry.getValue(), StandardCharsets.UTF_8));
                paramSb.append("&");
            }
            paramSb.deleteCharAt(paramSb.length() - 1); // 마지막 & 제거

            log.info("paramSb = {}", paramSb);

            URL url = new URL(API_URL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setRequestMethod("POST");

            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(paramSb.toString());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                String inputLine;
                StringBuffer result = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    result.append(inputLine);
                }
                br.close();

                return new JSONObject(result.toString());
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
            return null;
        }

        return null;
    }

    public JSONObject getUserInfo(String accessToken) {
        final String API_URL = "https://openidconnect.googleapis.com/v1/userinfo";

        try {
            StringBuilder paramSb = new StringBuilder();
            URL url = new URL(API_URL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestProperty("Authorization", "Bearer " + accessToken);
            con.setRequestMethod("GET");

            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(paramSb.toString());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                String inputLine;
                StringBuffer result = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    result.append(inputLine);
                }
                br.close();

                log.info("result = {}", result);
                return new JSONObject(result.toString());
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

        return null;
    }

}
