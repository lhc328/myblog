package com.myblog.service;

import com.myblog.entity.User;

import java.util.List;

public interface UserService {
    List<User> selectAllUser();

    User selectUserById(Long user_id);

    List<User> selectUserByName(String user_name, Integer permission);

    int updateUserById(User user);

    User loginByName(String user_name, String password);

    User insertUser(String user_name, String password, String email);
}
