<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <title>Insert title here</title>      
      <style>
         .reup{
            background-color: black;
            color: white;
            cursor: pointer;
         }
         .reup:hover {
            background-color: white;
            color: black;
         }
      </style>
   </head>
   <body>
      <form id="fileUpload" action="./mainUpload" method="post" enctype="multipart/form-data">
         <input type="file" name="file" onchange="fileUpload()"/>
      </form>
      업로드 한 파일 경로 : <span></span>
   </body>
   <script>
      function fileUpload(){
         $("#fileUpload").submit();
         console.log('${path}');
      }
      var filePath = "${path}";
      $("span").text(filePath);
      
      if(filePath != ""){
         var content = "";//img 태그
         var elem = window.opener.document.getElementById("mainimg2");
         content +="<img width=250px height=150px src='${path}'/>";
         content+="<input id='${path}' class='reup' type='button' value='다시올리기' onclick='mainDel(this)'>";
         content += "<br/>";
         elem.innerHTML += content;
         self.close();
      }
   </script>
</html>