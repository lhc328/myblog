package com.myblog.entity;

public class User {
    private Long user_id;       //用户ID
    private String user_name;
    private String password;
    private String email;
    private Integer permission;     //用户权限 1 管理员 2 普通 3 游客  4删除
    private String reg_time;   //注册时间
    private String img_url;     //头像url

    public User(){

    }

    public User(Long user_id, String user_name, String password, String email, Integer permission, String reg_time, String img_url){
        this.user_id = user_id;
        this.user_name = user_name;
        this.password = password;
        this.email = email;
        this.permission = permission;
        this.reg_time = reg_time;
        this.img_url = img_url;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    public String getReg_time() {
        return reg_time;
    }

    public void setReg_time(String reg_time) {
        this.reg_time = reg_time;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", permission=" + permission +
                ", reg_time='" + reg_time + '\'' +
                ", img_url='" + img_url + '\'' +
                '}';
    }
}
