package com.myblog.controller;


import com.myblog.entity.Comment;
import com.myblog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping("/insertComment")
    @ResponseBody
    public Map insertComment(String com_info, Long user_id, Long art_id, Long com_fa_id){
        System.out.println(com_info +" "+ user_id +" " +art_id);
        int state = commentService.insertComment(com_info, user_id, art_id, com_fa_id);
        Map map = new HashMap();
        map.put("state", state);
        return map;
    }

    @RequestMapping("/showComment")
    @ResponseBody
    public Map showComment(Long art_id){
        System.out.println(art_id);
        List<Comment> commentlist = new ArrayList<Comment>();
        commentlist = commentService.showCommentByArt(art_id);
        Map map = new HashMap();
        map.put("commentlist", commentlist);
        return map;
    }
}
