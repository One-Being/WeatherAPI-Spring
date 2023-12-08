<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        body{
            background-image: url(/coolstuff.gif);
            background-repeat: no-repeat;
            background-size: cover;
            height: 90vh;
            width: 200vh;
        }
    </style>
</head>
<body>
    <div class="modal-dialog " role="document">
        <div class="modal-content rounded-4 shadow bg-dark">
          <div class="modal-header p-5 pb-4 border-bottom-0">
            <h1 class="fw-bold mb-0 fs-2 text-light">Sign up </h1>
            <a href="/jsp/index.jsp"><button type="button" class="btn-close btn-light bg-light" data-bs-dismiss="modal" aria-label="Close"></button></a>
          </div>
    
          <div class="modal-body p-5 pt-0">
          
            <form class="" action="../weather/signup">
              <div class="form-floating mb-3">
                <input type="email" class="form-control rounded-3" id="floatingInput" name="email" placeholder="name@example.com">
                <label for="floatingInput">Email address</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control rounded-3" id="floatingPassword" name="password" placeholder="Password">
                <label for="floatingPassword">Password</label>
              </div>
              <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Sign up</button>
              <small class="text-body-secondary text-light">By clicking Sign up, you agree to the terms of use.
               <p style="text-align: center;">Already as an account  <a href="/jsp/login.jsp">Login</a></p></small>
              </form>
              <!-- <hr class="my-4">
              <h2 class="fs-5 fw-bold mb-3 text-light">Or use a third-party</h2>
              <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" type="submit">
                <i class="fa-brands fa-twitter"></i>
                Sign up with Twitter
              </button>
              <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3" type="submit">
                <i class="fa-brands fa-facebook"></i>
                Sign up with Facebook
              </button>
              <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" type="submit">
                <i class="fa-brands fa-github"></i>
                Sign up with GitHub -->
           
          </div>
        </div>
      </div>
      <% String message = (String)request.getAttribute("message");%>
      <%if(message != null){%> 
      <div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="liveToast" class="toast bg-dark" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header bg-dark">
      <i class="fa-solid fa-circle-xmark" style="color: #ff0505;">Error</i>
      <strong class="me-auto"></strong>
      
      <button type="button" class="btn-close bg-light" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body text-light">
      <%= message %>
    </div>
  </div>
</div>
     
      <script src="https://kit.fontawesome.com/187fee232c.js" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  
		<script>
  const toastLiveExample = document.getElementById('liveToast');
    const toastBootstrap = new bootstrap.Toast(toastLiveExample);
    toastBootstrap.show();
  
</script>
<%} %> 
</body>
</html>