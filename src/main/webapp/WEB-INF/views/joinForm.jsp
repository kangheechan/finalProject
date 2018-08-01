
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>슈마니커 회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
	#tab1{
		margin-left: 43.5%; 
		margin-top: 5%;
				
	}
	#tab1 table{
		margin-left: -15%; 
		border-spacing: 10px;
		
	}
	
	#overlay{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		height: 20px;
	}
	#overlay:hover{
		background-color: white;
		color: black;
	}
	#tab3{
		height: 60%;
	}

	#point{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		height: 20px;
	}
	#point:hover{
		background-color: white;
		color: black;
	}
	
	#email_send{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		margin-left: 1%;
		color: white;
		height: 20px;
	}
	#email_send:hover{
		background-color: white;
		color: black;
	}

	#join{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		margin-left: 25%;
		color: white;
		height: 30px;
		width: 80px;
		
	}
	#join:hover{
		background-color: white;
		color: black;
	}
	#size{
		margin-left: 1.5%;
	}
	#question{
		width: 38%;
		height: 32%; 		 
	}
	#answer{
		margin-left: 1%;
	}
	#tab3 a{
		margin-top: -5%;
	}
	#mainimg{		
		margin-left: 45%;
		margin-top: 5%;
		cursor: pointer;
	}
	#add{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		height: 70%;
		width: 21%; 
		
	}
	#add:hover{
		background-color: white;
		color: black;
	}
	
/* table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center;
	width: 1000;
}

input.inputTxt {
	width: 100%;
} */

</style>
</head>
<body>

<h2 id="mainimg" onclick="location.href='./'">슈마니커</h2>

<div id="tab1">
	<table>	
		
		
		<tr>
			<td>아이디</td> 
			<td><input style="width: 171.7" type="text" name="userId"
				placeholder="아이디 입력란" /> <input id="overlay" type="button"
				value="중복 체크" /></td>
		</tr> 
		<tr>
			<td>비밀번호</td>
			<td><input class="inputTxt" type="password" name="userPw"
				placeholder="비밀번호 입력란" /></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input class="inputTxt" type="password" name="userPwCk"
				placeholder="비밀번호 확인란" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input class="inputTxt" type="text" name="userName"
				placeholder="이름 입력란" /></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="남성" /> 남성 <input
				type="radio" name="gender" value="여성" /> 여성</td>
		</tr>
		<tr>
			<td>신발 사이즈</td>
			<td><input type="text" id="sizeview" name="sizeview"
				style="width: 171.5" placeholder="사이즈를 선택하세요." disabled="true" /><select
				id="size">
					<option value="0">신발 사이즈를 선택하세요.</option>
					<option value="1">직접입력</option>
					<option>210mm</option>
					<option>215mm</option>
					<option>220mm</option>
					<option>225mm</option>
					<option>230mm</option>
					<option>235mm</option>
					<option>240mm</option>
					<option>245mm</option>
					<option>250mm</option>
					<option>255mm</option>
					<option>260mm</option>
					<option>265mm</option>
					<option>270mm</option>
					<option>275mm</option>
					<option>280mm</option>
					<option>285mm</option>
					<option>290mm</option>
					<option>295mm</option>
					<option>300mm</option>
			</select></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr1" id="sample4_postcode"
				placeholder="우편번호"> <input type="button" id="add"
				onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <br>
				<input type="text" name="addr2" id="sample4_roadAddress"
				placeholder="도로명주소"> <input type="text" name="addr3"
				id="sample4_jibunAddress" placeholder="지번주소"> <span
				id="guide" style="color: #999"></span></td>
		</tr>
		<tr>

		</tr>
		<tr>
			<td>EMAIL</td>
			<td><input class="inputTxt" type="text" name="email" 
				id="first_email" style="width: 171.5" placeholder="이메일 입력란" /> @ <input
				type="text" id="emailview" name="emailview" style="width: 100"
				placeholder="이메일 선택" disabled="true" /> <select id="email">
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
			<td>본인 확인 절차</td>
			<td><input type="text" style="color: red" name="email_enter"
				id="email_enter" value="이메일 인증이 필요합니다." disabled="true" /><input
				type="button" id="email_send" name="email_send" value="이메일 인증" /></td>
		</tr>
		<tr>
			<td>휴대폰 번호</td>
			<td><input class="inputTxt" type="text" name="phone"
				placeholder="휴대폰 번호 입력란" /></td>
		</tr>
		<tr>
			<td>본인인증 질문</td>
			<td><select id="question">
					<option value="0">질문을 선택하세요.</option>
					<option value="나의 보물 1호는?">나의 보물 1호는?</option>
					<option value="출신 고등학교는?">출신 고등학교는?</option>
					<option value="유년시절 내가 살던 동네는?">유년시절 내가 살던 동네는?</option>
					<option value="가장 친한 친구의 이름은?">가장 친한 친구의 이름은?</option>
					<option value="나의 별명은?">나의 별명은?</option>
			</select><input type="text" name="answer" id="answer" placeholder="질문 답변" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<button id="join">회원가입</button>
			</td>
			</tr>
		</table>
	</div>
	
</body>
<script>
var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
var pwReg = /^[a-z]+[a-z0-9]{7,15}$/g;

var obj = {};//초기화   
obj.type = "post";
obj.dataType = "json";
obj.enctype = "multipart/form-data";
obj.error = function(e) {
	console.log(e)
};


var openWin;
$("#email_send")
		.click(
				function() {

					// window.name = "부모창 이름"; 
					window.name = "parentForm";
					//window.open("open할 window", "자식창 이름", "팝업창 옵션");
					openWin = window
							.open("./mail_check", "childForm",
									"width=700, height=200, resizable = no, scrollbars = no, left = 300, top= 200");

				});

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

