<%@page import="ch.qos.logback.core.joran.conditional.ElseAction"%>
<%@page import="com.WeatherApi.WeatherApi.dto.Weather"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
     
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>


    @import url(https://fonts.googleapis.com/css?family=Poiret+One);
@import url(https://cdnjs.cloudflare.com/ajax/libs/weather-icons/2.0.9/css/weather-icons.min.css);


body {
  background-color: #A64253;
  font-family: Poiret One;
}

.widget {
  position: absolute;
  top: 50%;
  left: 50%;
  display: flex;
  height: 300px;
  width: 600px;
  transform: translate(-50%, -50%);
  flex-wrap: wrap;
  cursor: pointer;
  border-radius:20px; 
  box-shadow : 0 27px 55px 0 rgba(0, 0, 0, 0.3), 0 17px 17px 0 rgba(0, 0, 0, 0.15);
  
  .weatherIcon{
    flex: 1 100%;
    height: 60%;
    border-top-left-radius: 20px;
    border-top-right-radius:20px;
    background: #FAFAFA;
    font-family: weathericons;
    display: flex;
    align-items: center;
    justify-content: space-around;
    font-size: 100px;
    
    i{
      padding-top: 30px;
    }
  }
  
  .weatherInfo{
    flex: 0 0 70%;
    height: 40%;
    background: #080705;
    border-bottom-left-radius: 20px;
    display: flex;
    align-items: center;
    color: white;
    
    .temperature{
      flex: 0 0 40%;
      width: 100%;
      font-size: 65px;
      display: flex;
      justify-content: space-around;
    }
    
    .description{
      flex: 0 60%;
      display: flex;
      flex-direction: column;
      width: 100%;
      height: 100%;
      justify-content: center;
      
      .weatherCondition{
        text-transform: uppercase;
        font-size: 35px;
        font-weight: 100;
      }
      
      .place{
        font-size: 15px;
      }
    }
  }
  
  .date{
    flex: 0 0 30%;
    height: 40%;
    background: #70C1B3;
    border-bottom-right-radius: 20px;
    display: flex;
    justify-content: space-around;
    align-items: center;
    color: white;
    font-size: 30px;
    font-weight: 800;
  }
}

p{
  position: fixed;
  bottom: 0%;
  right: 2%;
  a{
    text-decoration: none;
    color: #E4D6A7;
    font-size: 10px;
  }
}


</style>
</head>



 <% Weather s = (Weather) request.getAttribute("Weather");%>

 <body>
    <article class="widget">
    <% String[] d = s.getCurrent().getWeather_descriptions(); %>
     
    
    <% if (d[0].contains("Rain")) { %>
    <div class="weatherIcon">
        <i class="fa-solid fa-cloud fa-bounce fa-xl"></i>
    </div>
<% } else if (d[0].contains("Partly cloudy")) { %>
    <div class="weatherIcon">
        <i class="fa-solid fa-cloud fa-bounce fa-xl"></i>
    </div>
<% } else if (d[0].contains("Snow")) { %>
    <div class="weatherIcon">
        <i class="fa-solid fa-snowflake fa-xl"></i>
    </div>
<% } else if (d[0].contains("Mist")) { %>
    <div class="weatherIcon">
        <i class="fa-solid fa-smog fa-xl"></i>
    </div>
<% } else if (d[0].contains("Overcast")) { %>
    <div class="weatherIcon">
        <i class="fa-solid fa-cloud fa-bounce fa-xl" style="color: #44546f;"></i>
    </div>
<% } else if (d[0].contains("Thunderstorm")) { %>
    <div class="weatherIcon">
        <i class="fa-regular fa-cloud-bolt fa-beat"></i>
    </div>
<% } else if (d[0].contains("Clear")) { %>
    <div class="weatherIcon">
        <i class="fa-regular fa-sun fa-spin"></i>
    </div>
<% } else if (d[0].contains("Sunny")) { %>
    <div class="weatherIcon">
       <i class="fa-solid fa-sun fa-spin fa-xl" style="color: #ffeb0a;"></i>
    </div>
<% } else { %>
    <div class="weatherIcon">
        <i class="fa-solid fa-question-circle fa-xl"></i> 
    </div>
<% } %>

        <div class="weatherInfo">
          <div class="temperature"><span><%= s.getCurrent().getTemperature() %>&deg;</span></div>
          <div class="description">    
         
            <div class="weatherCondition"><%=d[0]%></div>    
            <div class="place"><%= s.getLocation().getName() %>,<%= s.getLocation().getRegion() %>,<%= s.getLocation().getCountry() %></div>
          </div>
        </div>
        <div class="date"><%= s.getLocation().getLocaltime() %></div>
      </article>
      
   
      
 <script src="https://kit.fontawesome.com/187fee232c.js" crossorigin="anonymous"></script>
</body>
</html>