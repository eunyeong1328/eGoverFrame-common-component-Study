<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

 <script>
 $(function(){
	$("#btn_send").click(function(){
		 var addr = $("#address").val();
		 alert(addr);
		 //var addr = "[137929] 12 서울특별시 서초구 서초4동 서초교대e편한세상아파트 (101~106동)" 
		 var addr_array = addr.split(" ");
		 var zipcode = addr_array[0].substring(1,addr_array[0].length-1);
		 var address = addr.replace(addr_array[0],""); //우편번호를 공백으로 바꾸기
		 address = $.trim(address)
		 alert(zipcode);
		 alert(address);
		 
		 //본 화면에 적용
		 opener.document.frm.zipcode.value = zipcode;
		 opener.document.frm.address.value = address;
		 //화면       창
		 
		 self.close();
	});
 });
 </script>
<body>
<div style = "width:100%; text-align:center;">
<select name = "address" id ="address">

	<c:forEach var = "result" items = "${resultList}">
		<option value = "${result.addr}">${result.addr}</option>
		<!-- option에 있는 내용을 반복문으로 돌리면서 화면에 출력 -->
	</c:forEach>
	
</select>

<br><br>
<button type = "button" id = "btn_send">적용하기</button>
</div>
</body>
</html>