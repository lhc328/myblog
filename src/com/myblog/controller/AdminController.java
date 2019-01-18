package com.myblog.controller;


import com.myblog.entity.User;
import com.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
    @Autowired
    private UserService userService;


    @RequestMapping("showUser")
    public String showUser(Model model){
        List<User> userList = new ArrayList<User>();
        userList = userService.selectAllUser();
        System.out.println(userList);
        model.addAttribute("userlist",userList);
        return "../pages/userlist.jsp";
    }

    @RequestMapping("showUserByName")
    public String showUserByNamePer(String user_name, Integer permission, Model model){
        List<User> userList = new ArrayList<User>();
        userList = userService.selectUserByName(user_name, permission);
        System.out.println(userList);
        model.addAttribute("userlist", userList);
        return  "../pages/userlist.jsp";
    }

}
