package com.myblog.entity;

public class Comment {
    //评论ID, 评论内容，评论时间，评论状态，用户名，用户ID，文章ID，文章标题,父评论ID
    private Long com_id;
    private String com_info;
    private String com_time;
    private Integer com_permission;
    private String com_username;
    private Long com_user_id;
    private Long com_art_id;
    private String com_title;
    private Long com_fa_id;

    public Comment() {
    }

    public Comment(Long com_id, String com_info, String com_time, Integer com_permission, String com_username, Long com_user_id, Long com_art_id, String com_title, Long com_fa_id) {
        this.com_id = com_id;
        this.com_info = com_info;
        this.com_time = com_time;
        this.com_permission = com_permission;
        this.com_username = com_username;
        this.com_user_id = com_user_id;
        this.com_art_id = com_art_id;
        this.com_title = com_title;
        this.com_fa_id = com_fa_id;
    }

    public Long getCom_id() {
        return com_id;
    }

    public void setCom_id(Long com_id) {
        this.com_id = com_id;
    }

    public String getCom_info() {
        return com_info;
    }

    public void setCom_info(String com_info) {
        this.com_info = com_info;
    }

    public String getCom_time() {
        return com_time;
    }

    public void setCom_time(String com_time) {
        this.com_time = com_time;
    }

    public Integer getCom_permission() {
        return com_permission;
    }

    public void setCom_permission(Integer com_permission) {
        this.com_permission = com_permission;
    }

    public String getCom_username() {
        return com_username;
    }

    public void setCom_username(String com_username) {
        this.com_username = com_username;
    }

    public Long getCom_user_id() {
        return com_user_id;
    }

    public void setCom_user_id(Long com_user_id) {
        this.com_user_id = com_user_id;
    }

    public Long getCom_art_id() {
        return com_art_id;
    }

    public void setCom_art_id(Long com_art_id) {
        this.com_art_id = com_art_id;
    }

    public String getCom_title() {
        return com_title;
    }

    public void setCom_title(String com_title) {
        this.com_title = com_title;
    }

    public Long getCom_fa_id() {
        return com_fa_id;
    }

    public void setCom_fa_id(Long com_fa_id) {
        this.com_fa_id = com_fa_id;
    }
}
