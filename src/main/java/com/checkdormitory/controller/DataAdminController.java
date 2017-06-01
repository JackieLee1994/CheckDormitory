package com.checkdormitory.controller;

import com.checkdormitory.entity.CheckResult;
import com.checkdormitory.entity.Record;
import com.checkdormitory.entity.StudentInfo;
import com.checkdormitory.service.DataStatisticsService;
import com.checkdormitory.utils.HibernateUtil;
import com.checkdormitory.utils.HttpUtil;
import com.checkdormitory.utils.Page;
import com.checkdormitory.utils.Pagination;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lwxzbh on 2017/5/31.
 */
@Controller
@RequestMapping(value = "/dataAdmin")
public class DataAdminController {
    public static List<StudentInfo> listInfo = new ArrayList<StudentInfo>();
    @Resource
    private DataStatisticsService dataStatisticsService;

    @RequestMapping(value = "/lateReturnList")
    private ModelAndView lateRetrunLIst(HttpServletRequest request, HttpServletResponse response){
        //清除原有数据
        listInfo.clear();
        //查询最新日期
        String latestDate = dataStatisticsService.getLatestDate(
                "select MAX(model.date) from CheckResult as model");

        //查询每个同学的总未归次数
        String countHql = "select CR.studentNumber,count (*) from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber group by CR.studentNumber order by SI.stuNumber";
        List<Object[]> count = dataStatisticsService.getCount(countHql);
        Map<Integer, Long> countMap = new HashMap<Integer, Long>();
        for (int i = 0; i < count.size(); i++) {
            Object[] objects = count.get(i);
            countMap.put((Integer) objects[0], (Long) objects[1]);
        }
        //分页查询
        String hql = "from CheckResult as CR,StudentInfo as SI where CR.studentNumber = SI.stuNumber and CR.date='"+latestDate+"' order by SI.stuNumber";
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

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("list", l);
        map.put("page", page);
        map.put("date", latestDate);
        return new ModelAndView("admin/late_return_list",map);
    }
    @RequestMapping(value = "/barData")
    private ModelAndView classCompare(){
        String hql = "select SI.clazz,count (*) as c from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber group by SI.clazz order by c desc";
        List<Object[]> list = dataStatisticsService.getBarData(hql);
        List<Long> data = new ArrayList<Long>();
        List<String> labels = new ArrayList<String>();
        int size = list.size();
        if (size >30){
            for (int i=0;i<30;i++){
                Object[] objects = list.get(i);
                labels.add("\""+(String)objects[0]+"\"");
                data.add((Long)objects[1]);
            }
        }else{
            for (int i=0;i<size;i++){
                Object[] objects = list.get(i);
                labels.add("\""+(String)objects[0]+"\"");
                data.add((Long)objects[1]);
            }
        }

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",data);
        map.put("labels",labels);
        return new ModelAndView("admin/bar_chart",map);
    }
    @RequestMapping(value = "/lineData")
    private ModelAndView lineData(){
        String hql = "select CR.date,count (*) from CheckResult as CR,StudentInfo as SI where CR.studentNumber=SI.stuNumber group by CR.date order by CR.date desc";

        List<Object[]> list = dataStatisticsService.getLineData(hql);
        List<Long> data = new ArrayList<Long>();
        List<String> labels = new ArrayList<String>();
        int size = list.size();
        if (size > 30) {
            for (int i = 0; i < 30; i++) {
                Object[] objects = list.get(i);
                String date = (String)objects[0];
                labels.add("\""+date.substring(5)+"\"");
                data.add((Long) objects[1]);
            }
        } else
            for (int i = 0; i < size; i++) {
                Object[] objects = list.get(i);
                data.add((Long) objects[1]);
                String date = (String)objects[0];
                labels.add("\""+date.substring(5)+"\"");
            }
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",data);
        map.put("labels",labels);
        return new ModelAndView("admin/line_chart",map);
    }
    @RequestMapping(value = "/{record_ID}/delete")
    protected ModelAndView pinName(@PathVariable int record_ID) {
        dataStatisticsService.pinName(record_ID);
        return new ModelAndView("redirect:/dataAdmin/lateReturnList");
    }
}
