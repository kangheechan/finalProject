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
			
			#listTable td,th{
				border-collapse: collapse;
				padding: 18px;
				font-size:13px;
			}
   
			.paging-nav {
			  text-align: center;
			  padding-top: 15px;
			  width: 50%;
   			  margin-left: 25%;
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
			.imgbtn{
				width: 190px;
   				height: 190px;
			}
				
			#listTable{
				border: 0px;
			    margin-left: -63%;
 			    width: 219%;
    			height: 105%;
    			border-spacing: 20px;
				border-collapse: collapse;
				padding: 10 10;
				text-align: center;
			} 
			
			#list tr{
			 float: left;
			 height: 45%;
  			 width: 20%;
			}
			#list tr:hover {
               background-color: #EAEAEA;
              
            }
			#list td{
				font-size: 15px; 
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
		</style>
	</head>
	<body>
	<c:if test="${sessionScope.loginId != null}">
			<%@include file="./head.jsp"%>
			<div class="di">
				<table id="listTable">
				<thead class="th">
					</thead>
					<tbody id="list">
					</tbody>
				</table>
			</div>
		</c:if>
	</body>
	<script>
	
	  var loginId = "${sessionScope.loginId}";
	
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "./SpellertList",
			dataType : "json",
			success : function (data) {
				console.log(data);
				printList(data.list);
				
				$('#listTable').paging({
	            	limit: 10,
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
			content += "<td class ='td1'><a href='./detail?idx="+item.pro_idx+"'><img class='imgbtn' src='resources/upload/"+item.img_main+"'/>"+"<br/>"+item.pro_name+"<br/>"+item.pro_price+"원"+"<br/>"+item.pro_size+"</td></br></br>";
			content += "</tr>";
		});
		$("#list").empty();
		$("#list").append(content);
	}
	</script>
</html>











