package com.checkdormitory.serviceimpl;

import com.checkdormitory.dao.UserDao;
import com.checkdormitory.entity.User;
import com.checkdormitory.service.UserService;
import com.checkdormitory.utils.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    public User findByWorkId(String workId, String password) {
        return userDao.findByWorkId(workId,password);
    }

    public User findByName(String username) {
        return null;
    }

    public List<Object> findAll(String queryString, Object[] params) {
        return null;
    }

    public void updateUser(User user) {

    }

    public void update(String username) {

    }

    public void update_user(String queryString) {

    }

    public Page findPageByHQL(String queryString, int startRow, int pageSize, Object[] params) {
        return userDao.findPageByHQL(queryString, startRow, pageSize, params);
    }

    public int getTotal(String queryString, Object[] params) {
        return 0;
    }

    public void add(User user) {
        userDao.add(user);
    }

    public void modify(User user) {
        userDao.modify(user);
    }

    public void delete(int id) {
        userDao.delete(id);
    }

    public User load(int id) {
        return userDao.load(id);
    }
}
