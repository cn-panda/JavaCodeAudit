package com.panda.fileinclude;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.View;

@Controller
public class TemplateController {
    Logger log =  LoggerFactory.getLogger(TemplateController.class);

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("message", "hello world!");
        return "index";
    }


    @GetMapping("/admin")
    public String path(@RequestParam String language) {
        return "language/" + language + "/admin";
    }

    @GetMapping("/page")
    public String path(@RequestParam String exp, Model model) {
        model.addAttribute("exp", exp);
        return "exp";
    }

    @GetMapping("/test")
    public String test(@RequestParam String path) {
        return "/" + path;
    }


}
