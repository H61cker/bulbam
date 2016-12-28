<%@page import="kr.hs.dgsw.web.domain.BoardList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.hs.dgsw.web.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8">
    <meta name="apple-mobile-wep-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>Boad List</title>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="include/js/jquery-3.0.0.min.js"></script>
    <link rel='stylesheet' href="include/css/bootstrap.css" />
</head>

<%
	UserService service = UserService.getInstance();
	List<BoardList> list = service.BoardList();
%>

<!-- body 시작 -->
<body>
<div class="container">
	<table class="table table-striped">
	  <thead>
		   <tr>
		     <th>번 호 </th>
		     <th>제 목</th>
		     <th>글쓴이</th>
		     <th>작성날짜</th>
		   </tr>
	   </thead>
	  <tbody>
	            <%
	            	for(int i=0; i<list.size(); i++)
	            	{
	            		BoardList nt = list.get(i);
	            		
	            %>
	            <tr>
	            	<td><%= nt.getId() %></td>
	            	<td><a href="board_view.jsp?id=<%= nt.getId() %>"><%= nt.getTitle() %></a></td>
	            	<td><%= nt.getWriterV() %></td>
	            	<td><%= nt.getDate() %></td>
	            </tr>
				<%
	            	}
				%>
				
	   </tbody>
	
	</table>
</div>

</body>
<!-- body 끝 -->

</html>