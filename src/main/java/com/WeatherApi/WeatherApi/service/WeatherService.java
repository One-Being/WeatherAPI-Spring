package com.WeatherApi.WeatherApi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.WeatherApi.WeatherApi.dao.UserDao;
import com.WeatherApi.WeatherApi.dto.User;
import com.WeatherApi.WeatherApi.dto.Weather;
import com.WeatherApi.WeatherApi.email.service.EmailService;

import jakarta.servlet.http.HttpSession;

import java.net.URI;

@Service
public class WeatherService {

    private final WebClient client;

    private final String weatherUrl = "http://api.weatherstack.com/current";
    private final String apiKey = "c42aaebc01f487d5907c15fbac026b8c";

    @Autowired
    public WeatherService(WebClient.Builder webClientBuilder) {
        this.client = webClientBuilder.build();
    }
    
    @Autowired
    UserDao dao;
    
    @Autowired
	ModelAndView view;
    
    @Autowired
	EmailService emailservice;

    public Weather getWeatherByCity(String city) {
        try {
            URI uri = UriComponentsBuilder.fromUriString(weatherUrl)
                    .queryParam("access_key", apiKey)
                    .queryParam("query", city)
                    .build()
                    .toUri();

            ResponseEntity<Weather> responseEntity = client.post().uri(uri)
                    .accept(MediaType.APPLICATION_JSON)
                    .retrieve().toEntity(Weather.class).block();

            return responseEntity.getBody();
        } catch (WebClientResponseException e) {
            // Handle WebClientResponseException if needed
            System.err.println("Error Response: " + e.getStatusText());
            System.err.println("Response Body: " + e.getResponseBodyAsString());
            return null;
        }
    }
    
    public ModelAndView verifiedSignup(HttpSession sess) 
    {
    	User us =dao.saveUser((User) sess.getAttribute("User"));
		sess.setAttribute("veruser", us);
		
		view.addObject("User", us);
		view.addObject("message", "Signup Successful");
		view.setViewName("index.jsp");
		return view;
	}
    
    public ModelAndView  verifiedChangeOfPassword(HttpSession sess) 
    {
    	
    	sess.setAttribute("veruser",(User) sess.getAttribute("User"));
    	sess.setAttribute("change", false);
		
		view.setViewName("change_password.jsp");
		return view;
		
	}
    
    public ModelAndView signup(HttpSession sess, User u) 
    {
    	
    	sess.setAttribute("otp",emailservice.sendSimpleMail(u.getEmail()));
    	sess.setAttribute("User", u);
    	
    	view.addObject("User", u);
    	view.setViewName("otp_verify.jsp");
    	return view;
    	
	}
    
    public ModelAndView login(HttpSession sess , User u) 
    {
    	sess.setAttribute("veruser", u);
		view.addObject("message", "Login Successful");
		view.addObject("User", u);
		view.setViewName("index.jsp");
		return view;
	}
    
    public ModelAndView logout(HttpSession session) {
    	
   		if(session != null) {
   			session.invalidate();
   			return new ModelAndView("index.jsp");
   	}
   		return new ModelAndView("index.jsp");

	}
    
    public ModelAndView forgetPasswordVerification(HttpSession sess , User u) 
    {
    	sess.setAttribute("otp",emailservice.sendSimpleMail(u.getEmail()));
    	sess.setAttribute("User", u);
    	sess.setAttribute("change", true);
    	view.addObject("User",u);
    	
    	view.setViewName("otp_verify.jsp");
    	return view;
	}
    
    public boolean changePassword(User user, String password, String confirmPassword) {
        if (user != null && password.equals(confirmPassword)) 
        {
            User existingUser = dao.findUser(user.getEmail());
            if (existingUser != null) 
            {
                existingUser.setPassword(password);
                dao.updateUser(existingUser);
                return true; 
            }
        }
        return false; 
    }
    
    
}
