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

}
