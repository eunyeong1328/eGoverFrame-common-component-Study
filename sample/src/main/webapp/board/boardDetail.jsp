<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% pageContext.setAttribute("newline", "\n"); %>
<c:set var = "content" value = "${fn:replace(boardVO.content,newline,'<br>') }"/>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 화면</title>
<script src="script/jquery-1.12.4.js"></script>
<script src="script/jquery-ui.js"></script>
</head>
<style>
body {
	font-size: 9pt;
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

<script>
$(function(){
	$("#title").val("제목입력");
}); 
function fn_submit() {
		// [ jquery 형식 ]
		//trim() -> 앞귀 공백 제거, java, jsp
		//자바스크립트에는 공백을 글씨로 인정하지만 jquery는 공백을 인정하지 않는다.
		if ( $.trim($("#title").val()) == "") {
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
		//공백 체크 후 공백에 들어간 값이  다시 재설정되도록 하는 것
		$("#title").val($.trim( $("#title").val()) );

		if ( $.trim($("#pass").val()) == "") {
			alert("암호를 입력해주세요");
			return false;
		}
		$("#pass").val( $.trim( $("#pass").val() ) );
		
		//form 데이터
		var formData = $("#frm").serialize();//serialize()는 form 그 자체
		
		//ajax : 비동기 전송방식의 기능을 가지고 있는 jquery의 함수
		$.ajax({  
			type:"POST",
			data:formData,
			url:"boardWriteSave.do",
			dataType:"text", //리턴 타입
			success:function(data){ //Controller에서 매개변수로 값이 넘어옴
				if(data == "ok" ){
					alert("저장 완료");
					location = "boardList.do";
				}else{
					alert("저장 실패")
				}
			},
			error: function(){ // 장애발생
				alert("오류발생");
			}
		});
		
	}
</script>
<body>
	<form id="frm">
		<table>
			<caption>게시판 상세</caption>
			<tr>
				<th width="20%"><label for="title">제목</label></th>
				<td width="80%"><c:out value = "${boardVO.title }"/></td>
			</tr>
	
			<tr>
				<th>글쓴이</th>
				<td>${boardVO.name }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td height = "50">
				${content }
				</td>

			</tr>
			<tr>
				<th>등록일</th>
				<td>${boardVO.rdate }</td>

			</tr>
			<tr>
				<th colspan="2">
					<button type = "button" onclick = "location='boardList.do'">목록</button>
					<button type = "button" onclick = "location='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
					<button type = "button" onclick = "location='passWrite.do?unq=${boardVO.unq}'">삭제</button>
				</th>
			</tr>

		</table>
	</form>
</body>
</html>