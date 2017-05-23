package com.checkdormitory.dao;

import com.checkdormitory.entity.UserEntity2;
import com.checkdormitory.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 99206 on 2017/4/10.
 */
public class UserDaoTest {
    public List<Object> query() {
        Session session = HibernateUtil.getSession();
        List<Object> list =
                session.createSQLQuery("select * from user").addEntity(UserEntity2.class).list();;
        HibernateUtil.closeSession();
        /*try {
            //实例化Configuration，这行代码默认加载hibernate.cfg.xml文件
            Configuration conf = new Configuration().configure();
            //以Confiuratigon创建SessionFactory
            SessionFactory sf = conf.buildSessionFactory();
            //实例化Session
            session = sf.openSession();
            String hql = "from UserEntity2 order by id desc ";
            Query query = session.createQuery(hql);
            list = query.list();
            //list = session.createSQLQuery("select * from user").addEntity(UserEntity2.class).list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }*/
        return list;
    }
    public boolean insertUser(UserEntity2 user){
        Session session = HibernateUtil.getSession();
        Transaction tran = session.beginTransaction();//开始事物
        session.save(user);//执行
        tran.commit();//提交
        return false;
    }
}
