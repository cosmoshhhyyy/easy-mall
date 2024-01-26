package com.qcby.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qcby.dao.DemoMapper;
import com.qcby.model.Demo;
import com.qcby.service.DemoService;
import com.qcby.query.DemoQuery;

@Service
public class DemoServiceImpl extends BaseServiceImpl<DemoQuery, Demo> implements DemoService {

   private DemoMapper demoMapper;

   @Autowired
   public void setDemoMapper(DemoMapper demoMapper) {
      this.demoMapper = demoMapper;
      this.baseDao=demoMapper;
   }

}