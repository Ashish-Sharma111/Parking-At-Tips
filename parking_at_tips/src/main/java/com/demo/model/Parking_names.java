package com.demo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Parking_names {

	@Id
	private int pid;
	private String name;
	private String address;
	private String mobile_number;
	private String location;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="admainId")
	private Admin adminId;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name="parking_name_user",joinColumns = @JoinColumn(name="parking_name_id"),inverseJoinColumns = @JoinColumn(name="user_id"))
	private List<User> users;

	public Parking_names() {
		super();
	}
	
	public Parking_names(int pid, String name, String address, String mobile_number, String location) {
		super();
	}
	
	public Parking_names(int pid, String name, String address, String mobile_number, String location, Admin adminId,
			List<User> users) {
		super();
		this.pid = pid;
		this.name = name;
		this.address = address;
		this.mobile_number = mobile_number;
		this.location = location;
		this.adminId = adminId;
		this.users = users;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile_number() {
		return mobile_number;
	}

	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Admin getAdminId() {
		return adminId;
	}

	public void setAdminId(Admin adminId) {
		this.adminId = adminId;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Parking_names [pid=" + pid + ", name=" + name + ", address=" + address + ", mobile_number="
				+ mobile_number + ", location=" + location + ", adminId=" + adminId + ", users=" + users + "]";
	}

	

	
	
	
	
	
	
}
