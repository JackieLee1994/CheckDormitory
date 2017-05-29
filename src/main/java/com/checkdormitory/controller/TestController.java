package com.checkdormitory.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.checkdormitory.entity.Person;
import com.checkdormitory.entity.UserEntity2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lwxzbh on 2017/5/4.
 */
@Controller
public class TestController {
    private Logger logger = LoggerFactory.getLogger(TestController.class);
    @RequestMapping("/JsonSource")
    @ResponseBody
    public Map<String, Object> jsonSource(@RequestBody Person person){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("userType","管理员");
        return map;
    }
    //@RequestBody 将json对象转成java对象
    //@ResponseBody 表示返回的是json对象
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addUser(@RequestBody Person person) {
        Map<String, Object> map = new HashMap<String, Object>();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("value","1");
        jsonObject.put("text","计算机");
        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("value","1");
        jsonObject1.put("text","法学院");
        JSONArray jsonArray = new JSONArray();
        jsonArray.add(jsonObject);
        jsonArray.add(jsonObject1);
        map.put("jsonArray",jsonArray);
        System.out.println(person.getUsername());
        System.out.println(person.getPassword());
        return map;
    }
    @RequestMapping(value = "/object")
    public String mappingObject(Person person, UserEntity2 u, Model model) throws Exception{
        //转码
        String username = person.getUsername();
        username = new String(username.getBytes("iso8859-1"),"utf-8");
        person.setUsername(username);
        model.addAttribute("person",person);
        model.addAttribute("u",u);
        System.out.println(u.getId());
        return "/test/objectDisplay";
    }
    @RequestMapping(value = "/ReturnJson")
    @ResponseBody
    public void returnJson(HttpServletResponse response) throws Exception{
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("name","lwx");
        System.out.println("returnJson");
        String jsonresult=JSON.toJSONString(map);
        renderData(response,jsonresult);
    }

    @RequestMapping(value = "/ajax", method = RequestMethod.POST)
    public void ajaxDatas(HttpServletRequest request, HttpServletResponse response)throws Exception {
        String jsonResult = getJSONString(request);
        System.out.println(jsonResult);
        renderData(response, jsonResult);
    }

    private String getJSONString(HttpServletRequest request) {
        //故意构造一个数组，使返回的数据为json数组，数据更复杂些
        List<Map<String, Object>> datas = new ArrayList<Map<String, Object>>(5);
        Map<String, Object> map1 = new HashMap<String, Object>(10);
        //可以获得ajax请求中的参数
        map1.put("a", request.getParameter("a"));
        map1.put("b", request.getParameter("b"));
        map1.put("c", request.getParameter("c"));
        datas.add(map1);
        //故意构造一个数组，使返回的数据为json数组，数据更复杂些
        Map<String, Object> map2 = new HashMap<String, Object>(10);
        map2.put("a", "11");
        map2.put("b", "22");
        map2.put("c", "33");
        datas.add(map2);
        String jsonResult = JSON.toJSONString(datas);
        return jsonResult;
    }

    /**
     * 通过PrintWriter将响应数据写入response，ajax可以接受到这个数据
     *
     * @param response
     * @param data
     */
    private void renderData(HttpServletResponse response, String data) throws Exception {
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
            printWriter.print(data);
        } catch (IOException ex) {
//            Logger.getLogger(TestController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (null != printWriter) {
                printWriter.flush();
                printWriter.close();
            }
        }
    }
}
