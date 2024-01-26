package com.qcby.query;

import com.qcby.model.Uorder;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author KopiKaki
 */
public class UorderQuery extends Uorder {
 private String pname;
 private String username;
 private String mname;
 private Integer total;
 private Integer num_min;
 private Integer num_max;
 @DateTimeFormat(pattern = "yyyy-MM-dd")
 private Date start;
 @DateTimeFormat(pattern = "yyyy-MM-dd")
 private Date end;

 public String getPname() {
  return pname;
 }

 public void setPname(String pname) {
  this.pname = pname;
 }

 public String getUsername() {
  return username;
 }

 public void setUsername(String username) {
  this.username = username;
 }

 public String getMname() {
  return mname;
 }

 public void setMname(String mname) {
  this.mname = mname;
 }

 public Integer getTotal() {
  return total;
 }

 public void setTotal(Integer total) {
  this.total = total;
 }

 public Integer getNum_min() {
  return num_min;
 }

 public void setNum_min(Integer num_min) {
  this.num_min = num_min;
 }

 public Integer getNum_max() {
  return num_max;
 }

 public void setNum_max(Integer num_max) {
  this.num_max = num_max;
 }


 public Date getStart() {
  return start;
 }

 public void setStart(Date start) {
  this.start = start;
 }

 public Date getEnd() {
  return end;
 }

 public void setEnd(Date end) {
  this.end = end;
 }
}

