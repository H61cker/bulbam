
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �۾���</title>

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
<div style="width:90%; text-align:left">
<h2 style="margin:0px 10px;font-style:���ʷҵ���;font-size:40px">BOARD</h2><br><br>

<form name="theForm" action="WriterServlet.do" method="POST"  onsubmit="return check()">



<input type=hidden name=cid value="">
<div style="margin:0px 10px;font-size:25px;font-family:���ʷҵ���">����</div>
<div><input name=subject style="width:300px; height:20px; font-size:18px;font-family:���ʷҵ���;margin:0 10px; padding:2px 10px"></div>
<br>
<div style="margin:0px 10px;font-size:25px;font-family:���ʷҵ���">����</div>
<div><textarea name=contents style="width:700px; height:400px;font-size:18px;font-family:���ʷҵ���;margin:0 10px; padding:10px"></textarea></div>
<br>
<div style="margin:0px 10px;font-size:25px;font-family:���ʷҵ���">�ۼ���</div>
<div><input name=writer style="width:300px; height:20px;font-size:18px;font-family:���ʷҵ���;margin:0 10px; padding:2px 10px"></div>
<br>
<div style="margin:0px 10px;font-size:25px;font-family:���ʷҵ���">��й�ȣ</div>
<div><input type="password" name=password style="width:300px; height:20px;font-size:18px;margin:0 10px; padding:2px 10px"></div>
<br>
<button type="submit" class="btn btn-danger btn-lg btn-block"style="font-size:23px;
font-family:���ʷҵ���;width:100px;height:50px;position:absolute;top:830px;left:300px;">�ۼ�</button>
</form>
</div>
	
</body>
</html>