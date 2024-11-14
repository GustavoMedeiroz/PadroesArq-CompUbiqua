package com.spectre.Spectre.domain.vo.base;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

import static com.fasterxml.jackson.annotation.JsonInclude.Include.NON_NULL;

@Getter
@Setter
@NoArgsConstructor
public abstract class BaseEntityDto<T> {

    @JsonInclude(NON_NULL)
    private Long id;
    @JsonInclude(NON_NULL)
    private LocalDateTime updatedAt;
    @JsonInclude(NON_NULL)
    private LocalDateTime createdAt;

    public abstract T mapDtoToEntity();
}
