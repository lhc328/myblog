package com.myblog.mapper;

        import com.myblog.entity.Article;
        import org.apache.ibatis.annotations.Param;


        import java.util.List;

public interface ArticleMapper {
    int addArticle(Article article);

    List<Article> showArticle();

    List<Article> showSomeArticle(@Param("art_title")String art_title, @Param("art_permission")Integer art_permission, @Param("art_type")String art_type);
}
