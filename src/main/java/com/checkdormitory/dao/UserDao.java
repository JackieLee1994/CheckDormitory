package com.checkdormitory.dao;

import com.checkdormitory.entity.User;
import com.checkdormitory.utils.Page;

import java.util.List;

/**
 * Created by lwxzbh on 2017/4/18.
 */
public interface UserDao {
    User find(String username, String password);
    User findByWorkId(String workId,String password);
    User findbyName(String name);

    List<Object> findAll(String queryString, Object[] params);

    void updateUser(User user);

    void update(String name);

    void update_user(String queryString);

    void add(User user);

    void modify(User user);

    void delete(int id);

    User load(int id);

    Page findPageByHQL_Sqltotal(String queryString, int startRow, int pageSize, Object[] params);

    // Page findPage(String queryString, int startRow, int pageSize,
    // List<Object> params);
    Page findPageByHQL(String queryString, int startRow, int pageSize, Object[] params);
    int getTotal(String queryString, Object[] params);

    int getTotalBySQL(String queryString, Object[] params);

}
