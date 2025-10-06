package com.ejemplo.hello_devops;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String sayHello() {
        // 3. Devuelve la respuesta como texto simple
        return "Hello DevOps! (from Spring Boot)";
    }
}
