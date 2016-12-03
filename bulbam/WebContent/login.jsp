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
           <li><a href="#">Home</a></li>
           <li><a href="#">Night</a></li>
           <li class="active"><a href="#">List</a></li>
            <a class="navbar-brand navbar-right" href="#">
                <img alt="brand" src="include/img/dgsw_logo.png">
            </a>
      </ul>
    </header>
    <p class="margin_top"></p>

	<div>
		<form method="post" action="login.do">
<%
	if (error != null)
	{
%>
			<div>
				등록되지 않았거나 비밀번호가 올바르지 않습니다.
			</div>
<%
	}
%>
			<div>
				<label>아이디</label>
				<input type="text" name="id">
			</div>
		
			<div>
				<label>비밀번호</label>
				<input type="password" name="password">
			</div>
		
			<div>
				<input type="submit" value="로그인">
			</div>
		
		
		</form>
	
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
<script>
    $('.carousel').carousel()
</script>

</html>