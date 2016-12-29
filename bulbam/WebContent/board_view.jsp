<%@page import="kr.hs.dgsw.web.domain.Board"%>
<%@page import="kr.hs.dgsw.web.domain.User"%>
<%@page import="kr.hs.dgsw.web.service.UserService"%>
<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*
		����� �� �ٷ���
		
		1. ������ ���̽����� ���� ��ȸ�Ѵ��� ��ȯ�Ѵ�.
			1. ��û �Ķ���Ϳ� ���� Ȯ���Ѵ�.
			2. ��û �Ķ���Ϳ� ��� �ִ� ���� �̿��ؼ� �����ͺ��̽����� ��ȸ�Ѵ�.
			
		2. ��ȯ�� �����͸� �̿��Ͽ� �信 ����� �ش�.
	*/

	int uri = Integer.parseInt(request.getParameter("id"));
	
	UserService service = UserService.getInstance();
	Board board = service.getBoard(uri);
	
	System.out.println(board.getPassword());
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta name="apple-mobile-wep-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>BoadView!</title>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="include/js/jquery-3.0.0.min.js"></script>
    <link rel='stylesheet' href="include/css/bootstrap.css" />
    
    <script type="text/javascript">
    
    	function confirmDelete(id)
    	{
    		
    		var password = prompt("��й�ȣ�� �Է��ϼ���.");
    		
    		if (password == "<%= board.getPassword() %>")
    		{
    			var result = confirm("�����Ͻðڽ��ϱ�?");
        		if (result == true)
        		{
        			location.href= "delete.jsp?id=" + id;
        		}
    		}
    		else
    		{
    			alert("��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
    		}
    		
    	}
 
    	function confirmMod(id)
    	{
    		var password = prompt("��й�ȣ�� �Է��ϼ���.");
    		
    		if(password == "<%= board.getPassword()%>")
    		{
    			location.href="modify.jsp?id="+id;
    		}
    		else
    		{
    			alert("���������� �����ϴ�.");
    		}
    	}
    </script>
</head>
<body>
	<br><br><br>
	<aritcle id="board_area">
	    <div class="panel panel-info">
	        <div class="panel-heading">
	            <h3 class="panel-title">
	                <%= board.getTitle() %>
	            </h3>
	        </div>
	        <div class="panel-body">
	            <table cellspacing="0" cellpadding="0" class="table table-striped">
	                <thead class="pull-right">
	                    <tr>
	                        <th scope="col">�̸� : <%= board.getWriter() %></th>
	                        <th scope="col">����� : <%= board.getWriteTime() %></th>
	                    </tr>
	                </thead>
	            </table>
	            <%= board.getContent() %>
	        </div>
	    </div>
	    <div class="pull-right">
	        <a href="board_list.jsp" class="btn btn-primary btn">���</a>
	        <a href="write.jsp" class="btn btn-primary btn-success">����</a>
	        <a href="javascript:confirmMod(<%= board.getBoardId() %>)" class="btn btn-primary btn-warning">����</a>
	        <a href="javascript:confirmDelete(<%= board.getBoardId() %>)" class="btn btn-primary btn-danger">����</a>
	    </div>
	    <br>
	</aritcle>
</body>
</html>