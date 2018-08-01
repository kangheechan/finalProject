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
               border: 1px solid black; 
               border-collapse: collapse;
               border: 0;
               position: absolute;  
               margin-top: 3%;   
               width: 228%;
               margin-left: -32%;
           
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
            
            
            #user_name{
               text-align: center;
            }
            #notice_subject{
               width: 100%; 
               height: 100%;
               border: 1px solid black;
            }
            #notice_content{
               resize: none; 
               width: 100%; 
               height: 100%;  
               margin-left: 0%; 
               margin-top: 5%;   
               border: 1px solid black;
            }
            
            #exit{
                position: absolute;
                border: none; 
                background-color: black; 
                color: white; 
                border-radius: 2px; 
                font-size: 15px; 
                margin-top: 97%; 
                margin-left: 80%;
                cursor: pointer;
             }
             #exit:hover{
                background-color: white;
                color: black;
             } 
            #write{
               position: absolute; 
               border: none; 
               background-color: black; 
               color: white;  
               border-radius: 2px; 
               font-size: 15px; 
               margin-top: 97%;
               margin-left: 50%;
               cursor: pointer;
            }
            #write:hover{
               background-color: white;
               color: black;
            }
            #ter{
                   position: absolute;
                margin-left: 2%; 
                width: 13.7%;
                margin-top: 2%;
            }
          
      </style>
   </head>
   <body style="overflow-x:hidden; overflow-y:auto;">
   <c:if test="${sessionScope.adminId != null}">
      <%@include file="./adminpage.jsp"%>
      <div id="board">
         <table id="boarta">
             <tr>                  
                  <td><input type="hidden" id="user_name" value="관리자"></td>
               </tr>

                <tr>
                    <th>제목</th>   
                    <th colspan="3"><input type="text" id="notice_subject"/></th>                 
                </tr>                
                <tr>
                   
                </tr> 
                <tr>
                   
                </tr>
                <tr>
                   <th id="ter">내용</th>
                    <td colspan="4"><textarea rows="15" id="notice_content"></textarea></td>
                </tr>
         </table> 
         <input type="button" id="write" value="글쓰기">
            <input type="button" id="exit" value="취소">
            
      </div>
      
      </c:if>
      
      <c:if test="${sessionScope.adminId == null}">
         <h3>관리자만 접근 가능합니다</h3>
      </c:if>   
   </body>

   <script>
   $("#exit").click(function () {
         location.href="a_notice";
      });
   $("#write").click(function () {
      $.ajax({
         type : "post",
         url : "./noticeWrite",
         data : {
            
            id : $("#user_name").val(),
            subject : $("#notice_subject").val(),
            content : $("#notice_content").val()
         },
         dataType : "json",
         success : function (data) {
            console.log(data);
            if(data.success>0){
               console.log(data.success);
               alert("글쓰기 성공");
               location.href="./a_notice"  
            }else{
               alert("글쓰기 실패");
            }
         },
         error : function (error) {
            
         }
      });
   });
   </script>
</html>