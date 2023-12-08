package com.WeatherApi.WeatherApi.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.WeatherApi.WeatherApi.email.service.EmailService;

 
// Annotation
@RestController
@RequestMapping("/email")
public class EmailController {
 
    @Autowired private EmailService emailService;
 
    // Sending a simple Email
    @GetMapping("/sendMail")
    public int
    sendMail(@RequestParam String email)
    {
    	
    	
        int status
            = emailService.sendSimpleMail(email);
 
        return status;
    }
 
    // Sending email with attachment
//    @PostMapping("/sendMailWithAttachment")
//    public String sendMailWithAttachment(
//        @RequestBody EmailDetails details)
//    {
//        String status
//            = emailService.sendMailWithAttachment(details);
// 
//        return status;
//    }
    
    
    
}