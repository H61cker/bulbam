
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WritePage!</title>
</head>
<body>
	<form action="WriterServlet.do" method="POST">
		���� : <input type="text" name="subject""><br><br>
		���� : <textarea cols="50" rows="5" name="contents"></textarea><br><br>
		�ۼ��� : <input type="text" name="writer"><br><br>
		��ȣ : <input type="text" name="password"><br><br>
		<button type="submit">����</button>
	</form>
</body>
</html>