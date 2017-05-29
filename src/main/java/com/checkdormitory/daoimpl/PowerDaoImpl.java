package com.checkdormitory.daoimpl;

import com.checkdormitory.dao.PowerDao;
import com.checkdormitory.utils.HibernateUtil;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lwxzbh on 2017/5/27.
 */
@Repository
public class PowerDaoImpl implements PowerDao {
    public List<Object> getColleges() {
        Query query = HibernateUtil.getSession().createQuery("from College");
        List list = query.list();
        HibernateUtil.closeSession();
        return list;
    }

    public List getClasses(int collegeId, int grade) {
        Query query = HibernateUtil.getSession().createQuery("from Classes as c where c.collegeId=? and c.grade=? and c.distributed=0");
        query.setInteger(0,collegeId);
        query.setInteger(1,grade);
        List list = query.list();
        HibernateUtil.closeSession();
        return list;
    }
}
