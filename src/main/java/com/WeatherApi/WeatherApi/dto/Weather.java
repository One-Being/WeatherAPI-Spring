package com.WeatherApi.WeatherApi.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;

@Component
@Getter
public class Weather {
	private Location location;
	private Current current;
	

}
