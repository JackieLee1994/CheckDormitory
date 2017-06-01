package com.checkdormitory.daoimpl;

import com.checkdormitory.dao.DataStatisticsDao;
import com.checkdormitory.entity.CheckResult;
import com.checkdormitory.entity.CounselorManageClasses;
import com.checkdormitory.utils.HibernateUtil;
import com.checkdormitory.utils.Page;
import com.checkdormitory.utils.QueryProcessor;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lwxzbh on 2017/5/23.
 */
@Repository
public class DataStatisticsDaoImpl implements DataStatisticsDao {
    public Page findLateReturnPage(String hql, int startRow, int pageSize, Object[] params) {
        Query query = HibernateUtil.getSession().createQuery("select CR.date,count (*) from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber group by CR.date ");
        ;
        List<Object[]> list = query.list();
        return getOnePage(hql, startRow, pageSize, params);
    }

    public Page findHistoryRecord(String hql, int startRow, int pageSize, Object[] params) {

        return getOnePage(hql, startRow, pageSize, params);
    }

    public List<Object[]> getCount(String countHql) {
        Query query = HibernateUtil.getSession().createQuery(countHql);
        List list = query.list();
        HibernateUtil.closeSession();
        /*select CR.studentNumber,count (*) from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber  and SI.clazz in('医影1302','软件1302','计科卓越1301','足球1402') group by CR.studentNumber order by SI.stuNumber*/
        return list;
    }

    public void pinName(int student_id) {
        CheckResult checkResult = this.load(student_id);
        Session session = HibernateUtil.getSession();
        Transaction tran = session.beginTransaction();
        session.delete(checkResult);
        tran.commit();
    }

    public List<Object[]> getLineData(String countHql) {
        Query query = HibernateUtil.getSession().createQuery(countHql);
        List<Object[]> list = query.list();
        HibernateUtil.closeSession();
        return list;
    }

    public List<Object[]> getBarData(String countHql) {
        Query query = HibernateUtil.getSession().createQuery(countHql);
        List list = query.list();
        HibernateUtil.closeSession();
        return list;
    }

    private CheckResult load(int id) {
        return (CheckResult) HibernateUtil.getSession().load(CheckResult.class, (long) id);
    }

    private Page getOnePage(String hql, int startRow, int pageSize, Object[] params) {
        int total = this.getTotal(hql, params);
        List list = null;
        if (total > 0) {
            Query hqlQuery = HibernateUtil.getSession().createQuery(hql);
            hqlQuery.setMaxResults(pageSize);
            hqlQuery.setFirstResult(startRow);
            if (params != null && params.length > 0) {
                for (int i = 0; i < params.length; i++) {
                    hqlQuery.setParameter(i, params[i]);
                }
            }
            list = hqlQuery.list();
        }
        return new Page(list, startRow, pageSize, total);
    }


    public List findLateReturnStudentID(String queryStr) {
        Query query = HibernateUtil.getSession().createQuery(queryStr);
        List list = query.list();
        HibernateUtil.closeSession();
        return list;
    }

    public String getClassesOfCounselor(String workId) {
        Query query = HibernateUtil.getSession().createQuery("from CounselorManageClasses as c where c.id=?");
        query.setInteger(0, Integer.parseInt(workId));
        CounselorManageClasses c = (CounselorManageClasses) query.uniqueResult();
        return c.getClasses();
    }

    public String getLatestDate(String hql) {
        Query query = HibernateUtil.getSession().createQuery(hql);
        String latestDate = (String) query.uniqueResult();
        return latestDate;
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
}
