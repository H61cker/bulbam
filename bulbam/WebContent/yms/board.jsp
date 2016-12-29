<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>

<body>
	<h1 style="text-align: center">글쓰기</h1>
	<form action = "/bulbam/Boardwrite" method="post">
 	제목 : <input type=text name=title size=10 maxlength=30><br>
 	내용 : <input type=text name=content size=10 maxlength=30><br>
 	작성자 : <input type=text name=writer size=10 maxlength=30><br>
 	암호 : <input type=text name=password size=10 maxlength=30><br>
 	<input type=submit value="글쓰기">
 </form>
</body>

</html>