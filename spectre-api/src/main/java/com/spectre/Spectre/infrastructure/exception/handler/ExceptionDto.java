package com.spectre.Spectre.infrastructure.exception.handler;

import lombok.Builder;

@Builder
public record ExceptionDto(
        String className,
        String message
) {
}
