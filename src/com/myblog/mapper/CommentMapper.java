package com.myblog.mapper;

import com.myblog.entity.Comment;
import java.util.List;

public interface CommentMapper {
    List<Comment> showCommentByArt();
}
