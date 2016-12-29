<%@page import="kr.hs.dgsw.web.domain.BoardList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.hs.dgsw.web.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String sCurrentPage = request.getParameter("page");
int currentPage = 0;

try
{
	currentPage = Integer.parseInt(sCurrentPage);
}
catch (NumberFormatException e) 
{
	currentPage = 1;
}
if (currentPage <= 0)
{
	currentPage = 1;
}

UserService service = UserService.getInstance();

int countOfArticles = service.getCountOfArticles(); //총 게시물 개수
int countOfPages = ((countOfArticles-1)/10)+1; //총 페이지 개수
int firstPage = (currentPage/10)*10+1;
int lastPage = (currentPage/10)*10+10;

if(countOfPages<lastPage){
	lastPage = countOfPages;
}

List<BoardList> list = service.BoardList(currentPage);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8">
    <meta name="apple-mobile-wep-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>Boad List</title>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="include/js/jquery-3.0.0.min.js"></script>
    <link rel='stylesheet' href="include/css/bootstrap.css" />
</head>


<!-- body 시작 -->
<body>



<div class="container">

	<header>
	<ul class="nav nav-tabs">
     	 <div style="margin-bottom:10px">
      		<a class="navbar-brand navbar-left" href="#">
                <img alt="brand" src="include/img/dgsw_logo.png" style="margin-bottom:30px">
            </a>
         </div>
           <li><a href="./home.jsp">홈</a></li>
           <li><a href="./request.jsp">심야자습 신청</a></li>
           <li><a href="./list.jsp">신청목록</a></li>
           <li><a href="./list_private.jsp">개인별 신청이력</a></li>
           <li class="active"><a href="./board_list.jsp">자유 게시판</a></li>
           <li><a href="./members.jsp">회원관리</a></li>
      </ul>
    </header>
    
    <div class="jumbotron" style="margin-top:30px">
        <h2>자유 익명 게시판</h2>
        <p class="lead">누구나 자유롭게 익명으로 글을 남기고<br>웹페이지의 기능에 관해 건의할 수 있습니다<br></p>

        <p><a class="btn btn-md btn-success" href="/bulbam/write.jsp" role="button" style="float:right">글쓰기</a></p>
        
        
      </div>

	<table class="table table-striped">
	  <thead>
		   <tr>
		     <th>번 호 </th>
		     <th>제 목</th>
		     <th>글쓴이</th>
		     <th>작성날짜</th>
		     <th>조회수</th>
		   </tr>
	   </thead>
	  <tbody>
	            <%
	            	for(int i=0; i<list.size(); i++)
	            	{
	            		BoardList nt = list.get(i);
	            		
	            %>
	            <tr>
	            	<td><%= nt.getId() %></td>
	            	<td><a href="board_view.jsp?id=<%= nt.getId() %>"><%= nt.getTitle() %></a></td>
	            	<td><%= nt.getWriterV() %></td>
	            	<td><%= nt.getDate() %></td>
	            	<td><%= nt.getViews() %></td>
	            </tr>
				<%
	            	}
				%>
				
	   </tbody>
	
	</table>
	
	<div style="text-align: center;">
	<!--
	<nav aria-label="Page navigation">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>
-->
<nav aria-label="Page navigation">
<ul class="pagination">
<li class="page-item">
	
	<%
		if (firstPage != 1)
		{
	%>
		<span class="sr-only"><a class="page-link" href="board_list.jsp?page<%= firstPage-1 %>">[이전]</a></span>
	<%
		}
	%>

<%
	for (int i = firstPage ; i <= lastPage ; i++)
	{
		if(currentPage == i){
			
	%>
			<li class="page-item" style="font-weight:bold"><a href="board_list.jsp?page=<%= i %>"><%= i %></a></li>
	<%
		}
		else{
	%>		
			<li class="page-item"><a href="board_list.jsp?page=<%= i %>"><%= i %></a></li>
	<%
		}
	%>
	
	<%
	}
	%>



<%
 if(countOfPages>lastPage){
%>
		<span class="sr-only"><a class="page-link" href="board_list.jsp?page<%=lastPage+1 %>">[다음]</a></span>
<%
 }
%>
</li>
</ul>
</nav>

	</div>
</div>

</body>
<!-- body 끝 -->

</html>