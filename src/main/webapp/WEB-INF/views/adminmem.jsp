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
      table{
            border-top: 1px solid #444444;
            border-spacing: 20px;
            border-collapse: collapse;
            padding: 10 10;
            table-layout: fixed;
            word-break:break-all; 

            }
            td,th{
            border-bottom: 1px solid #444444;
            border-collapse: collapse;
            padding: 12px;
            font-size:13
            }
            /* th{
             background-color:black;
             color:white;      
             
            } */

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
            /* #tr1 tr{
            cursor: pointer;
            } */
            #tr1 tr:hover {
               background-color: #EAEAEA;
            }
            
            
/* ----------------------------------------------------------------------- */            
            /*댓글 div */
#page #reply {
    position: absolute;
    top: 130%;
    left: 15.8%;
    width: 73%;
    height: 33%;
    background-color: white;
    border: 3px solid black;
}

#page #replysubmit {
    position: absolute;
    top: 88%;
    left: 0%;
    width: 87.5%;
    height: 10%;
    background-color: white;
}

#page #replytable {
    position: absolute;
    top: 0%;
    left: 0%;
    width: 100%;
    height: 87%;
    background-color: white;
    overflow-y: scroll;
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
	.memstate{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;		
	}
	.memstate:hover{
		background-color: white;
		color: black;
	}
	.memdel{
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: black;
		color: white;		
	}
	.memdel:hover{
		background-color: white;
		color: black;
	}
	#membercontent{
		text-align: center;
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
				  background: black;
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
      <h4>회원관리</h4>
      <h5>슈마니커에 등록된 회원의 조회, 상태변경, 삭제가 가능합니다.</h5>
      <form action="search">
      <fieldset id="field">
         <legend align="center"></legend>
            <select id="key" name = "keyField"> 
               <option value="0" >모든회원</option>
               <option value="1">일반회원</option>
               <option value="2">블랙회원</option>
               <option value="3">휴면회원</option>
            </select>
            <input type="text" name="keyWord" placeholder="검색어를 입력하시오 "/>
            <input id="sur" type="submit" value="검색">
      </form>   
      <table id="membercontent">
         <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>주소</th>
            <th>성별</th>
            <th>핸드폰번호</th>
            <th>회원상태</th>
            <th>상태변경</th>
            <th>삭제</th>
         </tr>
         <tbody id="tr1">
         <c:forEach items="${memberlist}" var="dto">
         
         <tr>
            <td>${dto.mem_id}</td>
            <td>${dto.mem_name}</td>
            <td>${dto.mem_addr}</td>
            <td>${dto.mem_gender}</td>
            <td>${dto.mem_phone}</td>
            <td>
               <c:if test="${dto.mem_state eq 0 }">일반회원</c:if>
               <c:if test="${dto.mem_state eq 1 }">블랙회원</c:if>
               <c:if test="${dto.mem_state eq 2 }">휴면회원</c:if>   
            </td>
            <td>
               <select id="${dto.mem_id}"   name = "skeyField">
               <c:if test="${dto.mem_state eq 0 }">
                  <option value="1">블랙회원</option>
                  <option value="2">휴면회원</option>
               </c:if>
               <c:if test="${dto.mem_state eq 1 }">
                  <option value="0">일반회원</option>
                  <option value="2">휴면회원</option>
               </c:if>
               <c:if test="${dto.mem_state eq 2 }">
                  <option value="0">일반회원</option>
                  <option value="1">블랙회원</option>
               </c:if>
               </select>
               <input id="${dto.mem_id}" type=button  class="memstate" value=변경 />
            </td>
            <td>
            <input id="${dto.mem_id}" type=button  class="memdel" value=삭제 />
            </td>
            </tr>
         </c:forEach>
         </tbody>
      </table>
      </fieldset>
      </form>
      
   </div>
   
   
   
</c:if>
<c:if test="${sessionScope.adminId == null}">
<h3>관리자만 접근 가능합니다</h3>
</c:if>
</body>
<script>


 var obj = {};//초기화   
obj.type = "post";
obj.dataType = "json";
obj.enctype = "multipart/form-data";
obj.data={};
obj.error = function(e) {
   console.log(e)
};
/* ------------------------------------------------------------------------------- */
$(document).ready(function() {
   listPrint();
   
   $('#membercontent').paging({
   	limit: 5,
   	rowDisplayStyle: 'block',
   	activePage: 0,
   	rows: "${memberlist}"
   	});
});

function listPrint() {
   obj.url = "./replylist";
   obj.data = {};
   obj.success = function(data) {
      console.log(data);
      var content="";
      data.replylist.forEach(function(item, idx) {
         content += "<tr>";
         content += "<td>" + item.breply_idx + "</td>";
         content += "<td>" + item.breply_content + "</td>";
         content += "<td>" + item.breply_date + "</td>";
         content += "<td>" + item.mem_id + "</td>";
         content += "</tr>";
      });
      $("#listTable2").empty();
      $("#listTable2").append(content);
      content = "";
   };
   ajaxCall(obj);
};

$("#slide").click(function() {
   $("#page").slideToggle("slow")
})
/* ------------------------------------------------------------------------------------- */

$(".memdel").click(function(){
   var delmem;
   delmem = $(this).attr("id");
   console.log(delmem);
   obj.url="./memdel";
   obj.data.delmem = delmem;
   
   obj.success=function(data){
      if(data.success>0) {
         alert("삭제성공")
         location.reload();
         //location.href = "./adminpage";
      }else{
         alert("삭제실패")
      }
   }
   ajaxCall(obj);
});

$(".memstate").click(function(){
   var upstate;
   var upmemid;
   upstate= $(this).prev().val();
   upmemid=$(this).attr("id");
   obj.url="./memstate";
   obj.data.upstate=upstate;
   obj.data.upmemid=upmemid;
   
   obj.success=function(data){
      if(data.success>0){
         alert("상태변경 성공")
         location.reload();
         //location.href="./adminpage";
      }else{
         alert("상태변경 실패")
      }
   }
   ajaxCall(obj);
});

$("#key").change(function(){
   $("#key option:selected").val();
});

function ajaxCall(obj) {
   $.ajax(obj);
}



</script>
</html>