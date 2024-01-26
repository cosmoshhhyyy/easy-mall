package com.qcby.service.impl;

import com.qcby.model.Product;
import com.qcby.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qcby.dao.UorderMapper;
import com.qcby.model.Uorder;
import com.qcby.service.UorderService;
import com.qcby.query.UorderQuery;

import java.util.List;
import java.util.Map;

/**
 * 订单服务实现类
 *
 * @author KopiKaki
 */
@Service
public class UorderServiceImpl extends BaseServiceImpl<UorderQuery, Uorder> implements UorderService {

   private UorderMapper uorderMapper;

   @Autowired
   public void setUorderMapper(UorderMapper uorderMapper) {
      this.uorderMapper = uorderMapper;
      this.baseDao=uorderMapper;
   }

   @Override
   public List<UorderQuery> findByCondition(UorderQuery uorderQuery) {
      return uorderMapper.findByCondition(uorderQuery);
   }

   @Override
   public String findSeller(Integer id) {
      return uorderMapper.findSeller(id);
   }

   @Override
   public List<Product> findAllCommodity() {
      return uorderMapper.findAllCommodity();
   }

   @Override
   public List<User> findAllSeller() {
      return uorderMapper.findAllSeller();
   }

   @Override
   public List<User> findAllUser() {
      return uorderMapper.findAllUser();
   }
}
