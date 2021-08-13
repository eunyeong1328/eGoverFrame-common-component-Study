<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	font-size: 9pt;
	df
	',0,now());
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

.div1 {
	width: 600px;
	text-align: center;
	font-size: 15pt;
}

.div2 {
	width: 600px;
	text-align: left;
	font-size: 8pt;
}
</style>
<body>
	<div class="div1">일반게시판 목록</div>
	<div class="div2">Total: ${total }</div>
	
	<div class = "div2">
	<form name = "searchFrm" method = "post" action = "boardList.do">
		<select name = "searchGubun" id = "searchGubun">
			<option value ="title">제목</option>
			<option value ="name">글쓴이</option>
			<option value ="content">내용</option>
		</select>
		<input type ="text" name = "searchText" id = "searchText">
		<button type = "submit" onclick = "fn_search(); return false;">검색</button>
	</form>
	</div>
	
	<table>
		<!-- 번호, 제목, 글쓴이, 등록일, 조회수 -->
		<tr>
			<th width="15%">번호</th>
			<th width="40%">제목</th>
			<th width="15%">글쓴이</th>
			<th width="15%">등록일</th>
			<th width="15%">조회수</th>
		</tr>
		<c:set var="rownum" value="${rowNumber }" />

		<c:forEach var="result" items="${resultList}">
			<tr align="center">
				<td><c:out value="${rownum }" /></td>
				<td align = "">
					<a href="boardDetail.do?unq=${result.unq }"><c:out value="${result.title }" /></a>
				</td>
				<td><c:out value="${result.name }" /></td>
				<td><c:out value="${result.rdate }" /></td>
				<td><c:out value="${result.hits }" /></td>
			</tr>
			<c:set var="rownum" value="${rownum-1 }" />
		</c:forEach>
	</table>
	<div style="width: 800px; margin-top: 5px; text-align: center;">
		<c:forEach var="i" begin="1" end="${totalPage}">
			<!-- 페이지 번호를 클릭 했을 때 viewPage이름의 값을 Controller로 넘긴다.  -->
			<a href="boardList.do?viewPage=${i }">${i }</a>
		</c:forEach>
	</div>
	<!-- div는 스타일을 지정해 주는 코드이다. -->
	<div style="width: 800px; margin-top: 5px; text-align: right;">
		<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
	</div>

</body>
</html>