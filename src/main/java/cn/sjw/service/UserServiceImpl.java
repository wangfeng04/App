package cn.sjw.service;

import cn.sjw.mapper.UserMapper;
import cn.sjw.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public int addUser(User user) {

        return userMapper.addUser(user);
    }

    @Override
    public User selectUser(User user) {
        return userMapper.selectUser(user);
    }

}
