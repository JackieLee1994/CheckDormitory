package com.checkdormitory.androidcontroller;

import com.checkdormitory.entity.User;
import com.checkdormitory.service.UserService;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by lwxzbh on 2017/5/12.
 */
@Controller
@RequestMapping(value = "/android")
public class AndroidLoginController {
    @Resource
    private UserService userService;

    @RequestMapping(value = "/login",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    private Object login(@RequestParam("workId") String workId
            ,@RequestParam String password) throws Exception{
        User userRe=userService.findByWorkId(workId,password);
        JSONObject jsonObject= new JSONObject();
        if (userRe !=null){
            int type = userRe.getTypeId();
            if (type !=3){
                jsonObject.put("code","failure");
                jsonObject.put("desc","无使用权限");
                return jsonObject.toString();
            }else {
                //登陆成功
                jsonObject.put("code","success");
                return jsonObject.toString();
            }
        }else{
            jsonObject.put("code","failure");
            jsonObject.put("desc","用户名或密码错误");
            return jsonObject.toString();
        }
    }
}
