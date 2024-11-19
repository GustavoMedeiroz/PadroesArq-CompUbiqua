package com.spectre.Spectre.presentation.information;

import com.spectre.Spectre.application.core.dtos.information.InformationDto;
import com.spectre.Spectre.domain.entity.information.Information;
import com.spectre.Spectre.domain.service.information.InformationContext;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("information")
@RequiredArgsConstructor
public class InformationResource {

    private final InformationContext informationService;

    @GetMapping(value = "/{id}")
    public ResponseEntity<Information> findById(@PathVariable Long id) {
        Information information = this.informationService.findById(id);
        return ResponseEntity.ok(information);
    }

    @PostMapping
    public ResponseEntity<Information> create(
            @RequestBody @Valid InformationDto informationDto,
            UriComponentsBuilder uriBuilder
    ) {
        Information information = this.informationService.create(informationDto);
        var uri = uriBuilder.path("/information/{id}").buildAndExpand(information.getId()).toUri();
        return ResponseEntity.created(uri).body(information);
    }

    @PutMapping
    public ResponseEntity<Information> update(@RequestBody @Valid InformationDto informationDto) {
        this.informationService.update(informationDto);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Information> delete(@PathVariable Long id) {
        this.informationService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
