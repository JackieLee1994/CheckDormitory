package com.checkdormitory.controller;

import com.checkdormitory.entity.*;
import com.checkdormitory.service.DataStatisticsService;
import com.checkdormitory.utils.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
    public static List<StudentInfo> listInfo = new ArrayList<StudentInfo>();
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
        //清除原来的数据
        listInfo.clear();

        //获取辅导员管理的班级
        Map<String, Object> classesMap = getClassesOfCounselor(workId);
        //查询最新日期
        String latestDate = dataStatisticsService.getLatestDate(
                "select MAX(model.date) from CheckResult as model");
        //拼接hql语句
        String hql = "from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber " + "and CR.date='" + latestDate + "'";
        String mediumHql = getHqlOfLimitOfClasses(classesMap);
        hql += mediumHql + " order by SI.stuNumber";

        //查询每个同学的总未归次数
        String countHql = "select CR.studentNumber,count (*) from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber " + mediumHql + " group by CR.studentNumber order by SI.stuNumber";
        List<Object[]> count = dataStatisticsService.getCount(countHql);
        Map<Integer, Long> countMap = new HashMap<Integer, Long>();
        for (int i = 0; i < count.size(); i++) {
            Object[] objects = count.get(i);
            countMap.put((Integer) objects[0], (Long) objects[1]);
        }
        //分页查询最新晚未归名单
        HttpUtil util = new HttpUtil(request, response);
        int startRow = util.parseInt(Pagination.START_ROW);
        Page page = dataStatisticsService.findLateReturnPage(hql, startRow, 6, null);
        List<Record> l = new ArrayList<Record>();
        if (page != null && page.getList() != null) {
            List lists = page.getList();
            for (int i = 0; i < lists.size(); i++) {
                Object[] objects = (Object[]) lists.get(i);
                CheckResult checkResult = (CheckResult) objects[0];
                StudentInfo studentInfo = (StudentInfo) objects[1];
                Integer studentID = studentInfo.getStuNumber();
                if (countMap.containsKey(studentID)) {
                    studentInfo.setNoComingSum(countMap.get(studentID));
                }
                Record Record = new Record(checkResult, studentInfo);
                listInfo.add(studentInfo);//该数据用于导出Excel
                l.add(Record);
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

        Map<String, Object> classesMap = getClassesOfCounselor(workId);
        String mediumHql = getHqlOfLimitOfClasses(classesMap);
        String hql = "from CheckResult as CR,StudentInfo as SI " +
                "where CR.studentNumber = SI.stuNumber" + mediumHql + "order by date desc";
        HttpUtil util = new HttpUtil(request, response);
        int startRow = util.parseInt(Pagination.START_ROW);
        Page page = dataStatisticsService.findHistoryRecord(hql, startRow, 8, null);
        List<Record> l = new ArrayList<Record>();
        if (page != null && page.getList() != null) {
            List lists = page.getList();
            for (int i = 0; i < lists.size(); i++) {
                Object[] objects = (Object[]) lists.get(i);
                CheckResult checkResult = (CheckResult) objects[0];
                StudentInfo studentInfo = (StudentInfo) objects[1];
                Record Record = new Record(checkResult, studentInfo);
                l.add(Record);
            }
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", l);
        map.put("page", page);
        return new ModelAndView("/counselor/history_record", map);
    }

    @RequestMapping(value = "/student/{record_ID}/delete/{workId}")
    protected ModelAndView pinName(@PathVariable int record_ID, @PathVariable String workId) {
        dataStatisticsService.pinName(record_ID);
        return new ModelAndView("redirect:/dataStatistics/lateReturnList?workId=" + workId);
    }

    private Map<String, Object> getClassesOfCounselor(String workId) {
        //获取辅导员管理的班级
        String classesOfCounselor = dataStatisticsService.getClassesOfCounselor(workId);
        String[] classesArray = classesOfCounselor.split(",");
        Map<String, Object> classesMap = new HashMap<String, Object>();
        for(int i=0;i<classesArray.length;i++){
            classesMap.put(classesArray[i], "");
        }
        return classesMap;
    }

    public String getHqlOfLimitOfClasses(Map<String, Object> classesMap) {
        String mediumHql = " and SI.clazz in(";
        int t = 0;
        for (String key : classesMap.keySet()) {
            if (0 == t)
                mediumHql += "'" + key + "'";
            else
                mediumHql += ",'" + key + "'";
            t = 2;
        }
        mediumHql += ")";
        return mediumHql;
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
            map.put("res", client.getErrorMsg(result));
        }
        return map;
    }



    @RequestMapping(value = "/barData/{workId}")
    public ModelAndView barData(@PathVariable String workId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("counselor/bar_chart");
        //获取辅导员管理的班级
        Map<String, Object> classesMap = getClassesOfCounselor(workId);
        String mediumHql = getHqlOfLimitOfClasses(classesMap);
        String countHql = "select SI.clazz,count (*) as c from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber " + mediumHql + " group by SI.clazz order by c desc";
        List<Object[]> list = dataStatisticsService.getBarData(countHql);
        List<Long> data = new ArrayList<Long>();
        List<String> labels = new ArrayList<String>();
        for(int i=0;i<list.size();i++){
            Object[] objects = list.get(i);
            labels.add("\""+(String)objects[0]+"\"");
            data.add((Long)objects[1]);
        }
        mv.addObject("data", data);
        mv.addObject("labels",labels);
        return mv;
    }

    @RequestMapping(value = "/lineData/{workId}")
    public ModelAndView lineData(@PathVariable String workId) {
        //获取辅导员管理的班级
        Map<String, Object> classesMap = getClassesOfCounselor(workId);
        String mediumHql = getHqlOfLimitOfClasses(classesMap);
        String countHql = "select CR.date,count (*) from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber " + mediumHql + " group by CR.date order by CR.date desc";
        List<Object[]> list = dataStatisticsService.getLineData(countHql);
        List<Long> data = new ArrayList<Long>();
        List<String> labels = new ArrayList<String>();
        int size = list.size();
        if (size > 30) {
            for (int i = 0; i < 30; i++) {
                Object[] objects = list.get(i);
                String date = (String)objects[0];
                labels.add("\""+date/*.replace("-","")*/.substring(5)+"\"");
                data.add((Long) objects[1]);
            }
        } else
            for (int i = 0; i < size; i++) {
                Object[] objects = list.get(i);
                data.add((Long) objects[1]);
                String date = (String)objects[0];
                labels.add("\""+date/*.replace("-","")*/.substring(5)+"\"");
            }
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",data);
        map.put("labels",labels);
        ModelAndView mv = new ModelAndView("counselor/line_chart",map);
        /*mv.addObject("data", data);
        mv.addObject("labels", labels);*/
        return mv;
    }
}
