package com.qcby.controller;
import com.qcby.model.Admin;
import com.qcby.model.User;
import com.qcby.service.AdminService;
import com.qcby.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/login")
public class loginController {

    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    /**
     * 用户登录，这里包含普通用户和商家，都属于用户表，不要搞混
     * @return 查询到的个数，前端负责跳转，这里不做跳转
     */
    @ResponseBody
    @RequestMapping("/loginUser")
    public String loginUser(HttpServletRequest request) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        // System.out.println(username + password + type);
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setType(new Integer(type));

        int count = userService.login(user);

        // 查询到的大于0,返回成功
        if (count > 0) return "success";

        return "false";
    }

    /**
     * 返回登录用户的id
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("selectIdUser")
    public String selectIdUser(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setType(new Integer(type));

        int uid = userService.selectId(user);
        // System.out.println(id);
        request.getSession().setAttribute("uid", uid);

        return String.valueOf(uid);
    }


    /**
     * 用于管理员登录
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/loginAdmi")
    public  String loginAdmi(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        int count = adminService.login(admin);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/selectIdAdmi")
    public  String selectIdAdmi(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);

        int aid = adminService.selectId(admin);
        request.getSession().setAttribute("aid", aid);
        // System.out.println(id);
        return "success";
    }
}
