package com.WeatherApi.WeatherApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.WeatherApi.WeatherApi.dto.User;

public interface UserRepo extends JpaRepository<User, String> {

}
