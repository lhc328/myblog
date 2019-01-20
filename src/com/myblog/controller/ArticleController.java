package com.myblog.controller;

import com.myblog.entity.User;
import com.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping("/insertArt")
    public String insertArticle(String art_title, String art_info, String art_url, String content, String art_type, HttpSession session){
        Long art_user_id = ((User)session.getAttribute("user")).getUser_id();
        System.out.println(art_title+"0"+art_info+"0"+art_url+"0"+content+"0"+art_type+"0"+art_user_id);
        if(articleService.addArticle(art_title, art_info, art_url, content, art_user_id, art_type)>0){
            return "redirect:../index.jsp";
        }else{
            return "redirect:../pages/edit.jsp";
        }
    }
}
