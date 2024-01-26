package com.qcby.controller;

import com.qcby.model.Categorie;
import com.qcby.model.Product;
import com.qcby.query.ProductQuery;
import com.qcby.service.CategorieService;
import com.qcby.service.ProductService;
import com.qcby.util.Page;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 商品 管理
 * 表现层
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    /**
     * 用于下拉框选择插值按商品类别查询
     */
    @Autowired
    private CategorieService categorieService;
    /**
     * 分页查询商品，展示数据
     * @return
     */
    @RequestMapping("/list")
    public String list(ProductQuery mq, Model model) {

        // 程序严谨性
        if (mq.getPageNo() == null) {
            mq.setPageNo(1);
        }
        // System.out.println("123:::"+mq.getCid());

        Page<Product> page = productService.selectByPage(mq);

        model.addAttribute("page", page);
        model.addAttribute("mq", mq);

        List<Categorie> list = categorieService.selectAll();
        model.addAttribute("categories", list);

        return "product";
    }

    /**
     * 根据id删除商品
     * @param pid
     * @return
     */
    @ResponseBody
    @RequestMapping("/delProduct")
    public String del(int pid) {

        System.out.println("pid = " + pid);
        int i = productService.deleteByPrimaryKey(pid);

        return "success";
    }


}
