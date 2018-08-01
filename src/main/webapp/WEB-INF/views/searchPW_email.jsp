<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매자 비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <style type="text/css">
 			.searchPw table{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            }   
            
            .searchPw td{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            }   
            
            .searchPw th{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            }   
     
            
            .searchPwTitle{
            	margin : 30px 0px 60px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
            
            .searchPwTable{
            	position : fixed;
            	top: 330px;
            	left: 30%;
            	width:1000px;
            }
            
            .background{
          		position : fixed;
            	width: 100%;
            	height: 290px;
            	background-color: limegreen;
            	opacity: 0.15;
            }
            
            .inp, #search_email{
            	height: 43px;
            }
            
              .searchPw hr{
            	border:none;
            	border:1px solid limegreen; 
            	color: limegreen;    /* IE */
    			border-color: limegreen;  /* 사파리 */
   			    background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
   			    width:66%;
   			    float: left;
            }
            
            #searchPWbtn{
            	position:absolute;
            	left:24%;
            	text-align: center;
            	font-weight: 600;
            	border-style : solid;
            	height : 50px;
            	width: 150px;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            	cursor: pointer;
            } 
</style>-->
<style>
	.searchPwTitle h3{
		margin-left: 40%;
	}
	.searchPwTable{
		margin-left: 0%;
		border-spacing: 5px;
	} 
	.searchPwTable td{
		border: 0;
	}
	#searchPWbtn{
           	position:absolute;
           	left:24%;
           	text-align: center;
           	font-weight: 600;
           	height : 50px;
           	width: 150px;
           	border: 0;
			outline: 0;
           	background-color: black;
           	margin-left: 2%; 
           	margin-top: 1%;  
           	color: white;
           	cursor: pointer;
           }
            #searchPWbtn:hover {
			background-color: white;
			color: black;
		}
		.searchPwTable{
            	position : fixed;
            	width:1000px;
            }
</style>
</head>
<body>
	<div class=searchPw>
		<div class=searchPwTitle>
			<h3>비밀번호 찾기</h3>
		</div>
		<div class=background></div>
		<table class=searchPwTable>
			<tr>
				<th>ID</th>
				<td><input style="width: 150; height: 43px" type="text" class=inp name="search_userId" id="mem_id"
					placeholder="아이디 입력란" /></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input class="inputTxt" type="text" name="email"
					id="first_email" style="width: 150; height: 43px" placeholder="이메일 입력란" /> @ <input
					type="text" id="emailview" name="emailview" style="width: 150; height: 43px"
					placeholder="이메일 선택" disabled="true" /> <select style="height: 43px" id="email">
						<option value="0">이메일을 선택 하세요</option>
						<option value="1">직접입력</option>
						<option>naver.com</option>
						<option>hanmail.net</option>
						<option>google.com</option>
						<option>nate.com</option>
						<option>daum.net</option>
				</select></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="button" id="searchPWbtn"	value="이메일 인증하기" /></td>
			</tr>
		</table>
	</div>
</body>

<script type="text/javascript">
	var obj = {};//초기화   
	obj.type = "post";
	obj.dataType = "json";
	obj.data = {};
	//obj.enctype = "multipart/form-data";
	obj.error = function(e) {
		console.log(e)
	};

	$("#email").change(function() {
		$("#email option:selected").each(function() {

			if ($(this).val() == '0') {
				$("#emailview").val("이메일 입력란");
				$("#emailview").attr("disabled", true);
			}

			else if ($(this).val() == '1') { //직접입력일 경우
				$("#emailview").val(''); //값 초기화
				$("#emailview").attr("placeholder", "직접입력");
				$("#emailview").attr("disabled", false); //활성화 
			} else { //직접입력이 아닐경우 
				$("#emailview").val($(this).text()); //선택값 입력
				$("#emailview").attr("disabled", true); //비활성화
			}
		});
	});
	var openWin;
	var mem_id;
	$("#searchPWbtn")
			.click(
					function() {
						if ($("input[name='search_userId']").val() == "") {//이름 입력 확인
							alert("아이디를 확인 해 주세요!");
							$("input[name='userName']").focus();//포커스 이동
						} else if ($("input[name='email']").val() == "") {//이메일 입력 확인
							alert("이메일을 확인 해 주세요!");
							$("input[name='email']").focus();//포커스 이동
						} else {
							obj.url = "./email_searchPW";
							obj.data.mem_id = $("input[name='search_userId']")
									.val();
							obj.data.mem_email = $("input[name='email']").val()
									+ "@" + $("input[name=emailview]").val();
							
							obj.success = function(data) {
								if (data.success == true) {
									mem_id = data.mem_id;
									// window.name = "부모창 이름"; 
									window.name = "parentForm";
									//window.open("open할 window", "자식창 이름", "팝업창 옵션");
									openWin = window
											.open("./search_mail_check",
													"childForm",
													"width=700, height=200, resizable = no, scrollbars = no");
								} else {
									alert("해당 정보가 없습니다.");
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