package com.a4tech.dao.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "shipinfo")
public class ShippingInfo implements Serializable{
	@Id
	@GeneratedValue
	@Column(name = "id")
	public Integer id;
	
	@Column(name = "deliverdate")
	public Date deliverdate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getDeliverdate() {
		return deliverdate;
	}
	public void setDeliverdate(Date deliverdate) {
		this.deliverdate = deliverdate;
	}
	
	
	
	

}
