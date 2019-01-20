package com.myblog.service;

import com.myblog.entity.Article;

import java.util.List;

public interface ArticleService {
    int addArticle(String art_title, String art_info, String art_url, String content, Long user_id, String art_type);

    List<Article> showArticle();
}
