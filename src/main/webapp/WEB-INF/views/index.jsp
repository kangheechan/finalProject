<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<style>
	#tab1{
		margin-left: 40%;
		margin-top: 10%;		
	}
	
	#mainimg{		
		margin-left: 45%;
		margin-top: 5%;
		cursor: pointer;
		
	}
	#loginBtn{		
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		height: 45px;
		border: 1px solid black;
	}
	#loginBtn:hover{
		background-color: white;
		color: black;
		border: 1px solid black;
	}
	#join{
		border: 1px solid black;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		width: 130px;	
		height: 30px;
		margin-top: 2%;
	}
	#join:hover{
		background-color: white;
		color: black;
		border: 1px solid black;
	}
	#search{
		border: 1px solid black;
		outline: 0;
		cursor: pointer; 
		background-color: black;
		color: white;
		width: 130px;	
		height: 30px;
	}
	#search:hover {
		background-color: white;
		color: black;
		border: 1px solid black;
	}
	
</style>
</head>
	
	
	<h2 id="mainimg" onclick="location.href='./'"> 슈마니커</h2>


	<div id="tab1">
		<table>			
			<tr>
				<th>ID</th>
				<td><input type="text" id="userId" placeholder="아이디" /></td>
				<td rowspan="2" colspan="3"><input id="loginBtn" type="button" value="로그인" />
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input onkeyup="enterkey()" type="password" id="userPw" placeholder="비밀번호" /></td>
			</tr>
			<tr>
				<td colspan="10"><input id="join" onclick="join()" type="button" value="회원가입" /> 
				<input id="search" type="button" onclick="search()"	value="아이디/비번 찾기" /></td>
			</tr>
		</table>
	</div>
	
</body>
<script>

function enterkey() {
    if (window.event.keyCode == 13) {

    	$.ajax({
    		type : "post",
    		url : "./login",
    		data : {
    			id : $("#userId").val(),
    			pw : $("#userPw").val()
    		},
    		dataType : "json",
    		success : function(data) {//인자 값은 서버에서 주는 메시지
    			console.log(data);
    			if (data.success) {
    				alert("로그인에 성공 했습니다.");
    				location.href = "./";
    			} else {
    				alert("로그인에 실패 했습니다.");
    			}
    		},
    		error : function(err) {//인자 값은 서버에서 주는 에러 메시지
    			console.log(err)
    		}
    	});
    }
}



function join() {
	location.href = "./joinForm";
}

var openwin;
function search() {
	// window.name = "부모창 이름"; 
	window.name = "parentForm";
	//window.open("open할 window", "자식창 이름", "팝업창 옵션");
	openWin = window.open("./mem_search", "childForm",
			"width=700, height=250, resizable = no, scrollbars = no");
}

$("#loginBtn").click(function() {
	//키와 값으로 복수개가 들어간다.
	//type: [post|get], url: 어디로 보낼 것인가? 
	//data: 어떤 파라메터와 값?, dataType: [json|xml|text|html|jsonp]
	//success: 성공시 할 일, error: 실패시 할 일
	$.ajax({
		type : "post",
		url : "./login",
		data : {
			id : $("#userId").val(),
			pw : $("#userPw").val()
		},
		dataType : "json",
		success : function(data) {//인자 값은 서버에서 주는 메시지
			console.log(data);
			if (data.success) {
				alert("로그인에 성공 했습니다.");
				location.href = "./";
			} else {
				alert("로그인에 실패 했습니다.");
			}
		},
		error : function(err) {//인자 값은 서버에서 주는 에러 메시지
			console.log(err)
		}
	});
});
</script>
</html>