package cn.sjw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

    @RequestMapping("error")
    public String errortext(){
        System.out.println(100/0);
        return "error";
    }
}
