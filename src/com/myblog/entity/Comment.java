package com.myblog.entity;

public class Comment {
    //评论ID, 评论内容，评论时间，评论状态，用户名，用户ID，文章ID，文章标题,父评论ID
    private Long com_id;
    private String com_info;
    private String com_time;
    private Integer com_permission;
    private String user_name;
    private Long user_id;
    private Long art_id;
    private Long com_fa_id;
    private String art_title;

    public Comment() {
    }

    public Comment(Long com_id, String com_info, String com_time, Integer com_permission, String user_name, Long user_id, Long art_id, Long com_fa_id, String art_title) {
        this.com_id = com_id;
        this.com_info = com_info;
        this.com_time = com_time;
        this.com_permission = com_permission;
        this.user_name = user_name;
        this.user_id = user_id;
        this.art_id = art_id;
        this.com_fa_id = com_fa_id;
        this.art_title = art_title;
    }

    public String getArt_title() {
        return art_title;
    }

    public void setArt_title(String art_title) {
        this.art_title = art_title;
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

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Long getArt_id() {
        return art_id;
    }

    public void setArt_id(Long art_id) {
        this.art_id = art_id;
    }

    public Long getCom_fa_id() {
        return com_fa_id;
    }

    public void setCom_fa_id(Long com_fa_id) {
        this.com_fa_id = com_fa_id;
    }
}
