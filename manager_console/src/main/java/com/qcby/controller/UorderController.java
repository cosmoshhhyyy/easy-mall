package com.qcby.controller;

import com.qcby.model.Product;
import com.qcby.model.User;
import com.qcby.query.UorderQuery;
import com.qcby.service.UorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单控制器
 *
 * @author KopiKaki
 */
@RequestMapping("/uorder")
@Controller
public class UorderController {
    @Autowired
    private UorderService uorderService;

    /**
     * 条件查询订单
     *
     * @param uorderQuery 条件
     * @return 订单列表
     */
    @RequestMapping(value = "findByCondition")
    @ResponseBody
    public Map<String, Object> findByCondition(UorderQuery uorderQuery) {
        List<UorderQuery> temp = uorderService.findByCondition(uorderQuery);
        temp.forEach(query -> {
            query.setMname(uorderService.findSeller(query.getMid()));
        });
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", temp.size());
        result.put("data", temp);
        return result;
    }

    /**
     * 查询所有商品
     *
     * @return 订单列表
     */
    @RequestMapping(value = "findAllCommodity")
    @ResponseBody
    public List<Product> findAllCommodity() {
        return uorderService.findAllCommodity();
    }

    /**
     * 查询所有商家
     *
     * @return 商家列表
     */
    @RequestMapping(value = "findAllSeller")
    @ResponseBody
    public List<User> findAllSeller() {
        return uorderService.findAllSeller();
    }

    /**
     * 查询所有用户
     *
     * @return 用户列表
     */
    @RequestMapping(value = "findAllUser")
    @ResponseBody
    public List<User> findAllUser() {
        return uorderService.findAllUser();
    }

    /**
     * 新增订单
     *
     * @param uorderQuery 订单
     * @return 200
     */
    @RequestMapping(value = "insert")
    @ResponseBody
    public Integer insert(UorderQuery uorderQuery) {
        uorderService.insert(uorderQuery);
        return 200;
    }

    /**
     * 根据订单id删除订单
     *
     * @param oid 订单id
     * @return 200
     */
    @RequestMapping(value = "deleteByPrimaryKey")
    @ResponseBody
    public Integer deleteByPrimaryKey(Integer oid) {
        uorderService.deleteByPrimaryKey(oid);
        return 200;
    }

    /**
     * 跳转页面
     */
}
