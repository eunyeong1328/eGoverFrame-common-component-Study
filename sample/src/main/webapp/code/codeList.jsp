<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jsp에서는 Controller에서 넘어온 데이터를 받을 수 없다.설정한 후 사용 -->
<!-- jsp에서 jstl의 문법을 사용하기 위한 설정 -->
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
table{
	width:400px;
	boarder-collapse:callapse; /* cell 간격 없앰 */
}
th,td{
	border:1px solid #cccccc;
	padding:5px;
}
</style>

<script language="javascript">
function fn_delete(code){
	if(confirm("정말 삭제하시겠습니까?")){
		location = "codeDelete.do?code="+code;
	}	
}

function fn_update(code){
	location="codeModifyWrite.do?code="+code;
}
	
</script>
<body>
<table>
	<caption>코드목록</caption>
	<!-- 코드관리: 총 개수 출력  width:100%-->
	<div style = "width:100%"; text-align:left;">Total : ${resultTotal } 개 </div>
	<colgroup>
		<col width = "10%"/>
		<col width = "30%"/>
		<col width = "30%"/>
		<col width = "30%"/>
	</colgroup>
	<tr>
		<th>번호</th>
		<th>그룹명</th>
		<th>코드명</th>
		<th>구분</th>
	</tr>
	
	<!--jstl로 변수 만드는 법!! 변환 타입이 없다!!  -->
	<c:set var="count" value = "1" />
	<c:forEach var ="result" items = "${resultList}" varStatus = "state">
		<tr align = "center">
			<td><c:out value ="${count }" /></td>
			<td>${result.gid }</td>
			<td>${result.name }</td>
			<td>
			<button type="button" onclick="fn_update('${result.code}')">수정</button>
			<button type="button" onclick="fn_delete('${result.code}')">삭제</button>
			</td>
		</tr>
		<c:set var = "count" value= "${count+1}"/>
	</c:forEach> 
</table>
</body>
</html>