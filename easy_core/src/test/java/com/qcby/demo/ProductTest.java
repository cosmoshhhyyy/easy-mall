package com.qcby.demo;

import com.qcby.model.Categorie;
import com.qcby.model.Product;
import com.qcby.model.User;
import com.qcby.query.ProductQuery;
import com.qcby.service.CategorieService;
import com.qcby.service.ProductService;
import com.qcby.service.UserService;
import com.qcby.util.Page;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ProductTest {

    @Autowired
    private ProductService productService;

    @Test
    public void run() {
        ProductQuery mq = new ProductQuery();
        mq.setPageNo(1);
        mq.setPageSize(5);
        Page<Product> productPage = productService.selectByPage(mq);
        System.out.println(productPage);
    }

}
