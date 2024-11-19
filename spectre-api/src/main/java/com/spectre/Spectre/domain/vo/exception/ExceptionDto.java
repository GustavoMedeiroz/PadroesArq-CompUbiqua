package com.spectre.Spectre.domain.vo.exception;

import lombok.Builder;

@Builder
public record ExceptionDto(
        String className,
        String message
) {
}
