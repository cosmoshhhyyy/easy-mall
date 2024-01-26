package com.qcby.service;

import com.qcby.model.Admin;
import com.qcby.query.AdminQuery;

public interface AdminService extends BaseService<AdminQuery, Admin>{

    int login(Admin admin);

    int selectId(Admin admin);
}
