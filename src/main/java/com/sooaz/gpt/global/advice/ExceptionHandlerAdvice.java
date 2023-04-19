package com.sooaz.gpt.global.advice;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.ConstraintViolationException;

@Slf4j
@ControllerAdvice
public class ExceptionHandlerAdvice {

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
