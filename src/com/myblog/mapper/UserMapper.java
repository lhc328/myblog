package com.myblog.mapper;

import com.myblog.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface UserMapper {
    //增加用户
    int insert(User user);

    //删除用户
    int deleteByUserId(Long user_id);

    //查询所有用户
    List<User> selectAllUser();

    //按id查询用户
    User selectUserById(Long user_id);

    //按名字查询用户
    User selectUserByName(String user_name);

    //更改用户信息
    int updateUser(User user);

}
