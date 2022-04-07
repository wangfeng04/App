package cn.sjw.controller;

import cn.sjw.bean.Mag;
import cn.sjw.pojo.User;
import cn.sjw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 注册
     *
     * @param user   要校验的数据  要加 @Valid注解
     * @param result 校验的结果
     * @return
     */
    @ResponseBody
    @PutMapping("/add")
    public Mag addUser(@Valid User user, BindingResult result) {
        //创建一个错误的map集合
        Map<String, Object> errorMap = new HashMap<String, Object>();
        if (result.hasErrors()) {
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("error fildes：" + error.getField());
                System.out.println("error info：" + error.getDefaultMessage());
                //将字段名称作为Key 错误提示信息作为 value 存入map
                errorMap.put(error.getField(), error.getDefaultMessage());
            }
            //将错误信息的map加入到返回的Msg中返回给页面
            return Mag.fail().add("errorMap", errorMap);
        } else {
            int i = userService.addUser(user);
            return Mag.success();
        }

    }

    //登陆
    @PostMapping("/hello")
    public String selectUseer(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user1 = userService.selectUser(user);
        session.setAttribute("userid",user1.getId());
        System.out.println(user1.getId());
        if (user1 != null) {
            if (user1.getUserName() != null && user1.getPassward() != null) {
                if (user1.getQuanXian() == 1) {
                    return "shenhe";
                } else {
                    return "ruanjian";
                }
            }
        } else {
            return "index";
        }
        return "index";
    }
    @ResponseBody
    @PostMapping("/getuser")
    public Map getUseer(User user, HttpServletRequest request) throws ServletException, IOException {

        HttpSession session = request.getSession();
       Object userid = session.getAttribute("userid");
      Map<String,Object> restUser=new HashMap<String, Object>();
        restUser.put("userid",userid);
        return restUser;
    }



}
