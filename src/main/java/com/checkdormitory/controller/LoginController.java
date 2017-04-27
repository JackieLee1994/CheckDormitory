package com.checkdormitory.controller;

import com.checkdormitory.entity.User;
import com.checkdormitory.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by lwxzbh on 2017/4/18.
 */
@Controller
public class LoginController {
    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public String login(User user, Model model){
        System.out.println(user.getUsername()+" "+user.getPassword());
        User user2=userService.find(user.getUsername(),user.getPassword());
        if (user2 !=null){
            model.addAttribute(user);
        }
        return "welcomeUser";
    }
}
