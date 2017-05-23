package com.checkdormitory.controller;

import com.checkdormitory.entity.CheckResult;
import com.checkdormitory.entity.StudentInfo;
import com.checkdormitory.service.DataStatisticsService;
import com.checkdormitory.utils.HttpUtil;
import com.checkdormitory.utils.Page;
import com.checkdormitory.utils.Pagination;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lwxzbh on 2017/5/23.
 */
@Controller
@RequestMapping(value = "/dataStatistics")
public class DataStatisticsController {

    @Resource
    private DataStatisticsService dataStatisticsService;

    @RequestMapping(value = "/lateReturnList")
    private ModelAndView lateReturnList(HttpServletRequest request, HttpServletResponse response,
                                        HttpSession session, @RequestParam String workId) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        //获取辅导员管理的班级
        String classesOfCounselor = dataStatisticsService.getClassesOfCounselor(workId);
        JSONArray classesJSONArray = new JSONArray(classesOfCounselor);
        Map<String, Object> classesMap = new HashMap<String, Object>();
        for (int i = 0; i < classesJSONArray.length(); i++) {
            JSONObject oneClass = (JSONObject) classesJSONArray.get(i);
            classesMap.put(oneClass.getString("class_name"), "");
        }

        HttpUtil util = new HttpUtil(request, response);
        int startRow = util.parseInt(Pagination.START_ROW);
        /*select CR.student_number from CheckResult as CR
        where CR.date=(select MAX(model.date) from CheckResult as model)*/
        String latestDate = dataStatisticsService.getLatestDate(
                "select MAX(model.date) from CheckResult as model");
        String queryStr = "select CR.studentNumber from CheckResult as CR " +
                "where CR.date=(select MAX(model.date) from CheckResult as model)";
        List list = dataStatisticsService.findLateReturnStudentID(queryStr);
        String hql = "from StudentInfo as SI where SI.stuNumber in(";
        for (int i = 0; i < list.size(); i++) {
            Integer studentID = (Integer) list.get(i);
            if (i == 0)
                hql += studentID;
            else
                hql += "," + studentID;
        }
        hql += ")";

        Map<String, Object> map = new HashMap<String, Object>();
        List<StudentInfo> l = new ArrayList<StudentInfo>();
        Page page = dataStatisticsService.findLateReturnPage(hql, startRow, 8, null);
        if (page != null && page.getList() != null) {
            List lists = page.getList();
            for (int i = 0; i < lists.size(); i++) {
                StudentInfo studentInfo = (StudentInfo) lists.get(i);
                if (classesMap.containsKey(studentInfo.getClazz()))
                    l.add(studentInfo);
            }
        }
        map.put("list", l);
        map.put("page", page);
        map.put("date",latestDate);
        return new ModelAndView("/counselor/late_return_list", map);
    }
}
