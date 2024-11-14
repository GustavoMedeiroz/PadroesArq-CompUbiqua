package com.spectre.Spectre.presentation.information;

import com.spectre.Spectre.domain.service.information.InformationContext;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/information")
@RequiredArgsConstructor
public class InformationResource {

    private final InformationContext informationService;
}
