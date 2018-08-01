<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
		<script src="./resources/js/paging.js" type="text/javascript"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>슈마니커</title>
	<style>	
		#back{
			background-color: black;
			margin: -1%;  
		}
	
		#div1{
			width: 50%;
			height: 20%;
			margin-left: 75%;
			margin-top: 1%;
			
			
		}
			
		#div1 a{
			position: static;			
			cursor: pointer;
			color: black;
			font-size: 20px;
			text-decoration: none;	
			text-align:center;
			color: white;				
		}
		#div1 a:hover {
			background-color: white;			
			font-size: 20px;
			color: black;
			text-decoration: none;
		}
		
		#div3{
			width: 50%;
			height: 20%; 
			margin-left: 85%;
			margin-top: 1%;
		}
		#div3 a{
			position: static;			
			cursor: pointer;
			color: black;
			font-size: 20px;
			text-decoration: none;	
			text-align:center;
			color: white;				
		}
		#div3 a:hover {
			background-color: white;			
			font-size: 20px;
			color: black;
			text-decoration: none;
		}
		
		#select{
			margin-top: 0.5%;
			
		}		
		
		#mainimg{
			position: absolute;
			color: white;
			margin-left: 1%;
			
		}
		#div2{
			margin-left: 15%;			
			top: 1%;
			
			
		}
		#div2 a{
			position: static;			
			cursor: pointer;
			color: white;
			font-size: 20px;
			text-decoration: none;	
			text-align:center;	
		}
		#div2 a:hover {
			background-color: white;
			color: black;			
			font-size: 20px;
			text-decoration: none;
		}
		#div2 p{
			margin-left: 12%;
			position: absolute;
			margin-top: -1.5%;
		}
		#mainimg{
			cursor: pointer;
		}
		button{
			cursor: pointer;
		}
		#selbtn{
			border: 0;
			background-color: black;
			color: white;
		}
		#selbtn:hover {
			background-color: white;
			color: black;
		}
		#sur{
			background-color: black;
			color: white;
			border: 1px solid white; 
		}
		#sur:hover{
			background-color: white;
			color: black;
		}
		#surr{
			    margin-left: 14%;
    			margin-top: -1.8%;
		}
	</style>
</head>
<body style="overflow-x:hidden; overflow-y:auto;">


	<div id="back" style="height: 58;" > 
	<!-- img id="mainimg"  src="resources/img.jpg" width="200px;" onclick="location.href='./'"> -->
	<h2 id="mainimg" onclick="location.href='./'"> 슈마니커</h2>
		 
	
	  <c:if test="${sessionScope.loginId == null && sessionScope.adminId == null}">
   <div id="div3">      
      <a href="./joinForm">회원가입</a>
      <a href="./index">로그인</a>
      <a href="notice">공지사항</a><br/>
   </div>   
   </c:if>
	
	 <c:if test="${sessionScope.loginId != null && sessionScope.adminId ==null}">
   <div id="div1">      
      <a href="./logout">로그아웃</a>
      <a href="./mypage?id='${sessionScope.loginId}'">마이페이지</a>
      <a href="notice">공지사항</a>
      <a href="Request">요청게시판</a>
      
   </div>   
   </c:if>
	
	<c:if test="${sessionScope.adminId !=null && sessionScope.loginId == null}">
   <div id="div1">      
      <a href="adminpage">관리자 페이지</a>
      <a href="adminlogout">로그아웃</a>
   </div>   
   </c:if>
	
	
	<div id="div2" style="margin-top: 1%"> 
		<a href="category">카테고리</a>
			<a href="speller">맞춤 상품</a>
			<div id="surr">
            <form action="m_search">
               <input type="text" name="MainkeyWord" placeholder="검색어를 입력하시오 " /> 
               <input id="sur" type="submit" value="검색">
            </form> 
         </div>
	</div>
	</div>
	
</body>
<script>
$("#sur").click(function () {
	location.href = "./prd_search?search_name=" + $("#search").val();
})

</script>
</html>