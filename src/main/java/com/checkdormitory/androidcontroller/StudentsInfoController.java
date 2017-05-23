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
import java.util.*;

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
            /*obj.getString("date");*/
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
        JSONArray scope = new JSONArray();
        //[{"dorm_ID":"[{"name":"","student_ID":""},{"name":"","student_ID":""}]"}]
        Map<String,JSONArray> map = new HashMap<String,JSONArray>();
        for (Object obj:list){
            StudentInfo stu = (StudentInfo)obj;
            String dorm_ID = stu.getDormitoryNumber();

            JSONObject aMember = new JSONObject();
            aMember.put("name",stu.getName());
            aMember.put("student_ID",stu.getStuNumber());
            aMember.put("bed_ID",stu.getBedNumber());
            aMember.put("class_Name",stu.getClazz());
            aMember.put("college",stu.getCollege());
            if(map.containsKey(dorm_ID)){
                JSONArray aDorm = map.get(dorm_ID);
                aDorm.put(aMember);
                map.put(dorm_ID,aDorm);
            }else{
                JSONArray aDorm = new JSONArray();
                aDorm.put(aMember);
                map.put(dorm_ID,aDorm);
            }
        }
        for (Map.Entry<String, JSONArray> entry : map.entrySet()) {
            JSONObject aDorm = new JSONObject();
            aDorm.put("dormitory_ID",entry.getKey());
            aDorm.put("members",entry.getValue());
            scope.put(aDorm);
        }
        return scope.toString();
    }


    @RequestMapping(value = "/scope",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    private String getCheckScope(@RequestParam String workId){
        Checker checker = studentInfoService.getScope(workId);
        return checker.getCheckScope();
    }
}
