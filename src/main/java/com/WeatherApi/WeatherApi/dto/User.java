package com.WeatherApi.WeatherApi.dto;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
@Entity
public class User 
{
	@Id
	private String email;
	private String password;
	

}
