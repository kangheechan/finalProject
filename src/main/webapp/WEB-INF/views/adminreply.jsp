<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
		<script src="./resources/js/paging.js" type="text/javascript"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>슈마니커</title>
	<style>	
				#membercontent{
				border-top: 1px solid #444444;
				border-spacing: 20px;
				border-collapse: collapse;
				padding: 10 10;

				}
				#membercontent td,th{
		            border-bottom: 1px solid #444444;
		            border-collapse: collapse;
		            padding: 12px;
		            font-size:13;
		            text-align: center;		            
	            }
	           /*   #tr1{
		            cursor: pointer;
		         } */
	            #tr1:hover {
	               background-color: #EAEAEA;
	            }

				#content{
				top:10%;
				margin:2%;
				margin-left: 14%;
				}
				#field{
		            display: inline-block;
		            border: 0;
		            margin-left: -2%;
		            
	            }
	          /*   #membercontent th{
	            	background-color: black;
	            	color: white;
	            } */
	            #membercontent{
	            	width: 228%;
	            }
	            #sur{
					border: 0;
					outline: 0;
					cursor: pointer;
					background-color: black;
					color: white;		
				}
				#sur:hover{
					background-color: white;
					color: black;
				}				
				.replydel{
					border: 0;
					outline: 0;
					cursor: pointer;
					background-color: black;
					color: white;		
				}
				.replydel:hover{
					background-color: white;
					color: black;
				}
				/*페이징  */	
		    	.paging-nav {
				  text-align: right;
				  padding-top: 2px;
				}
			 
				.paging-nav a {
				  margin: auto 1px;
				  text-decoration: none;
				  display: inline-block;
				  padding: 1px 7px;
				  background: #91b9e6;
				  color: white;
				  border-radius: 3px;
				}
			 
				.paging-nav .selected-page {
				  background: #187ed5;
				  font-weight: bold;
				}	
	</style>
	</head> 
<body style="overflow-x:hidden; overflow-y:auto;">
<c:if test="${sessionScope.adminId != null}">
	<%@include file="./adminpage.jsp"%>

<div id="content">
		<h4>후기관리</h4>
		<h5>슈마니커에 등록된 상점의 후기를 조회, 삭제하실 수 있습니다.</h5>
		<form action="replysearch">
		<fieldset id="field">
				<legend align="center"></legend>
				<select id="key" name = "keyField"> 
						<option value="mem_id" >회원이름</option>
						<option value="sreply_content">내용</option>
					</select>
					<input type="text" name="keyWord" placeholder="검색어를 입력하시오"/>
					<input id="sur" type="submit" value="검색">
			</form>	
			<table id="membercontent">
				<tr>
					<th>후기번호</th>
					<th>작성회원</th>
					<th>내용</th>
					<th>작성날짜</th>			
					<th>작성된상점</th>
					<th>별점</th>
					<th>삭제</th>
				</tr>
				
				<c:forEach items="${adminreply}" var="dto">
				
				<tr id="tr1">
					<td>${dto.sreply_idx}</td>
					<td>${dto.mem_id}</td>
					<td>${dto.sreply_content}</td>
					<td>${dto.sreply_date}</td>
					<td>${dto.shop_idx}</td>
					<td>${dto.sreply_star }</td>
					<td><input id="${dto.sreply_idx}" type=button  class="replydel" value=삭제 /></td>
				</tr>
				</c:forEach>
			</table>
		</fieldset>
</div>
</c:if>
<c:if test="${sessionScope.adminId == null}">
<h3>관리자만 접근 가능합니다</h3>
</c:if>
</body>
<script>

$(document).ready(function () {
	$('#membercontent').paging({
    	limit: 5,
    	rowDisplayStyle: 'block',
    	activePage: 0,
    	rows: "${adminreply}"
    	});
});

var obj = {};//초기화   
obj.type = "post";
obj.dataType = "json";
obj.enctype = "multipart/form-data";
obj.data={};
obj.error = function(e) {
	console.log(e)
};

$(".replydel").click(function(){
	var delreply;
	delreply = $(this).attr("id");
	console.log(delreply);
	obj.url="./replydel";
	obj.data.delreply = delreply;
	
	obj.success=function(data){
		if(data.success>0) {
			alert("삭제성공")
			location.reload();
		}else{
			alert("삭제실패")
		}
	}
	ajaxCall(obj);
});

function ajaxCall(obj) {
	$.ajax(obj);
}

</script>
</html>