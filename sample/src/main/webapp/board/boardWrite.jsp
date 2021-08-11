<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 화면</title>
</head>
<style>
	body{
	font-size:9pt;
	}
	table{
	width: 600pt;
	border-collapse:collapse;
	}
	th,td{
	border:1px solid #cccccc;
	padding:3px
	}
	.input1{
	width:98%;
	}
	.textarea{
	width:98%;
	height:70px;
	}
</style>

<script>
	function fn_submit(){
		if(document.frm.title.value == "" ){
			alert("제목을 입력해주세요");
			document.frm.title.focus();
			return false;
		}
		if(document.frm.pass.value == "" ){
			alert("암호를 입력해주세요");
			document.frm.title.focus();
			return false;
		}
		//document.frm.submit(); //동기전송방식(움직임,java로 데이터전송)
		
	}
</script>
<body>
게시판 등록 화면
<form name ="frm" id="frm method = "post" action = "boardWriteSave.do">
<table>
	<caption>게시판 등록</caption>
	<tr>	<!-- 커서의 움직임,클릭(사용자 편의 기능) for와 id의 이름은 일치해야 한다.-->
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%"><input type = "text" name = "title" id = "title" class = "input1"></td>
	</tr>
	<tr>
		<th><label for="pass">암호</th>
		<td><input type = "password" name = "pass" id = "pass"></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td><input type = "text" name = "name" id = "name"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea type = "content" id = "content" class=textarea></textarea></td>
		
	</tr>
	<tr>
		<th colspan ="2">			<!-- return false 시 action이 실행이 되지 않는다. -->
			<button type = "submit" onclick = "fn_submit(); return false;">저장</button>
			<button type = "resest">취소</button>
		</th>
	</tr>
	
</table>
</form>
</body>
</html>