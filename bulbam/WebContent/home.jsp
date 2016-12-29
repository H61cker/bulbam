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
  <title>대소고 심자신청</title>
  <link href="include/css/bootstrap.min.css" rel="stylesheet">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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
     	 <div style="margin-bottom:10px">
      		<a class="navbar-brand navbar-left" href="#">
                <img alt="brand" src="include/img/dgsw_logo.png" style="margin-bottom:30px">
            </a>
         </div>
           <li class="active"><a href="./home.jsp">홈</a></li>
           <li><a href="./request.jsp">심야자습 신청</a></li>
           <li><a href="./list.jsp">신청목록</a></li>
           <li><a href="./list_private.jsp">개인별 신청이력</a></li>
           <li><a href="./board_list.jsp">자유 게시판</a></li>
           <li><a href="./members.jsp">회원관리</a></li>
           <li style="margin-top:10px; margin-left:250px"><%= user.getUserName() %> 님 환영합니다!</li>
        </ul>
    </header>  
    <p class="margin_top"></p>

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	  </ol>
	
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
	    <div class="item active">
	      <img src="img/school1.jpg" alt="1.jpg">
	      <div class="carousel-caption">
	      </div>
	    </div>
	    <div class="item">
	      <img src="img/school2.jpg" alt="2.jpg">
	      <div class="carousel-caption">
	      </div>
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
	
	<br>
	<div class="alert alert-success text-center" role="alert"> 방문을 진심으로 환영합니다! </div>
	<br>
	<div class="row">
  		<div class="col-md-8 text-center">
            
            <div class="panel panel-primary">
                
                <div class="panel-heading">
                    <h3 class="panel-title">School Information</h3>
                </div>
                
                <div class="panel-body">
                    <div class="col-sm-4">
                        <span class="glyphicon glyphicon-thumbs-up"></span> <a href="https://www.facebook.com/dgsw.hs.kr/?fref=ts" target="_blank">FACKEBOOK</a>
                    </div>
                    <div class="col-sm-4">
                        <span class="glyphicon glyphicon-globe"></span> <a href="http://www.dgsw.hs.kr/index.do" target="_blank">SCHOOLHOME</a>
                    </div>
                    <div class="col-sm-4">
                        <span class="glyphicon glyphicon-home"></span> <a href="https://www.youtube.com/channel/UCnk0N0PXUNmDLD3WPt4ca_w" target="_blank">SCHOOL YOUTUBE</a>
                    </div>
                </div>
                
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <span style="color:#204d74">Create by</span> <a href="https://www.facebook.com/dgsw.hs.kr/?fref=ts">DGSW#WebServer</a>
                </div>
            </div>
            
        </div>
  		
  		<div class="col-md-4">
  			<div class="panel panel-info">
	            <div class="panel-heading">
	                <h3 class="panel-title">
	                    USER INFORMATION
	                </h3>
	            </div>   
	            <div class="panel-body">
	                    <p class="glyphicon glyphicon-user"> name-> <%= user.getUserName() %>님 </p><br>
	                    <p class="glyphicon glyphicon-fire"> class-> <%= user.getGrade() %>학년<%= user.getClazz() %>반<%= user.getNumber() %>번 </p> <br>
	                    <p class="glyphicon glyphicon-eye-close"> state-> 로그인중..(<a href="javascript:logout();">로그아웃</a>)</p>
	            </div>
       	 	</div>

  		</div>
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