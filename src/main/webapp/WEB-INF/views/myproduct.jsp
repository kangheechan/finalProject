<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
      <script src="./resources/js/paging.js" type="text/javascript"></script>
      <script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f02b4f642a6f753a6e695053e9fa3a2&libraries=services"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>슈마니커</title>
<style>
#myname{
       margin-left: 5%;       
   }
   #mymenu{
      margin-top: 5%;
      border-bottom: 1px solid black;
   }
   #mymenu a{
      color: black;
      text-decoration: none;   
      margin-left: 12%;      
      font-size: large;
      font-style: inherit; 
   }
   #mymenu a:hover{
      background-color: black;
      color: white;
   }
   #sel{
      margin-left: 85%; 
      margin-top: -2%;
   }
   

   .pop-layer .pop-container {
     padding: 20px 25px;
   }
   
   .pop-layer p.ctxt {
     color: #666;
     line-height: 25px;
   }
   
   .pop-layer .btn-r {
     width: 100%;
     margin: 10px 0 20px;
     padding-top: 10px;
     border-top: 1px solid #DDD;
     text-align: right;
   }
   
   .pop-layer {
     display: none;
     position: absolute;
     top: 50%;
     left: 50%;
     width: 410px;
     height: auto;
     background-color: #fff;
     border: 5px solid black;
     z-index: 10;
   }
   
   .dim-layer {
     display: none;
     position: fixed;
     _position: absolute;
     top: 0;
     left: 0;
     width: 100%;
     height: 100%;
     z-index: 100;
   }
   
   .dim-layer .dimBg {
     position: absolute;
     top: 0;
     left: 0;
     width: 100%;
     height: 100%;
     background: #000;
     opacity: .5;
     filter: alpha(opacity=50);
   }
   
   .dim-layer .pop-layer {
     display: block;
   }
   
   a.btn-layerClose {
     display: inline-block;
     height: 25px;
     padding: 0 14px 0;     
     background-color: black;
     color: white;
     font-size: 13px;
     color: #fff;
     line-height: 25px;
     text-decoration: none;
     border: 1px solid;
   }
   
   a.btn-layerClose:hover {
     background-color: white;
     color: black;
     border: 1px solid;
   }
   #shopname{
      margin-left: 28%;
   }
   #shop_idx{
      /* display: none; */
   }
   #shop
   .pop-conts h4{
      margin-left: 27%; 
   }
   .btn-example{
      background-color: black;
      color: white;
      text-decoration: none;
   }
   .btn-example:hover{
      background-color: white;
      color: black;
   }

   #sel{
      margin-top: -1%;   
   }
   #tab{
      margin-left: 10%;       
      margin-left: 0%;
      
   }
   #tab table{
      width: 80%;
   }
   #buybtn{
      margin-left: 43.5%;
   	  margin-top: 17%;    
      position: absolute;
      background-color: black;
      color: white;
      outline: 0;
      border: 0;
      font-size: 15px;  
      text-decoration: none;
      cursor: pointer;
      height: 5%;
 	  width: 5%;
   }
   #buybtn:hover{
      background-color: white;
      color: black;
      outline: 0;
      border: 1px solid;
   }
   .prodel{            
   
      background-color: black;
      color: white;
      outline: 0;
      border: 0;
      font-size: 15px;  
      cursor: pointer;
      border: 1px solid;
   } 
   .prodel:hover {
      background-color: white;
      color: black;
      outline: 0;
      border: 1px solid;
   }
   #sel2{
      cursor: pointer;      
   }
   #tr1 tr{
      cursor: pointer;
   }
   #tr1 tr:hover {
      background-color: #EAEAEA;
   }
   
   .pop-layer1 .pop-container1 {
     padding: 20px 25px;
   }
   .pop-container1{
   		margin-left: 19%;
   }
   .pop-layer1 p.ctxt {
     color: #666;
     line-height: 25px;
   }
   
   .pop-layer1 .btn-r {
     width: 100%;
     margin: 10px 0 20px;
     padding-top: 10px;
     border-top: 1px solid #DDD;
     text-align: right;
   }
   
   .pop-layer1 {
     display: none;
     position: absolute;
     top: 50%;
     left: 50%;
     width: 410px;
     height: auto;
     background-color: #fff;
     border: 5px solid black;
     z-index: 10;
   }
   
   .dim-layer1 {
     display: none;
     position: fixed;
     _position: absolute;
     top: 0;
     left: 0;
     width: 100%;
     height: 100%;
     z-index: 100;
   }
   
   .dim-layer1 .dimBg1 {
     position: absolute;
     top: 0;
     left: 0;
     width: 100%;
     height: 100%;
     background: #000;
     opacity: .5;
     filter: alpha(opacity=50);
   }
   
   .dim-layer1 .pop-layer1 {
     display: block;
   }
   
   a.btn-layerClose {
     display: inline-block;
     height: 25px;
     padding: 0 14px 0;     
     background-color: black;
     color: white;
     font-size: 13px;
     color: #fff;
     line-height: 25px;
     text-decoration: none;
   }
   
   a.btn-layerClose:hover {
     background-color: white;
     color: black;
   }
   #ok{
      background-color: black;
      color: white;
      border: 0;
      outline: 0;
      margin-left: 80%;
      margin-top: -6%;
   }
   #ok:hover {
      background-color: white;
      color: black;
   }
   .btn-example1{
   	  background-color: black;
      color: white;
      border: 1px solid black;
      text-decoration: none;
      font-weight: 100;
   }
   .btn-example1:hover{
      background-color: white;
      color: black;
      border: 1px solid black;
   }
   td{
      text-align: center;
   }
      /*페이징  */   
             .paging-nav {
              text-align: right;
              padding-top: 2px;
                 width: 74%;

            }
          
            .paging-nav a {
              margin: auto 1px;
              text-decoration: none;
              display: inline-block;
              padding: 1px 7px;
              background-color: black;
              color: white;
              border-radius: 3px;
            }
          
            .paging-nav .selected-page {
              background-color: white;
              color: black;
              font-weight: bold;
              border: 1px solid;
         }   
		#buyer{
			    margin-left: 9%;
		}
   		#buyche{
   			    margin-left: 24%;
  				margin-top: 2%;
  				background-color: black;
  				color: white;
  				border: 1px solid;
  				cursor: pointer;
   		}
   		#buyche:hover{
   			    margin-left: 24%;
  				margin-top: 2%;
  				background-color: white;
  				color: black;
  				border: 1px solid;
   		}
   	.btn-layerClose1{   		
   		color: black;   		
   		text-decoration: none;
   		margin-left: 96%;
   		font-weight: 150;
   	}
   	.btn-layerClose1:hover{   		
   		
   		font-weight: 200;
   	}
   
   	
   	#tt:hover{
   		text-decoration: underline;
   	}
   	#pro1{
   	
	border: 2px solid black;    
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    border-bottom: 1px solid white;    
}

