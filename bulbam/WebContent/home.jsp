<%@page import="kr.hs.dgsw.web.domain.User"%>
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
  
  <script type="text/javascript">
  	
  function logout()
  {
  	var form = document.getElementById("logoutForm");
  	form.submit();
  }
  
  </script>
</head>
<body>
	<form id="logoutForm" method="post" action="logout.do">
	</form>
  <div class="container">
    <header>
      <ul class="nav nav-tabs">
           <li class="active"><a href="#">Home</a></li>
           <li><a href="./request.jsp">Night</a></li>
           <li><a href="./list.jsp">List</a></li>
            <a class="navbar-brand navbar-right" href="#">
                <img alt="brand" src="include/img/dgsw_logo.png">
            </a>
      </ul>
    </header>
    <p class="margin_top"></p>
    
      <div><%= user.getUserName() %>님 환영합니다.  <a href="javascript:logout();">로그아웃</a></div>


    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">

    <div class="item active">
      <img src="include/img/list1.jpg" alt="img1">
    </div>
    
    <div class="item">
      <img src="include/img/list1.jpg" alt="img2">
    </div>

  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<p class="margin_top"></p>



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
<script>
    $('.carousel').carousel()
</script>

</html>