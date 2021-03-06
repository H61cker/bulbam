<%@page import="kr.hs.dgsw.web.domain.NightStudyRequest"%>
<%@page import="java.util.List"%>
<%@page import="kr.hs.dgsw.web.service.UserService"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sTime = request.getParameter("time");
	SimpleDateFormat date_format = new SimpleDateFormat("yyy-MM-dd");
	
	Date time = null;
	if (sTime == null )
	{
		time = new Date();
	}
	else
	{
		try{
			time = date_format.parse(sTime);
		}catch(ParseException e)
		{
			time = new Date();
		}
	}
	
	UserService service = UserService.getInstance();
	List<NightStudyRequest> list = service.listNightStudy(time);
	
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
           <li><a href="./request.jsp">Night</a></li>
           <li class="active"><a href="./list.jsp">List</a></li>
            <a class="navbar-brand navbar-right" href="#">
                <img alt="brand" src="include/img/dgsw_logo.png">
            </a>
      </ul>
    </header>
    <p class="margin_top"></p>
	
	<%
		if (list.size()==0)
		{
			
	%>
		<p> 신청자가 존재하지 않습니다.  </p>
	<%
		}else{
	%>
	 <table cellspacing="0" cellpadding="0" class="table table-hover text-center">
        <thead>
        <tr class="success">
            <th scope="col" class="text-center">이름</th>
            <th scope="col" class="text-center">학년</th>
            <th scope="col" class="text-center">반</th>
            <th scope="col" class="text-cetner">번호</th>
            <th scope="col" class="text-center">날짜</th>
        </tr>
        
        </thead>
        <tbody>
            <%
            	for(int i=0; i<list.size(); i++)
            	{
            		NightStudyRequest nt = list.get(i);
            		
            %>
            <tr>
            	<td><%= nt.getUserName() %></td>
            	<td><%= nt.getGrade() %></td>
            	<td><%= nt.getClazz() %></td>
            	<td><%= nt.getNumber() %></td>
            	<td><%= nt.getTime() %></td>	
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