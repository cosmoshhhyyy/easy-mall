package com.qcby.demo;

import com.qcby.service.UorderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class OrderTest {

    @Autowired
    private UorderService uorderService;

//    @Autowired
//    private ProductService productService;
//
//
//    @Test
//    public void run() {
//        Product product = new Product();
//
//        product.setCid(1);
//        product.setMid(2);
//        product.setPdesc("123");
//        product.setPid(1);
//
//        productService.insert(product);
//    }
}
