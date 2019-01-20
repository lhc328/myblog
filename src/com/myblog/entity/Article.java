package com.myblog.entity;

public class Article {
    //文章ID,文章标题，发文日期，文章简介，缩略图，文章内容，文章状态，浏览数，评论数，点赞数，用户ID, 用户名, 分类
    private Long art_id;
    private String art_title;
    private String art_time;
    private String art_info;
    private String art_url;
    private String content;
    private Integer art_permission;
    private Integer art_viewers;
    private Integer art_comments;
    private Integer art_likes;
    private Long user_id;
    private String user_name;
    private String art_type;


    public Article(){

    }

    public Article(String art_title, String art_info, String art_url, String content, Long user_id, String art_type){
        this.art_title = art_title;
        this.art_info = art_info;
        this.art_url = art_url;
        this.content = content;
        this.user_id = user_id;
        this.art_type = art_type;
    }

    public Article(Long art_id, String art_title, String art_time, String art_info, String art_url, String content, Integer art_permission, Integer art_viewers, Integer art_comments, Integer art_likes, Long user_id, String user_name, String art_type) {
        this.art_id = art_id;
        this.art_title = art_title;
        this.art_time = art_time;
        this.art_info = art_info;
        this.art_url = art_url;
        this.content = content;
        this.art_permission = art_permission;
        this.art_viewers = art_viewers;
        this.art_comments = art_comments;
        this.art_likes = art_likes;
        this.user_id = user_id;
        this.user_name = user_name;
        this.art_type = art_type;
    }

    public Long getArt_id() {
        return art_id;
    }

    public void setArt_id(Long art_id) {
        this.art_id = art_id;
    }

    public String getArt_title() {
        return art_title;
    }

    public void setArt_title(String art_title) {
        this.art_title = art_title;
    }

    public String getArt_time() {
        return art_time;
    }

    public void setArt_time(String art_time) {
        this.art_time = art_time;
    }

    public String getArt_info() {
        return art_info;
    }

    public void setArt_info(String art_info) {
        this.art_info = art_info;
    }

    public String getArt_url() {
        return art_url;
    }

    public void setArt_url(String art_url) {
        this.art_url = art_url;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getArt_permission() {
        return art_permission;
    }

    public void setArt_permission(Integer art_permission) {
        this.art_permission = art_permission;
    }

    public Integer getArt_viewers() {
        return art_viewers;
    }

    public void setArt_viewers(Integer art_viewers) {
        this.art_viewers = art_viewers;
    }

    public Integer getArt_comments() {
        return art_comments;
    }

    public void setArt_comments(Integer art_comments) {
        this.art_comments = art_comments;
    }

    public Integer getArt_likes() {
        return art_likes;
    }

    public void setArt_likes(Integer art_likes) {
        this.art_likes = art_likes;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getArt_type() {
        return art_type;
    }

    public void setArt_type(String art_type) {
        this.art_type = art_type;
    }
}
