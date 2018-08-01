<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	fieldset {
		text-align: center;
		top: 200;
		left: 350;
	}

	#q_checK_btn{
		border: 0;
		outline: 0;
		cursor: pointer; 
		background-color: black;
		color: white;
		width: 130px;	
		height: 50px;
		margin-top: 2%;
	}
	#q_checK_btn:hover {
		background-color: white;
		color: black;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<fieldset>
		<legend>본인 인증 질문 및 답변</legend>
		<input type="hidden"  id="mem_id" value="${mem_id}"/>
		<input style="width: 150; height: 43px" type="text" value="${question}" disabled="disabled"/>
		<input style="width: 150; height: 43px" type="text" id="question_text" placeholder="답변 입력"/></br>
		<input type="button" id="q_checK_btn" value="비밀번호 재설정"/>
	</fieldset>
</body>
<script>
var obj = {};//초기화   
obj.type = "post";
obj.dataType = "json";
obj.data={};
//obj.enctype = "multipart/form-data";
obj.error = function(e) {
	console.log(e)
};
$("#q_checK_btn").click(
		function() {
			if ($("#question_text").val() == "") {//이름 입력 확인
				alert("답변을 입력해 주세요");
				$("#question_text").focus();//포커스 이동
			} else {
				obj.url = "./answer_check";
				obj.data.mem_id = $("#mem_id").val();
				obj.data.mem_answer = $("#question_text").val();
				obj.success = function(data) {
					if (data.success == true) {
						location.href = "resetPW_call?mem_id="+data.mem_id;
					} else {
						alert("답변이 틀렸습니다.");
					}
				}
				console.log(obj);
				ajaxCall(obj);
			}
		});

function ajaxCall(obj) {
	$.ajax(obj);
}

</script>
</html>