package com.qcby.dao;

import com.qcby.model.Categorie;
import com.qcby.query.CategorieQuery;

import java.util.List;
import java.util.Map;

public interface CategorieMapper extends BaseDao<CategorieQuery, Categorie>{

    List<Categorie> selectAll();

    List<Categorie> selectCategorieByName(Map<String, String> map);
}
