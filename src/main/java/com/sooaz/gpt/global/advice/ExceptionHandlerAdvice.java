package com.sooaz.gpt.global.advice;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.ConstraintViolationException;

@ControllerAdvice
@Slf4j
public class ExceptionHandlerAdvice {

    // Controller @RequestParam 유효성 검증 오류 발생 시 오류메시지 응답
    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseBody
    public String handleValidationException(ConstraintViolationException e) {
        String message = e.getMessage();

        int colon = message.indexOf(":");
        if (colon != -1) {
            message = message.substring(colon + 1, message.length());
        }

        return message;
    }
}
