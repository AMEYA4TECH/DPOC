package com.a4tech.dao.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "truck_info")
public class Truck_info{
	
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	public Integer id;
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "slno")
	public String slno;
	@Column(name = "vehicleno")
	public String vehicleno;
	@Column(name = "vehicletype")
	public int vehicletype;
	@Column(name = "wheels")
	public String wheels;
	@Column(name = "entrytype")
	public String entrytype;

	public String getSlno(){
		return slno;
	}

	public void setSlno(String slno){
		this.slno=slno;
	}

	public String getVehicleno(){
		return vehicleno;
	}

	public void setVehicleno(String vehicleno){
		this.vehicleno=vehicleno;
	}

	public int getVehicletype(){
		return vehicletype;
	}

	public void setVehicletype(int vehicletype){
		this.vehicletype=vehicletype;
	}

	public String getWheels(){
		return wheels;
	}

	public void setWheels(String wheels){
		this.wheels=wheels;
	}

	public String getEntrytype(){
		return entrytype;
	}

	public void setEntrytype(String entrytype){
		this.entrytype=entrytype;
	}
}