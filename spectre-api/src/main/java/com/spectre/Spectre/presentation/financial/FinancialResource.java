package com.spectre.Spectre.presentation.financial;

import com.spectre.Spectre.application.core.dtos.financial.FinancialDto;
import com.spectre.Spectre.domain.entity.financial.Financial;
import com.spectre.Spectre.domain.service.financial.FinancialContext;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("financial")
@RequiredArgsConstructor
public class FinancialResource {

    private final FinancialContext financialService;

    @GetMapping(value = "/all")
    public ResponseEntity<Page<Financial>> findAll(@PageableDefault(sort = { "id" }) Pageable pageable) {
        Page<Financial> financials = this.financialService.findAll(pageable);
        return ResponseEntity.ok(financials);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Financial> findById(@PathVariable Long id) {
        Financial financial = this.financialService.findById(id);
        return ResponseEntity.ok(financial);
    }

    @PostMapping
    public ResponseEntity<Financial> create(
            @RequestBody @Valid FinancialDto financialDto,
            UriComponentsBuilder uriBuilder
    ) {
        Financial financial = this.financialService.create(financialDto);
        var uri = uriBuilder.path("/financial/{id}").buildAndExpand(financial.getId()).toUri();
        return ResponseEntity.created(uri).body(financial);
    }

    @PutMapping
    public ResponseEntity<Financial> update(@RequestBody @Valid FinancialDto financialDto) {
        this.financialService.update(financialDto);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Financial> delete(@PathVariable Long id) {
        this.financialService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
