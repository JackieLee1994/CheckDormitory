package com.checkdormitory.serviceimpl;

import com.checkdormitory.dao.PowerDao;
import com.checkdormitory.service.PowerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lwxzbh on 2017/5/27.
 */
@Service
public class PowerServiceImpl implements PowerService {

    @Resource
    private  PowerDao powerDao;
    public List<Object> getColleges() {
        return powerDao.getColleges();
    }

    public List getClasses(int collegeId, int grade) {
        return powerDao.getClasses(collegeId,grade);
    }
}
