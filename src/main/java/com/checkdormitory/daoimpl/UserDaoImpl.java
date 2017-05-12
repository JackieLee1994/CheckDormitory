package com.checkdormitory.daoimpl;

import com.checkdormitory.dao.UserDao;
import com.checkdormitory.entity.User;
import com.checkdormitory.utils.HibernateUtil;
import com.checkdormitory.utils.Page;
import com.checkdormitory.utils.QueryProcessor;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    public User findByWorkId(String workId, String password) {
        Session session=HibernateUtil.getSession();
        Query query = session.createQuery("from User where workId=? and password=?")
                .setString(0,workId)
                .setString(1,password);
        User user = (User)query.uniqueResult();
        return user;
    }

    public User findbyName(String name) {
        return null;
    }

    public List<Object> findAll(String queryString, Object[] params) {
        return null;
    }

    public void updateUser(User user) {

    }

    public void update(String name) {

    }

    public void update_user(String queryString) {

    }

    public void add(User user) {
        Session session = HibernateUtil.getSession();
        Transaction tran = session.beginTransaction();//开始事物
        session.save(user);//执行
        tran.commit();//提交
    }

    public void modify(User user) {
        Session session = HibernateUtil.getSession();
        Transaction tran = session.beginTransaction();
        session.update(user);
        tran.commit();
    }

    public void delete(int id) {
        User user = this.load(id);
        Session session = HibernateUtil.getSession();
        Transaction tran = session.beginTransaction();
        session.delete(user);
        tran.commit();
    }

    public User load(int id) {

        return (User) HibernateUtil.getSession().load(User.class, (long)id);
    }

    public Page findPageByHQL_Sqltotal(String queryString, int startRow, int pageSize, Object[] params) {
        return null;
    }

    public Page findPageByHQL(String queryString, int startRow, int pageSize, Object[] params) {
        int total = this.getTotal(queryString, params);
        List list = null;
        if (total > 0) {
            Query query = HibernateUtil.getSession().createQuery(queryString);
            query.setFirstResult(startRow);
            query.setMaxResults(pageSize);
            if (params != null && params.length > 0) {
                for (int i = 0; i < params.length; i++) {
                    query.setParameter(i, params[i]);
                }
            }
            list = query.list();
        }
        return new Page(list, startRow, pageSize, total);
    }


    public int getTotal(String queryString, Object[] params) {

        String hql = "select count(*) "
                + QueryProcessor.removeFetchs(
                QueryProcessor.removeSelect(QueryProcessor.removeOrders(queryString)));
        Query query = HibernateUtil.getSession().createQuery(hql);
        if (params != null && params.length > 0) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
        List list = query.list();
        int total = 0;
        if (list != null && list.size() > 0) {
            System.out.println(list.get(0) + "total......");
            total = Integer.parseInt(list.get(0) + "");
        }
        return total;
    }

    public int getTotalBySQL(String queryString, Object[] params) {
        return 0;
    }
}
