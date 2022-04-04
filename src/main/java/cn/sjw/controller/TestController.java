package cn.sjw.controller;

import cn.sjw.bean.Mag;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
    @ResponseBody
    @PutMapping("/test")
    public Mag toPut(Model model){
        model.addAttribute("mag","发送了一个Put请求！！！！");
        return Mag.success().add("msg","发送了一个Put请求！！！！");
    }

    @ResponseBody
    @DeleteMapping("/test")
    public Mag toPDel(){
        return Mag.success().add("msg","发送了一个Delete请求！！！！");
    }
}
