<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호입력화면</title>
<script src="script/jquery-1.12.4.js"></script>
<script src="script/jquery-ui.js"></script>
</head>
<script>
$(function(){
	$("#delBtn").click(function(){
		var pass = $("#pass").val();
		pass = $.trim(pass);
		if(pass == ""){
			alert("암호를 입력해주세요");
			$("#pass").focus();
			return false;
		}
		var sendData = "unq=${unq}&pass="+pass;
		//ajax : 비동기 전송방식의 기능을 가지고 있는 jquery의 함수
		$.ajax({  
			type:"POST",
			data:sendData, //json설정
			url:"boardDelete.do",
			dataType:"text", //리턴 타입
			success:function(result){ //Controller에서 매개변수로 값이 넘어옴
				if(result == "1"){
					alert("삭제 완료");
					location = "boardList.do";
				}else if(result == "-1"){
					alert("암호가 일치하지 않습니다.")
				}else{
					alert("삭제 실패\n관리자에게 연락해주세요.")
				}
			},
			error: function(){ // 장애발생
				alert("오류발생");
			}
		});
	});
});
</script>
<body>
<table>
	<tr>
		<th>암호입력</th>
		<td><input type = "password" id = "pass"></td>
		<td><button type = "button" id = "delBtn">삭제하기</button></td>
	</tr>
</table>

</body>
</html>