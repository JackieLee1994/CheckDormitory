package com.checkdormitory.dao;

import com.checkdormitory.entity.User;

/**
 * Created by lwxzbh on 2017/4/18.
 */
public interface UserDao {
    User find(String username, String password);


}
