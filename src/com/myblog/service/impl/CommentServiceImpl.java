package com.myblog.service.impl;

import com.myblog.entity.Comment;
import com.myblog.mapper.CommentMapper;
import com.myblog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    public List<Comment> showCommentByArt(Long art_id){
        return commentMapper.showCommentByArt(art_id);
    }

    public List<Comment> selectAllComment(String user_name, String art_title, Integer com_permission, int page, int limit){
        Map map = new HashMap();
        int index = (page-1) * limit;
        map.put("index", index);
        map.put("limit", limit);
        map.put("user_name", user_name);
        map.put("art_title", art_title);
        map.put("com_permission", com_permission);
        return commentMapper.selectAllComment(map);
    }

    public int selectCommentCount(String user_name, String art_title, Integer com_permission){
        Map map = new HashMap();
        map.put("user_name", user_name);
        map.put("art_title", art_title);
        map.put("com_permission", com_permission);
        return commentMapper.selectCommentCount(map);
    }

    public int insertComment(String com_info, Long user_id, Long art_id, Long com_fa_id){
        Map map = new HashMap();
        map.put("com_info", com_info);
        map.put("user_id", user_id);
        map.put("art_id", art_id);
        map.put("com_fa_id", com_fa_id);
        return commentMapper.insertComment(map);
    }

    public int operateComment(int com_permission, Long com_id){
        return commentMapper.operateComment(com_permission, com_id);
    }
}
