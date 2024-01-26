package com.qcby.service;

import com.qcby.model.Categorie;
import com.qcby.query.CategorieQuery;

import java.util.List;
import java.util.Map;

public interface CategorieService extends BaseService<CategorieQuery, Categorie>{

    public List<Categorie> selectAll();

    List<Categorie> selectCategorieByName(Map<String, String> map);
}
