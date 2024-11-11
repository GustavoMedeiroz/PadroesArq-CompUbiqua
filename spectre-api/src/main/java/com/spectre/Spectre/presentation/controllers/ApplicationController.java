package com.spectre.Spectre.presentation.controllers;

import com.spectre.Spectre.presentation.dtos.app.EnumDto;
import com.spectre.Spectre.presentation.services.app.EnumContext;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/app")
@RequiredArgsConstructor
public class ApplicationController {

    private static final String spectreRunning = "SPECTRE API Running!";
    private final EnumContext enumContext;

    @GetMapping(path = "/health")
    @ResponseStatus(HttpStatus.OK)
    public String health() {
        return spectreRunning;
    }

    @GetMapping(path = "/enum/{name}")
    public List<EnumDto> findEnumByName(@PathVariable(name = "name") String name) {
        return this.enumContext.findEnumByName(name);
    }
}
