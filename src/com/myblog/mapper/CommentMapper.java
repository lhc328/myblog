package com.myblog.mapper;

import com.myblog.entity.Comment;
import java.util.List;
import java.util.Map;

public interface CommentMapper {
    List<Comment> showCommentByArt(Long art_id);

    List<Comment> selectAllComment(Map map);

    int selectCommentCount(Map map);

    int insertComment(Map map);

    //操作评论
    int operateComment(int com_permission ,Long com_id);
}
