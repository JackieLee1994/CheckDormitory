package com.checkdormitory.controller;

import com.checkdormitory.entity.UserEntity2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lwxzbh on 2017/4/18.
 */
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login(UserEntity2 user, Model model){

        return "";
    }
}
