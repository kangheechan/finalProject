<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html> 
   <head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
      <script src="./resources/js/paging.js" type="text/javascript"></script>
      <script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
      <title>슈마니커</title>
      <style>
       
         .di{
            width: 500px;
            height: 500px;
            position: absolute;
            margin: 0 auto;
            top: 100px;
            
         }
         
         #listTable{
            border-top: 1px solid #444444;
            border-spacing: 20px;
            border-collapse: collapse;
            padding: 10 10;
            margin-left: 41%;
            margin-top: 29%;
            text-align: center;

            }
            .td1,.td2,.td3,.td4,.td5,.td6{border-bottom: 1px solid black}
         #listTable td,th{
            border-bottom: 1px solid black;
            border-collapse: collapse;
            
            padding: 18px;
            font-size:13px;
         }
           #listTable{
                border-top: 1px solid black;
                width: 228%;
                
            }
           
   
         .th{
            /*border-bottom: 1px dashed black;*/
         }    
          
            
             
             #field{
            display: inline-block;
         }
         /* .tr th{
            background-color: black;
            color: white;
         } */
           #list{
               cursor: pointer;
            }
            #list tr:hover {
               background-color: #EAEAEA;
            }
         #h4{
            position: absolute;
            margin-top: 7%;
            margin-left: 44%;
         }
         #h5{
            position: absolute;
            margin-top: 16%;
            margin-left: 44%;
            width: 500px; 
         }
         #write{
               border: 0;
               outline: 0;
               cursor: pointer;
               background-color: black;
               color: white;      
               margin-top: 7%;
               margin-left: 80.7%;   
               height: 3.5%;  
            }
         #write:hover{
            background-color: white;
            color: black;
            border: 1px solid;
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
                /*페이징  */   
             .paging-nav {
              text-align: right;
              padding-top: 2px;
              width: 269%;
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

      <div class="di">
            <h4 id="h4">공지사항</h4> 
            <h4 id="h4">공지사항관리</h4>
            <h5 id="h5">슈마니커에 등록된 공지사항을 수정,삭제 할 수 있습니다.</h5>
         <table id="listTable">
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
         <input type="button" id="write" value="작성하기"> 
      </c:if>
      <c:if test="${sessionScope.adminId == null}">
         <h3>관리자만 접근 가능합니다</h3>
      </c:if>
   </body>
   <script>
   $("#write").click(function () {
      location.href="a_noticeWrite";
   });
   
   $(document).ready(function() {
      $.ajax({
         type : "post",
         url : "./noticeList",
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
      console.log("리스트 어팬드 여부");
      var content = "";
      list.forEach(function(item, idx) {
         content += "<tr class ='tr1'>";
         content += "<td class ='td1'><a href='./a_noticeDetail?notice_idx="+item.notice_idx+"'>"+item.notice_idx+"</a></td>";
         content += "<td class ='td2'><a href='./a_noticeDetail?notice_idx="+item.notice_idx+"'>"+item.notice_subject+"</a></td>";
         content += "<td class ='td3'><a href='./a_noticeDetail?notice_idx="+item.notice_idx+"'>"+item.notice_content+"</a></td>";
         content += "<td class ='td4'><a href='./a_noticeDetail?notice_idx="+item.notice_idx+"'>"+item.admin_id+"</a></td>";
         var date = new Date(item.notice_date);
         content += "<td class ='td5'><a href='./a_noticeDetail?notice_idx="+item.notice_idx+"'>"+date.toLocaleDateString("ko-KR")+"</a></td>";
         content += "<td class ='td6'><a href='./a_noticeDetail?notice_idx="+item.notice_idx+"'>"+item.bHit+"</a></td>";
         content += "</tr class ='tr2'>";
      });
      $("#list").empty();
      $("#list").append(content);
   }
   </script>
</html>