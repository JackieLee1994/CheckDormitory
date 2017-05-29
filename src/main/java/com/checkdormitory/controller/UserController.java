package com.checkdormitory.controller;

import com.checkdormitory.entity.Person;
import com.checkdormitory.entity.User;
import com.checkdormitory.entity.UserEntity2;
import com.checkdormitory.service.UserService;
import com.checkdormitory.utils.HttpUtil;
import com.checkdormitory.utils.Page;
import com.checkdormitory.utils.Pagination;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import org.json.JSONArray;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 99206 on 2017/4/9.
 */

@Controller
//@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping(value = "/user/UserAdd")
    protected ModelAndView toAdd()throws Exception {
        return new ModelAndView("admin/useradd");
    }


    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    protected String add(User user, HttpServletRequest req, HttpServletResponse res) throws Exception {
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");
        Integer typeId=Integer.parseInt(req.getParameter("typeId"));
        int gender= Integer.parseInt(req.getParameter("gender"));
        String workId=req.getParameter("workId");
        String username=req.getParameter("username");
        System.out.print("班级"+req.getParameter("selectedClasses"));
        //手动解决乱码问题
        username = new String(username.getBytes("iso8859-1"),"utf-8");
        String password=req.getParameter("password");

        User u=new User();
        u.setTypeId(typeId);
        u.setGender((short)gender);
        u.setWorkId(workId);
        u.setUsername(username);
        u.setPassword(password);
        System.out.println(username);
        userService.add(u);
        return "redirect:/user/list";
    }

    @RequestMapping(value = "/user/PersonalCenter")
    protected ModelAndView toUser(HttpServletRequest request,
                                    HttpServletResponse response, HttpSession session) throws Exception {

        return new ModelAndView("admin/account_user");
    }
    /* 跳转到修改页面 */
    @RequestMapping(value = "/user/{id}/update")
    public String update(@PathVariable int id, Model model) {
        model.addAttribute("user", userService.load(id));
        return "admin/user_update";
    }
    /* 修改用户信息 将接收到的页面的值修改过来-----》跳到显示页面 */
    @RequestMapping(value = "/user/{id}/update", method = RequestMethod.POST)
    public ModelAndView updateUser(HttpServletRequest request,
                                   HttpServletResponse response, @PathVariable int id,
                                   @Validated User user) throws Exception {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        User u = userService.load(id);
        u.setTypeId(user.getTypeId());
        u.setGender(user.getGender());
        u.setWorkId(user.getWorkId());
        String username=user.getUsername();
        username=new String(username.getBytes("iso8859-1"),"utf-8");
        u.setUsername(username);
       /* u.setAdress(user.getAdress());
        u.setType(user.getType());
        u.setTel(user.getTel());*/
        userService.modify(u);

        ModelAndView andView = new ModelAndView();

        andView.setViewName("redirect:/user/list");
        return andView;
    }
    // 删除某个用户
    @RequestMapping(value = "/user/{id}/del")
    protected ModelAndView del(HttpServletRequest request,
                               HttpServletResponse response, @PathVariable int id)
            throws Exception {
//        System.out.println("..del.....进来没有？id:"+id);
        userService.delete(id);
        return new ModelAndView("redirect:/user/list");
    }
    @RequestMapping(value = "/user/list")
    public ModelAndView userList(HttpServletRequest request, HttpServletResponse response,
                                 HttpSession session) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        HttpUtil util = new HttpUtil(request, response);
        int startRow = util.parseInt(Pagination.START_ROW);
        Map<String, Object> map = new HashMap<String, Object>();
        String sql = "from  User";/* as u where u.username in('王昭君','习大大') as u where u.username='王昭君'*/
        List<User> l = new ArrayList<User>();
        Page page = userService.findPageByHQL(sql, startRow, 6, null);
        if (page != null && page.getList() != null) {
            List lists = page.getList();
            for (int i = 0; i < lists.size(); i++) {
                User user = (User) lists.get(i);
                l.add(user);
            }
        }
        map.put("list", l);
        map.put("page", page);
        return new ModelAndView("/admin/userlist",map);
    }

    //映射一个action
    @RequestMapping(value = "/get_user")
    @ResponseBody
    public String getUserEntity(@RequestParam String name) {
        JSONArray json = new JSONArray();
        JSONObject jo = new JSONObject();
        jo.put("id", "20134545");
        if (name != null)
            jo.put("userName", name);
        else
            jo.put("userName", "Jackie");
        json.put(jo);
        System.out.println("get_user");
        return json.toString();
    }

    @RequestMapping(value="/test",method = RequestMethod.POST)
    @ResponseBody
    public void test(@ModelAttribute("person") Person person,
                       @ModelAttribute("user2") User user2){
        if(person!=null&& user2!=null){
        String name = person.getUsername();
        String password = person.getPassword();
        System.out.println(name+"  "+password);
        name = user2.getUsername();
        password=user2.getPassword();
        System.out.println(name+"  "+password);
        }
    }

    @RequestMapping(value = "/user_input")
    public String inputUser() {
        return "/WEB-INF/view/UserForm";
    }

    @RequestMapping("/user_add")
    public String addUser(UserEntity2 user, Model model) {
        //save user
        //new UserDaoTest().insertUser(user);
        if (user != null) {
            System.out.println(user.getUsername());
            System.out.println(user.getPassword());
        }
        model.addAttribute("user", user);
        return "/WEB-INF/view/UserDetails";
    }
}
