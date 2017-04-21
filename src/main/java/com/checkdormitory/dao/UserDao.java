package com.checkdormitory.dao;

import com.checkdormitory.entity.UserEntity2;

import java.util.List;

/**
 * Created by lwxzbh on 2017/4/18.
 */
public interface UserDao {
    UserEntity2 find(String name, String pass);

    UserEntity2 findbyName(String name);

    List<Object> findAll(String queryString, Object[] params);

    void updateUser(UserEntity2 user);

    void update(String name);

    void update_user(String queryString);

    void add(UserEntity2 user);

    void modify(UserEntity2 user);

    void delete(int id);

    UserEntity2 load(int id);


}
