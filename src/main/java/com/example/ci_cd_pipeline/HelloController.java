package com.example.ci_cd_pipeline;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/welcome")
    public String welcome() {
        return "Let's learn Docker!";
    }
}