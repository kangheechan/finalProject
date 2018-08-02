<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f02b4f642a6f753a6e695053e9fa3a2&libraries=services"></script>
<title>Insert title here</title>
<style>
#myname {
   margin-left: 5%;
}

#mymenu {
   margin-top: 5%;
   border-bottom: 1px solid black;
}

#mymenu a {
   color: black;
   text-decoration: none;
   margin-left: 12%;
   font-size: large;
   font-style: inherit;
}

#mymenu a:hover {
   background-color: black;
   color: white;
}

#sel {
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
   filter: alpha(opacity = 50);
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
   border: 1px solid black;
}

a.btn-layerClose:hover {
   background-color: white;
   color: black;
   border: 1px solid black;
}

#shopname {
   margin-left: 28%;
}

#shopname2{
   background-color: black;
   border: 0px;
   color: white;
   cursor: pointer;
}

#shop_idx {
   /* display: none; */
   
}

#shop
   .pop-conts h4 {
   margin-left: 27%;
}

.btn-example {
   background-color: black;
   color: white;
   text-decoration: none;
}

.btn-example:hover {
   background-color: white;
   color: black;
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

   <c:if test="${sessionScope.shopState eq 0}">
      <div id="myname">
         <h2 align="center">상점이 없습니다. 상점을 개설 하여 주세요</h2>
         <h4 align="center">
            <a href="#layer2" class="btn-example">상점개설</a>
         </h4>
      </div>
   </c:if>

   <c:if test="${sessionScope.shopState eq 1 }">
      <div id="shopInfo"></div>
   </c:if>




   <div class="dim-layer">
      <div class="dimBg"></div>
      <div id="layer2" class="pop-layer">
         <div class="pop-container">
            <div class="pop-conts">
               <!--content //-->
               <h4 class="ctxt mb20" style="margin-left: 30%;">상점 이름을 입력 하세요</h4>
               <input id="shopname" type="text"> <input id="shopname2" type="button"
                  value="중복확인" onclick="shopOverlay()"/>
               </p>

               <div class="btn-r">
                  <a href="#" class="btn-layerClose">확인</a>
               </div>
               <!--// content-->
            </div>
         </div>
      </div>
   </div>
   <div id="map" style="width: 200px; height: 200px;"></div> 
   <c:if test="${sessionScope.shopState eq 1}">
      <div id="mymenu">
         <a href="./myproduct?shopIdx=${sessionScope.shopIdx}">상품</a> <a
            href="./mybuy?shopIdx=${sessionScope.shopIdx}">구매내역</a> <a
            href="./mycart?shopIdx=${sessionScope.shopIdx}">찜목록</a> <a
            href="./myreview?shopIdx=${sessionScope.shopIdx}">상점후기 </a> <a
            href="./myinfo?shopIdx=${sessionScope.shopIdx}">개인정보 수정</a>
      </div>
   </c:if>
</body>
<script>
   $(document).ready(function() {
	   if('${sessionScope.shopIdx ne null}'){
		   getShopInfo();  
	   }
   });

   $('.btn-example').click(function() {
      var $href = $(this).attr('href');
      layer_popup($href);
   });

   function layer_popup(el) {

      var $el = $(el); //레이어의 id를 $el 변수에 저장
      var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

      isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

      var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el.outerHeight()), docWidth = $(
            document).width(), docHeight = $(document).height();

      // 화면의 중앙에 레이어를 띄운다.
      if ($elHeight < docHeight || $elWidth < docWidth) {
         $el.css({
            marginTop : -$elHeight / 2,
            marginLeft : -$elWidth / 2
         })
      } else {
         $el.css({
            top : 0,
            left : 0
         });
      }

      $el.find('a.btn-layerClose').click(function() {
         if ($('#shopname').val() != '' && overChk == true) {
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.   
         }
         return false;
      });

      $('.layer .dimBg').click(function() {
         $('.dim-layer').fadeOut();
         return false;
      });

   }
   //상점이름 입력 후 확인 클릭시 값 INSERT
   $('.btn-layerClose').click(function() {

      if ($('#shopname').val() == '') {
         alert('상점명은 반드시 기입하셔야 합니다. 다시 입력하여 주세요');
      } else {
         if (!overChk) {
            alert("상점명 중복 체크를 실행 해 주세요!");
            $('#shopname').focus();//포커스 이동
         } else if ($('#shopname').val() != '') {
            $.ajax({
               type : "GET",
               url : "./setShopName",
               data : {
                  shopName : $('#shopname').val(),
                  id : '${sessionScope.loginId}'
               },
               dataType : "JSON",
               success : function(data) {
                  console.log(data);
                  if (data.success > 0) {
                     console.log('insert 성공');
                     upShopState();
                  }
               },
               error : function(err) {
                  console.log(err);
               }
            });
         }
      }
   });

   var overChk = false;//중복체크 값
   //상점명 중복 확인
   function shopOverlay() {
      $.ajax({
         type : "GET",
         url : "./shopOverlay",
         data : {
            shopName : $('#shopname').val()
         },
         dataType : "JSON",
         success : function(data) {
            console.log(data);
            if (data.overlay) {
               alert('이미 사용중인 상점명입니다. 다른 상점명을 입력해 주세요');
               $('#shopname').val('');
               $('#shopname').focus();
            } else {
               alert("사용 가능한 상점명 입니다.");
               $('#shopname').css('color', 'green');
               overChk = true;
            }
         },
         error : function(err) {
            console.log(err);
         }
      });
   }

   //상점개설 여부 상태값 UPDATE
   function upShopState() {
      $.ajax({
         type : "GET",
         url : "./upShopState",
         data : {
            id : '${sessionScope.loginId}'
         },
         dataType : "JSON",
         success : function(data) {
            console.log(data);
            if (data.success > 0) {
               console.log('상태값 수정완료');
               getMemShopState();
            }
         },
         error : function(err) {
            console.log(err);
         }
      });
   }

   //상점개설상태 값 얻기
   function getMemShopState() {
      $.ajax({
         type : "GET",
         url : "./getMemShopState",
         data : {
            id : '${sessionScope.loginId}'
         },
         dataType : "JSON",
         success : function(data) {
            console.log(data);
            if (data.result != null) {
               console.log(data.result);
               console.log('${sessionScope.shopState}');
               alert('상점이 개설되었습니다.');
               getShopIdx();
            }
         },
         error : function(err) {
            console.log(err);
         }
      });
   }

   //상점정보 출력
   function getShopInfo() {
      $
            .ajax({
               type : "GET",
               url : "./getShopInfo",
               data : {
                  id : '${sessionScope.loginId}',
                  shop_idx : "${sessionScope.shopIdx}"
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

   //상점idx 세션값 얻기
   function getShopIdx() {
      $.ajax({
         type : 'GET',
         url : './getShopIdx',
         data : {
            id : '${sessionScope.loginId}'
         },
         dataType : 'JSON',
         success : function(data) {
            console.log(data);
            console.log(data.shopIdx);
            console.log('${sessionScope.shopIdx}');
            testInsert(data.shopIdx);
         },
         error : function(err) {
            console.log(err);
         }
      });
   }

   function testInsert(shopIdx) {
      $.ajax({
         type : 'GET',
         url : './testInsert',
         data : {
            id : '${sessionScope.loginId}',
            shopIdx : shopIdx
         },
         dataType : 'JSON',
         success : function(data) {
            console.log(data);
            if (data.result > 0) {
               console.log("test값 삽입 성공");
               location.href = './mypage?id=' + '${sessionScope.loginId}';
            }
         },
         error : function(err) {
            console.log(err);
         }
      });
   }
</script>

</html>