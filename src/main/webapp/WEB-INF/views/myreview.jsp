<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="resources/jquery-1.11.3.min.js"></script>
<script src="resources/star.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f02b4f642a6f753a6e695053e9fa3a2&libraries=services"></script>

<title>슈마니커</title>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('resources/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
.star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover{background-image: none;}
.star-input>.input>label[for="1"]{width:30px;z-index:5;}
.star-input>.input>label[for="2"]{width:60px;z-index:4;}
.star-input>.input>label[for="3"]{width:90px;z-index:3;}
.star-input>.input>label[for="4"]{width:120px;z-index:2;}
.star-input>.input>label[for="5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}


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
      margin-left: 5%; 
      margin-top: 1%;
   }
   #tab table{
      width: 80%;
   } 
   #myReview tr{
      cursor: pointer;
      height: 
   }
   #myReview tr:hover {
      background-color: #EAEAEA;
   }
   
   /* #reviewDel{
      margin-left: 85.5%;  
      margin-top: 15%;      
      position: absolute;
      background-color: white;
      outline: 0;
      border: 0;
      font-size: 15px;  
   }
   #reviewDel:hover {
      background-color: black;
      color: white;
      outline: 0;
      border: 0;
   } */
   #rev1{
      margin-left: 20%; 
      word-spacing: 10px; 
   }
   #sreply_content{
      width: 50%;
   }
   #selrev{
      width: 5%;
      text-align: center;
   }
   
   #reviewWrite{
      margin-left: 70%;  
      margin-top: 0%;      
      position: absolute;
      background-color: black;
      color: white;
      outline: 0;
      border: 0;
      font-size: 15px;  
   }
   #reviewWrite:hover{
      background-color: white;
      color: black;
      outline: 0;
      border: 1px solid black;
   }
   #myReview{
      text-align: center;
   }
   .reviewdel{
      border: none;
      background: transparent;

   }
   #reviewcontent{
      border : none;
   }
  
   .reviewupdate{
   display:none;
   }
   #starRateup{
   display:none;
   }
   #shop_idx{
   display:none;
   }
   #buyerOnly{
   display:none;
   }
   .updateStarRate{
   display:none;
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

	    
	 	#pro1{
   	
	border: 2px solid black;    
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    border-bottom: 1px solid white;    
}
</style>
</head>
<body>

<%@include file="./head.jsp"%>
   

      <div id="shopInfo"></div>
      <div id="map" style="width: 200px; height: 200px;"></div>

   <div id="mymenu">
      <c:if test="${myReview['0'].shop_idx eq sessionScope.shopIdx}">
         <a href="./myproduct?shopIdx=${sessionScope.shopIdx}">상품</a>
      </c:if>
      
      <c:if test="${myReview['0'].shop_idx ne sessionScope.shopIdx}">
         <a href="./myproduct?shopIdx=${myReview['0'].shop_idx}">상품</a>
      </c:if>
      
      <c:if test="${myReview['0'].mem_id eq sessionScope.loginId}">
         <a href="./mybuy?shopIdx=${sessionScope.shopIdx}">구매내역</a>
      </c:if>
      
      <c:if test="${myReview['0'].mem_id eq sessionScope.loginId}">
         <a href="./mycart?shopIdx=${sessionScope.shopIdx}">찜목록</a>
      </c:if>
      
      <c:if test="${myReview['0'].shop_idx eq sessionScope.shopIdx}">
         <a href="./myreview?shopIdx=${sessionScope.shopIdx}" id="pro1">상점후기</a>
      </c:if>
      
      <c:if test="${myReview['0'].shop_idx ne sessionScope.shopIdx}">
         <a href="./myreview?shopIdx=${myReview['0'].shop_idx}" id="pro1">상점후기</a>
      </c:if>
         
      <c:if test="${myReview['0'].mem_id eq sessionScope.loginId}">
         <a href="./myinfo?shopIdx=${sessionScope.shopIdx}">개인정보 수정</a>
      </c:if>
      

   </div>
   
   <h3>상점후기 내역</h3>
   <div id=buyerOnly>
   <button id="reviewWrite">글등록 </button>
   
   <div id="rev1">
      후기  <input type="text" id="sreply_content"/> 
      평점  <select id="starRate">
            <option selected="selected">5</option>
            <option>4</option>
            <option>3</option>
            <option>2</option>
            <option>1</option>
         </select>
      
      
   </div>
   </div>
   
   <div id=tab>
      <table>
         <thead>
            <tr>
               <th>구매자</th>
               <th>후기내용</th>
               <th>날짜</th>
               <th>평점</th>
               <th></th>
            </tr>
         </thead>
         <tbody id="myReview">
         
         </tbody>
      </table>      
   </div>
   
   
