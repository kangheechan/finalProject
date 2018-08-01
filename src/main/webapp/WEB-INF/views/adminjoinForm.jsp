<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<style>
	#mainimg{
			position: absolute;
			color: white;
			margin-left: 1%;
			cursor: pointer;
			top: 2%;
			}

		#back{
			height: 15%;
			background-color: black;
			margin: -1%;  
		}
		#div2{
			position:absolute;
			background-color: black;
			height:5%;
			margin-left: 44%;			
			margin-top: 3%;
			top: 1%;
			color: white;
			font-size: 18px;
			text-decoration: none;	
			text-align:center;	
		}
		#registdiv{
			position:absolute;
			margin-left: 40%;			
			margin-top: 15%;
		}
		
	</style>	
</head>
<body>
	<div id="back">
	<h2 id="mainimg" onclick="location.href='./'"> 슈마니커</h2>
	<div id="div2">관리자 회원가입</div>
	</div>
	<div id="registdiv">
        	<fieldset>
			<legend>회원 정보 입력</legend>
			<p>ID:<input type="text" name="user_id"/></p>
			<p>PW:<input type="password" name="user_pw"/></p>
			<button id="adminjoin">가입</button>
			</fieldset>
	</div>
</body>
	<script>
	 var obj = {};//초기화   
	obj.data={};
	obj.type = "post";
	obj.dataType = "json";
	obj.enctype = "multipart/form-data";
	obj.error = function(e) {
		console.log(e)
	};
	$("#adminjoin").click(function(){
		console.log("서버 전송");
		obj.url = "./adminjoin";
		obj.data.mem_id = $("input[name='user_id']").val();
		obj.data.mem_pw = $("input[name='user_pw']").val();
		obj.success = function(data) {
			if (data.success==1) {
				alert("회원 가입이 정상 처리 되었습니다.");
				alert('${msg}');
				location.href = "./adminLogin";
			} else {
				alert("회원 가입에 실패 했습니다.");
			}
		}
		console.log(obj);
		ajaxCall(obj);
	});

//전달 받은 오브젝트로 ajax 통신 실행
function ajaxCall(obj) {
$.ajax(obj);
} 
	</script>
</html>