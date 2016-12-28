<%@page import="kr.hs.dgsw.web.service.UserService"%>
<%@page import="kr.hs.dgsw.web.domain.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	/*
		삭제 해줄려면
		
		1. 데이터베이스에 DELETE 문을 이용해서 삭제한다.
	*/

	int uri = Integer.parseInt(request.getParameter("id"));
	
	UserService service = UserService.getInstance();
	service.Delete(uri);
	response.sendRedirect("board_list.jsp");
	
%>
</body>
</html>