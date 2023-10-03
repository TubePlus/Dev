package com.example.dev;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@Slf4j
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api/v1")
public class HelloController {
    @GetMapping("/hello")
    public String hello(HelloDto helloDto) {
        return helloDto.id;
    }
}
