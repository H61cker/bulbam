<%@page import="kr.hs.dgsw.web.service.UserService"%>
<%@ page import="kr.hs.dgsw.web.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	
	User user = (User)session.getAttribute("user"); 

	if (user == null)
	{
		response.sendRedirect("login.jsp");
		return;
	}

%>

<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>request</title>
  <link href="include/css/bootstrap.min.css" rel="stylesheet">
  <style type="text/css">
    .margin_top{
      margin-top: 50px;
    }
  </style>
</head>
<body>
  <div class="container">
    <header>
      <ul class="nav nav-tabs">
           <li><a href="./home.jsp">Home</a></li>
           <li class="active"><a href="./request.jsp">Night</a></li>
           <li><a href="./list.jsp">List</a></li>
            <a class="navbar-brand navbar-right" href="#">
                <img alt="brand" src="include/img/dgsw_logo.png">
            </a>
      </ul>
    </header>
    <p class="margin_top"></p>
    <div class="container"> 
     <div class="jumbotron">
      <div class="container text-center">
        <h1 style="color:#b82601">심자 할 사람~!</h1><br>
        <p>여러분 공부 열심히하세여!</p>
      </div>
    </div>
    <div class="center">

    <%
	    Boolean checked=true;
	    UserService service = UserService.getInstance();
		checked = service.requestCheck(user.getUserId());

		// 신청 했다면.
		if(checked){
		
	%>
    
    <form class="margin_top" action="request_cancel.do" method="post">
    	
    	<button type="submit" class="btn bt-success btn-lg btn-block">
    		<span class="glyphicon glyphicon-hand-down" style="font-size:25px"></span>
    			심야 자율 학습 취소
    		<span class="Glyphicon glyphicon-hand-down" style="font-size:25px"></span>
    	</button>
    	
    </form>
    <%
	}
	// 신청 안했다면.
	else{
    %>
    
    <form class="margin_top" action="request.do" method="post">
    
      <button type="submit" class="btn btn-success btn-lg btn-block"> 
        <span class="glyphicon glyphicon-hand-down" style="font-size:25px"></span>
          심야 자율 학습 신청!
        <span class="glyphicon glyphicon-hand-down" style="font-size:25px"></span>
      </button>

    </form>
    <%
	}
    %>

     </div>
     <footer class="text-center margin_top">
        <div class="panel panel-default">
          <div class="panel-body text-center">
              All Copyright Reserved 2016- DGSW Web Server<br>
              DGSW 2016-2016 DGSW WEB SERVER PROJECT TEAM
          </div>
        </div>

     </footer>
  </div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="include/js/bootstrap.min.js"></script>

</html>