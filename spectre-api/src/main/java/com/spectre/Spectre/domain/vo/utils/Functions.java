package com.spectre.Spectre.domain.vo.utils;

import java.util.function.Consumer;
import java.util.function.Supplier;

import static java.util.Optional.ofNullable;

public final class Functions {

    public static void acceptTrue(Boolean value, EmptySpectreAction action) {
        if (Boolean.TRUE.equals(value))
            action.run();
    }

    public static void acceptTrueOrElse(Boolean value, EmptySpectreAction action, EmptySpectreAction otherAction) {
        if (Boolean.TRUE.equals(value))
            action.run();
        else
            otherAction.run();
    }

    public static <T extends Throwable> void acceptTrueThrows(Boolean value, Supplier<? extends T> exception) throws T {
        if (Boolean.TRUE.equals(value))
            throw exception.get();
    }
    
    public static <T extends Throwable> void acceptTrueOrElseThrows(
            Boolean value,
            EmptySpectreAction action,
            Supplier<? extends T> exception
    ) throws T {
        if (Boolean.TRUE.equals(value))
            action.run();
        else
            throw exception.get();
    }

    public static void acceptFalse(Boolean value, EmptySpectreAction action) {
        if (Boolean.FALSE.equals(value))
            action.run();
    }

    public static void acceptFalseOrElse(Boolean value, EmptySpectreAction action, EmptySpectreAction otherAction) {
        if (Boolean.FALSE.equals(value))
            action.run();
        else
            otherAction.run();
    }
    
    public static <T extends Throwable> void acceptFalseThrows(Boolean value, Supplier<? extends T> exception) throws T {
        if (Boolean.FALSE.equals(value))
            throw exception.get();
    }
    
    public static <T extends Throwable> void acceptFalseOrElseThrows(
            Boolean value,
            EmptySpectreAction action,
            Supplier<? extends T> exception
    ) throws T {
        if (Boolean.FALSE.equals(value))
            action.run();
        else
            throw exception.get();
    }

    public static <T> void ifPresent(T value, EmptySpectreAction action) {
        if (notNullAndNotEmpty(value))
            action.run();
    }

    public static <T> void ifPresent(T value, Consumer<T> consumer) {
        if (notNullAndNotEmpty(value))
            consumer.accept(value);
    }

    public static <T> void ifPresentOrElse(T value, Consumer<T> consumer, EmptySpectreAction otherAction) {
        if (notNullAndNotEmpty(value))
            consumer.accept(value);
        else
            otherAction.run();
    }

    public static <T> Boolean notNullAndNotEmptyValue(T value) {
        return notNullAndNotEmpty(value);
    }

    private static <T> Boolean notNullAndNotEmpty(T value) {
        return ofNullable(value).isPresent();
    }
}
