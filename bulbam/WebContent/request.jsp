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
  <title>대소고 심자신청</title>
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

    <%
	    Boolean checked=true;
	    UserService service = UserService.getInstance();
		checked = service.requestCheck(user.getUserId());

		// 신청 했다면.
		if(checked){
		
	%>
	
	<p class="margin_top"></p>
    <img src="include/img/cancel.png" width="1140px" class="img-rounded">
    
    <form class="margin_top" action="request_cancel.do" method="post">
    	
    	<button type="submit" class="btn btn-danger btn-lg btn-block"style="line-height:1.0em;font-size:23px;width:1140px;height:45px;position:absolute;top:440px;right:500px;"> 
    	▶심야 자율 학습 취소◀
    	</button>
    	
    </form>
    <%
	}
	// 신청 안했다면.
	else{
    %>
    
    <p class="margin_top"></p>
  	
  	<div style="position:absolute;top:103px;right:305px;"><img src="include/img/r.png" width="1140px"></div>

    <form class="margin_top" action="request.do" method="post">
    
  		<button type="submit" class="btn btn-success btn-lg btn-block"style="line-height:1.0em;font-size:23px;width:1140px;height:45px;position:absolute;top:440px;right:305px;"> 
		▶심야 자율 학습 신청◀
      	</button>

    </form>
    <%
	}
    %>

     <footer class="text-center margin_top" style="position:absolute;top:550px;left:670px">
        <div class="panel panel-default">
          <div class="panel-body text-center">
              All Copyright Reserved 2016- DGSW Web Server<br>
              DGSW 2016-2016 DGSW WEB SERVER PROJECT TEAM
          </div>
        </div>
     </footer>
  </div>
  
 <!--    <footer class="text-center margin_top">
        <div class="panel panel-default" style="position:absolute;top:600px;left:680px">
              All Copyright Reserved 2016- DGSW Web Server<br>
              DGSW 2016-2016 DGSW WEB SERVER PROJECT TEAM
        </div>
     </footer>-->
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="include/js/bootstrap.min.js"></script>

</html>