
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WritePage!</title>
<script type="text/javascript">
	function check(){
	 
	var subject = document.theForm.subject.value.trim();
	if (subject == "")
	{
		alert("������ �Է��ϼ���.");
		return false;
	}
	
	var contents = document.theForm.contents.value.trim();
	if(contents == "")
	{
		 alert("������ �Է��ϼ���.");
		 return false;
	}
	
	var writer = document.theForm.writer.value.trim();
	if(writer == "")
	{
		alert("�ۼ��ڸ� �Է��ϼ���.");
		return false;
	}
	
	var password = document.theForm.password.value.trim();
	if(password == "")
	{
		alert("��ȣ�� �Է��ϼ���.");
		return false;
	}
	
	
	return true;
	
	
}
</script>

</head>
<body>
	<form name="theForm" action="WriterServlet.do" method="POST"  onsubmit="return check()">
		���� : <input type="text" name="subject""><br><br>
		���� : <textarea cols="50" rows="5" name="contents"></textarea><br><br>
		�ۼ��� : <input type="text" name="writer"><br><br>
		��ȣ : <input type="text" name="password"><br><br>
		<button type="submit">����</button>
	</form>
</body>
</html>