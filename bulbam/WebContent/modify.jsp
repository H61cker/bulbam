<%@page import="kr.hs.dgsw.web.domain.Board"%>
<%@page import="kr.hs.dgsw.web.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta name="apple-mobile-wep-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>BoadModify!</title>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="include/js/jquery-3.0.0.min.js"></script>
    <link rel='stylesheet' href="include/css/bootstrap.css" />
</head>
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
	
%>
<body>
	<br><br><br>
	
	<form name=Modify action="Modify.do" method="POST" onsubmit="return check()">
	<aritcle id="board_area">
	    <div class="panel panel-info">
	        <div class="panel-heading">
	            <h3 class="panel-title">
	                <input type="text" name="title" pacleholder="제목" value=<%= board.getTitle() %> >
	            </h3>
	        </div>
	        <div class="panel-body">
	            <table cellspacing="0" cellpadding="0" class="table table-striped">
	                <thead class="pull-right">
	                    <tr>
	                        <th scope="col"><input disabled type="text" placeholder="이름" value="<%= board.getWriter() %>"></th>
	                        <th scope="col"><input disabled type="text" placeholder="등록일" value="<%= board.getWriteTime() %>"></th>
	                    </tr>
	                </thead>
	            </table>
	            <textarea name="content" rows="3" style="width: 100%; margin: 0px; height: 268px;"><%= board.getContent() %></textarea>
	        </div>
	    </div>
	    <input type="hidden" name="uri" value=<%= uri %>>
	    <button type="submit" class="btn btn-warning pull-right"> 전송 </button>
	    <br>
	</aritcle>
	</form>
</body>
</html>