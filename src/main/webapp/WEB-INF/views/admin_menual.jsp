<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
         <style>
            #main{
            position:absolute;
            width:50%;
            height:80%;
            left:20%;
            text-align: center;
            font-size: 14px; 
            margin-top: 2%;
            font-family: Arial Black;
            line-height:120%
            }   
            .title1{
            font-size:18px;
            border: 2px;
            font-weight: bold;  
            margin-left: 10%;
            margin-top:10%;
            }
             .title2{
            font-size:18px;
            border: 2px;
            font-weight: bold;  
            margin-left: 10%;
            margin-top:4.3%;
            }
             .title3{
            font-size:18px;
            border: 2px;
            font-weight: bold;  
            margin-left: 10%;
            margin-top:4.3%;
            }
            .content1{
             margin-left: 10%;
            margin-top:3.3%;
           letter-spacing: 1px;
             line-height: 17.2px;
            }
            .content2{
             margin-left: 10%;
            margin-top:3.3%;
           letter-spacing: 1px;
             line-height: 17.2px;
            }
            .content3{
             margin-left: 10%;
            margin-top:3.3%;
           letter-spacing: 1px;
             line-height: 17.2px;
            }
            #filed{
            display: inline-block;
            }
         </style>
   </head>
   <body>
   <c:if test="${sessionScope.adminId != null}">
      <%@include file="./adminpage.jsp"%>
      <div id="main">
      
         <div class="title1">회원관리<p></div>
         <div class="content1">
      '슈마니커'에 등록된 회원의 정보 확인<p>
            회원 검색 <p>
            회원 상태변경 <p>
            회원 삭제 <p>
         </div>
      
         <div class="title2">후기관리<p></div>
         <div class="content2">
      물품 구매자들이 구매한 상점에 대해 <p>
            작성한 후기들을 조회<p>
               후기 검색<p>
               후기 조회<p>
               후기 삭제<p>
               </div>
      
         <div class="title3">공지사항<p></div>
         <div class="content3">
            '슈마니커' 공지사항 <p>
               공지사항 등록<p>
               공지사항 변경<p>
               공지사항 상세보기<p>
               공지사항 삭제<p>   
               </div>
         </ul>
      </div>
      </c:if>
   </body>
   <script>

   </script>
</html>