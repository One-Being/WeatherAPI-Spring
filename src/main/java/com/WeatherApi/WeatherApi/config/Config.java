package com.WeatherApi.WeatherApi.config;



import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClient.Builder;



@Configuration
@ComponentScan(basePackages = {"com.WeatherApi"})
public class Config {
	
	
	@Bean
	public ModelAndView getView() {
		return new ModelAndView();
	}
	
	@Bean
	   public WebClient webClient() {
	
		 Builder client =  WebClient.builder();
		 WebClient client2 = client.build();
	       return client2;
	   }

}
