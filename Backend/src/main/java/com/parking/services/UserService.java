package com.parking.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parking.dtos.LoginDTO;
import com.parking.models.User;
import com.parking.repos.UserRepository;

@Service
public class UserService {

	@Autowired private UserRepository repo;
	
	public void saveUser(User user) {
		repo.save(user);
	}
	
	public List<User> listall(){
		return repo.findAll();
	}
	
	public User findById(int id) {
		return repo.getById(id);
	}
	
	public User validate(LoginDTO dto) {
		User user=repo.findByEmail(dto.getUserid());
		if(user!=null && user.getPassword().equals(dto.getPassword())) {
			return user;
		}
		return null;
	}
}
