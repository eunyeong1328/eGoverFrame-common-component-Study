<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String USERID = (String) session.getAttribute("SessionUserID");
%>

<table>
	<tr>
		<th width = "25%">홈</th>
		<th width = "25%"><a href ="/sample/boardList.do">게시판</a></th>
		
		<%
			if(USERID == null){
		%>
		<th width = "25%"><a href ="/sample/memberWrite.do">회원가입</a></th>
		<th width = "25%"><a href ="/sample/loginWrite.do">로그인</a></th>
		<%
		}else{
		%>
			<th width = "25%"><a href ="/sample/memberModify.do">회원정보</a></th>
			<th width = "25%"><a href ="/sample/logout.do">로그아웃</a></th>
		<%
		}
		%>
	</tr>
</table>

</body>
</html>