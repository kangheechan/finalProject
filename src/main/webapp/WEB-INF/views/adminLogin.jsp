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
		#logindiv{
			position:absolute;
			margin-left: 40%;			
			margin-top: 15%;
		}
		 #adminloginBtn{
	      border: 0;
	      outline: 0;
	      cursor: pointer;
	      background-color: black;
	      color: white;
	      height: 45px;
	   }
	   #adminloginBtn:hover{
	      background-color: white;
	      color: black;
	   }
		
	</style>	
</head>
<body>
<c:if test="${sessionScope.loginId == null}">
	<div id="back">
	<h2 id="mainimg" onclick="location.href='./'"> 슈마니커</h2>
	<div id="div2">관리자 로그인</div>
	</div>
	<div id="logindiv">
	
		<table>			
			<tr>
				<th>ID</th>
				<td><input type="text" id="admin_Id" placeholder="관리자 아이디" /></td>
				<td rowspan="2"><input id="adminloginBtn" type="button" value="로그인" />
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" id="admin_Pw" placeholder="관리자 비밀번호" /></td>
			</tr>	
		<!-- 	 <tr>
				<td colspan="3">
				<input onclick="join()" type="button"	value="회원가입" /> 
			</tr>  --> 
		</table>
	</div>
	</c:if>
	<c:if test="${sessionScope.loginId != null}">
	<h3>회원 로그인시 접근 불가능 합니다.</h3>
	</c:if>
</body>
	<script>
	function join() {
		location.href = "./adminjoinForm";
	}
	
	$("#adminloginBtn").click(function() {
		//키와 값으로 복수개가 들어간다.
		//type: [post|get], url: 어디로 보낼 것인가? 
		//data: 어떤 파라메터와 값?, dataType: [json|xml|text|html|jsonp]
		//success: 성공시 할 일, error: 실패시 할 일
		$.ajax({
			type : "post",
			url : "./adminlogin",
			data : {
				id : $("#admin_Id").val(),
				pw : $("#admin_Pw").val()
			},
			dataType : "json",
			success : function(data) {//인자 값은 서버에서 주는 메시지
				console.log(data);
				if (data.success) {
					alert("로그인에 성공 했습니다.");
					location.href = "./admin_menual";
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