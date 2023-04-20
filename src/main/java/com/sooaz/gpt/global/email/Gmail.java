package com.sooaz.gpt.global.email;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Component
@PropertySource("classpath:/application.properties")
@Slf4j
public class Gmail {

    @Value("${email.address}")
    private String EMAIL_ADDRESS;

    @Value("${email.password}")
    private String EMAIL_PASSWORD;

    public void sendEmail(String targetEmailAddress, String title, String content) {
        // Property에 SMTP 서버 정보를 설정
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        // SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_ADDRESS, EMAIL_PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_ADDRESS));

            // Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(targetEmailAddress)); //수신자메일주소
            message.setSubject(title); //메일 제목을 입력
            message.setText(content); //메일 내용을 입력

            // Transport 클래스를 사용하여 작성한 메세지를 전달
            Transport.send(message); ////전송
            log.info("message sent successfully!");
        } catch (AddressException e) {
            log.error("e = ", e);
        } catch (MessagingException e) {
            e.printStackTrace();
            log.error("e = ", e);
        }
    }
}
