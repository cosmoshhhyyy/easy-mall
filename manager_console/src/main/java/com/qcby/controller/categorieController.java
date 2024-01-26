package com.qcby.controller;


import com.qcby.model.Categorie;
import com.qcby.query.CategorieQuery;
import com.qcby.service.CategorieService;
import com.qcby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/categorie")
public class categorieController {

    @Autowired
    private CategorieService categorieService;

    /**
     * 查询商品类别信息
     * 调用业务层的分页条件查询逻辑
     * @return
     */
    @RequestMapping("/list")
    public String list(CategorieQuery mq, Model model){
        System.out.println(mq.toString()+mq.getCname());
        if(mq.getPageNo()==null){
            mq.setPageNo(1);
        }
        //2.调用业务层进行分页条件查询
        Page<Categorie> page = categorieService.selectByPage(mq);
        //3.返回前端想要的数据  返回一个页对象
        model.addAttribute("page",page);
        //要进行搜素参数的回显功能
        model.addAttribute("mq",mq);
        return "categorie";
    }

    /**
     * 添加商品类别
     * @return
     */
    @ResponseBody
    @RequestMapping("/addCategorie")
    public String addCateforie(Categorie categorie){
        String cname2 = categorie.getCname();
        Map<String,String> map = new HashMap<>();
        map.put("cname",cname2);
        //调取业务层进行验证
        List<Categorie> cats =categorieService.selectCategorieByName(map);
        if(cats.size()>0){
            return "true";
        }else {
            int insert = categorieService.insert(categorie);
            return "success";
        }

    }



    /**
     * 删除商品分类信息的方法
     * @param cid
     * @return
     */
    @ResponseBody
    @RequestMapping("/delCategorie")
    public String delCategorie(Integer cid ){
        int del =categorieService.deleteByPrimaryKey(cid );
        return "success";
    }

    /**
     * 回显商品类别信息的方法
     * @param cid
     * @return
     */
    @ResponseBody
    @RequestMapping("/getCategorie")
    public Categorie getCategorie(int cid){
       Categorie categorie = categorieService.selectByPrimaryKey(cid);
        return categorie;
    }

    /**
     * 修改商品类别的方法
     * @param mq
     * @return
     */
    @ResponseBody
    @RequestMapping("/updateCategorie")
    public String updateCategorie(Categorie mq){
        categorieService.updateByPrimaryKey(mq);
        return "success";
    }
}
