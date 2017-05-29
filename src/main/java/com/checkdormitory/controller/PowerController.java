package com.checkdormitory.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.checkdormitory.entity.Classes;
import com.checkdormitory.entity.College;
import com.checkdormitory.entity.Person;
import com.checkdormitory.service.PowerService;
import com.checkdormitory.utils.HibernateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lwxzbh on 2017/5/27.
 */
@Controller
@RequestMapping(value = "/power")
public class PowerController {
    @Resource
    private PowerService powerService;

    @RequestMapping(value = "/colleges",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> getColleges(){
        List<Object> list = powerService.getColleges();
        JSONArray college = new JSONArray();
        for(int i=0;i<list.size();i++){
            College c = (College)list.get(i);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("value",c.getId()+"");
            jsonObject.put("text",c.getCollegeName());
            college.add(jsonObject);
        }
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("college",college);
        return map;
    }

    @RequestMapping(value = "/classes/{collegeId}/{grade}",method = RequestMethod.GET)
    @ResponseBody
    public List<String> getClasses(@PathVariable int collegeId,@PathVariable int grade){

        List list = powerService.getClasses(collegeId,grade);
        List<String> classesArray = new ArrayList<String>();
        for (int i=0;i<list.size();i++){
            Classes classes = (Classes)list.get(i);
            classesArray.add(classes.getClassName());
        }
        return classesArray;
    }
}
