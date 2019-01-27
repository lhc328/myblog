package com.myblog.controller;

import com.myblog.entity.User;
import com.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    //登录验证
    @RequestMapping("/login")
    public String loginController(String user_name, String password, Long art_id, HttpSession session){
        System.out.println(user_name+"00000"+password);
        User user = userService.loginByName(user_name, password);
        if(user != null) {          //为null时不能存进session
            session.setAttribute("user", user);
            if(art_id != null){
                System.out.println(art_id);
                return "redirect:/article/readArticle.shtml?art_id="+art_id;
            }
        }
        return "redirect:/index.jsp";
    }

    //注销登录
    @RequestMapping("/logout")
    public String logoutServlet(Long art_id, HttpSession session){
        session.invalidate();
        if(art_id!=null){
            return "redirect:/article/readArticle.shtml?art_id="+art_id;
        }
        return "redirect:/index.jsp";
    }

    //注册
    @RequestMapping("/register")
    public String registerConstroller(String user_name, String password, String email, HttpSession session){
        User user = userService.insertUser(user_name, password, email);
        if(user == null){
            return "redirect:register.jsp";
        }else{
            session.setAttribute("user", user);
            return "redirect:/index.jsp";
        }
    }
}
