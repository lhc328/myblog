package com.myblog.controller;

import com.myblog.entity.Article;
import com.myblog.entity.User;
import com.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping("/insertArt")
    public String insertArticle(String art_title, String art_info, String art_url, String content, String art_type, HttpSession session){
        Long user_id = ((User)session.getAttribute("user")).getUser_id();
        System.out.println(art_title+"0"+art_info+"0"+art_url+"0"+content+"0"+art_type+"0"+user_id);
        if(articleService.addArticle(art_title, art_info, art_url, content, user_id, art_type)>0){
            return "redirect:../index.jsp";
        }else{
            return "redirect:../pages/edit.jsp";
        }
    }

    @RequestMapping("/showAllArt")
    public String showAllArticle(Model model){
        List<Article> articles = new ArrayList<Article>();
        articles = articleService.showArticle();
        System.out.println(articles);
        model.addAttribute("articlelist", articles);
        return "../pages/artiles.jsp";
    }

    @RequestMapping("/showSomeArt")
    public String showSomeArticle(String art_title, Integer art_permission, String art_type, Model model){
        List<Article> articles = new ArrayList<Article>();
        articles = articleService.showSomeArticle(art_title, art_permission, art_type);
        System.out.println(articles);
        model.addAttribute("articlelist", articles);
        return "../pages/artiles.jsp";
    }

    @RequestMapping("/modifyArtPer")
    public String modifyArtPermission(Long art_id, Integer art_permission){
        System.out.println(art_id+"000"+art_permission);
        if(articleService.updateArtPer(art_id, art_permission) > 0){
            return "/article/showAllArt.shtml";
        }else{
            return "/article/showAllArt.shtml";
        }
    }
}
