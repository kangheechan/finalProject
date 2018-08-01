<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<style>
   #proInfo{
      width: 150%;
      height: 50%;
      margin-left: 60%;
      margin-top: -13%;
   }
   
   #mainimg2{
      width: 97%;
      height: 105%;
      border: 1px solid black;
      margin-left: 1%;
      margin-top: 2%;
   }
   
   
   
   #mainParent{
    margin-left: 20%;
    width: 37%;
    height: 200px;   
    margin-top: 7%;
}
   }
   
   #subParent{
      width: 40%;
      height: 300px;      
      margin-left: 30%;
      margin-top: 1%;
   }
   
   #subImg{
         position: absolute;
       width: 36%;
       height: 30%;
       margin-left: -0.4%;
       margin-top: 2%;
       border: 1px solid black;
   }
   
   
   
   #proname{
      margin-left: 1.65%;
   }
   #price{
      margin-left: 1%;
   }
   #size{
      margin-left: 1.65%;
   }
   
   #brand{
      margin-left: 1.7%;
   }
   
   #gender{
      margin-left: 2.4%;
   }
   
   #category{
      margin-left: 2.4%;
   }
  
   #memo{
         margin-left: 60%;
           margin-top: -1%;
   }
   
   #register{
    margin-top: 1%;
    margin-left: 73%;
    background-color: black;
    color: white;
    cursor: pointer;
    border: 0;
   }   
   #register:hover{
       background-color: white;
       color: black;
   } 
   #mainUpBtn{                
       position: absolute;
       margin-top: 1.88%;
       margin-left: -24.2%;
       width: 35.5%;
         height: 26.4%;
       background-color: white;
       border:0;
       cursor: pointer;
       font-size: 40px;
       border: 0;
   }
   #mainUpBtn:hover {
      background-color: black;
      color: white;
   } 
   #proText{
      margin-top: 4%;
      height: 234px;
   }
   #subUpBtn{
         background-color: black;
       border:0;
       color: white;
       cursor: pointer;
   }
   #subUpBtn:hover{
         background-color: white;
       border:0;
       color: black;
   }
            .reup{
            background-color: black;
            color: white;
            cursor: pointer;
            border: 0px;
         }
         .reup:hover {
            background-color: white;
            color: black;
         }
</style>
</head>
<body>
   <jsp:include page="./head.jsp"/>
   
   
   <div id="mainParent" align="center">
           <font size="2">메인이미지를 업로드 하세요 (*필수!)</font>
      <input id="mainUpBtn" type="button" onclick="mainUpload()" value="+"/>
         <div id="mainimg2" contenteditable="false"></div>
   </div>
  
   <div id="proInfo">
      상품명<input id="proname" type="text"/><br/><br/>
     
      판매가격<input id="price" type="number"/><br/><br/>
           
     브랜드<select id="brand">
               <option value="0">종류를 선택해주세요</option>
               <option value="1">NIKE</option>
               <option value="2">ADIDAS</option>
               <option value="3">FILA</option>
               <option value="4">Reebok</option>
               <option value="5">Descente</option>
               </select><br/><br/>
     
      성별<select id="gender">
               <option value="0">성별을 선택해주세요</option>
               <option value="1">남자</option>
               <option value="2">여자</option>
               </select><br/><br/> 
               
      종류<select id="category">
               <option value="0">종류를 선택해주세요</option>
               <option value="1">운동화</option>
               <option value="2">캔버스화</option>
               <option value="3">구두</option>
               <option value="4">샌들</option>
               <option value="5">하이힐</option>
               <option value="6">슬리퍼</option>
               </select><br/><br/>                   
               
      사이즈<select id="size">
               <option value="0">신발 사이즈를 선택하세요</option>
               <option>210mm</option>
               <option>215mm</option>
               <option>220mm</option>
               <option>225mm</option>
               <option>230mm</option>
               <option>235mm</option>
               <option>240mm</option>
               <option>245mm</option>
               <option>250mm</option>
               <option>255mm</option>
               <option>260mm</option>
               <option>265mm</option>
               <option>270mm</option>
               <option>275mm</option>
               <option>280mm</option>
               <option>285mm</option>
               <option>290mm</option>
               <option>295mm</option>
               <option>300mm</option>
         </select><br/><br/>        
   </div>
   
    <div id ="subParent" style="margin-left: 21%">
          서브이미지를 업로드 하세요<br/>(선택사항이며 3장까지 가능합니다)
        <input id="subUpBtn" type="button" onclick="subUpload()" value="업로드"/>
            <div id="subImg" contenteditable="false"><input id="subImgForm" type="hidden" name="subContent"/></div>
   </div>
    
    <div id="memo">
          상품설명<br/><textarea id="proText" rows="10" cols="60"></textarea>
    </div>
    
    <input type="button" id="register" value="등록">
</body>

