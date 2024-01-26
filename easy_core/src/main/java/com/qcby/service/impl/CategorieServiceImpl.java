package com.qcby.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qcby.dao.CategorieMapper;
import com.qcby.model.Categorie;
import com.qcby.service.CategorieService;
import com.qcby.query.CategorieQuery;

import java.util.List;
import java.util.Map;

@Service
public class CategorieServiceImpl extends BaseServiceImpl<CategorieQuery, Categorie> implements CategorieService {

   private CategorieMapper categorieMapper;

   @Autowired
   public void setCategorieMapper(CategorieMapper categorieMapper) {
      this.categorieMapper = categorieMapper;
      this.baseDao=categorieMapper;
   }

   @Override
   public List<Categorie> selectAll() {
      return categorieMapper.selectAll();
   }

   @Override
   public List<Categorie> selectCategorieByName(Map<String, String> map) {
      return categorieMapper.selectCategorieByName(map);
   }
}
