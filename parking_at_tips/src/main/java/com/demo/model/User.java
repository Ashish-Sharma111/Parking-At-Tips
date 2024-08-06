package com.demo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class User {
@Id @GeneratedValue(strategy=GenerationType.AUTO)
private int user_id;
private String user_name;
private String mobile_number;
private String emailId;
private String car_model;

@ManyToMany(mappedBy="users", cascade = CascadeType.ALL)
private List<Parking_names> parking_names;

public User() {
	super();
}

public User(int user_id, String user_name, String mobile_number, String emailId, String car_model) {
	super();
}
public User(int user_id, String user_name, String mobile_number, String emailId, String car_model,
		List<Parking_names> parking_names) {
	super();
	this.user_id = user_id;
	this.user_name = user_name;
	this.mobile_number = mobile_number;
	this.emailId = emailId;
	this.car_model = car_model;
	this.parking_names = parking_names;
}

public int getUser_id() {
	return user_id;
}

public void setUser_id(int user_id) {
	this.user_id = user_id;
}

public String getUser_name() {
	return user_name;
}

public void setUser_name(String user_name) {
	this.user_name = user_name;
}

public String getMobile_number() {
	return mobile_number;
}

public void setMobile_number(String mobile_number) {
	this.mobile_number = mobile_number;
}

public String getEmailId() {
	return emailId;
}

public void setEmailId(String emailId) {
	this.emailId = emailId;
}

public String getCar_model() {
	return car_model;
}

public void setCar_model(String car_model) {
	this.car_model = car_model;
}

public List<Parking_names> getParking_names() {
	return parking_names;
}

public void setParking_names(List<Parking_names> parking_names) {
	this.parking_names = parking_names;
}

@Override
public String toString() {
	return "User [user_id=" + user_id + ", user_name=" + user_name + ", mobile_number=" + mobile_number + ", emailId="
			+ emailId + ", car_model=" + car_model + ", parking_names=" + parking_names + "]";
}


}