#map{
	margin-left: 23%;
    margin-top: -10.7%;	 
}
#hh3{
	border: 1px solid;
    width: 19%;
    height: 150px;
    margin-top: 2%;
    border-radius: 10px;
}



</style>
</head>
<body>
      <%@include file="./head.jsp"%>
   

      <div id="shopInfo"></div>
   	<div id="map" style="width: 200px; height: 150px;"></div>

   <div id="mymenu">
      <c:if test="${myProduct['0'].shop_idx eq sessionScope.shopIdx}">
         <a href="./myproduct?shopIdx=${sessionScope.shopIdx}" id="pro1">상품</a>
      </c:if>
      
      <c:if test="${myProduct['0'].shop_idx ne sessionScope.shopIdx}">
         <a href="./myproduct?shopIdx=${myProduct['0'].shop_idx}" id="pro1">상품</a>
      </c:if>
      
      <c:if test="${myProduct['0'].mem_id eq sessionScope.loginId}">
         <a href="./mybuy?shopIdx=${sessionScope.shopIdx}" >구매내역</a>
      </c:if>
      
      <c:if test="${myProduct['0'].mem_id eq sessionScope.loginId}">
         <a href="./mycart?shopIdx=${sessionScope.shopIdx}">찜목록</a>
      </c:if>
      
      <c:if test="${myProduct['0'].shop_idx eq sessionScope.shopIdx}">
         <a href="./myreview?shopIdx=${sessionScope.shopIdx}">상점후기</a>
      </c:if>
      
      <c:if test="${myProduct['0'].shop_idx ne sessionScope.shopIdx}">
         <a href="./myreview?shopIdx=${myProduct['0'].shop_idx}">상점후기</a>
      </c:if>
         
      <c:if test="${myProduct['0'].mem_id eq sessionScope.loginId}">
         <a href="./myinfo?shopIdx=${sessionScope.shopIdx}">개인정보 수정</a>
      </c:if>
      

   </div>


   <h3>상품리스트</h3>
   <c:if test="${myProduct['0'].mem_id eq sessionScope.loginId}">
      <button id="buybtn" onclick='location.href = "./regProduct"'>상품등록</button>
   </c:if>
   <div id=tab>
      <table id="pag">
         <thead>
            <tr>
               <th>상품정보</th>
               <th>등록날짜</th>
               <th>상품상태</th>
               <c:if test="${sessionScope.loginId eq myProduct['0'].mem_id}">
                  <th>판매여부</th>
                  <th>상품삭제</th>
               </c:if>
            </tr>
         </thead>
      <tbody  id="tr1">
            <c:forEach items="${myProduct}" var="pro" varStatus="status">
               <c:if test="${pro.pro_name ne '개설일'}">
             <tr>               
                     <th id="tt" onclick="location.href = './detail?idx=${pro.pro_idx}'">${pro.pro_name}</th>
                     <th>${pro.pro_date}</th>
                     <th>${pro.pro_state}</th>
                 <c:if test="${sessionScope.loginId eq myProduct['0'].mem_id and pro.pro_state eq '판매중'}"> 
                     <th><a id="${pro.pro_idx}" href="#layer3" class="btn-example1" onclick="get(this)">변경</a></th>
                     <th onclick="location.href = './prodel?prodel=${pro.pro_idx}'"><input type="button" class="prodel" value="삭제"/></th>
                 </c:if>    
                </tr>
               </c:if>
            </c:forEach>
         </tbody>

      </table>
      
      <div class="dim-layer1">
    <div class="dimBg1"></div>
    <div id="layer3" class="pop-layer1">
        <div class="pop-container1">
            <div class="pop-conts">
         		   <a href="#" class="btn-layerClose1">X</a>
                <!--content //-->
                <h4 class="ctxt mb20">구매자의 아이디를 입력하세요</h4>
                   <input id="buyer" type="text"/><br>
                   <input id='buyche' type ="button" value="아이디확인" onclick="buyerCheck()"/>
               
                

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">판매 완료</a>
                    
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
    </div>   
   </div>
