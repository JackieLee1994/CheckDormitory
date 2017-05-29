package com.checkdormitory.dao;

import com.checkdormitory.utils.Page;

import java.util.List;

/**
 * Created by lwxzbh on 2017/5/23.
 */
public interface DataStatisticsDao {
    Page findLateReturnPage(String sql, int startRow, int pageSize, Object[] params);

    List findLateReturnStudentID(String queryStr);

    String getClassesOfCounselor(String workId);

    String getLatestDate(String hql);

    Page findHistoryRecord(String hql, int startRow, int pageSize, Object[] params);

    List<Object[]> getCount(String countHql);

    void pinName(int student_id);

    List<Object[]> getLineData(String countHql);

    List<Object[]> getBarData(String countHql);
}
