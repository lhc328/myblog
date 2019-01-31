package com.myblog.service;

import com.myblog.entity.Comment;

import java.util.List;
import java.util.Map;

public interface CommentService {

    //管理员评论管理
    List<Comment> selectAllComment(String user_name, String art_title, Integer com_permission, int page, int limit);

    int selectCommentCount(String user_name, String art_title, Integer com_permission);

    //查看评论
    List<Comment> showCommentByArt(Long art_id);

    //添加评论
    int insertComment(String com_info, Long user_id, Long art_id, Long com_fa_id);
}
