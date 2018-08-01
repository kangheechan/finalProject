<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<title>연락하기</title>
		<style>
			 .sna3{
                text-align: center;
            }
		</style>
	</head>
	<body>
		<div>
			<h3>찜</h3>
			<h2>선택한 상품을 찜 하였습니다.</h2>
			<div class="sna3">
				<button class="btn">찜목록</button>
				<button class="btn2">쇼핑 계속하기</button>
			</div>
		</div>
	</body>
	<script>
	
	//찜목록
	$(".btn").click(function(){
		//자식 - >부모  이동
		window.opener.location.href= './mycart';
		//자동닫힘
		window.open('about:blank','_self').self.close();

	});
	//쇼핑 계속하기
	$(".btn2").click(function () {
		//자동닫힘
		window.open('about:blank','_self').self.close();
		
	});
	
	</script>
</html>