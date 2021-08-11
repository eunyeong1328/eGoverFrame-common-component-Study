<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 화면</title>
<script src="/sample/script/jquery-1.12.4.js"></script>
<script src="/sample/script/jquery-ui.js"></script>
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
		//# = jqeury에서 id값(title이라는 요소) 
		/*  [자바 스크립트 형식]
		if(document.frm.title.value == "" ){
			alert("제목을 입력해주세요");
			document.frm.title.focus();
			return false;
		}
		if(document.frm.pass.value == "" ){
			alert("암호를 입력해주세요");
			document.frm.pass.focus();
			return false;
		} */
		//document.frm.submit(); //동기전송방식(움직임,java로 데이터전송)
	}
</script>
<body>
	<form name="frm" id="frm method = " post" action="boardWriteSave.do">
		<table>
			<caption>게시판 등록</caption>
			<tr>
				<!-- 커서의 움직임,클릭(사용자 편의 기능) for와 id의 이름은 일치해야 한다.-->
				<th width="20%"><label for="title">제목</label></th>
				<td width="80%"><input type="text" name="title" id="title"
					class="input1"></td>
			</tr>
			<tr>
				<th><label for="pass">암호</label></th>
				<td><input type="password" name="pass" id="pass"></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea type="content" id="content" class=textarea></textarea></td>

			</tr>
			<tr>
				<th colspan="2">
					<button type="submit" onclick="fn_submit(); return false;">저장</button>
					<button type="resest">취소</button>
				</th>
			</tr>

		</table>
	</form>
</body>
</html>