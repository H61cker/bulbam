<%@page import="kr.hs.dgsw.web.domain.User"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.hs.dgsw.web.domain.NightStudyRequest"%>
<%@page import="java.util.List"%>
<%@page import="kr.hs.dgsw.web.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	UserService service = UserService.getInstance();
	List<User> list = service.listUsers();
	
	System.out.println(list.size());

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
           <li><a href="./home.jsp">홈</a></li>
           <li><a href="./request.jsp">심야자습 신청</a></li>
           <li class="active"><a href="./list.jsp">신청목록</a></li>
           <li><a href="./list_private.jsp">개인별 신청이력</a></li>
           <li><a href="./board_list.jsp">자유 게시판</li>

            <a class="navbar-brand navbar-right" href="./home.jsp">
                <img alt="brand" src="include/img/dgsw_logo.png">
            </a>
      </ul>
    </header>
    <p class="margin_top" style="margin-bottom:50px"></p>
    <div style="margin-bottom:40px; margin-left:90px">
	<img src="include/img/rqlist.png" class="img-rounded" width="970px" height="350px">
	</div>

	
	<p>
<%
if (list.size() == 0)
{
	
%>
	<span>신청한 학생이 없습니다.</span>
<%
}
else
{
%>
    <table cellspacing="0" cellpadding="0" class="table table-hover text-center">
        <thead>
        <tr class="success">
            <th scope="col" class="text-center">이름</th>
            <th scope="col" class="text-center">ID</th>
            <th scope="col" class="text-center">학년::반::번호</th>
            <th scope="col" class="text-center">구분</th>
        </tr>
        </thead>
        <tbody>
 <%
	for (User item : list)
	{
%>            
            <tr>
                <td><%= item.getUserName() %></td>
                <td><%= item.getLoginId() %></td>
<%
				if(item.getType().equals("S")){
%>
					<td><%= item.getGrade() %>학년 <%= item.getClazz() %>반 <%= item.getNumber() %>번</td>
<%
                }
				else
				{
%>
					<td> </td>
<%
				}
				if(item.getType().equals("S")){
%>
                	<td>학생</td>
<%
                }
				else
				{
%>
					<td>선생님</td>
<%
				}

%>
            </tr>
<%
	}
%>

        </tbody>
    </table>



<%
}
%>



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