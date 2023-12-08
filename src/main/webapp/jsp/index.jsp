<%@page import="com.WeatherApi.WeatherApi.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style type="text/css">
*{
  box-sizing: border-box;
}
body{
  margin: 0px;
  padding: 0px;
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #130f40;
  font-family: 'Lato' !important;
}
.search-box{
  width: fit-content;
  height: fit-content;
  position: absolute;
  left: 550px;
  top: 450px;
  
}
.input-search{
  height: 50px;
  width: 50px;
  border-style: none;
  padding: 10px;
  font-size: 18px;
  letter-spacing: 2px;
  outline: none;
  border-radius: 25px;
  transition: all .5s ease-in-out;
  background-color: #22a6b3;
  padding-right: 40px;
  color:#fff;
}
.input-search::placeholder{
  color:rgba(255,255,255,.5);
  font-size: 18px;
  letter-spacing: 2px;
  font-weight: 100;
}
.btn-search{
  width: 50px;
  height: 50px;
  border-style: none;
  font-size: 20px;
  font-weight: bold;
  outline: none;
  cursor: pointer;
  border-radius: 50%;
  position: absolute;
  right: 0px;
  color:#ffffff ;
  background-color:transparent;
  pointer-events: painted;  
}
.btn-search:focus ~ .input-search{
  width: 300px;
  border-radius: 0px;
  background-color: transparent;
  border-bottom:1px solid rgba(255,255,255,.5);
  transition: all 500ms cubic-bezier(0, 0.110, 0.35, 2);
}
.input-search:focus{
  width: 300px;
  border-radius: 0px;
  background-color: transparent;
  border-bottom:1px solid rgba(255,255,255,.5);
  transition: all 500ms cubic-bezier(0, 0.110, 0.35, 2);
}
p {
  font-size: 8vw;
  text-transform: uppercase;
  text-align: center;
  line-height: 1;
}

.fancy {
  @supports (background-clip: text) or (-webkit-background-clip: text) {
    background-image: 
      url("data:image/svg+xml,%3Csvg width='2250' height='900' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cg%3E%3Cpath fill='%2300A080' d='M0 0h2255v899H0z'/%3E%3Ccircle cx='366' cy='207' r='366' fill='%2300FDCF'/%3E%3Ccircle cx='1777.5' cy='318.5' r='477.5' fill='%2300FDCF'/%3E%3Ccircle cx='1215' cy='737' r='366' fill='%23008060'/%3E%3C/g%3E%3C/svg%3E%0A");
    background-size: 110% auto;
    background-position: center;
    color: transparent;
    -webkit-background-clip: text;
    background-clip: text;
  }
}

 #drop{
            position: absolute;
            left: 1150px;
            top:10px;
            
        }
</style>
</head>
<body>
<%HttpSession sess = request.getSession(); %>
<%User u = (User) sess.getAttribute("veruser"); %>
<%if(u != null){ %>
<div id="drop" class="dropdown">
       <button class="btn  dropdown-toggle text-light" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-regular fa-circle-user fa-xl"></i> <%= u.getEmail().substring(0,u.getEmail().length()-10) %>
        </a>
        </button>
        <ul class="dropdown-menu dropdown-menu-dark">
          <li><a class="dropdown-item active" href="/jsp/change_password.jsp"><i class="fa-solid fa-right-to-bracket"></i> Change Password</a></li>
          <li><a class="dropdown-item" href="../weather/logout"><i class="fa-solid fa-user-plus"></i>Logout</a></li>
        </ul>
      </div>
      <%} else{ %>
 
 <div id="drop" class="dropdown">
       <button class="btn  dropdown-toggle text-light" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-regular fa-user"></i> Account
        </a>
        </button>
        <ul class="dropdown-menu dropdown-menu-dark">
          <li><a class="dropdown-item active" href="/jsp/login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>
          <li><a class="dropdown-item" href="/jsp/signup.jsp"><i class="fa-solid fa-user-plus"></i>  Signup</a></li>
         
        </ul>
      </div>
      <% } %>
<form action="../weather/city" method="get">
    <p>Weather <span class="fancy"><br>Dust</span><div class="search-box" style="text-align: center;">
        <button class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
        <input type="text" class="input-search" name="city"  placeholder="Type a city">
      </div></p>
 
</form>

<% String message = (String)request.getAttribute("message");%>
      <%if(message != null){%> 
      <div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="liveToast" class="toast bg-dark" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header bg-dark">
    <%if(message.contains("Successful")){ %>
    <i class="fa-solid fa-circle-check" style="color: #3af207;">Success</i>
    <%}else{ %>
      <i class="fa-solid fa-circle-xmark" style="color: #ff0505;">Error</i>
      <%} %>
      <strong class="me-auto"></strong>
      
      <button type="button" class="btn-close bg-light" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body text-light">
      <%= message %>
    </div>
  </div>
</div>
     <%} %> 
      <script src="https://kit.fontawesome.com/187fee232c.js" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  
		  <%if(message != null){%> 
		<script>
  const toastLiveExample = document.getElementById('liveToast');
    const toastBootstrap = new bootstrap.Toast(toastLiveExample);
    toastBootstrap.show();
  
</script>
<%} %> 

</body>
</html>