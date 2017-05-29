package com.checkdormitory.service;

import java.util.List;

/**
 * Created by lwxzbh on 2017/5/27.
 */
public interface PowerService {
    List<Object> getColleges();

    List getClasses(int collegeId, int grade);
}
