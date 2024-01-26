package com.qcby.service;

import com.qcby.model.User;
import com.qcby.query.UserQuery;

public interface UserService extends BaseService<UserQuery, User>{
    public User selectByPrimerKey(Integer uid);


    int login(User user);

    int selectId(User user);
}

