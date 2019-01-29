package com.myblog.mapper;

        import com.myblog.entity.Article;
        import org.apache.ibatis.annotations.Param;


        import java.util.List;
        import java.util.Map;

public interface ArticleMapper {
    int addArticle(Article article);

    List<Article> showArticle();

    List<Article> selectArticle();

    List<Article> showSomeArticle(Map map);

    int updateArtPer(Map<String, Object> map);

    Article showArticleById(Long art_id);

    int getArtCount();

    List<Article> showArtLimit(Map<String,Object> map);
}
