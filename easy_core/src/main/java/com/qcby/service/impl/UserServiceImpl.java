package com.qcby.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qcby.dao.UserMapper;
import com.qcby.model.User;
import com.qcby.service.UserService;
import com.qcby.query.UserQuery;

@Service
public class UserServiceImpl extends BaseServiceImpl<UserQuery, User> implements UserService {

   private UserMapper userMapper;

   @Autowired
   public void setUserMapper(UserMapper userMapper) {
      this.userMapper = userMapper;
      this.baseDao=userMapper;
   }

   @Override
   public User selectByPrimerKey(Integer uid) {
      return userMapper.selectByPrimerKey(uid);
   }

   @Override
   public int login(User user) {
      return userMapper.login(user);
   }

   @Override
   public int selectId(User user) {
      return userMapper.selectId(user);
   }


}
