package com.checkdormitory.service;

import com.checkdormitory.utils.Page;

import java.util.List;

/**
 * Created by lwxzbh on 2017/5/23.
 */
public interface DataStatisticsService {
    Page findLateReturnPage(String sql, int startRow, int pageSize, Object[] params);

    List findLateReturnStudentID(String queryStr);

    String getClassesOfCounselor(String workId);

    String getLatestDate(String hql);
}
