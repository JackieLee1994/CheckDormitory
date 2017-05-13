package com.checkdormitory.serviceimpl;

import com.checkdormitory.dao.StudentDao;
import com.checkdormitory.entity.CheckResult;
import com.checkdormitory.entity.Checker;
import com.checkdormitory.service.StudentInfoService;
import org.json.JSONArray;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lwxzbh on 2017/5/12.
 */
@Service
public class StudentInfoServiceImpl implements StudentInfoService {
    @Resource
    private StudentDao studentDao;

    public List<Object> findStudent(String dormitoryBuilding, String scope) {
        return studentDao.findStudent(dormitoryBuilding,scope);
    }

    public Checker getScope(String workId) {
        return studentDao.getScope(workId);
    }

    public void saveCheckResult(CheckResult checkResult) {
        studentDao.saveCheckResult(checkResult);
    }
}
