package com.myblog.service;

import com.myblog.entity.User;

import java.util.List;

public interface UserService {
    List<User> selectAllUser();
}
