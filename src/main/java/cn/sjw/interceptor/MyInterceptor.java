package cn.sjw.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //preHandle() 方法：该方法会在控制器方法前执行，其返回值表示是否中断后续操作。当其返回值
        //为true时，表示继续向下执行；当其返回值为false时，会中断后续的所有操作（包括调用下一个拦截器和控制器类中的方法执行等）。
        HttpSession session = request.getSession();
        String uName = (String) session.getAttribute("uName");
        String pwd = (String) session.getAttribute("pwd");
        if ("admin".equals(uName) && "admin".equals(pwd)) {
            return true;
        }
        request.getRequestDispatcher("WEB-INF/jsp/.jsp").forward(request, response);
        return false;
    }

//
//
//    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//            //postHandle()方法：该方法会在控制器方法调用之后，且解析视图之前执行。可以通过此方法对请
//            //求域中的模型和视图做出进一步的修改。
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//    //afterCompletion()方法：该方法会在整个请求完成，即视图渲染结束之后执行。可以通过此方法实
//    //现一些资源清理、记录日志信息等工作
//    }
}
