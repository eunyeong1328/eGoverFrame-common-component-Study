<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	font-size: 9pt;df',0,now()); 
}

table {
	width: 600pt;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #cccccc;
	padding: 3px
}

.input1 {
	width: 98%;
}

.textarea {
	width: 98%;
	height: 70px;
}
</style>
<body>
<table>
<!-- 번호, 제목, 글쓴이, 등록일, 조회수 -->
	<tr>
		<th width = "15%" >번호</th>
		<th  width = "40%">제목</th>
		<th  width = "15%">글쓴이</th>
		<th  width = "15%">등록일</th>
		<th  width = "15%">조회수</th>
	</tr>
	<c:set var = "rownum" value = "1"  />
	<c:forEach var="result" items="${ resultList}">
	<tr align = "center">
		<td><c:out value = "${rownum }"/></td>
		<td><c:out value ="${result.title }"/></td>
		<td><c:out value = "${result.name }"/></td>
		<td><c:out value = "${result.rdate }"/></</td>
		<td><c:out value = "${result.hits }"/></</td>
	</tr>
		<c:set var = "rownum" value = "${rownum+1 }"/> 
	</c:forEach>
</table>
<!-- div는 스타일을 지정해 주는 코드이다. -->
<div style = width:600px; margin-top:5px; text-align:left;">
	<button type ="button" onclick = "location='boardWrite.do'">글쓰기</button>
</div>

</body>
</html>