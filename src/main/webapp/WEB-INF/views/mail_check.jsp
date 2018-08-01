<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>이메일 인증하기</title>
<style>
	#mail_button{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		margin-left: 1%;
		color: white;
		height: 20px;
	}
	#mail_button:hover{
		background-color: white;
		color: black;
	}
	
	#mail_check_success{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		margin-left: 1%;
		color: white;
		height: 20px;
	}
	#mail_check_success:hover{
		background-color: white;
		color: black;
	}
	#mail_check_success{
		margin-left: 85%;
	}
	#fie{
		text-align: center;
	}
</style>
</head>
<body>
	<fieldset id="fie">
		<legend>본인확인 이메일 인증</legend>
		<input type="text" id="mail_check" name="mail_check"
			placeholder="인증번호를 입력하세요" disabled="true"/> <input type="button" id="mail_button"
			value="인증번호 요청" />
	</fieldset>
	<input type="button" id="mail_check_success" value="메일 인증 확인"/>
</body>
<script>
	var obj = {};//초기화   
	obj.type = "post";
	obj.dataType = "json";
	obj.enctype = "multipart/form-data";
	obj.error = function(e) {
		console.log(e)
	};

	
	var num;
	$("#mail_button").click(
			function() {
				obj.url = "./email_check";
				obj.data = {
					email : opener.document.getElementById("first_email").value 
					+ "@"+ opener.document.getElementById("emailview").value
				};
				obj.success = function(d) {
					console.log(d.mail_check);
					alert("메일로 인증번호를 발송했습니다.");
					$("#mail_check").attr("disabled",false);
					num = d.mail_check
				};
				console.log(obj);
				ajaxCall(obj);
			});

	
	$("#mail_check_success").click(function(){
		console.log(num);
		if($("#mail_check").val()==num){
			alert("메일 인증이 완료되었습니다.");
			window.opener.document.getElementById("email_enter").value = "메일 인증 완료";
			window.opener.$("#email_enter").css("color","green");
			window.open('about:blank','_self').self.close(); 
		} else{
			alert("인증번호가 다릅니다.");
		}
	});
	function ajaxCall(obj) {
		$.ajax(obj);
	}
</script>
</html>