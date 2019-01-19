package com.myblog.entity;

public class Article {
    //文章ID,文章标题，发文日期，文章简介，缩略图，文章内容，文章状态，浏览数，评论数，点赞数，用户ID, 用户名
    private Long art_id;
    private String title;
    private String art_time;
    private String art_info;
    private String art_url;
    private String content;
    private Integer art_permission;
    private Integer art_viewers;
    private Integer art_comments;
    private Integer art_likes;
    private Long art_user_id;
    private String art_username;


    public Article(){

    }

    public Article(Long art_id, String title, String art_time, String art_info, String art_url, String content, Integer art_permission, Integer art_viewers, Integer art_comments, Integer art_likes, Long art_user_id, String art_username) {
        this.art_id = art_id;
        this.title = title;
        this.art_time = art_time;
        this.art_info = art_info;
        this.art_url = art_url;
        this.content = content;
        this.art_permission = art_permission;
        this.art_viewers = art_viewers;
        this.art_comments = art_comments;
        this.art_likes = art_likes;
        this.art_user_id = art_user_id;
        this.art_username = art_username;
    }

    public Long getArt_id() {
        return art_id;
    }

    public void setArt_id(Long art_id) {
        this.art_id = art_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public Long getArt_user_id() {
        return art_user_id;
    }

    public void setArt_user_id(Long art_user_id) {
        this.art_user_id = art_user_id;
    }

    public String getArt_username() {
        return art_username;
    }

    public void setArt_username(String art_username) {
        this.art_username = art_username;
    }
}