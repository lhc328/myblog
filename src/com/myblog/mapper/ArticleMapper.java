package com.myblog.mapper;

import com.myblog.entity.Article;

import java.util.List;

public interface ArticleMapper {
    int addArticle(Article article);

    List<Article> showArticle();
}
