<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String error = request.getParameter("error");

%>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>request</title>
  <link href="include/css/bootstrap.min.css" rel="stylesheet">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <style type="text/css">
    .margin_top{
      margin-top: 50px;
    }
    .margin_Dtop{
    	margin-top: 10%;
    }
    .margin_DDtop{
    	margin-top: 15%;
    }
  </style>
</head>
<body>
  <div class="container">
    <header>
      <ul class="nav nav-tabs">
           <li><a href="./login.jsp">로그인</a></li>
           <li><a href="./sign_up.jsp">회원 가입</a></li>
            <a class="navbar-brand navbar-right" href="#">
                <img alt="brand" src="include/img/dgsw_logo.png">
            </a>
      </ul>
    </header>
    <p class="margin_top"></p>
	<%
	if (error != null)
	{
%>
		
		<p>
			<script> alert("아이디 또는 비밀번호가 일치하지 않습니다."); </script>
		</p>
<%
	}
%>

	<div class="margin_Dtop"></div>

	<div class="alert alert-warning text-center" role="alert"> 모든 서비스는 로그인 후 이용하실 수 있습니다. </div>
	
	<div class="container-fluid">
		
		<form class="form" method="post" action="login.do">
			
			<div class="container" style="width:60%;">
			
			<div class="form-group">
			
				<div class="controls">
					<input type="text" style="height: 50px;" class="form-control text-center" name="id" placeholder="아이디">
				</div>

				<div class="controls">
					<input type="password" style="height: 50px;" class="form-control text-center" name="password" placeholder="비밀번호">
				</div>
				<br>
				<div class="form-actions">
					<button type="submit" class="btn btn-success btn-lg btn-block"> 전송 </button>
				</div>
				<br>
				<a href="http://localhost/bulbam/sign_up.jsp"><p class="text-right" style="font-size: 15px;">가입하러 가기..</p></a>
				
			</div>
			
			</div>
		</form>


	</div>
    
	<div class="margin_DDtop"></div>
	
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