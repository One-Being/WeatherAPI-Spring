package com.WeatherApi.WeatherApi.controller;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;

import org.springframework.web.servlet.ModelAndView;


import com.WeatherApi.WeatherApi.dao.UserDao;
import com.WeatherApi.WeatherApi.dto.User;
import com.WeatherApi.WeatherApi.dto.Weather;
import com.WeatherApi.WeatherApi.email.service.EmailService;
import com.WeatherApi.WeatherApi.service.WeatherService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("/weather")
public class WeatherController 
{
	@Autowired
	WebClient client;
	@Autowired
	ModelAndView view;
	@Autowired
	EmailService service;
	@Autowired
	UserDao dao;
	@Autowired
	WeatherService weatherService;

	
    @GetMapping("/city")
    public ModelAndView getAuthorization(@RequestParam String city, HttpServletRequest req) {
        HttpSession sess = req.getSession();
        User u = (User) sess.getAttribute("veruser");
        if (u != null) {
            try {
                Weather weather = weatherService.getWeatherByCity(city);
                view.addObject("Weather", weather);
                view.setViewName("home.jsp");
                System.out.println(weather.getLocation().getName());
                return view;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        } else if (city != null) {
            view.addObject("message", "Login is Required");
        }
        view.setViewName("index.jsp");
        return view;
    }

    @GetMapping
    public ModelAndView index() {
		view.setViewName("index.jsp");
		return view;
	}

 
    @GetMapping("/verify")
    public ModelAndView verifyOTP(@RequestParam String f1,@RequestParam String f2,@RequestParam String f3,@RequestParam String f4,HttpServletRequest req ) {
    	
    	HttpSession sess =req.getSession();
		int otp = (Integer) sess.getAttribute("otp");
		boolean flag = (boolean) sess.getAttribute("change");
		System.out.println(flag);
    	String con =f1+f2+f3+f4;
		int sotp =Integer.parseInt(con);
		if(sess.getAttribute("User") != null) 
		{
		if(otp==sotp &&  !flag ) 
		{
			
			return weatherService.verifiedSignup(sess);
			
		}
		else if (otp == sotp) 
		{
			
			return weatherService.verifiedChangeOfPassword(sess);
		}
		view.addObject("message", "Invaild OTP");
		view.setViewName("index.jsp");
		return view;
		}
		view.addObject("message", "User Not Found");
		view.setViewName("index.jsp");
		return view;
	}
    
    @GetMapping("/signup")
   public ModelAndView signup(@RequestParam String email,@RequestParam String password,HttpServletRequest req) {
    	if(dao.findUser(email)!= null) {
    		String message = "Email Already Exist";
    		view.addObject("message", message);
    		view.setViewName("signup.jsp");
    		return view;
    	}
    	User u = new User() ;
    	u.setEmail(email);
    	u.setPassword(password);
    	return weatherService.signup(req.getSession(), u);
    	
    	
	
}
    @GetMapping("/login")
    public ModelAndView login(@RequestParam String email, @RequestParam String password ,HttpServletRequest req) 
    {
		User u = dao.findUser(email);
		if(u !=  null) {
			if (password.equals(u.getPassword())) 
			{
				return weatherService.login(req.getSession(), u);
				
			}
			view.addObject("msg", "Invaild Password");
			view.setViewName("login.jsp");
			return view;
		}
		view.addObject("msg", "User Does not Exist");
		view.setViewName("login.jsp");
		return view;
	}
    
    
    @GetMapping("/logout")
   	public ModelAndView logout(HttpServletRequest req) 
   	{
    	return weatherService.logout(req.getSession(false));
   	}	
   

    @GetMapping("/forgetpassword")
    public ModelAndView forgetPassword(HttpServletRequest req ,@RequestParam String email) 
    {
    	User u = dao.findUser(email);
    	if (u != null) {
    		
        	return weatherService.forgetPasswordVerification(req.getSession(), u);
		}
    	
    	String message = "User Doesn't Exist";
		view.addObject("message", message);
		view.setViewName("signup.jsp");
		return view;
    }
    
    @GetMapping("/changepassword")
    public ModelAndView changePassword( HttpServletRequest req, @RequestParam String password,@RequestParam String spassword) {
        HttpSession sess = req.getSession();
        User user = (User) sess.getAttribute("veruser");

        if (weatherService.changePassword(user, password, spassword)) {
           
            sess.setAttribute("User", user);
            view.addObject("sess", sess);
            view.addObject("User", user);
            view.addObject("message", "Password Successfully Changed");
            view.setViewName("index.jsp");
        } else {
           
            
            view.addObject("sess", sess);
            view.addObject("message", "Password Does Not Match");
            view.setViewName("change_password.jsp");
        }

        return view;
    }
   
}

