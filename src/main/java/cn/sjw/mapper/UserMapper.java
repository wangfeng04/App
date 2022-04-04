package cn.sjw.mapper;

import cn.sjw.pojo.User;

public interface UserMapper {
    //注册用户
    int addUser(User user);
    //登陆
    User selectUser(User user);

}
