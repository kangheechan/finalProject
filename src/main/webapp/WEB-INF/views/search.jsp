<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#fie {
	text-align: center;
	top: 200;
	left: 350;
	height: 70px;
	border: 0;
}
	#searchID{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		width: 20%;
		height: 30px;
		margin-top: 10%;
	}
	#searchID:hover{
		background-color: white;
		color: black;
	}
	#searchPW{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		width: 20%;
		height: 30px;
	}
	#searchPW:hover{
		background-color: white;
		color: black;
	}

</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<fieldset id="fie">
		<legend>찾으실 정보를 클릭하세요.</legend>
		<input type="button" id="searchID" value="아이디 찾기" />
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" id="searchPW"
			value="비밀번호 찾기" />
	</fieldset>
</body>
<script>
	$("#searchPW").click(function(){
		location.href = "./searchPW";
	});
	$("#searchID").click(function(){
		location.href = "./searchID";
	});
</script>
</html>