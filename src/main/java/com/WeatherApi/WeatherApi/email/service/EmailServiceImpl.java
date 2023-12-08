package com.WeatherApi.WeatherApi.email.service;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


    //import for email with attachment
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.core.io.FileSystemResource;
//import jakarta.mail.MessagingException;
//import jakarta.mail.internet.MimeMessage;
//import java.io.File;

@Service

public class EmailServiceImpl implements EmailService {
 
    @Autowired private JavaMailSender javaMailSender;
 
    @Value("${spring.mail.username}") private String sender;
 
    
    public int sendSimpleMail(String toemail)
    {
 
       int otp = OTP.getOTP();
        try {
 
            
            SimpleMailMessage mailMessage
                = new SimpleMailMessage();
 
            
            mailMessage.setFrom(sender);
            mailMessage.setTo(toemail);
            mailMessage.setText("Welcome \r\n"
            		+ "Use the verification code below to Sign up.\r\n"
            		+ "\r\n"
            		+ otp);
            mailMessage.setSubject("Registration OTP");
           
 
            
            javaMailSender.send(mailMessage);
            System.out.println(otp);
            return otp;
        }
 
       
        catch (Exception e) {
            return 0;
        }
    }
 
   
//    public String
//    sendMailWithAttachment(EmailDetails details)
//    {
//        
//        MimeMessage mimeMessage
//            = javaMailSender.createMimeMessage();
//        MimeMessageHelper mimeMessageHelper;
// 
//        try {
// 
//           
//            mimeMessageHelper
//                = new MimeMessageHelper(mimeMessage, true);
//            mimeMessageHelper.setFrom(sender);
//            mimeMessageHelper.setTo(details.getRecipient());
//            mimeMessageHelper.setText(details.getMsgBody());
//            mimeMessageHelper.setSubject(
//                details.getSubject());
//            
// 
//            System.out.println(details.getAttachment());
//          
//            FileSystemResource file
//                = new FileSystemResource(
//                    new File(details.getAttachment()));
//            
//          
// 
//            mimeMessageHelper.addAttachment(
//                file.getFilename(), file);
// 
//            
//            javaMailSender.send(mimeMessage);
//            return "Mail sent Successfully";
//        }
// 
//   
//        catch (MessagingException e) {
// 
//           
//            return "Error while sending mail!!!";
//        }
//    }
    

}