<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
      <script src="http://malsup.github.com/jquery.cycle2.js"></script>
      <title>슈마니커</title>
	<style>
		#wrapper {
			width: 1000px;
			margin-left: 6%;
			margin-top: 1%;
		}
		#mainImg {
			
			width: 1000px;
			height: 300px;
		}
		.newImg {	
			
			width: 1200px;
			height: 200px;
			
		}
		.new {			
			float: left;
			width: 200px;
			height: 240px;			
			margin: 1%;
		}
		.new:hover {
			cursor: pointer;
					
		}
		#imggg{
			border: 1px solid white;
		}
		#imggg:hover{
			border: 1px solid black;			
		}
		.content{width:1232px;height:1000px;margin:0 auto;position:relative; margin-top :55px;}
	</style>
</head>
<body>
	<%@include file="./head.jsp"%>
	<div class="content">
	<c:if test="${sessionScope.loginId != null}">
	<%@include file="./fly.jsp"%>
	</c:if>
	
	<c:if test="${sessionScope.pathSession ne null}">
	   <c:remove var="pathSession" scope="session"/>
	</c:if>
   
   <h1></h1> 
      <div id="wrapper">
 <!-- style="width: 500%; height: 100%" -->
      <div id="mainImg" style="width: 100%" class="cycle-slideshow" data-cycle-loader="wait"   data-cycle-timeout="1000">
         <img width="110%" height="300" src="resources/slide1.jpg" /> 
         <img width="110%" height="300" src="resources/slide2.jpg" />
         <img width="110%" height="300" src="resources/slide3.jpg" />
         <img width="110%" height="300" src="resources/slide4.jpg" />
         <img width="110%" height="300" src="resources/slide5.jpg" />
      </div>
      <br />

      <h2>상품보기 &nbsp;&nbsp;&nbsp;&nbsp; <a href="./category">더 보기</a> </h2> 
      <div class="newImg">
         <c:forEach items="${product}" var="product" varStatus="status">
         <c:if test="${status.count le 10}">
            <div class="new">
            	<c:if test="${product.pro_state eq '판매중'}">
                     <img width="200px" height="200px" src="resources/upload/${product.img_main}" onclick="location.href = './detail?idx=${product.pro_idx}'"/><br/>
              </c:if>
              <c:if test="${product.pro_state eq '판매완료'}">
                     <img width="200px" height="200px" src="resources/soldOut.jpg" onclick="location.href = './detail?idx=${product.pro_idx}'"/><br/>
              </c:if> 
                 이름:${product.pro_name}<br/>
                 사이즈:${product.pro_size}<br/>
                 가격:${product.pro_price}<br/>                
           </div>
          </c:if> 
         </c:forEach>     
      </div>
      
      </div>
 </div>     
</body>
<script>

	//메인페이지 이동시 함수실행
	$(document).ready(function(){
		getMemShopState();
		if('${sessionScope.pathSession ne null}'){
			fileDel();
		}
		
		//상점이 있으면 상점인덱스 세션값 가져오기
		if('${sessionScope.shopState eq 1}'){
			getShopIdx();	
		}
	});
	
//상점개설상태 값 얻기
function getMemShopState(){
	$.ajax({
		type:"GET",
		url:"./getMemShopState",
		data:{
			id : '${sessionScope.loginId}'
		},
		dataType:"JSON",
		success:function(data){
			console.log(data);
			if(data.result != null){
				console.log(data.result);
				console.log('${sessionScope.shopState}');
			}
		},
		error : function(err){
			console.log(err);
		}
	});
}

	//상점idx 세션값 얻기
	function getShopIdx(){
		$.ajax({
			type:'GET',
			url:'./getShopIdx',
			data:{
				id: '${sessionScope.loginId}'
			},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				console.log(data.shopIdx);
				console.log('${sessionScope.shopIdx}');
			},
			error:function(err){console.log(err);}
		});	
	}
	
	//불필요한 파일 삭제
	function fileDel(){
		$.ajax({
			url:"./fileDel",
			type:"get",
			data:{"fileName":'${sessionScope.pathSession}'},
			dataType:"JSON",
			success:function(data){
				if(data.success == 1){
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
</script>
</html>
