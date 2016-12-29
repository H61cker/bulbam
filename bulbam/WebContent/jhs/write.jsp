<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

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

<form action="/bulbam/write.jhs" method="post">
제목 : <input type="text" name="title" size="50">
<p>
내용 : <textarea cols="50" name="content" rows="10"></textarea>
<p>
작성자 : <input type="text" name="writer" size="50">
<p>
암호 : <input type="password" name=password" size="50">
<p>

  <input type="submit" value="저장">

</form>
 

</body>

</html>