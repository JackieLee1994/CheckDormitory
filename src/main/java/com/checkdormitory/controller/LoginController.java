package com.checkdormitory.controller;

import com.checkdormitory.entity.User;
import com.checkdormitory.service.UserService;
import com.checkdormitory.utils.CharacterEncode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by lwxzbh on 2017/4/18.
 */
@Controller
public class LoginController {
    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public String login(User user, Model model,HttpSession session) throws Exception{
        String workId = CharacterEncode.toUTF8(user.getWorkId());
        System.out.println(workId+" "+user.getPassword());
        User userRe=userService.find(workId,user.getPassword());
        if (userRe !=null){
            session.setAttribute("username",userRe.getUsername());
            session.setAttribute("type",userRe.getTypeId());
            session.setAttribute("workId",userRe.getWorkId());
            model.addAttribute(userRe);
            int type = userRe.getTypeId();
            if (type == 1){
                return "redirect:/user/list";
            }else if (type==2)
                return "redirect:/dataStatistics/lateReturnList?workId="+userRe.getWorkId();
            else {
                model.addAttribute("error","对不起，您无使用系统权限！");
                return "login";
            }
        }else{
            model.addAttribute("error","用户名或密码错误!");
            return "login";
        }
    }
}
