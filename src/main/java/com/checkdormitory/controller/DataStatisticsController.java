package com.checkdormitory.controller;

import com.checkdormitory.entity.*;
import com.checkdormitory.service.DataStatisticsService;
import com.checkdormitory.utils.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import sun.awt.SunToolkit;

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
        session.setAttribute("workId", workId);
        System.out.println("lateReturnList被调用");

        //获取辅导员管理的班级
        String classesOfCounselor = dataStatisticsService.getClassesOfCounselor(workId);
        JSONArray classesJSONArray = new JSONArray(classesOfCounselor);
        Map<String, Object> classesMap = new HashMap<String, Object>();
        for (int i = 0; i < classesJSONArray.length(); i++) {
            JSONObject oneClass = (JSONObject) classesJSONArray.get(i);
            classesMap.put(oneClass.getString("class_name"), "");
        }
        //查询最新日期
        String latestDate = dataStatisticsService.getLatestDate(
                "select MAX(model.date) from CheckResult as model");

        //拼接hql语句
        String hql = "from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber " + "and CR.date='" + latestDate + "'";

        int t = 0;
        String mediumHql = " and SI.clazz in(";
        for (String key : classesMap.keySet()) {
            if (0 == t)
                mediumHql += "'" + key + "'";
            else
                mediumHql += ",'" + key + "'";
            t = 2;
        }
        mediumHql += ")";
        hql += mediumHql + " order by SI.stuNumber";
        //查询每个同学的总未归次数
        String countHql = "select CR.studentNumber,count (*) from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber " + mediumHql + " group by CR.studentNumber order by SI.stuNumber";

        HttpUtil util = new HttpUtil(request, response);
        int startRow = util.parseInt(Pagination.START_ROW);
        Page page = dataStatisticsService.findLateReturnPage(hql, startRow, 6, null);
        Page page1 = dataStatisticsService.getCount(countHql, startRow, 6, null);
        List<HistoryRecord> l = new ArrayList<HistoryRecord>();
        if ((page != null && page.getList() != null)
                && (page1 != null && page1.getList() != null)) {
            List lists = page.getList();
            List lists1 = page1.getList();
            for (int i = 0; i < lists.size(); i++) {
                Object[] objects = (Object[]) lists.get(i);
                CheckResult checkResult = (CheckResult) objects[0];
                StudentInfo studentInfo = (StudentInfo) objects[1];
                HistoryRecord historyRecord = new HistoryRecord(checkResult, studentInfo);
                Object[] objects1 = (Object[]) lists1.get(i);
                Long count = (Long) objects1[1];
                historyRecord.setCount(count);
                l.add(historyRecord);
            }
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", l);
        map.put("page", page);
        map.put("date", latestDate);
        return new ModelAndView("/counselor/late_return_list", map);
    }

    @RequestMapping(value = "/history_record")
    private ModelAndView historyRecord(HttpServletRequest request, HttpServletResponse response,
                                       HttpSession session, @RequestParam String workId) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        session.setAttribute("workId", workId);
        String hql = "from CheckResult as CR,StudentInfo as SI " +
                "where CR.studentNumber = SI.stuNumber order by date desc";
        HttpUtil util = new HttpUtil(request, response);
        int startRow = util.parseInt(Pagination.START_ROW);
        Page page = dataStatisticsService.findHistoryRecord(hql, startRow, 8, null);
        List<HistoryRecord> l = new ArrayList<HistoryRecord>();
        if (page != null && page.getList() != null) {
            List lists = page.getList();
            for (int i = 0; i < lists.size(); i++) {
                Object[] objects = (Object[]) lists.get(i);
                CheckResult checkResult = (CheckResult) objects[0];
                StudentInfo studentInfo = (StudentInfo) objects[1];
                HistoryRecord historyRecord = new HistoryRecord(checkResult, studentInfo);
                l.add(historyRecord);
            }
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", l);
        map.put("page", page);
        return new ModelAndView("/counselor/history_record", map);
    }

    @RequestMapping(value = "/student/{student_ID}/delete/{workId}")
    protected ModelAndView pinName(@PathVariable int student_ID, @PathVariable String workId) {
        dataStatisticsService.pinName(student_ID);
        return new ModelAndView("redirect:/dataStatistics/lateReturnList?workId=" + workId);
    }

    @RequestMapping(value = "/sendMsg", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> sendMessage(@RequestBody String tel) {
        System.out.println(tel);
        //用户名
        String Uid = "JackieLee";
        //接口安全秘钥
        String Key = "6975e522316761412ab9";
        //手机号码，多个号码如13800000000,13800000001,13800000002
        String smsMob = tel;
        //短信内容
        String smsText = "同学，你已晚未归，请回寝室！";
        HttpClientUtil client = HttpClientUtil.getInstance();
        Map<String, String> map = new HashMap<String, String>();
        //UTF发送
        int result = client.sendMsgUtf8(Uid, Key, smsText, smsMob);
        if (result > 0) {
            System.out.println("UTF8成功发送条数==" + result);
            map.put("res", "发送成功");
        } else {
            System.out.println(client.getErrorMsg(result));
            map.put("res",client.getErrorMsg(result));
        }
        return map;
    }
}
