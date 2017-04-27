package com.checkdormitory.serviceimpl;

import com.checkdormitory.dao.UserDao;
import com.checkdormitory.entity.User;
import com.checkdormitory.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by lwxzbh on 2017/4/27.
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;


    public User find(String username, String password) {
        return userDao.find(username,password);
    }

    public User findByName(String username) {
        return null;
    }

}
