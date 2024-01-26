package com.qcby.query;

 import com.qcby.model.Product;

 public class ProductQuery extends Product {
  private Integer pageNo;

  private Integer pageSize = 5; // 页大小

  private Integer startNum;

  private String mname;

  public String getMname() {
   return mname;
  }

  public void setMname(String mname) {
   this.mname = mname;
  }

  public Integer getPageNo() {
   return pageNo;
  }

  public void setPageNo(Integer pageNo) {
   this.pageNo = pageNo;
  }

  public Integer getPageSize() {
   return pageSize;
  }

  public void setPageSize(Integer pageSize) {
   this.pageSize = pageSize;
  }

  public Integer getStartNum() {
   return startNum;
  }

  public void setStartNum(Integer startNum) {
   this.startNum = startNum;
  }

 }
