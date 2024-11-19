package com.spectre.Spectre.domain.vo.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Utils {

    private static final String DATE_TIME_FORMATTER = "dd/MM/yyyy HH:mm:ss";

    public static String currentLocalDateTimeFormatter() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern(DATE_TIME_FORMATTER));
    }
}
