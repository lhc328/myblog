package com.myblog.mapper;

import com.myblog.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface UserMapper {

    //查询所有用户
    List<User> selectAllUser();

    //按id查询用户
    User selectUserById(Long user_id);

    //按名字或权限查询用户
    List<User> selectUserByName(@Param("user_name")String user_name, @Param("permission")Integer permission);

    //更改用户信息
    int updateUserById(User user);

    //用户名登录
    User loginByName(String user_name);

    //用户注册
    int insertUser(User user);
}
