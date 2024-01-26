package com.qcby.dao;

import com.qcby.model.User;
import com.qcby.query.UserQuery;

public interface UserMapper extends BaseDao<UserQuery, User>{
    public User selectByPrimerKey(Integer uid);


    int login(User user);

    int selectId(User user);
}