</body>
<script>
var myreviewcnt;
var obj = {};//초기화   
obj.type = "post";
obj.dataType = "json";
obj.enctype = "multipart/form-data";
obj.data={};
obj.error = function(e) {
   console.log(e)
};

$(document).ready(function() {
   getShopInfo();
   listPrint();
});

//상점정보 출력
function getShopInfo() {
   $.ajax({
         type : "GET",
         url : "./getShopInfo",
         data : {
            id : "${myReview['0'].mem_id}",
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
	 var shop_idx = "";
      //이 상점의 구매자인지 확인
      function writerCheck(){
         var login_id = "${sessionScope.loginId}";
         shop_idx = "${param.shopIdx}";
         
         console.log("로그인 아이디: "+login_id);
         console.log("샵 번호: "+shop_idx);
         
             $.ajax({
                type : "POST",
                url : "./writerCheck",
                data : {
                   login_id : login_id,
                   shop_idx: shop_idx
                },
                dataType : "JSON",
                success : function(data) {
                   console.log(data);
                   console.log(data.list.length);
                   console.log(data.reviewcnt);
                   if(data.list.length != 0){
                      $("#buyerOnly").css("display","inline");
                      if(data.reviewcnt >= data.list.length){
                         $("#buyerOnly").css("display","none");
                         alert('이미 후기를 작성하셨습니다.');
                      }
                   }
                },
                error : function(err) {
                   console.log(err);
                }
             });
         /* obj.url = "./writerCheck";
         obj.data = {};
         obj.data.shop_idx ="${myReview['0'].shop_idx}";
         obj.data.login_id = "${sessionScope.loginId}";
         
         obj.success = function(data){
            console.log(data);
            console.log(data.list.length);
             console.log(data.reviewcnt.length);
            if(data.list.length != 0){
               $("#buyerOnly").css("display","inline")
                if( data.list.length <=data.reviewcnt.length){
                  $("#buyerOnly").css("display","none")
               }
            }
         ajaxCall(obj); };*/
     }
    //후기 리스트 출력
      function listPrint() {
         
         obj.url = "./reviewList";
         obj.data = {};
         obj.data.shop_idx ="${myReview['0'].shop_idx}";
         obj.success = function(data) {
            console.log(data);
            writerCheck();
            var content = "";
            var totalscore = 0;
            var reviewcnt =0;
            var avgRate = 0
            data.reviewList.forEach(function(item, index) {
                     content += "<tr>";
                   content += "<td id='reviewWriter'>"+item.mem_id+"</td>";
                   content += "<td><input id ='reviewcontent'  type =text class="+item.sreply_idx+" value='"+item.sreply_content+"' readonly/></td>";
                   var date = new Date(item.sreply_date);
                   content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
                   content +="<td>"
                            +"<span class='star-input'>"
                           +"<span class='input' id='starPoint"+item.sreply_idx+"'>"
                            +"<input type='radio' name="+item.sreply_idx+" id="+item.sreply_star+" checked>"
                            +"<label for="+item.sreply_star+">"+item.sreply_star+"</label>"
                            +"</span>"
                            +" <select class= updateStarRate id='starRateup"+item.sreply_idx+"' >"
                              +"<option selected='selected'>5</option>"
                             +"<option>4</option>"
                             +"<option>3</option>"
                             +"<option>2</option>"
                             +"<option>1</option>"
                             +"</select>"
                             +"<output id='out"+item.sreply_idx+"' for='star-input'><b>"+item.sreply_star+"</b>점</output>"   
                           +"</span>"
                           +"</td>";
                        totalscore += item.sreply_star;
                        reviewcnt += 1;
                        
                   if(item.mem_id=='${sessionScope.loginId}'){
                      
                      content += "<td><input id="+item.sreply_idx+" type=button class='reviewdel' value='삭제'/></td>"
                      content += "<td ><input id="+item.sreply_idx+" name=update"+item.sreply_idx+" type=button class='reviewupdate'  value='완료'/>"
                                     +"<input id="+item.sreply_idx+" name=form"+item.sreply_idx+" type=button class='reviewupdateform'  value='수정'/>"
                                        + "</td>";
                      
                      content += "</tr>";
                   }else{
                      content += "</tr>";
                   }
                   console.log(totalscore/reviewcnt);
                   avgRate=totalscore/reviewcnt;
                   
                   
               });

         $("#myReview").empty();
         $("#myReview").append(content);
         $("#avgRate").empty();
         $("#avgRate").append("상점 평균점수:"+Number(avgRate).toFixed(1)+"점");
         
         
         }            
            
             ajaxCall(obj); 
         }
            //후기 작성
          $("#reviewWrite").click(function() {
             if($("#sreply_content").val()==""){
               alert("댓글 내용을 입력해주세요");
            }
            else{
               obj.url = "./reviewWrite";
                  obj.data = {};
                  obj.data.shop_idx = shop_idx;
                  obj.data.mem_id = '${sessionScope.loginId}';
                  obj.data.sreply_content = $("#sreply_content").val();
                  obj.data.sreply_star=$("#starRate option:selected").val();
                  console.log($("#shop_idx").text()+"/"+obj.data.mem_id+"/"+$("#sreply_content").val());
                  obj.success = function(data) {
                     if (data.success > 0) {
                        alert("댓글쓰기에 성공 했습니다.");
                        location.reload();
                        } else {
                        alert("댓글쓰기에 실패 했습니다.");
                     }
                  }
               }
               ajaxCall(obj); 
            }); 
         /*후기  삭제 */
         $(document).on('click','.reviewdel', function() {
            $.ajax({
               type : "post",
               url : "./reviewdel",
               data : {
                  delreply : $(this).attr('id')
               },
               dataType : "json",
               success : function(data) {//인자 값은 서버에서 주는 메세지
                  if (data.success) {
                     //listPrint(data.list)
                     alert("삭제 성공")
                     location.reload();
                  } else {
                     alert("삭제 실패")
                  }
               }
            });
            ajaxCall(obj);
         });
         
         
         //후기 수정
         $(document).on('click', '.reviewupdateform', function() {   
           var upcomment = $(this).attr("id");
           console.log(upcomment);
           $("input[class=" + upcomment + "]").css("border","1px solid #004C63");
           $("input[class=" + upcomment + "]").attr("readonly",false);
           $("#starPoint"+upcomment).css("display","none");
           $("#starRateup"+upcomment).css("display","inline");
           $("#out").css("display","none");
           
            $("input[name= form"+upcomment+"]").css("display","none");
            $("input[name= update"+upcomment+"]").css("display","inline"); 

       $(document).on('click', '.reviewupdate', function() {
          console.log("수정");
             var sreply_idx = $(this).attr('id');
           
             var reviewcontent = $("input[class="+sreply_idx+"]").val();
             //var time=$("inpput[class=" +upcomment+"]").id;
             //var content= $(".edit").val();   

             obj.url = "./reviewupdate";
             obj.data = {};
             obj.data.sreply_idx = sreply_idx;
             obj.data.reviewcontent = reviewcontent;
             obj.data.sreply_star=$("#starRateup"+upcomment+" option:selected").val();
             console.log(obj.data.sreply_idx+"/"+obj.data.reviewcontent);
             obj.success = function(data) {
                console.log(data);
                if (data.success) {
                   alert("수정에 성공하였습니다.")
                   location.reload();
                } else {
                   alert("수정 실패")
                }

             };

             ajaxCall(obj);
          
          });
       });

         
            function ajaxCall(param) {
                console.log(param);
                $.ajax(param);
             }

   
</script>
</html>