package com.myblog.service.impl;

import com.myblog.entity.User;
import com.myblog.mapper.UserMapper;
import com.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    //输出全部User, 后面要改成分页处理
    public List<User> selectAllUser(){
        return userMapper.selectAllUser();
    }

    //利用user_id搜索User
    public User selectUserById(Long user_id){
        return userMapper.selectUserById(user_id);
    }

    //利用user_name模糊查询
    public List<User> selectUserByName(String user_name, Integer permission){
        return userMapper.selectUserByName(user_name, permission);
    }

    public int updateUserById(User user){
        return userMapper.updateUserById(user);
    }

    //登录验证
    public User loginByName(String user_name, String password){
        User user = userMapper.loginByName(user_name);
        System.out.println(user);
        if(user != null) {
            if (password.equals(user.getPassword()) && user.getPermission() != 4) {
                return user;
            } else {
                return null;
            }
        }
        return null;
    }

    //用户注册
    public User insertUser(String user_name, String password, String email){
        User user = userMapper.loginByName(user_name);
        if(user != null){
            return null;
        }else{
            user = new User();
            user.setUser_name(user_name);
            user.setPassword(password);
            user.setEmail(email);
            user.setImg_url("bbb");
            return (userMapper.insertUser(user))!=0?userMapper.loginByName(user_name):null;
        }
    }
}
