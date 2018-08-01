<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<style>
	#myname{
	 	margin-left: 5%;	 	
	}
	#mymenu{
		margin-top: 2%;
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
	
</style>
</head>
<body>
	<%@include file="./head.jsp"%>
	
	<div id="myname">
		<h4>상점 이름 : </h4>
		<h4>장소 : </h4>
		<h4>전화번호 : </h4>
	</div>
	
	<div id="shopmenu">
		<a href="./shopProduct">상점 상품</a>
		<a href="./shopReview">상점후기 </a>
	</div>
	
	
	<h3>상점후기 내역</h3>
	<button id="revwri">글등록 </button>
	<button id="revdel">후기 삭제 </button>
	
	<div id="rev1">
		후기  <input type="text" id="rev2"/> 
		평점  <select id="starRate">
				<option selected="selected">5</option>
				<option>4</option>
				<option>3</option>
				<option>2</option>
				<option>1</option>
			</select>
		
	</div>
	
	<div id=tab>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>구매자</th>
					<th>후기내용</th>
					<th>날짜</th>
					<th>평점</th>
				</tr>
			</thead>
			<tbody id="tr1">
				<c:forEach items="${shopReviewList}" var="review">
				<tr>
					<td><input type="checkbox"/></td>
					<td>${review.mem_id}</td>
					<td>${review.sreply_content}</td>
					<td>${review.sreply_date}</td>
					<td>${review.sreply_star}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>		
	</div>
	
	
	

	
	
	
</body>
<script>
	
</script>

</html>