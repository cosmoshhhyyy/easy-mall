package com.qcby.query;

import com.qcby.model.User;

public class UserQuery extends User {
 //页码
 private Integer pageNo;
 //每页展示数量
 private Integer pageSize=5;
 //开始行号
 private Integer startNum;

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

 @Override
 public String toString() {
  return "UserQuery{" +
          "pageNo=" + pageNo +
          ", pageSize=" + pageSize +
          ", startNum=" + startNum +
          '}';
 }

}