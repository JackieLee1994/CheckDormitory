package com.checkdormitory.service;

import com.checkdormitory.entity.CheckResult;
import com.checkdormitory.entity.Checker;
import org.json.JSONArray;

import java.util.List;

/**
 * Created by lwxzbh on 2017/5/12.
 */
public interface StudentInfoService {
    List<Object> findStudent(String dormitoryBuilding, String scope);

    Checker getScope(String workId);

    void saveCheckResult(CheckResult checkResult);
}
