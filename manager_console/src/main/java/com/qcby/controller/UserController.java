package com.qcby.controller;

import com.qcby.model.User;
import com.qcby.query.UserQuery;
import com.qcby.service.UserService;
import com.qcby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 管理员后台模块的用户控制层
 * 进行用户的增删改查
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 跳转用户列表页面
     * @return
     */
    @RequestMapping("/list")
    public String list(){
        return "homePage";
    }
    /**
     * 跳转修改用户页面
     * @return
     */
    @RequestMapping("/addUserPage")
    public String addPage(){
        return "addPage";
    }
    /**
     * 按照条件查询
     * 按照页码和条件筛选
     * @param userQuery
     * @return
     */
    @RequestMapping(value = "/showData",method = RequestMethod.POST)
    @ResponseBody
    public Page<User> showData(UserQuery userQuery){
        if(userQuery.getPageNo()==null){
            userQuery.setPageNo(1);
            userQuery.setPageSize(5);
        }
        Page<User> result=userService.selectByPage(userQuery);
        List<User> users=result.getList();
        return result;
    }

    /**
     * 按照主键删除用户
     * @param uid
     * @return
     */
    @RequestMapping("/delUser")
    @ResponseBody
    public int delUser(Integer uid){
        int i = userService.deleteByPrimaryKey(uid);
        return i;
    }

    /**
     * 按照主键得到用户信息
     * @param uid
     * @return
     */
    @RequestMapping("/getUser")
    @ResponseBody
    public User getUser(Integer uid){
        return userService.selectByPrimaryKey(uid);
    }

    /**
     * 按照主键更新用户信息
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    @ResponseBody
    public int updateUser(User user){
        return userService.updateByPrimaryKey(user);
    }

    /**
     * 跳转更新页面
     * @return
     */
    @RequestMapping("/updatePage")
    public String updatePage(){
        return "changePage";
    }

    /**
     * 返回用户列表页面
     * @return
     */
    @RequestMapping("/backToHomePage")
    public String backToHomePage(){
        return "homePage";
    }

    /**
     * 添加用户请求
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    @ResponseBody
    public int addUser(User user){
        int insert = userService.insert(user);
        return insert;
    }


}
