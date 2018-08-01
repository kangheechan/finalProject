<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
		<script src="./resources/js/paging.js" type="text/javascript"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>슈마니커</title>
		<style>
				.di{
				width: 500px;
				height: 500px;				
				position: relative;
				margin: 0 auto;
				top: 100px;
				
			}
			
			#listTable{
				border-top: 1px solid #444444;
				border-spacing: 20px;
				border-collapse: collapse;
				padding: 10 10;
				text-align: center;
				width: 228%;
				margin-left: -67%;
				margin-top: 17%;
				}
				.td1,.td2,.td3,.td4,.td5,.td6{border-bottom: 1px solid black}
			#listTable td,th{
				/*border-bottom: 1px solid black;*/
				border-collapse: collapse;
			
				padding: 18px;
				font-size:13px;
			}
            .tab{
                border-top: 1px solid black;
                
            }
            .tr{
               border-bottom: 1px solid #444444; 
              /*  border-bottom:1px dashed #444444 !important */
            }
	
			.th{
				/*border-bottom: 1px dashed black;*/
			}	 
			 
            #write{
	             position: absolute;
	             background-color: black; 
	             color: white;
	             border: 1px solid; 
	             border-radius: 2px; 
	             font-size: 15px; 
	             top: 26.5%;
    			 left: 80%;    			 
    			 cursor: pointer;
             }
             #write:hover{
             	background-color: white;
             	color: black;
             	border: 1px solid;
             }
          	#field{
				display: inline-block;
			}
			 /*페이징  */	
		    	.paging-nav {
				  text-align: right;
				  padding-top: 2px;
				  margin-left: 124%;
  				  width: 37%;
				  
				}
			 
				.paging-nav a {
				  margin: auto 1px;
				  text-decoration: none;
				  display: inline-block;
				  padding: 1px 7px;
				  background: black;
				  color: white;
				  border-radius: 3px;
				}
			 
				.paging-nav .selected-page {
				  background: #187ed5;
				  font-weight: bold;
			}	
			#h4{				
			       margin-top: -1%;
 				  margin-left: -65%;
			}
			
			#list td{
				font-size: 15px;
			}
			#list tr:hover {
               background-color: #EAEAEA;
            }
			
			#list a{
				color: black;
			}
			/*링크가 걸린 상황*/
		    #list a:link{
		        text-decoration: none;
		        color: black;
		    }    
		   	  
		    /*방문 후 */
		    #list a:visited{
		        text-decoration: none;
		        color: gray;
		    }
		    .td2:hover{
		    	text-decoration:underline; 
		    }
		</style>
	</head>
	<body>
		
	
		<c:if test="${sessionScope.loginId != null}">
			<%@include file="./head.jsp"%>
			<div class="di">
				<h4 id="h4">요청 게시판</h4>
				<table id="listTable">
					<thead class="th">
						<tr class="tr">
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th>조회수</th> 
						</tr>
					</thead>
					<tbody id="list">
					</tbody>
				</table>
			</div>
			<button id="write">작성하기</button> 
		</c:if>
	</body>
	<script>
	$("#write").click(function () {
		location.href="RequestWritePage";
	});
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "./RequestList",
			dataType : "json",
			success : function (data) {
				console.log(data);
				printList(data.list);
				
				$('#listTable').paging({
	            	limit: 5,
	            	rowDisplayStyle: 'block',
	            	activePage: 0,
	            	rows: data.list
	            	});
			},
			error : function (error) {
				console.log(error);
			}
		});
	});
	
	//받아온 리스트
	function printList(list) {
		console.log("리스트  여부");
		var content = "";
		list.forEach(function(item, idx) {
			content += "<tr class ='tr1'>";
			content += "<td class ='td1'><a href='./RequestDetail?req_idx="+item.req_idx+"'>"+item.req_idx+"</a></td>";
			content += "<td class ='td2'><a href='./RequestDetail?req_idx="+item.req_idx+"'>"+item.req_subject+"</a></td>";
			content += "<td class ='td4'><a href='./RequestDetail?req_idx="+item.req_idx+"'>"+item.mem_id+"</a></td>";
			var date = new Date(item.req_date);
			content += "<td class ='td5'><a href='./RequestDetail?req_idx="+item.req_idx+"'>"+date.toLocaleDateString("ko-KR")+"</a></td>";
			content += "<td class ='td6'><a href='./RequestDetail?req_idx="+item.req_idx+"'>"+item.bHit+"</a></td>";
			content += "</tr class ='tr2'>";
		});
		$("#list").empty();
		$("#list").append(content);
	}
	</script>
</html>