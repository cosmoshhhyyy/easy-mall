package com.qcby.dao;

import com.qcby.model.Admin;
import com.qcby.query.AdminQuery;

public interface AdminMapper extends BaseDao<AdminQuery, Admin>{


    int login(Admin admin);

    int selectId(Admin admin);
}
