package com.demo.model;



import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class Admin {
	@Id
	private int id;
	private String parking_name;
	@OneToMany(mappedBy="adminId",cascade = CascadeType.ALL)
	private List<Parking_names> parkingnames;
	public Admin() {
		super();
	}
	public Admin(int id, String parking_name, List<Parking_names> parkingnames) {
		super();
		this.id = id;
		this.parking_name = parking_name;
		this.parkingnames = parkingnames;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getParking_name() {
		return parking_name;
	}
	public void setParking_name(String parking_name) {
		this.parking_name = parking_name;
	}
	public List<Parking_names> getParkingnames() {
		return parkingnames;
	}
	public void setParkingnames(List<Parking_names> parkingnames) {
		this.parkingnames = parkingnames;
	}
	@Override
	public String toString() {
		return "admin [id=" + id + ", parking_name=" + parking_name + ", parkingnames=" + parkingnames + "]";
	}
	
	

	
	
	
	
}