</body>
<script>

var idx = '';
function get(elem){
    idx = elem.id;
    console.log('get() idx 값 = ' + idx);
}

$('.btn-layerClose').click(function(){
   console.log('전역변수로 가져온 idx 값 = ' + idx);
      if($('#buyer').val() == ''){
         alert('구매자 아이디를 입력하여 주세요');
      }else{
         if (!overChk) {
            alert("구매자 존재 여부를 확인해 주세요");
            $('#buyer').focus();//포커스 이동
         }
         else if($('#buyer').val() != ''){
            $.ajax({
               type:"GET",
               url:"./setBuyer",
               data:{
                  buyer : $('#buyer').val() ,
                  proIdx : idx
               },
               dataType:"JSON",
               success:function(data){
                  console.log(data);
                  if(data.success>0){
                     console.log('insert 성공');
                     upProState(idx);
                  }
               },
               error : function(err){
                  console.log(err);
               }
            }); 
         }
      }
   });

   var overChk = false;//중복체크 값
   //상점명 중복 확인
   function buyerCheck(){
   $.ajax({
      type:"GET",
      url:"./buyerCheck",
      data:{
         buyer : $('#buyer').val()
      },
      dataType:"JSON",
      success:function(data){
         console.log(data);
         if(data.overlay == false){
            alert('존재하지 않는 아이디 입니다.');
            $('#buyer').val('');
            $('#buyer').focus();
         }else{
            alert("존재하는 아이디 입니다.");
            $('#buyer').css('color', 'green');
            overChk = true;
         }
      },
      error : function(err){
         console.log(err);
      }
   });
   }

   function upProState(proIdx){
      $.ajax({
         type:'GET',
         url:'./upProState',
         data:{
            'proIdx' : proIdx
         },
         dataType:'JSON',
         success:function(data){
            console.log(data);
            if(data.success > 0){
               console.log('업데이트 성공');
               setWallet(proIdx);
            }
         },
         error:function(err){
            console.log(err);
         }
      });
   }

   function setWallet(proIdx){
        $.ajax({
            type:'GET',
            url:'./setWallet',
            data:{
               'proIdx' : proIdx,
               'id' : $('#buyer').val()
            },
            dataType:'JSON',
            success:function(data){
               console.log(data);
               if(data.success > 0){
                  console.log('업데이트 성공');
                  upSellCount();
               }
            },
            error:function(err){
               console.log(err);
            }
         });
   }
   
   function upSellCount(){
	   $.ajax({
           type:'GET',
           url:'./upSellCount',
           data:{
             'shopIdx' : '${sessionScope.shopIdx}'
           },
           dataType:'JSON',
           success:function(data){
              console.log(data);
              if(data.success > 0){
                 console.log('업데이트 성공');
                 location.href = './myproduct?shopIdx=' + '${sessionScope.shopIdx}';
              }
           },
           error:function(err){
              console.log(err);
           }
        });
   }

   $(document).ready(function(){
      getShopInfo();
      
      $('#pag').paging({
             limit: 5,
             rowDisplayStyle: 'block',
             activePage: 0,
             rows: "${myProduct}"
             });
      
   });

    

      //상점정보 출력
      function getShopInfo() {
         $
               .ajax({
                  type : "GET",
                  url : "./getShopInfo",
                  data : {
                     id : '${myProduct["0"].mem_id}',
                     shop_idx : "${param.shopIdx}"
                  },
                  dataType : "JSON",
                  success : function(data) {
                     console.log(data);
                     var addrSplit = data.mem_dto.mem_addr.split('/');
                     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                     mapOption = {
                        center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 
                        level : 7
                     // 지도의 확대 레벨
                     };
                     // 지도를 생성합니다    
                     var map = new daum.maps.Map(mapContainer, mapOption);
                     // 주소-좌표 변환 객체를 생성합니다
                     var geocoder = new daum.maps.services.Geocoder();
                     // 주소로 좌표를 검색합니다
                     geocoder
                           .addressSearch(
                                 addrSplit[1] + addrSplit[2],
                                 function(result, status) {
                                    // 정상적으로 검색이 완료됐으면 
                                    if (status === daum.maps.services.Status.OK) {
                                       var coords = new daum.maps.LatLng(
                                             result[0].y,
                                             result[0].x);
                                       // 결과값으로 받은 위치를 마커로 표시합니다
                                       var marker = new daum.maps.Marker(
                                             {
                                                map : map,
                                                position : coords
                                             });
                                       // 인포윈도우로 장소에 대한 설명을 표시합니다
                                       var infowindow = new daum.maps.InfoWindow(
                                             {
                                                content : '<div style="width:150px;text-align:center;padding:6px 0;">직거래 위치</div>'
                                             });
                                       infowindow.open(map, marker);
                                       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                       map.setCenter(coords);
                                    }
                                 });
                     if (data.dto != null) {
                   	  var date = new Date(data.dto.shop_date);
                   	  if(data.star_avg != null){
                   		  $('#shopInfo').append(
                                  '<h3 id="hh3">상점 이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
                                        + data.dto.shop_name + '<br/><br/>'
                                        + '상품판매 개수 &nbsp;&nbsp;&nbsp; '
                                        + data.dto.shop_sellcount + '<br/><br/>'
                                        + '상점 개설 날짜 &nbsp;&nbsp; '
                                        +date.toLocaleDateString("ko-KR") + '<br/><br/>'
                                        + '상점 평점 &nbsp;&nbsp; '
                                        + data.star_avg + " 점"
                                        + '</h3>');
                         }else{
                        	 $('#shopInfo').append(
                                     '<h3 id="hh3">상점 이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
                                           + data.dto.shop_name + '<br/><br/>'
                                           + '상품판매 개수 &nbsp;&nbsp;&nbsp; '
                                           + data.dto.shop_sellcount + '<br/><br/>'
                                           + '상점 개설 날짜 &nbsp;&nbsp; '
                                           +date.toLocaleDateString("ko-KR") + '<br/><br/>'
                                           + '상점 평점 &nbsp;&nbsp; '
                                           + "0점"
                                           + '</h3>');
                         }
                   	  }
                    
                  },
                  error : function(err) {
                     console.log(err);
                  }
               });
      }

   $('.btn-example1').click(function(){
       var $href = $(this).attr('href');
       layer_popup($href);
   });
   function layer_popup(el){
       var $el = $(el);        //레이어의 id를 $el 변수에 저장
       var isDim = $el.prev().hasClass('dimBg1');   //dimmed 레이어를 감지하기 위한 boolean 변수

       isDim ? $('.dim-layer1').fadeIn() : $el.fadeIn();

       var $elWidth = ~~($el.outerWidth()),
           $elHeight = ~~($el.outerHeight()),
           docWidth = $(document).width(),
           docHeight = $(document).height();

       // 화면의 중앙에 레이어를 띄운다.
       if ($elHeight < docHeight || $elWidth < docWidth) {
           $el.css({
               marginTop: -$elHeight /2,
               marginLeft: -$elWidth/2
           })
       } else {
           $el.css({top: 0, left: 0});
       }
       

       $el.find('a.btn-layerClose').click(function(){
          if($('#buyer').val() != '' && overChk == true){
             isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.   
          }           
           return false;
       });
       
       $el.find('a.btn-layerClose1').click(function(){
           isDim ? $('.dim-layer1').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
           return false;
       });

       $('.layer .dimBg1').click(function(){
           $('.dim-layer1').fadeOut();
           return false;
       });

   }
   
</script>


</html>