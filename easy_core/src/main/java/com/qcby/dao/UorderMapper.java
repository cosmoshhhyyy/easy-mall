package com.qcby.dao;

import com.qcby.model.Product;
import com.qcby.model.Uorder;
import com.qcby.model.User;
import com.qcby.query.UorderQuery;

import java.util.List;

public interface UorderMapper extends BaseDao<UorderQuery, Uorder>{

    List<UorderQuery> findByCondition(UorderQuery uorderQuery);

    String findSeller(Integer id);

    List<Product> findAllCommodity();

    List<User> findAllSeller();

    List<User> findAllUser();
}
