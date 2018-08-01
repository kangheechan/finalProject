<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <style>
         div#board{
            position: relative; 
            top: 100px; 
            left: 400px; 
            /* border: 1px solid black;  */
            width: 500px;
            height: 500px;
          }
          #board #maintable{
            border-top: 1px solid #444444;
            border-spacing: 20px;
            border-collapse: collapse;
            border:3px solid black;
            padding: 10 10;
            table-layout: fixed;
            word-break:break-all; 
            width: 130%;
            height: 140%;

            }
            #board td,th{
            border-right:1px solid #444444;;
            border-bottom: 1px solid #444444;
            border-collapse: collapse;
            padding: 10px;
            font-size:13px;
            }
            #board th{
             background-color:black;
             color:white;
         
             
            }

            
            #board td{
               width: 116px; 
               height: 30px;
               text-align: center;
             }
            
            input#board_category{
               width: 100%; 
               height: 100%;
            }
            
            span#user_id{
               text-align: center;
            }
            
            input#board_subject{
               width: 100%;
               height: 100%;
            }
            
            textarea#board_content{
               resize: none; 
               width: 100%; 
               height: 80%;
            }
            
            button#delete{
               position: absolute; 
               border: none; 
               background-color: white; 
               color:black; 
               border-radius: 2px; 
               font-size: 15px; 
               top: 406px; 
               left: 458px;
               margin-top: 269px;
            } 
            
            button#update{
               position: absolute; 
               border: none; 
               background-color: white; 
               color:black; 
               border-radius: 2px; 
               font-size: 15px; 
               top: 406px; 
               left: 405px;
               margin-top: 269px;
            }
            #edit{
            border:none;
            }
           .replyup{
           display:none;
           }
            
            /* ----------------------------------------------------------------------- */            
            /*댓글 div */
#page #reply {
    position: absolute;
    top: 145%;
    left: 0%;
   width: 130%;
    height: 40%;
    background-color: white;
    border: 3px solid black;
    table-layout: fixed;
   word-break:break-all; 
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



/* 댓글 등록창  */
#page #ccontent {
    resize: none;
    width: 100%;
    height: 100%;
    background-color: #F6F6F6;
}

#page #replybtn {
    position: absolute;
    top: 88%;
    left: 89%;
    width: 10%;
    height: 11%;
    background-color: white;
}

