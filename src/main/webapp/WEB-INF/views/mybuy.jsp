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
   }
   
   a.btn-layerClose:hover {
     background-color: white;
     color: black;
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
      #tab{
         margin-left: 10%;
         margin-left: 0%;
         
      }
      #tab table{
         width: 70%;
      }
      
      #review{
         margin-left: 85.5%;  
         margin-top: 0%;      
         position: absolute;
         background-color: white;
         outline: 0;
         border: 0;
      }
      #review:hover{
         background-color: black;
         color: white;
         outline: 0;
         border: 0;
      }
      
      #tr1 tr{
         cursor: pointer;
      }
      #tr1 tr:hover {
         background-color: #EAEAEA;
      }
      td{
         text-align: center;
      }
      
      #tt:hover{
 		text-decoration: underline;
   	  }
            /*페이징  */   
             .paging-nav {
              text-align: right;
              padding-top: 2px;
              width: 63%;
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
              background-color: white;
              color: black;
              font-weight: bold;
              border: 1px solid;
         }   
      	.buyreiv{
      		background-color: black;
      		color: white;
      		border: 1px solid;
      		cursor: pointer;
      	}
      	.buyreiv:hover{
      		background-color: white;
      		color: black;
      		border: 1px solid;
      	}
      	 	#pro1{
   	
			border: 2px solid black;    
		    border-top-left-radius: 4px;
		    border-top-right-radius: 4px;
		    border-bottom: 1px solid white;    
		}
      	
      	#map{
	margin-left: 23%;
    margin-top: -13.8%;	 
}
#hh3{
	border: 1px solid;
    width: 19%;
    height: 190px;
    margin-top: 2%;
    border-radius: 10px;
}
      	
</style>
</head>
<body>
   <%@include file="./head.jsp"%>
   

      <div id="shopInfo"></div>
  	<div id="map" style="width: 200px; height: 200px;"></div>

   <div id="mymenu">
      <c:if test="${myBuy['0'].shop_idx eq sessionScope.shopIdx}">
         <a href="./myproduct?shopIdx=${sessionScope.shopIdx}">상품</a>
      </c:if>
      
      <c:if test="${myBuy['0'].shop_idx ne sessionScope.shopIdx}">
         <a href="./myproduct?shopIdx=${myBuy['0'].shop_idx}">상품</a>
      </c:if>
      
      <c:if test="${myBuy['0'].mem_id eq sessionScope.loginId}">
         <a href="./mybuy?shopIdx=${sessionScope.shopIdx}" id="pro1">구매내역</a>
      </c:if>
      
      <c:if test="${myBuy['0'].mem_id eq sessionScope.loginId}">
         <a href="./mycart?shopIdx=${sessionScope.shopIdx}">찜목록</a>
      </c:if>
      
      <c:if test="${myBuy['0'].shop_idx eq sessionScope.shopIdx}">
         <a href="./myreview?shopIdx=${sessionScope.shopIdx}">상점후기</a>
      </c:if>
      
      <c:if test="${myBuy['0'].shop_idx ne sessionScope.shopIdx}">
         <a href="./myreview?shopIdx=${myBuy['0'].shop_idx}">상점후기</a>
      </c:if>
         
      <c:if test="${myBuy['0'].mem_id eq sessionScope.loginId}">
         <a href="./myinfo?shopIdx=${sessionScope.shopIdx}">개인정보 수정</a>
      </c:if>
      

   </div>
   
   <h3>구매내역 페이지</h3>
   
   <div id="tab">
      <table id="pag">
         <thead>
            <tr>
               <th></th>
               <th>상품정보</th>
               <th>구매일</th>
               <th>후기작성</th>
            </tr>                                    
         </thead>
         <tbody id="tr1">
            <c:forEach items="${myWallet}" var="wallet">
               <tr>
                  <th></th>
                  <th id="tt" onclick="location.href = './detail?idx=${wallet.pro_idx}'">${wallet.pro_name}</th>
                  <th>${wallet.wallet_date}</th>
                  <th><input id="${wallet.shop_idx}" class="buyreiv" type = 'button' value='후기 작성' onclick='writeReview(this)'/></th>
               </tr>         
            </c:forEach>
         </tbody>      
      </table>
   
   
   </div>
   
   
</body>
<script>
function writeReview(elem){
    console.log(elem.id);
    location.href = "./myreview?shopIdx=" + elem.id;
}


$(document).ready(function(){
   getShopInfo();
});


//상점정보 출력
function getShopInfo() {
   $
         .ajax({
            type : "GET",
            url : "./getShopInfo",
            data : {
               id : '${myBuy["0"].mem_id}',
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
                                   + '상점 평점 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
                                   + data.star_avg + " 점" + '<br/><br/>'
                                   + '상점 개설 날짜 &nbsp;&nbsp; '
                                   +date.toLocaleDateString("ko-KR") + '<br/><br/>'
                                   + '</h3>');
                    }else{
                   	 $('#shopInfo').append(
                                '<h3 id="hh3">상점 이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
                                      + data.dto.shop_name + '<br/><br/>'
                                      + '상품판매 개수 &nbsp;&nbsp;&nbsp; '
                                      + data.dto.shop_sellcount + '<br/><br/>'
                                      + '상점 평점 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
                                      + "0점" + '<br/><br/>'
                                      + '상점 개설 날짜 &nbsp;&nbsp; '
                                      +date.toLocaleDateString("ko-KR") + '<br/><br/>'
                                      + '</h3>');
                    }
               }
            },
            error : function(err) {
               console.log(err);
            }
         });
}

$(document).ready(function() {
      $.ajax({
         type : "post",
         url : "./mybuyCall",
         dataType : "json",
          data : {id : '${sessionScope.loginId}'}, 
         success : function (data) {
            console.log(data);
 
            
              $('#pag').paging({
                  limit: 5,
                  rowDisplayStyle: 'block',
                  activePage: 0,
                  rows: data.mybuyCall
                  });
         },
         error : function (error) {
            console.log(error);
         }
      });
   });
  
 
 

</script>
</html>