$("#size").change(function() {
	$("#size option:selected").each(function() {

		if ($(this).val() == '0') {
			$("#sizeview").val("사이즈를 선택하세요.");
			$("#sizeview").attr("disabled", true);
		}

		else if ($(this).val() == '1') { //직접입력일 경우
			$("#sizeview").val('mm'); //값 초기화
			$("#sizeview").attr("placeholder", "직접입력");
			$("#sizeview").attr("disabled", false); //활성화 
		} else { //직접입력이 아닐경우 
			$("#sizeview").val($(this).text()); //선택값 입력
			$("#sizeview").attr("disabled", true); //비활성화
		}
	});
});

var overChk = false;//중복체크 값
$("#overlay").click(function() {
	var userId = $("input[name=userId]").val();

	obj.url = "./overlay";
	obj.data = {
		id : $("input[name='userId']").val()
	};
	obj.success = function(d) {
		console.log(d.overlay);

		if (!idReg.test(userId)) {
			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			$("input[name='userId']").focus();
			$("input[name='userId']").val("");
		}
		else if (d.overlay) {
			alert("사용중인 아이디 입니다.");
			$("input[name='userId']").val("");
		} else {
			alert("사용 가능한 아이디 입니다.");
			$("input[name='userId']").css("color", "green");
			$("input[name='userId']").attr("disabled", true);
			overChk = true;
		}
	};
	console.log(obj);
	ajaxCall(obj);
});

$("#join")
		.click(
				function() {

					if (!overChk) {
						alert("아이디 중복 체크를 실행 해 주세요!");
						$("input[name='userId']").focus();//포커스 이동
					} else {

						if ($("input[name='userPw']").val() == "") {//비밀번호 입력 확인
							alert("비밀 번호를 확인 해 주세요!");
							$("input[name='userPw']").focus();//포커스 이동
						}else if (!pwReg.test($("input[name='userPw']").val()))  {
							alert("비밀번호는 영문자로 시작하는 8~16자 영문자 또는 숫자이어야 합니다.");
							$("input[name='userPw']").focus();
							$("input[name='userPw']").val("");
							$("input[name='userPwCk']").val("");
						}else if ($("input[name='userPwCk']").val() == "") {//이름 입력 확인
							alert("비밀번호확인을  확인 해 주세요!");
							$("input[name='userPwCk']").focus();//포커스 이동
						} else if ($("input[name='userPw']").val() != $(
								"input[name='userPwCk']").val()) {//이름 입력 확인
							alert("비밀번호가 일치하지 않습니다.");
							$("input[name='userPw']").focus();//포커스 이동
						} else if ($("input[name='userName']").val() == "") {//이름 입력 확인
							alert("이름을 확인 해 주세요!");
							$("input[name='userName']").focus();//포커스 이동

						} else if ($("input[name='sizeview']").val() == "") {
							alert("사이즈를 확인 해 주세요!");
							$("input[name='sizeview']").focus();//포커스 이동
						} else if ($("input[name='addr1']").val() == ""
								|| $("input[name='addr2']").val() == ""
								|| $("input[name='addr3']").val() == "") {//주소 입력 확인
							alert("주소를 확인 해 주세요!");
							$("input[name='userAge']").focus();//포커스 이동
						} else if ($("input[name='email']").val() == "") {//이메일 입력 확인
							alert("이메일을 확인 해 주세요!");
							$("input[name='email']").focus();//포커스 이동
						} else if ($("input[name='email_enter']").val() == "이메일 인증이 필요합니다.") {
							alert("이메일 인증을 확인 해 주세요!");
							$("input[name='email_send']").focus();//포커스 이동
						} else if ($("input[name='phone']").val() == "") {
							alert("핸드폰 번호를 확인 해 주세요!");
							$("input[name='phone']").focus();//포커스 이동
						} else if ($("#question").val() == 0) {
							alert("본인 확인 질문을 확인 해 주세요!");
							$("#question").focus();//포커스 이동
						}

						/* else if(){
							
						}  */
						else {
							console.log("서버 전송");
							obj.url = "./join";
							obj.data.mem_id = $("input[name='userId']")
									.val();
							obj.data.mem_pw = $("input[name='userPw']")
									.val();
							obj.data.mem_name = $("input[name='userName']")
									.val();
							obj.data.mem_gender = $(
									"input[name='gender']:checked").val();
							obj.data.mem_size = $("input[name='sizeview']")
									.val();
							obj.data.mem_email = $("input[name='email']")
									.val()
									+ "@"
									+ $("input[name=emailview]").val();
							obj.data.mem_addr1 = $("input[name='addr1']")
									.val();
							obj.data.mem_addr2 = $("input[name='addr2']")
									.val();
							obj.data.mem_addr3 = $("input[name='addr3']")
									.val();
							obj.data.mem_phone = $("input[name='phone']")
									.val();
							obj.data.mem_question = $("#question").val();
							obj.data.mem_answer = $("input[name='answer']")
									.val();

							obj.success = function(data) {
								if (data.success == 1) {
									alert("회원 가입이 정상 처리 되었습니다.");
									location.href = "./";
								} else {
									alert("회원 가입에 실패 했습니다.");
								}
							}
							console.log(obj);
							ajaxCall(obj);
						}
					}
				});

//전달 받은 오브젝트로 ajax 통신 실행
function ajaxCall(obj) {
	$.ajax(obj);
}

function sample4_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('sample4_roadAddress').value = fullRoadAddr;
					document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						//예상되는 도로명 주소에 조합형 주소를 추가한다.
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
								+ expRoadAddr + ')';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr + ')';

					} else {
						document.getElementById('guide').innerHTML = '';
					}
				}
			}).open();
}
</script>
</html>



