<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String url = request.getRequestURI();
%>

  <header>
    <ul class="nav nav-tabs" id="nav_bar">
     	 <div style="margin-bottom:10px;">
      		<a class="navbar-brand navbar-left" href="#">
                <img alt="brand" src="include/img/dgsw_logo.png" style="margin-bottom:30px">
            </a>
         </div>
           <li <%= (url.indexOf("home.jsp") > 0) ? "class=\"active\"" : "" %>><a href="./home.jsp">홈</a></li>
           <li <%= (url.indexOf("request.jsp") > 0) ? "class=\"active\"" : "" %> ><a href="./request.jsp">심야자습 신청</a></li>
           <li <%= (url.equals("/bulbam/list.jsp")) ? "class=\"active\"" : "" %> ><a href="./list.jsp">신청목록</a></li>
           <li <%= (url.indexOf("list_private.jsp") > 0) ? "class=\"active\"" : "" %> > <a href="./list_private.jsp">개인별 신청이력</a></li>
           <li <%= (url.equals("/bulbam/board_list.jsp")) ? "class=\"active\"" : "" %> > <a href="./board_list.jsp">자유 게시판</a></li>
           <li <%= (url.indexOf("members.jsp") > 0) ? "class=\"active\"" : "" %> ><a href="./members.jsp">회원 목록</a></li>
      </ul>
    </header>
    
    <%-- <%=(url.indexOf("list.jsp") > 0) ? "class=\"active\"" : "" %> // jsp 코드 주석.--%> 
    <%-- url.indexOf("찾고싶은 jsp파일 이름") true면 active, false면 non-active, 삼항연산자로 즉석에서 현재 페이지를 찾으며, active 시켜줌, 패턴 매칭이라 명명. --%>
    