<script>

   // div의 html/텍스트 변경 감지
   $("body").on('DOMSubtreeModified', "#mainimg2", function() {
       $('#mainUpBtn').css('display', 'none');
       $('#mainimg2').css('border', '0px');
       $('#mainParent').css('border', '0px');
   });

   $('#register').click(function(e){   
      var mainText = $('#mainimg2').html(); //메인이미지에 사진이 올라갔는지 판별하기 위한 변수
         if(mainText.indexOf('<img') == -1){
            alert('메인이미지는 반드시 넣어주셔야 합니다.');
            console.log($('#mainimg2').html());
         }
         else if($('#proname').val() == ''){
            alert('상품명을 입력하여 주세요');
            $('#proname').focus();
         }else if($('#price').val() == ''){
            alert('가격을 입력하여 주세요');
            $('#price').focus();
         }else if($('#brand').val() == 0){
            alert('브랜드를 선택하여 주세요');
            $('#brand').focus();
         }else if($('#gender').val() == 0){
            alert('성별을 선택하여 주세요');
            $('#gender').focus();
         }else if($('#category').val() == 0){
            alert('카테고리를 선택하여 주세요');
            $('#category').focus();
         }else if($('#size').val() == 0){
            alert('사이즈를 선택하여 주세요');
            $('#size').focus();
         }else if($('#proText').val() == ''){
            alert('메모를 작성하여 주세요');
            $('#proText').focus();
         }else{
            $.ajax({
               type:"GET",
               url:"./proInsert",
               data:{
                  pro_name: $('#proname').val(),
                  pro_price: $('#price').val(),
                  brand_idx: $('#brand').val(),
                  gender_idx: $('#gender').val(),
                  shoes_idx: $('#category').val(),
                  pro_size: $('#size option:selected').text(),
                  pro_memo:$('#proText').val(),
                  shop_idx: '${sessionScope.shopIdx}',
                  mem_id:'${sessionScope.loginId}'         
               },
               dataType:"JSON",
               success:function(data){
                    console.log(data);
                      alert('정상적인 등록 처리가 되었습니다.');
                      if($('#subImg').html() == ''){
                         location.href = "./detail?idx=" + data.proIdx; 
                      }else{
                         addSubImg(data.proIdx); //서브이미지 넣을시 추가해주는 함수
                         location.href = "./detail?idx=" + data.proIdx; 
                      }
               },
               error : function(err){
                  console.log(err);
               }
            });  
         }   
   });
   
   //메인 DIV 클릭시 파일업로드 이벤트 실행
   function mainUpload(){
      //fileUpload 새창을 띄운다.
       var myWin =  window.open("./mainUploadForm","파일 업로드","width=400, height=100");
       if('${sessionScope.pathSession ne null}'){fileDel();}
   }
   
   //서브 이미지 업로드
   function subUpload(){
      var myWin = window.open("./subUploadForm", "파일 업로드", "width=400, height=100");
          if($('#subImg').html().match(/subDel/g).length > 2){ // 업로드파일이 3개면 업로드버튼 숨기기
             alert('업로드는 3개 까지만 가능합니다.');
             myWin.close();
            $('#subUpBtn').attr("disabled", true);
            console.log($('#subImg').html());
      } 
   }
   
   //메인사진 삭제
   function mainDel(elem){
      var fileName = elem.id.split("/")[2];
      console.log(fileName);
      $.ajax({
         url:"./mainFileDel",
         type:"get",
         data:{"fileName":fileName},
         dataType:"JSON",
         success:function(data){
            if(data.success == 1){
               $(elem).prev().remove();//이미지 삭제
               $(elem).remove();//버튼 삭제
               $('#mainUpBtn').css('display', 'inline'); // 삭제버튼 클릭하면 다시 업로드버튼 나오게하기
               $('#mainimg2').css('border', '1px solid black');
            }
         },
         error:function(e){
            console.log(e);
         }
      });
   }
   
   //서브사진 삭제
   function subDel(elem){
        var fileName = elem.id.split("/")[2];
      console.log(fileName);
      $.ajax({
         url:"./subFileDel",
         type:"get",
         data:{"fileName":fileName},
         dataType:"JSON",
         success:function(data){
            if(data.success == 1){
               $(elem).prev().remove();//이미지 삭제
               $(elem).remove();//버튼 삭제
               $('#subUpBtn').attr("disabled", false);
            }
         },
         error:function(e){
            console.log(e);
         }
      });
   }
   
   //서브이미지 업데이트(서브사진추가)
   function addSubImg(proIdx){
       $.ajax({
         url:'./subImgInsert',
         type:'get',
         data:{
            proIdx : proIdx
         },
         dataType:"JSON",
         success:function(data){
            console.log(data);
         },
         error:function(err){
            console.log(err);
         }
      }); 
   }
   //메인이미지세션 관리
   function fileDel(){
      $.ajax({
         url:"./fileDel",
         type:"get",
         data:{"fileName":'${sessionScope.pathSession}'},
         dataType:"JSON",
         success:function(data){
            if(data.success == 1){
            }
         },
         error:function(e){
            console.log(e);
         }
      });
   }
  
</script>
</html>