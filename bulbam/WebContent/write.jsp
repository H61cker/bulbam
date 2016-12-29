
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WritePage!</title>
</head>
<body>
	<form action="WriterServlet.do" method="POST">
		제목 : <input type="text" name="subject""><br><br>
		내용 : <textarea cols="50" rows="5" name="contents"></textarea><br><br>
		작성자 : <input type="text" name="writer"><br><br>
		암호 : <input type="text" name="password"><br><br>
		<button type="submit">저장</button>
	</form>
</body>
</html>