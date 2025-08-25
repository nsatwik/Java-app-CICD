package com.example.myapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/")
    public String home() {
        return "Hello from Spring Boot on EC2 via CodeDeploy!";
    }
}
