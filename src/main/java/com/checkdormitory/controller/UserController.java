package com.checkdormitory.controller;

import com.checkdormitory.dao.UserDaoTest;
import com.checkdormitory.entity.UserEntity2;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.json.JSONArray;

import java.util.List;

/**
 * Created by 99206 on 2017/4/9.
 */

@Controller
@RequestMapping("/user")
public class UserController {

    //映射一个action
    @RequestMapping(value = "/get_user")
    @ResponseBody
    public String getUserEntity() {
        UserDaoTest dao = new UserDaoTest();
        //查询stage表的所有数据，返回json
        List<UserEntity2> list = dao.query();
        JSONArray json = new JSONArray();
        for(UserEntity2 a : list){
            JSONObject jo = new JSONObject();
            jo.put("id", a.getId());
            jo.put("userName", a.getUsername());
            jo.put("userPassword", a.getPassword());
            json.put(jo);
        }
        return json.toString();
    }
    @RequestMapping(value="/user_input")
    public String inputUser() {
        return "UserForm";
    }

    @RequestMapping("/user_add")
    public String addUser(UserEntity2 user, Model model){
        //save user
        //new UserDaoTest().insertUser(user);
        if (user !=null){
            System.out.println(user.getUsername());
            System.out.println(user.getPassword());
        }
        model.addAttribute("user", user);
        return "UserDetails";
    }
}
