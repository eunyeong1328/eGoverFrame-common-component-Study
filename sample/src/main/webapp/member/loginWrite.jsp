<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(function(){
	$("#btn_submit").click(function(){
		
		var userid = $.trim($("#userid").val());
		var pass = $.trim($("#pass").val());
			
		if(userid == ""){
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		if(pass == ""){
			alert("아이디를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		$.ajax({
			/* 전송 전 세팅 */
			type:"POST",
			data:"userid="+userid+"&pass="+pass,
			url:"loginWriteSub.do",
			dataType:"text", //성공 여부에 대해서 data를 text형태로 리턴
			/* 전송 후 세팅 */
			success:function(result){ //Controller에서 매개변수로 값이 넘어옴
				if(result == "ok"){
					alert(userid+"님 로그인 되었습니다.");
					location = "boardList.do";
				}else{
					alert("로그인 정보를 다시 확인해주세요.");
				}
			},
			error: function(){ // 장애발생(시스템 에러=서버에러)
				alert("오류발생");
			}
		});
	});
});
</script>

</head>
<style>
body{
	font-size:9pt;
	font-color:#333333;
	font-font:맑은 고딕;
}
a{
	text-decoration:none;
}
table{
	width:600px;
	border-collapse:collapse;
}
th,td{
	border:1px solid #cccccc;
	padding:3px;
	margin-top:5px;
}
caption{
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	padding-bottom:15px;
}
.div_button{
	width:600px;
	text-align:center;
	margin-top:5px;
	/* 줄 사이 간격을 띄는 방법 */
	line-height:2.0;
}
</style>
<body>
<%@include file="../include/topmenu.jsp" %>
<form name = "frm" id = "frm">
<table>
	<caption>로그인</caption>
	<tr>
		<th><label for = "userid">아이디</label></th>
		<td>	<!-- 초기 출력 시에 입력상자에 표현이 될 수 있도록  placeholder 속성 작성-->
		<input type = "text" name ="userid" id = "userid" placeholder = "아이디입력">
		<button type = "button" id="btn_idcheck">중복체크</button>
		</td>
	</tr>
	<tr>
		<th><label for = "pass">암호</label></th>
		<td>
		<input type = "password" name ="pass" id = "pass">
		</td>
	</tr>
</table>
<div class = "div_button">
	<button type = "button" id ="btn_submit">로그인</button>
	<button type = "reset">취소</button>
</div>
</form>

</body>
</html>