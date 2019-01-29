package com.myblog.controller;

import com.myblog.entity.Article;
import com.myblog.entity.User;
import com.myblog.service.ArticleService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @ResponseBody
    public Map showSomeArticle(String art_title, Integer art_permission, String art_type, int page, int limit){
        List<Article> articles = new ArrayList<Article>();
        articles = articleService.showSomeArticle(art_title, art_permission, art_type, page, limit);
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", 10);
        map.put("data",articles);
        return map;
    }

    @RequestMapping("/modifyArtPer")
    @ResponseBody
    public Map modifyArtPermission(Long art_id, Integer art_permission){
        System.out.println(art_id+"000"+art_permission);
        int state = articleService.updateArtPer(art_id, art_permission);
        Map map = new HashMap();
        map.put("state", state);
        return map;
    }

    //首页
    @RequestMapping("/index")
    public String indexDo(Model model){
        List<Article> articleList = new ArrayList<Article>();
        articleList = articleService.selectArticle();
        model.addAttribute("articlelist", articleList);
        return "../index.jsp";
    }

    @RequestMapping("/index1")
    @ResponseBody
    public String indexDo(Integer curr){
        List<Article> articleList = new ArrayList<Article>();
        articleList = articleService.showArtLimit(curr);
        System.out.println(curr);
        int totalCount = articleService.getArtCount();
        Map map = new HashMap();
        map.put("articlelist",articleList);
        map.put("curr",curr);
        map.put("totalCount",totalCount);
        String result = new JSONObject(map).toString();
        return result;
    }


    @RequestMapping("/readArticle")
    public String readArticle(Long art_id, Model model){
        Article article = new Article();
        article = articleService.showArticleById(art_id);
        if(article != null){
            model.addAttribute("article", article);
            return "../content.jsp";
        }else{
            return "../index.jsp";
        }
    }
}
