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
		    .td2:hover{
		    	text-decoration: underline;
		    }
      
         #membercontent {
            text-align: center;
         }
         .content{
            width:1232px;
            height:1000px;
            margin:0 auto;
            position:relative; 
            margin-top :55px;
         }
      </style>
   </head>
   <body>
   <c:if test="${sessionScope.loginId != null}">
   <%@include file="./head.jsp"%>
   <div class="content">
   <%@include file="./fly.jsp"%>
      <c:if test="${listSize == 0}">
         <h1>검색 값이 없습니다.</h1>
      </c:if>
      <c:if test="${listSize > 0}">
      
      <div class="di">
       <table id="listTable">    
         <thead class="th">
		</thead>
      <tbody id="list">
         <c:forEach items="${list}" var="dto">
         <tr>
            <td><img width="190px" height="190px" src="resources/upload/${dto.img_main}" onclick="location.href = './detail?idx=${dto.pro_idx}'"/><br/>${dto.pro_name}<br/>${dto.pro_price}<br/>${dto.pro_size}</td>
         </tr>
      </c:forEach>
      </tbody>
      </table>
      </div>
      </c:if>   
      </div>
   
      </c:if>
      <c:if  test ="${sessionScope.loginId == null}">
         <h3>회원만 접근 가능합니다</h3>
      </c:if>
   </body>
   <script>
    $(document).ready(function(){
    		   $('#listTable').paging({
    	        	limit: 10,
    	        	rowDisplayStyle: 'block',
    	        	activePage: 0,
    	        	rows: "${list}"
    		   });
   });
   

   </script>
</html>