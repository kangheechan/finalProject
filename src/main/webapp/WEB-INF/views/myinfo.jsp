<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f02b4f642a6f753a6e695053e9fa3a2&libraries=services"></script>
<style>
	#tab1{
			margin-left: 38%;
		    border-spacing: 5px;
	}
	#update_start{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		height: 30px;
		width: 35%; 
	}
	#update_start:hover{
		background-color: white;
		color: black;
		border: 1px solid;
	}
	#update_end2{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		height: 30px;
		width: 30%;
	}
	#update_end2:hover{
		background-color: white;
		color: black;
		border: 1px solid; 
	}
	#tab1 h3{
		margin-left: 10%;
	}
	#after{
		margin-left: -10%;
		margin-top: -4%;
	}
	#path{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		border: 1px solid;
	}
	#path:hover{
		background-color: white;
		color: black;
		border: 1px solid;
	}
	
	#update_success{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		width: 20%;
		height: 30px;
		margin-left: -15%; 
	}
	#update_success:hover{
		background-color: white;
		color: black;
		border: 1px solid;
	}
	
	#update_end1{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;
		width: 20%;
		height: 30px;
	}
	#update_end1:hover{
		background-color: white;
		color: black;
		border: 1px solid;
	}
	
	#size{
		margin-left: 1.5%;
	}
	
	#myname{
	 	margin-left: 5%;	 	
	}
	#mymenu{
		margin-top: 5%;
		border-bottom: 1px solid black;
	}
	#mymenu a{
		color: black;
		text-decoration: none;	
		margin-left: 12%;		
		font-size: large;
		font-style: inherit; 
	}
	#mymenu a:hover{
		background-color: black;
		color: white;
	}
	#sel{
		margin-left: 85%; 
		margin-top: -2%;
	}
	

	.pop-layer .pop-container {
	  padding: 20px 25px;
	}
	
	.pop-layer p.ctxt {
	  color: #666;
	  line-height: 25px;
	}
	
	.pop-layer .btn-r {
	  width: 100%;
	  margin: 10px 0 20px;
	  padding-top: 10px;
	  border-top: 1px solid #DDD;
	  text-align: right;
	}
	
	.pop-layer {
	  display: none;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 410px;
	  height: auto;
	  background-color: #fff;
	  border: 5px solid black;
	  z-index: 10;
	}
	
	.dim-layer {
	  display: none;
	  position: fixed;
	  _position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 100;
	}
	
	.dim-layer .dimBg {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: #000;
	  opacity: .5;
	  filter: alpha(opacity=50);
	}
	
	.dim-layer .pop-layer {
	  display: block;
	}
	
	a.btn-layerClose {
	  display: inline-block;
	  height: 25px;
	  padding: 0 14px 0;	  
	  background-color: black;
	  color: white;
	  font-size: 13px;
	  color: #fff;
	  line-height: 25px;
	  text-decoration: none;
	}
	
	a.btn-layerClose:hover {
	  background-color: white;
	  color: black;
	}
	#shopname{
		margin-left: 28%;
	}
	#shop_idx{
		/* display: none; */
	}
	#shop
	.pop-conts h4{
		margin-left: 27%; 
	}
	.btn-example{
		background-color: black;
		color: white;
		text-decoration: none;
	}
	.btn-example:hover{
		background-color: white;
		color: black;
	}
	.updateForm{
		    margin-left: 40%;
	}
	.updateFormTable{
		    margin-left: -4%;
		    margin-top: -4%;
	}
	#member_bye{
		background-color: black;
		color: white;
		width: 20%;
    	height: 30px;
    	border: 0;
	}
	#member_bye:hover{
		background-color: white;
		color: black;
		border: 1px solid;
	}
	#pro1{   	
		border: 2px solid black;    
	    border-top-left-radius: 4px;
	    border-top-right-radius: 4px;
	    border-bottom: 1px solid white;    
	}
	
	#map{
	margin-left: 23%;
    margin-top: -10.7%;	 
}
#hh3{
	border: 1px solid;
    width: 19%;
    height: 150px;
    margin-top: 2%;
    border-radius: 10px;
}
	
