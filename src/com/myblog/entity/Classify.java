package com.myblog.entity;

public class Classify {
    //分类ID，分类名称，父分类ID
    private Integer type_id;
    private String type_name;
    private Integer type_fa_id;

    public Classify() {
    }

    public Classify(Integer type_id, String type_name, Integer type_fa_id) {
        this.type_id = type_id;
        this.type_name = type_name;
        this.type_fa_id = type_fa_id;
    }

    public Integer getType_id() {
        return type_id;
    }

    public void setType_id(Integer type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public Integer getType_fa_id() {
        return type_fa_id;
    }

    public void setType_fa_id(Integer type_fa_id) {
        this.type_fa_id = type_fa_id;
    }
}
