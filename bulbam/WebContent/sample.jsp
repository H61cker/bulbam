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
  
  <script type="text/javascript">
  
  	function checkInput()
  	{
  		var nameElement = document.getElementById("txt_name");
  		var name = nameElement.value;
  		
  		console.log("name : " + name);
  		if (name == "")
  		{
  			alert("이름을 입력하세요.");
  			return false;
  		}
  		else
  		{
  			return true;
  		}
  	}
  
  </script>
  
</head>
<body>

<h1>POST 호출 테스트</h1>

<form name="theForm" action="sample.do" method="post" onsubmit="return checkInput();">
	<input type="text" name="name" id="txt_name">
	<br>
	<input type="submit" value="보내기">
</form>

</body>















</html>