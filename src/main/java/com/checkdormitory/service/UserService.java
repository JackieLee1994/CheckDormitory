package com.checkdormitory.service;

import com.checkdormitory.entity.User;
import com.checkdormitory.utils.Page;

import java.util.List;

/**
 * Created by lwxzbh on 2017/4/27.
 */
public interface UserService {
    User find(String username, String password);
    User findByWorkId(String workId,String password);
    User findByName(String username);

    List<Object> findAll(String queryString, Object[] params);

    void updateUser(User user);

    void update(String username);

    void update_user(String queryString);

    Page findPageByHQL(String queryString, int startRow, int pageSize, Object[] params);

    int getTotal(String queryString, Object[] params);

    void add(User user);

    void modify(User user);

    void delete(int id);

    User load(int id);
}
