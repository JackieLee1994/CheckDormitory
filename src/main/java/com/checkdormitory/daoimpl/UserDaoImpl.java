package com.checkdormitory.daoimpl;

import com.checkdormitory.dao.UserDao;
import com.checkdormitory.entity.User;
import com.checkdormitory.utils.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
 * Created by lwxzbh on 2017/4/27.
 */
@Repository
public class UserDaoImpl implements UserDao {
    public User find(String username, String password) {
        Session session = HibernateUtil.getSession();
        System.out.println(username + " " + password);
        Query query =
                session.createQuery("from  User  where username=? and password=?")
                        .setString(0, username)
                        .setString(1, password);
        User user = (User) query.uniqueResult();
        return user;
    }
}