/* 댓글 등록 버튼 */
#page #register {
   background-color: black;
   line-height: 26px;
   border-radius: 8px;
   font-size:16px;
   text-align: center;
   z-index: 2;
   color: white;
   width: 100%;
   border: none;
     font-weight: 900;
   height: 100%;
}
.img{
   width: 116px;
   height: 30px;
}
.btnup{
   margin-top: 100px;
   margin-left: 100px;
}
      </style>
   </head>
   <body>
      <!-- 회원 -->
      <c:if test="${sessionScope.loginId != null}">
         <%@include file="./head.jsp"%>
         <div id="board">
            <table id="maintable">
               <tr>
                  <th colspan="1">작성자</th>
                  <td>
                     <span id="user_name" >${dto.mem_id }</span>
                  </td>
                  <th>작성날짜</th>
                  <td colspan="2">
                     <span id="board_date">${dto.req_date }</span>
                  </td>
               </tr>
                   <tr>
                       <th>제목</th>
                       <td colspan="4">${dto.req_subject }</td>
                   </tr>
                   <tr>
                         <th>이미지</th>
                         <td colspan="4">
                            <img class="img" src=${dto.rimg_path }>
                         </td>
                   </tr>
                   <tr>
                       <td colspan="5">
                          <textarea rows="15" id="board_content" readonly="readonly">${dto.req_content }</textarea>
                       </td>
                   </tr>
                   <button id="slide">댓글</button>
                   </table>
                    <!--  -----------------------------댓글------------------------------------------------------ --> 
                   <div id="page">
               <div id="reply">
            <div id="replybtn">
               <button id="register">등록</button>
            </div>
            <div id="replytable">
               <table id="listTable2">
                  <tr>
                  <th>댓글번호</th>
                  <th>내용</th>
                  <th>아이디</th>
                  <th>날짜</th>
                  </tr>
               </table>

            </div>
            <div id="replysubmit">
               <textarea id="replycontent" cols="50" placeholder="댓글을 입력하세요.."></textarea>
            </div>
         </div>
         </div>
            <!--  -----------------------------댓글------------------------------------------------------ -->
            <c:if test="${sessionScope.loginId == dto.mem_id}">
                <button id="delete">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <button id="update" onclick="update()">수정</button>   
               </c:if>
           </div>    
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

   
       function update() {
         location.href="Request_updateForm?req_idx="+${dto.req_idx};
      }
      
       var idx = ${dto.req_idx};
      $("#delete").click(function () {
         $.ajax({
            type : "post",
            url : "./Request_noticeDelete",
            data : {
               idx : idx
            },
            dataType : "json",
            success : function (data) {
               if(data.success>0){
                  console.log(data.success);
                  alert("삭제 성공");
                  location.href="./Request";
               }else{
                  alert("삭제 실패");
               }
            },
            error : function (error) {
               console.log(error);
            }
         });
      });   
      
      $(document).ready(function() {
          listPrint(idx);
       });

       function listPrint(idx) {
          obj.url = "./replylist";
          obj.data = {idx : idx};
          obj.success = function(data) {
             console.log(idx)
             console.log(data);
             var content="";
             data.replylist.forEach(function(item, idx) {
                content += "<tr>";
                   content += "<td>" + item.mem_id + "</td>";
                content += "<td>"
                            +"<input  class="+item.breply_idx+" id='edit' type='text' value="+item.breply_content+" readonly>"
                            +"</td>";
                            var date = new Date(item.breply_date);
                            content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
                content += "<td>"
                      +"<input class='replyupform' value='수정?' type='button' id="+item.breply_idx+">"
                      +"<input class='replyup' value='완료?' type='button' id="+item.breply_idx+">"
                     +"<input class='replydel' type='button' value='삭제?' id="+item.breply_idx+">"
                         + "</td>";
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
       });
       
       /* 댓글삭제 */
       $(document).on('click', '.replydel', function() {   
          $.ajax({
             type : "post",
             url : "./replyDel",
             data : {
                delreply : $(this).attr('id')
                 },
                 dataType : "json",
         success : function(data) {
         if (data.success) {
            alert("댓글 삭제 성공.")
            location.reload();
            //listPrint(idx);//해당 플랜 idx번호
         } else {
            alert("삭제 실패")
         }
      }
       });
      ajaxCall(obj);
   });
       
       /* 댓글입력 */
       $("#register").click(function () {
          $.ajax({
             type : "post",
             url : "./replyWrite",
             data : {
                breply_content : $("#replycontent").val(),
                mem_id : '${sessionScope.loginId}',
                idx : '${dto.req_idx}'
             },
             dataType : "json",
             success : function (data) {
                console.log(data);
                if(data.success>0){
                   alert("글쓰기 성공");
                   location.reload();
                }else{
                   alert("글쓰기 실패");
                }
             }
           });
          ajaxCall(obj);
       });
       
       /* 댓글수정 */
       $(document).on('click', '.replyupform', function() {   
          var upcomment = $(this).attr("id");
          $("input[class=" + upcomment + "]").css("border","1px solid #004C63");
          $("input[class=" + upcomment + "]").attr("readonly",false);
          $(".replyupform").css("display","none");
          $(".replydel").css("display","none");
          $(".replyup").css("display","inline");
       
       $(document).on('click', '.replyup', function() {   
          var upreply = $(this).attr("id");
          $.ajax({
             type : "post",
             url : "./replyup",
             data : {
                breply_idx : upreply,
                upreply : $("input[class="+upreply+"]").val()
                
                 },
            dataType : "json",
         success : function(data) {
         if (data.success) {
            alert("댓글 수정 성공.")
            location.reload();
            //listPrint(idx);//해당 플랜 idx번호
         } else {
            alert("댓글 수정 실패")
         }
      }
       });
      ajaxCall(obj);
   });
       });
       
       function ajaxCall(obj) {
      $.ajax(obj);
      }

   /*     $(document).on('click', '.replyupform', function() {   
          $("#edit").css("border","1px solid #004C63");
          $("#edit").attr("readonly",false);
          $(".replyupform").css("display","none");
          $(".replydel").css("display","none");
          $(".replyup").css("display","inline");
       });
   */
      
   </script>
</html>