package com.myblog.service.impl;

import com.myblog.entity.Article;
import com.myblog.mapper.ArticleMapper;
import com.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    public int addArticle(String art_title, String art_info, String art_url, String content, Long art_user_id, String art_type){
        Article article = new Article(art_title, art_info, art_url, content, art_user_id, art_type);
        return articleMapper.addArticle(article);
    }
}
