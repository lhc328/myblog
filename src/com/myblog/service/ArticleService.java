package com.myblog.service;

import com.myblog.entity.Article;

import java.util.List;

public interface ArticleService {
    int addArticle(String art_title, String art_info, String art_url, String content, Long user_id, String art_type);

    List<Article> showArticle();

    List<Article> selectArticle();

    List<Article> showSomeArticle(String art_title, Integer art_permission, String art_type, int index, int limit);

    int updateArtPer(Long art_id, Integer art_permission);

    Article showArticleById(Long art_id);

    int getArtCount();

    List<Article> showArtLimit(int index);
}
