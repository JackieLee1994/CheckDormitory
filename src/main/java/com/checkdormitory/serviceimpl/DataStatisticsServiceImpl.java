package com.checkdormitory.serviceimpl;

import com.checkdormitory.dao.DataStatisticsDao;
import com.checkdormitory.entity.HistoryRecord;
import com.checkdormitory.service.DataStatisticsService;
import com.checkdormitory.utils.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lwxzbh on 2017/5/23.
 */
@Service
public class DataStatisticsServiceImpl implements DataStatisticsService {
    @Resource
    private DataStatisticsDao dataStatisticsDao;

    public Page findLateReturnPage(String sql, int startRow, int pageSize, Object[] params) {
        return dataStatisticsDao.findLateReturnPage(sql,startRow,pageSize,params);
    }

    public List findLateReturnStudentID(String queryStr) {
        return dataStatisticsDao.findLateReturnStudentID(queryStr);
    }

    public String getClassesOfCounselor(String workId) {
        return dataStatisticsDao.getClassesOfCounselor(workId);
    }

    public String getLatestDate(String hql) {
        return dataStatisticsDao.getLatestDate(hql);
    }

    public Page findHistoryRecord(String hql, int startRow, int pageSize, Object[] params) {
        return dataStatisticsDao.findHistoryRecord(hql,startRow,pageSize,params);
    }

    public Page getCount(String countHql, int startRow, int pageSize, Object[] params) {
        return dataStatisticsDao.getCount(countHql,startRow,pageSize,params);
    }

    public void pinName(int student_id) {
        dataStatisticsDao.pinName(student_id);
    }
}
