<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html> 
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <title>슈마니커</title>
      <style>
         #board{
            position: relative; 
            top: 100px; 
            left: 400px; 
            /* border: 1px solid black; */ 
            width: 500px; 
            height: 500px;
            
         }
            #boarta{
              
               border-collapse: collapse;
               
               position: absolute;  
               margin-top: 5%;   
               width: 200%;
               margin-left: -20%; 
           
            }           
           
           /*  #boarta th{             
               height: 30px; 
                background-color: black;
                color: white; 
            } */
            #boarta td{
               width: 210px; 
               height: 30px;
               text-align: center;
              
             }
            
            
            #board_category{
               width: 100%; 
               height: 100%;
            }
            
            #user_id{
               text-align: center;
            }
            
            #board_subject{
               width: 100%;
               height: 100%;
            }
            
            #board_content{
               resize: none; 
               width: 100%; 
               height: 100%;
            }
            
           
            #notice_content{
               width: 190%;  
               margin-left: 21%; 
            }
            
            
            
              #exit{
               position: absolute; 
               border: none; 
               background-color: black; 
               color: white; 
               border-radius: 2px; 
               font-size: 15px;
               cursor: pointer; 
               margin-top: 97%; 
               margin-left: 80%;
            } 
            #exit:hover{ 
               background-color: white;
               color: black;
            }
            
            #update{
               position: absolute; 
               border: none; 
               background-color: black;
               color: white;
               border-radius: 2px; 
               font-size: 15px;
               cursor: pointer; 
               margin-top: 97%;
               margin-left: 50%;
            }
            #update:hover {
             background-color: white; 
               color:black;
         }
      </style>
   </head>
   <body style="overflow-x:hidden; overflow-y:auto;">
   <c:if test="${sessionScope.adminId != null}">
      <%@include file="./adminpage.jsp"%>
      <div id="board">
         <table id="boarta">
         
            <tr>
                    <th>제목</th>
                    <td colspan="3"><input type="text" id="notice_subject" value="${dto.notice_subject }"/></td>
                    <th>작성날짜</th>
               <td>
                  <span id="notice_date">${dto.notice_date }</span>
               </td>
                </tr>
            <tr>
               <th>작성자</th>
               <td>
                  <input type="hidden" id="notice_idx" value="${dto.notice_idx }"/> 
                  <span id="user_name">${dto.admin_id }</span>
               </td>
               
            </tr>
                
                <tr>
                    <td colspan="3"><textarea rows="15" id="notice_content">${dto.notice_content }</textarea></td>
                </tr>
         </table>
            <input type="button" id="exit" value="취소">
            <input type="button" id="update" value="수정">
      </div>
      </c:if>
      <c:if test="${sessionScope.adminId == null}">
         <h3>관리자만 접근 가능합니다</h3>
      </c:if>
   </body>
   <script>
   $("#update").click(function () {
      $.ajax({
         type : "post",
         url : "./a_noticeUpdate",
         data : {
            idx : $("#notice_idx").val(),
            subject : $("#notice_subject").val(),
            content : $("#notice_content").val()
         },
         dataType : "json",
         success : function (data) {
            if(data.success>0){
               console.log(data.success);
               alert("수정 성공");
               location.href="./a_noticeDetail?notice_idx="+data.success;
            }else{
               alert("실패 실패");
            }
         },
         error : function (error) {
            console.log(error);
         }
      });
   });
   
   $("#exit").click(function () {
      history.back();
   });
   </script>
</html>