</style>
</head>
<body>

   <%@include file="./head.jsp"%>
   

      <div id="shopInfo"></div>
   		<div id="map" style="width: 200px; height: 150px;"></div>

   <div id="mymenu">
      <c:if test="${myInfo['0'].shop_idx eq sessionScope.shopIdx}">
         <a href="./myproduct?shopIdx=${sessionScope.shopIdx}">상품</a>
      </c:if>
      
      <c:if test="${myInfo['0'].shop_idx ne sessionScope.shopIdx}">
         <a href="./myproduct?shopIdx=${myInfo['0'].shop_idx}">상품</a>
      </c:if>
      
      <c:if test="${myInfo['0'].mem_id eq sessionScope.loginId}">
         <a href="./mybuy?shopIdx=${sessionScope.shopIdx}">구매내역</a>
      </c:if>
      
      <c:if test="${myInfo['0'].mem_id eq sessionScope.loginId}">
         <a href="./mycart?shopIdx=${sessionScope.shopIdx}">찜목록</a>
      </c:if>
      
      <c:if test="${myInfo['0'].shop_idx eq sessionScope.shopIdx}">
         <a href="./myreview?shopIdx=${sessionScope.shopIdx}">상점후기</a>
      </c:if>
      
      <c:if test="${myInfo['0'].shop_idx ne sessionScope.shopIdx}">
         <a href="./myreview?shopIdx=${myInfo['0'].shop_idx}">상점후기</a>
      </c:if>
         
      <c:if test="${myInfo['0'].mem_id eq sessionScope.loginId}">
         <a href="./myinfo?shopIdx=${sessionScope.shopIdx}"  id="pro1">개인정보 수정</a>
      </c:if>
      

   </div>
 <!-- 바디 전체를 감싸는 updateForm 클래스 -->
   <div class=updateForm>
      <div class=userUpdateTitle>
         <br /> <br />
         <h1>회원 정보 수정</h1>
      </div>
      <br />
      <!-- 기본 정보 뷰 -->
      <table class=updateFormTable id="before">
         <br />
         <tr>
            <td colspan="3"><hr /></td>
         </tr>
         <tr>
            <td>회원 이름</td>
            <td><input class=inp type="text" name="userName"
               id="beforeName" disabled="true" /></td>
         </tr>
         <tr>
            <td>성별</td>
            <td><input type="text" id="beforeGender" disabled="true"></td>
         </tr>
         <tr>
            <td>신발 사이즈</td>
            <td><input type="text" id="beforeSize" disabled="true"></td>
         </tr>
         <tr>
            <td>회원 주소</td>
            <td><input class=inp type="text" id="beforeAddr"
               disabled="true" style="width: 100%" /></td>
         </tr>
         <tr>
            <td>회원 EMAIL</td>
            <td><input class=inp type="text" id="beforeEmail"
               disabled="true" /></td>
         </tr>
         <tr>
            <td>회원 휴대폰 번호</td>
            <td><input class=inp type="text" name="phone" id="beforePhone"
               disabled="true" /></td>
         </tr>

         <tr>
            <td colspan="3"><hr /></td>
         </tr>

         <tr>
            <td colspan="2" style="text-align: center;">
               <button id="update_start">정보 수정하기</button>
            </td>
         </tr>
      </table>

      <!--    본인확인 완료 후 창 -->
      <table style="display: none;" id="after">

         <tr>
            <td colspan="3"><hr /></td>
         </tr>

         <tr>
            <td>새로운 비밀번호</td>
            <td><input class="inp" type="password" name="userPw"
               placeholder="비밀번호 입력란" /></td>
         </tr>
         <tr>
            <td>새로운 비밀번호 확인</td>
            <td><input class=inp type="password" name="userPwCk"
               placeholder="비밀번호 확인란" /></td>
         </tr>
         <tr>
            <td>새로운 이름</td>
            <td><input class=inp type="text" name="after_userName"
               id="after_userName" placeholder="이름 입력란" /></td>
         </tr>
         <tr>
            <td>성별</td>
            <td><input type="radio" name="gender" value="남성" /> 남성 <input
               type="radio" name="gender" value="여성" /> 여성</td>
         </tr>
         <tr>
            <td>신발 사이즈</td>
            <td><input type="text" id="sizeview" name="sizeview"
               style="width: 175" placeholder="사이즈를 선택하세요." disabled="true" /><select
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
            <td>새로운 주소</td>
            <td><input class=inp type="text" name="addr1"
               id="sample4_postcode" placeholder="우편번호" style="margin: 4 0 4 0">
               <input type="button" class=inp id="path"
               onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <br>
               <input type="text" class=inp name="addr2" id="sample4_roadAddress"
               placeholder="도로명주소" style="margin: 4 0 4 0"> <input
               type="text" class=inp name="addr3" id="sample4_jibunAddress"
               placeholder="지번주소" style="margin: 4 0 4 0"> <span
               id="guide" style="color: #999"></span></td>
         </tr>
         <tr>

         </tr>
         <tr>
            <td>새로운 EMAIL</td>
            <td><input class=inp type="text" name="after_email"
               id="after_email" style="margin: 0 5 0 0" placeholder="이메일 입력란" />
               @ <input class=inp type="text" id="emailview"
               name="after_emailview" style="width: 150" placeholder="이메일 선택"
               disabled="true" /> <select id="email">
                  <option value="0">이메일 선택</option>
                  <option value="1">직접입력</option>
                  <option>naver.com</option>
                  <option>hanmail.net</option>
                  <option>google.com</option>
                  <option>nate.com</option>
                  <option>daum.net</option>
            </select></td>
         </tr>
         <tr>
            <td>새로운 휴대폰 번호</td>
            <td><input class=inp type="text" name="after_phone"
               id="after_phone" placeholder="휴대폰 번호 입력란" /></td>
         </tr>
         <tr>
            <td colspan="2" style="text-align: center;">
               <button id="update_success">저장</button>
               <button id="update_end1">취소</button>
               <button id="member_bye">회원 탈퇴</button>
            </td>
         </tr>
      </table>
   </div>
