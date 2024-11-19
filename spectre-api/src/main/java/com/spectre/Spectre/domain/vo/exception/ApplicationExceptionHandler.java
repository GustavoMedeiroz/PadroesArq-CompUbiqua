package com.spectre.Spectre.domain.vo.exception;

import com.spectre.Spectre.domain.vo.exception.exceptions.BadRequestException;
import com.spectre.Spectre.domain.vo.exception.exceptions.NotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Arrays;

@RestControllerAdvice
public class ApplicationExceptionHandler {

    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity<ExceptionDto> handle404(NotFoundException ex) {
        String className = Arrays.stream(ex.getStackTrace())
                .findFirst()
                .map(StackTraceElement::getClassName)
                .orElse(null);

        ExceptionDto exceptionDto = ExceptionDto.builder()
                .className(className)
                .message(ex.getMessage())
                .build();

        return new ResponseEntity<>(exceptionDto, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(BadRequestException.class)
    public ResponseEntity<ExceptionDto> handle400(BadRequestException ex) {
        String className = Arrays.stream(ex.getStackTrace())
                .findFirst()
                .map(StackTraceElement::getClassName)
                .orElse(null);

        ExceptionDto exceptionDto = ExceptionDto.builder()
                .className(className)
                .message(ex.getMessage())
                .build();

        return ResponseEntity.badRequest().body(exceptionDto);
    }
}
