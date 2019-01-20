package com.myblog.service;

public interface ArticleService {
    int addArticle(String art_title, String art_info, String art_url, String content, Long art_user_id, String art_type);
}
