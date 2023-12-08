<%@page import="com.WeatherApi.WeatherApi.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Gamer's World</title>
    
    <style>
       
         body{background-color:rgb(19,15,64)}.height-100{height:100vh}.card{width:400px;border:none;height:300px;box-shadow: 0px 5px 20px 0px #d2dae3;z-index:1;display:flex;justify-content:center;align-items:center}.card h6{color:red;font-size:20px}.inputs input{width:40px;height:40px}input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button{-webkit-appearance: none;-moz-appearance: none;appearance: none;margin: 0}.card-2{background-color:#fff;padding:10px;width:350px;height:100px;bottom:-50px;left:20px;position:absolute;border-radius:5px}.card-2 .content{margin-top:50px}.card-2 .content a{color:red}.form-control:focus{box-shadow:none;border:2px solid red}.validate{border-radius:20px;height:40px;background-color:red;border:1px solid red;width:140px}   
        
    </style>
     
  </head>
  <body>
  <% User s = (User) request.getAttribute("User");
  String em  = s.getEmail();%>
   <div class="container height-100 d-flex justify-content-center align-items-center"> <div class="position-relative"> <div class="card p-2 text-center"> <h6>Please enter the one time password <br> to verify your account</h6> <div> <span>A code has been sent to</span> <small>*******<%= em.substring( em.length()-17) %></small> </div> <form action="../weather/verify" method="get">
        <div id="otp"  class="inputs d-flex flex-row justify-content-center mt-2" > <input class="m-2 text-center form-control rounded" name="f1" type="text" id="first" maxlength="1" /> <input class="m-2 text-center form-control rounded" name="f2" type="text" id="second" maxlength="1" /> <input class="m-2 text-center form-control rounded" name="f3" type="text" id="third" maxlength="1" /> <input class="m-2 text-center form-control rounded" name="f4" type="text" id="fourth" maxlength="1" />  </div> <div class="mt-4"> <button class="btn btn-danger px-4 validate" type="submit">Validate</button> </div> 
    </form></div> </div>
</div>
<% request.setAttribute("User",s);%>

  </body>
  
   

  
   
   
          
 




 
    
      <script src="https://kit.fontawesome.com/187fee232c.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

   
  </body>
</html>