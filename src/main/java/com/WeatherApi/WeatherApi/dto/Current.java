package com.WeatherApi.WeatherApi.dto;


import org.springframework.stereotype.Component;
import lombok.Getter;

@Getter
@Component
public class Current {
	private String observation_time;
	private int temperature;
	private String[] weather_descriptions = new String[1];
	private String is_day;
	
	
	

}
