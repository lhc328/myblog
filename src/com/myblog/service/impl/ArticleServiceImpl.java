package com.myblog.service.impl;

import com.myblog.entity.Article;
import com.myblog.mapper.ArticleMapper;
import com.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    public int addArticle(String art_title, String art_info, String art_url, String content, Long user_id, String art_type){
        Article article = new Article(art_title, art_info, art_url, content, user_id, art_type);
        return articleMapper.addArticle(article);
    }

    public List<Article> showArticle(){
        return articleMapper.showArticle();
    }

    public List<Article> selectArticle(){return articleMapper.selectArticle(); }

    public List<Article> showSomeArticle(String art_title, Integer art_permission, String art_type, int page, int limit){
        Map map = new HashMap();
        int index = (page-1) * limit;
        map.put("art_title", art_title);
        map.put("art_permission", art_permission);
        map.put("art_type", art_type);
        map.put("index", index);
        map.put("limit", limit);
        return articleMapper.showSomeArticle(map);
    }

    public int updateArtPer(Long art_id, Integer art_permission){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("art_id", art_id);
        map.put("art_permission", art_permission);
        return articleMapper.updateArtPer(map);
    }

    //阅读全文
    public Article showArticleById(Long art_id){
        return articleMapper.showArticleById(art_id);
    }

    //返回文章总数量
    public int getArtCount(){
        return articleMapper.getArtCount();
    }

    public List<Article> showArtLimit(int index){
        Map<String, Object> map = new HashMap<String, Object>();
        index = (index-1)*5;
        int count = 5;
        map.put("index", index);
        map.put("count", count);
        return articleMapper.showArtLimit(map);
    }
}
