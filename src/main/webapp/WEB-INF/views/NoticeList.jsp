<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>공지사항</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			.di{
				width: 500px;
				height: 500px;
				
				position: relative;
				margin: 0 auto;
				top: 100px;
				
			}
			
			table{
				border-top: 1px solid #444444;
				border-spacing: 20px;
				border-collapse: collapse;
				padding: 10 10;

				}
				.td1,.td2,.td3,.td4,.td5,.td6{border-bottom: 1px solid black}
			td,th{
				/*border-bottom: 1px solid black;*/
				border-collapse: collapse;
			
				padding: 18px;
				font-size:13px;
			}
            .tab{
                border-top: 1px solid black;
                
            }
            .tr{
               border-bottom: 1px dashed #444444; 
              /*  border-bottom:1px dashed #444444 !important */
            }
	
			.th{
				/*border-bottom: 1px dashed black;*/
			}	 
			 
            button#write{
	             position: absolute;
	             background-color: white; 
	             color: black; 
	             border-radius: 2px; 
	             font-size: 15px; 
	             top: 20.5%; 
	             left: 56.2%;
             }
             
          	#field{
				display: inline-block;
			}
		</style>
	</head>
	<body>
		<c:if test="${sessionScope.loginId != null}">
			<%@include file="./head.jsp"%>
			<div class="di">
				<table  class="tab">
					<thead class="th">
						<tr class="tr">
							<th>번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th>조회수</th> 
						</tr>
					</thead>
					<tbody id="list">
						
					</tbody>
				</table>
			</div>
		</c:if>
	</body>
	<script>
		$(document).ready(function() {
			$.ajax({
				type : "post",
				url : "./noticeList",
				dataType : "json",
				success : function (data) {
					console.log(data);
					printList(data.list);
					if(data.list != null){
						printList(data.list);
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		});
		
		//받아온 리스트
		function printList(list) {
			console.log("리스트 어팬드 여부");
			var content = "";
			list.forEach(function(item, idx) {
				content += "<tr class ='tr1'>";
				content += "<td class ='td1'>"+item.notice_idx+"</td>";
				content += "<td class ='td2'><a href='./a_noticeDetail?notice_idx="+item.notice_idx+"'>"+item.notice_subject+"</a></td>";
				content += "<td class ='td3'>"+item.notice_content+"</td>";
				content += "<td class ='td4'>"+item.admin_id+"</td>";
				var date = new Date(item.notice_date);
				content += "<td class ='td5'>"+date.toLocaleDateString("ko-KR")+"</td>";
				content += "<td class ='td6'>"+item.bHit+"</td>";
				content += "</tr class ='tr2'>";
			});
			$("#list").empty();
			$("#list").append(content);
		}
	</script>
</html>