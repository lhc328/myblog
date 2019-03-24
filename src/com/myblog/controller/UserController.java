package com.myblog.controller;

import com.myblog.entity.RedisUtil;
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

    @Autowired
    private RedisUtil redisUtil;

    //登录验证
    @RequestMapping("/login")
    public String loginController(String user_name, String password, Long art_id, HttpSession session){
        System.out.println(user_name+"00000"+password);
        User user = userService.loginByName(user_name, password);
        if(user != null) {          //为null时不能存进session
            session.setAttribute("user", user);
            System.out.println(session.getId());
            redisUtil.set(session.getId(),user.getUser_name());
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

    //后台登录
    @RequestMapping("/adminlogin")
    public String adminlogin(String user_name, String password, HttpSession session){
        User user = userService.loginByName(user_name, password);
        if(user != null && user.getPermission()==1) {          //为null时不能存进session
            session.setAttribute("user", user);
            return "/WEB-INF/testPages/admin.jsp";
        }
        return "redirect:/index.jsp";
    }
}
