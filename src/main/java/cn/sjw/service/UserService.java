package cn.sjw.service;

import cn.sjw.pojo.User;

public interface UserService {
    //注册用户
    int addUser(User user);

    //登陆
    User selectUser(User user);

    ;
}
