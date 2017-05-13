package com.checkdormitory.androidcontroller;

import com.checkdormitory.entity.CheckResult;
import com.checkdormitory.entity.Checker;
import com.checkdormitory.entity.StudentInfo;
import com.checkdormitory.service.StudentInfoService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by lwxzbh on 2017/5/12.
 */
@Controller
@RequestMapping(value = "/student")
public class StudentsInfoController {
    @Resource
    private StudentInfoService studentInfoService;

    @RequestMapping(value = "/check_result",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    private String checkResult(@RequestParam String result){
        if (result ==null)
            return "{\"code\":\"failure\"}";
        JSONArray jsonArray= new JSONArray(result);
        Iterator iterator = jsonArray.iterator();
        Date date = new Date();
        Long dateTime =date.getTime();
        while (iterator.hasNext()){
            JSONObject obj=(JSONObject)iterator.next();

            CheckResult checkResult=new CheckResult();
            checkResult.setStudentNumber(obj.getString("studentNumber"));
            Timestamp time = new Timestamp(dateTime);
            checkResult.setDate(time);

            studentInfoService.saveCheckResult(checkResult);
        }
        return "{\"code\":\"success\"}";
    }

    @RequestMapping(value = "/list",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    private String getStudentInfo(@RequestParam String workId){
        //首先得到宿舍管理员的查寝范围：寝室楼、楼层
        Checker checker = studentInfoService.getScope(workId);
        JSONObject jsonObject = new JSONObject(checker.getCheckScope());
        String dormitoryBuilding = jsonObject.getString("building");
        String floor = jsonObject.get("floor").toString();
        //查询查寝范围内的学生信息
        List<Object> list = studentInfoService.findStudent(dormitoryBuilding,floor);
        JSONArray jsonArray = new JSONArray();
        for (Object obj:list){
            StudentInfo stu = (StudentInfo)obj;
            JSONObject jsonStudentInfo = new JSONObject();
            jsonStudentInfo.put("stuNumber",stu.getStuNumber());
            jsonStudentInfo.put("name",stu.getName());
            jsonStudentInfo.put("headImg",stu.getHeadImg());
            jsonStudentInfo.put("tel",stu.getTel());
            jsonStudentInfo.put("college",stu.getCollege());
            jsonStudentInfo.put("major",stu.getMajor());
            jsonStudentInfo.put("clazz",stu.getClazz());//班级
            jsonStudentInfo.put("dormitoryBuilding",stu.getDormitoryBuilding());
            jsonStudentInfo.put("dormitoryNumber",stu.getDormitoryNumber());
            jsonStudentInfo.put("bedNumber",stu.getBedNumber());
            jsonStudentInfo.put("noComingSum",stu.getNoComingSum());
            jsonArray.put(jsonStudentInfo);
        }
        return jsonArray.toString();
    }


    @RequestMapping(value = "/scope",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    private String getCheckScope(@RequestParam String workId){
        Checker checker = studentInfoService.getScope(workId);
        return checker.getCheckScope();
    }
}
