package cn.sjw.controller;

import cn.sjw.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class TextController {
    @RequestMapping("/hello")
    public void   hello(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              if (user.getUName() !=null && user.getUName()!= " ") {
                  if (user.getPwd() !=null && user.getPwd()!= " ") {
                     HttpSession session = request.getSession();
                     session.setAttribute("uName",user.getUName());
                     session.setAttribute("pwd",user.getPwd());
                     request.getRequestDispatcher("index.jsp").forward(request,response);
                  }

              }
    }
}
