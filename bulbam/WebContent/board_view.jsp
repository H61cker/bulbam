<%@page import="kr.hs.dgsw.web.domain.Board"%>
<%@page import="kr.hs.dgsw.web.domain.User"%>
<%@page import="kr.hs.dgsw.web.service.UserService"%>
<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*
		출력을 해 줄려면
		
		1. 데이터 베이스에서 값을 조회한다음 반환한다.
			1. 요청 파라미터에 값을 확인한다.
			2. 요청 파라미터에 들어 있는 값을 이용해서 데이터베이스에서 조회한다.
			
		2. 반환한 데이터를 이용하여 뷰에 출력해 준다.
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
    		
    		var password = prompt("비밀번호를 입력하세요.");
    		
    		if (password == "<%= board.getPassword() %>")
    		{
    			var result = confirm("삭제하시겠습니까?");
        		if (result == true)
        		{
        			location.href= "delete.jsp?id=" + id;
        		}
    		}
    		else
    		{
    			alert("비밀번호가 올바르지 않습니다.");
    		}
    		
    	}
 
    	function confirmMod(id)
    	{
    		var password = prompt("비밀번호를 입력하세요.");
    		
    		if(password == "<%= board.getPassword()%>")
    		{
    			location.href="modify.jsp?id="+id;
    		}
    		else
    		{
    			alert("수정권한이 없습니다.");
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
	                        <th scope="col">이름 : <%= board.getWriter() %></th>
	                        <th scope="col">등록일 : <%= board.getWriteTime() %></th>
	                    </tr>
	                </thead>
	            </table>
	            <%= board.getContent() %>
	        </div>
	    </div>
	    <div class="pull-right">
	        <a href="board_list.jsp" class="btn btn-primary btn">목록</a>
	        <a href="write.jsp" class="btn btn-primary btn-success">쓰기</a>
	        <a href="javascript:confirmMod(<%= board.getBoardId() %>)" class="btn btn-primary btn-warning">수정</a>
	        <a href="javascript:confirmDelete(<%= board.getBoardId() %>)" class="btn btn-primary btn-danger">삭제</a>
	    </div>
	    <br>
	</aritcle>
</body>
</html>