package com.WeatherApi.WeatherApi.email.service;

public class OTP 
{
	public static int getOTP() {
		
		
		return (int)(Math.random()*10000);
	}

	
}
