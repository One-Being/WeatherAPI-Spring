package com.WeatherApi.WeatherApi.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.WeatherApi.WeatherApi.dto.User;
import com.WeatherApi.WeatherApi.repository.UserRepo;

@Component
public class UserDao {

	@Autowired
	UserRepo repo;
	
	public User saveUser(User u) 
	{
		return repo.save(u);
	}
	
	public User findUser(String email) 
	{
		Optional<User> op = repo.findById(email);
		if ( repo.existsById(email)) 
		{
			return op.get();
		}
		return null;
	}
	
	public User updateUser(User u ) {
		User ex = findUser(u.getEmail());
		if (u.getPassword() == null) 
		{
			u.setPassword(ex.getPassword());
			
		}
		return repo.save(u);
	}
	
	public User login(User u) {
		
		if(u != null) {
			User ex = findUser(u.getEmail());
			if(u.getPassword().equals(ex.getPassword())) {
				return ex;
			}
			
			return null;
		}
		return null;
	}
	
}
