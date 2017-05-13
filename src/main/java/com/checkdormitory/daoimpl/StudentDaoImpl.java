package com.checkdormitory.daoimpl;

import com.checkdormitory.dao.StudentDao;
import com.checkdormitory.entity.CheckResult;
import com.checkdormitory.entity.Checker;
import com.checkdormitory.utils.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import java.util.Iterator;
import java.util.List;

/**
 * Created by lwxzbh on 2017/5/12.
 */
@Repository
public class StudentDaoImpl implements StudentDao {
    public List<Object> findStudent(String dormitoryBuilding, String scope) {//{"1":"1","2":"3"}
        //遍历scop,获取查寝范围
        JSONObject jsonObject = new JSONObject(scope);
        String hql = "from StudentInfo where dormitoryBuilding= '"+dormitoryBuilding+"'";
        Iterator iterator=jsonObject.keys();
        int i=0;
        while(iterator.hasNext()){
            String key = (String) iterator.next();
            String floor = jsonObject.getString(key);
            if(i == 0)
                hql += " and dormitoryNumber like '_"+floor+"__'";
            else
                hql += " or dormitoryNumber like '_"+floor+"__'";
            i=2;
        }
        Session session = HibernateUtil.getSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public Checker getScope(String workId) {
        Session session = HibernateUtil.getSession();
        Query query = session.createQuery("from Checker where id=?").setString(0,workId);
        return (Checker) query.uniqueResult();
    }

    public void saveCheckResult(CheckResult checkResult) {
        Session session = HibernateUtil.getSession();
        Transaction tran = session.beginTransaction();//开始事务
        session.save(checkResult);//执行
        tran.commit();//提交
        HibernateUtil.closeSession();
    }


}
