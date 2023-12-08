package com.WeatherApi.WeatherApi.dto;


import org.springframework.stereotype.Component;
import lombok.Getter;


@Component
@Getter
public class Location {
	
	private String name;
	private String country;
	private String region;
	private String localtime;
	

}
