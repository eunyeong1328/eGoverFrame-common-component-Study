<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
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
 
function fn_submit() {
		//trim() -> 앞귀 공백 제거, java, jsp
		
		// document.frm.title.value == ""
		// $("#title").val() == ""  
		// $.trim(" aabbcc ") == $.trim($("#title").val()) == ""
		
		if ( $.trim($("#title").val()) == "") {
			alert("제목을 입력해주세요");
			//document.frm.title.focus();
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
			url:"boardModifySave.do",
			dataType:"text", //리턴 타입
			success:function(data){ //Controller에서 매개변수로 값이 넘어옴
				if(data == "1" ){
					alert("저장 완료");
					location = "boardList.do";
				}else{
					alert("저장 실패\n관리자에게 연락해주세요.")
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
	<input type = "hidden" name  ="unq" value = "${vo.unq }">
		<table>
			<caption>게시판 수정 화면</caption>
			<tr>
				<!-- 커서의 움직임,클릭(사용자 편의 기능) for와 id의 이름은 일치해야 한다.-->
				<th width="20%"><label for="title">제목</label></th>
				<td width="80%"><input type="text" name="title" id="title"
					class="input1" value = "${vo.title }" ></td>
			</tr>
			<tr>
				<th><label for="pass">암호</label></th>
				<td><input type="password" name="pass" id="pass" value = "${vo.pass }"></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="name" id="name" value = "${vo.name }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content">${vo.content }</textarea></td>

			</tr>
			<tr>
				<th colspan="2">
					<button type="submit" onclick="fn_submit(); return false;">저장</button>
					<button type="reset">취소</button>
				</th>
			</tr>

		</table>
	</form>
</body>
</html>