</body>
<script>
   var obj = {};//초기화   
   obj.type = "post";
   obj.dataType = "json";
   obj.enctype = "multipart/form-data";
   obj.data = {};
   obj.error = function(e) {
      console.log(e)
   };

   var pwReg = /^[a-z]+[a-z0-9]{7,15}$/g;

   $(document).ready(function() {
	   getShopInfo();
      obj.url = "./detailView";
      obj.success = function(data) {
         $("#beforeName").val(data.dto.mem_name);
         $("#beforeEmail").val(data.dto.mem_email);
         $("#beforeSize").val(data.dto.mem_size);
         $("#beforeGender").val(data.dto.mem_gender);
         $("#beforeAddr").val(data.dto.mem_addr);
         $("#beforePhone").val(data.dto.mem_phone);

         var addrSplit = data.dto.mem_addr.split('/');

         var emailSplit = data.dto.mem_email.split('@');

         $("#after_userName").val(data.dto.mem_name);
         $("#sizeview").val(data.dto.mem_size);
         $("#after_email").val(emailSplit[0]);
         $("#emailview").val(emailSplit[1]);
         $("#after_phone").val(data.dto.mem_phone);
         $("#sample4_postcode").val(addrSplit[0]);
         $("#sample4_roadAddress").val(addrSplit[1]);
         $("#sample4_jibunAddress").val(addrSplit[2]);

         if (data.login) {
            alert("본인 확인 후 수정이 가능합니다.");
         } else {
            alert("로그인이 필요한 서비스 입니다.");
            location.href = "index.html";
         }
      }
      ajaxCall(obj);
   });

   $("#update_end1").click(function() {
      location.href = "./myinfo?shopIdx=" + '${sessionScope.shopIdx}';
   });


   $("#member_bye").click(function(){
      console.log("회원탈퇴 버튼 클릭");
      var bool = confirm("슈마니커 회원을 탈퇴하시겠습니까?");
       if (bool){    //확인
         obj.url = "./byemember";
          obj.success=function(data){
          
         if(data.result>0){
            alert("탈퇴가 정상적으로 완료되었습니다.");
            location.href = "./";
         }
         else{
            alert("회원 탈퇴 실패");
         }
         
         
          }
       }else{   //취소

           return false;

       }
       ajaxCall(obj);
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

   $("#update_start")
         .click(
               function() {
                  // window.name = "부모창 이름"; 
                  window.name = "parentForm";
                  //window.open("open할 window", "자식창 이름", "팝업창 옵션");
                  openWin = window
                        .open("./updateChk", "childForm",
                              "width=550, height=200, resizable = no, scrollbars = no, top=200, left=450");

               });

   $("#update_success")
         .click(
               function() {

                  if ($("input[name='userPw']").val() == "") {//비밀번호 입력 확인
                     alert("비밀 번호를 확인 해 주세요!");
                     $("input[name='userPw']").focus();//포커스 이동
                  } else if ($("input[name='userPwCk']").val() == "") {//이름 입력 확인
                     alert("비밀번호확인을  확인 해 주세요!");
                     $("input[name='userPwCk']").focus();//포커스 이동
                  } else if (!pwReg.test($("input[name='userPw']").val())) {
                     alert("비밀번호는 영문자로 시작하는 8~16자 영문자 또는 숫자이어야 합니다.");
                     $("input[name='userPw']").focus();
                     $("input[name='userPw']").val("");
                     $("input[name='userPwCk']").val("");
                  } else if ($("input[name='userPw']").val() != $(
                        "input[name='userPwCk']").val()) {//이름 입력 확인
                     alert("비밀번호가 일치하지 않습니다.");
                     $("input[name='userPw']").focus();//포커스 이동
                  } else if ($("input[name='after_userName']").val() == "") {//이름 입력 확인
                     alert("이름을 확인 해 주세요!");
                     $("input[name='after_userName']").focus();//포커스 이동
                  } else if ($("input[name='sizeview']").val() == "") {
                     alert("사이즈를 확인 해 주세요!");
                     $("input[name='sizeview']").focus();//포커스 이동
                  } else if ($("input[name='addr1']").val() == ""
                        || $("input[name='addr2']").val() == ""
                        || $("input[name='addr3']").val() == "") {//주소 입력 확인
                     alert("주소를 확인 해 주세요!");
                     $("input[name='addr1']").focus();//포커스 이동
                  } else if ($("input[name='after_email']").val() == "") {//이메일 입력 확인
                     alert("이메일을 확인 해 주세요!");
                     $("input[name='after_email']").focus();//포커스 이동
                  } else if ($("input[name='after_phone']").val() == "") {
                     alert("핸드폰 번호를 확인 해 주세요!");
                     $("input[name='after_phone']").focus();//포커스 이동
                  } else {
                     console.log("서버 전송");
                     obj.url = "./m_update";
                     obj.data.mem_pw = $("input[name='userPw']").val();
                     obj.data.mem_name = $(
                           "input[name='after_userName']").val();
                     obj.data.mem_gender = $(
                           "input[name='gender']:checked").val();
                     obj.data.mem_size = $("input[name='sizeview']")
                           .val();
                     obj.data.mem_email = $("input[name='after_email']")
                           .val()
                           + "@"
                           + $("input[name=after_emailview]").val();
                     obj.data.mem_addr1 = $("input[name='addr1']").val();
                     obj.data.mem_addr2 = $("input[name='addr2']").val();
                     obj.data.mem_addr3 = $("input[name='addr3']").val();
                     obj.data.mem_phone = $("input[name='after_phone']")
                           .val();
                     obj.success = function(data) {
                        if (data.success == 1) {
                           alert("회원 정보 수정을 완료했습니다.");
                           location.href = "./mypage";
                        } else {
                           alert("회원 정보 수정에 실패했습니다.");
                        }
                     }
                     console.log(obj);
                     ajaxCall(obj);
                  }
               });

   //전달 받은 오브젝트로 ajax 통신 실행
   function ajaxCall(obj) {
      $.ajax(obj);
   }

   //주소 찾기 
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
   
 //상점정보 출력
   function getShopInfo() {
      $
            .ajax({
               type : "GET",
               url : "./getShopInfo",
               data : {
            	   id : '${myInfo["0"].mem_id}',
            	   shop_idx : "${param.shopIdx}"
               },
               dataType : "JSON",
               success : function(data) {
                  console.log(data);
                  var addrSplit = data.mem_dto.mem_addr.split('/');
                  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                  mapOption = {
                     center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 
                     level : 7
                  // 지도의 확대 레벨
                  };
                  // 지도를 생성합니다    
                  var map = new daum.maps.Map(mapContainer, mapOption);
                  // 주소-좌표 변환 객체를 생성합니다
                  var geocoder = new daum.maps.services.Geocoder();
                  // 주소로 좌표를 검색합니다
                  geocoder
                        .addressSearch(
                              addrSplit[1] + addrSplit[2],
                              function(result, status) {
                                 // 정상적으로 검색이 완료됐으면 
                                 if (status === daum.maps.services.Status.OK) {
                                    var coords = new daum.maps.LatLng(
                                          result[0].y,
                                          result[0].x);
                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                    var marker = new daum.maps.Marker(
                                          {
                                             map : map,
                                             position : coords
                                          });
                                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                                    var infowindow = new daum.maps.InfoWindow(
                                          {
                                             content : '<div style="width:150px;text-align:center;padding:6px 0;">직거래 위치</div>'
                                          });
                                    infowindow.open(map, marker);
                                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                    map.setCenter(coords);
                                 }
                              });
                  if (data.dto != null) {
                	  var date = new Date(data.dto.shop_date);
                	  if(data.star_avg != null){
                   		  $('#shopInfo').append(
                                  '<h3 id="hh3">상점 이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
                                        + data.dto.shop_name + '<br/><br/>'
                                        + '상품판매 개수 &nbsp;&nbsp;&nbsp; '
                                        + data.dto.shop_sellcount + '<br/><br/>'
                                        + '상점 개설 날짜 &nbsp;&nbsp; '
                                        +date.toLocaleDateString("ko-KR") + '<br/><br/>'
                                        + '상점 평점 &nbsp;&nbsp; '
                                        + data.star_avg + " 점"
                                        + '</h3>');
                         }else{
                        	 $('#shopInfo').append(
                                     '<h3 id="hh3">상점 이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
                                           + data.dto.shop_name + '<br/><br/>'
                                           + '상품판매 개수 &nbsp;&nbsp;&nbsp; '
                                           + data.dto.shop_sellcount + '<br/><br/>'
                                           + '상점 개설 날짜 &nbsp;&nbsp; '
                                           +date.toLocaleDateString("ko-KR") + '<br/><br/>'
                                           + '상점 평점 &nbsp;&nbsp; '
                                           + "0점"
                                           + '</h3>');
                         }
                  }
               },
               error : function(err) {
                  console.log(err);
               }
            });
   }
   
   
   
</script>
</html>



