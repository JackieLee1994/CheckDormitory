package com.checkdormitory.service;

import com.checkdormitory.entity.User;

/**
 * Created by lwxzbh on 2017/4/27.
 */
public interface UserService {
    User find(String username, String password);

    User findByName(String username);
}
