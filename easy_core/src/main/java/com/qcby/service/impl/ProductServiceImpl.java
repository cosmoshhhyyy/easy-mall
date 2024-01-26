package com.qcby.service.impl;

import com.qcby.dao.CategorieMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qcby.dao.ProductMapper;
import com.qcby.model.Product;
import com.qcby.service.ProductService;
import com.qcby.query.ProductQuery;

import java.util.List;

/**
 * 商品的接口实现
 */
@Service
public class ProductServiceImpl extends BaseServiceImpl<ProductQuery, Product> implements ProductService {

   private ProductMapper productMapper;

   @Autowired
   public void setProductMapper(ProductMapper productMapper) {
      this.productMapper = productMapper;
      this.baseDao=productMapper;
   }

}
