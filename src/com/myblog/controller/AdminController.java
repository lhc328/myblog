package com.myblog.controller;


import com.myblog.entity.Comment;
import com.myblog.entity.User;
import com.myblog.service.CommentService;
import com.myblog.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

    @RequestMapping("showUser")
    public String showUser(Model model){
        List<User> userList = new ArrayList<User>();
        userList = userService.selectAllUser();
        System.out.println(userList);
        model.addAttribute("userlist",userList);
        return "../pages/userlist.jsp";
    }

    @RequestMapping("showUser1")
    @ResponseBody
    public Map showUser1(int page, int limit, String user_name, Integer permission){
        System.out.println(page+"0"+limit);
        List<User> userList = new ArrayList<User>();
        userList = userService.showUserLimit(page, limit, user_name, permission);
        int count = userService.showUserCount(user_name, permission);
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data",userList);
        return map;
    }

    @RequestMapping("showUserByName")
    public String showUserByNamePer(String user_name, Integer permission, Model model){
        System.out.println(user_name + "0000" + permission);
        List<User> userList = new ArrayList<User>();
        userList = userService.selectUserByName(user_name, permission);
        System.out.println(userList);
        model.addAttribute("userlist", userList);
        return  "../pages/userlist.jsp";
    }

    @RequestMapping("modiUserById")
    public String modiUserById(Long user_id, String user_name, String password, String email, Integer permission){
        User user = new User(user_id, user_name, password, email, permission, null, null);
        System.out.println(user);
        int rerow = userService.updateUserById(user);
        if(rerow>0){
            return "../pages/userlist.jsp";
        }else{
            return "/admin/showUser.shtml";
        }
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public Map deleteUser(Long user_id){
        System.out.println("delete"+user_id);
        int state = userService.deleteUser(user_id);
        Map map = new HashMap();
        map.put("state", state);
        return map;
    }

    @RequestMapping("/selectComment")
    @ResponseBody
    public Map selectComment(String user_name, String art_title, Integer com_permission, int page, int limit){
        List<Comment> comments = new ArrayList<Comment>();
        comments = commentService.selectAllComment(user_name, art_title, com_permission, page, limit);
        int count = commentService.selectCommentCount(user_name, art_title, com_permission);
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data",comments);
        return map;
    }
}
