package cn.sjw.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@ControllerAdvice        //异常处理
public class Error2Controller {
    /**
     *
     * @ControllerAdvice   异常处理的类
     *
     * @ExceptionHandler   异常处理的class类
     *  @ExceptionHandler (value = {ArithmeticException.class,NullPointerException.class})
     *                      value 里是处理的异常类型的数组
     *                      需要处理的异常太多的时候可以写为: Exception.class
     *
     * @return   异常处理的视图
     */
//    @ExceptionHandler(value = {Exception.class})
//    public String error2(Model model,Exception ex){
////        把错误信息返回到视图
//            model.addAttribute("ex",ex);
//
//        return "error";
//    }

}
