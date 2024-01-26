package com.qcby.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qcby.dao.AdminMapper;
import com.qcby.model.Admin;
import com.qcby.service.AdminService;
import com.qcby.query.AdminQuery;

@Service
public class AdminServiceImpl extends BaseServiceImpl<AdminQuery, Admin> implements AdminService {

   private AdminMapper adminMapper;

   @Autowired
   public void setAdminMapper(AdminMapper adminMapper) {
      this.adminMapper = adminMapper;
      this.baseDao=adminMapper;
   }

   @Override
   public int login(Admin admin) {
      return adminMapper.login(admin);
   }

   @Override
   public int selectId(Admin admin) {
      return adminMapper.selectId(admin);
   }

}
