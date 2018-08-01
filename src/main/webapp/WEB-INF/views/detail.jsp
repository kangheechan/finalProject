<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
          margin-top: -19.5%;
   }
   
   #mainimg2{
      width: 97%;
      height: 105%;
      border: 1px solid black;
      margin-left: 1%;
      margin-top: 2%;
   }
   

   #mainParent{
    margin-left: 12%;
    width: 37%;
    height: 200px;   
    margin-top: 7%; 
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
      margin-left: -0.15%;
      border: 0px;
   }
   #price{
      margin-left: -0.15%;
      border: none;
      border-bottom: 1px solid black;
      padding-bottom: 21px;
   }
   #size{
      margin-left: 1.65%;
      border: 0px;
   }
   
    #brand{
      margin-left: 1.7%;
      width: 7.4%;
      border: 0px;
   }
   
   #gender{
      margin-left: 2.4%;
      width: 7.4%;
      border: 0px;
   }
   
   #category{
      margin-left: 2.4%;
      width: 7.4%;
      border: 0px;
   }
  
  #memo{
             margin-left: 15%;
           margin-top: 3%;
   }
   
   #subimg2{
      width: 900px;
      height: 300px;
      margin-top: -11%;
   }
   
   #proText{
         border-top: 2px solid black;
         border-bottom: 0px;
         border-left: 0px;
         border-right: 0px;
   }
   
   #addr{
        margin-left: 1%;
      border: 0px; 
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
      margin-top: 2%;
      width: 900px;
      height: 250px;
   }
   #cart1{
         margin-top: 15%;
    margin-left: 23%;
    position: relative;
    z-index: 1;
    width: 56%;
    height: 25px;
    background-color: #e6526c;
    color: white;
    border: 0;
    cursor: pointer;
    border: 0;
    font-size: 10px;
    
   }
   #cart1:hover{
     font-size: 12px;
   }
   
    #cart2{
     margin-top: 15%;
    margin-left: 23%;
    position: relative;
    z-index: 1;
    width: 56%;
    height: 25px;
    background-color: #e6526c;
    color: white;
    border: 0;
    cursor: pointer;
    border: 0;
    font-size: 10px;
    
   }
   #cart2:hover{
    font-size: 12px;
   }
   
   #mypage1{
      position: absolute;        
      width: 8.1%;
      background-color: black;
      margin-left: -0.8%;
      color: white;
       border:0;
       cursor: pointer;   
       height: 35px;  
       border: 0; 
   }
   #mypage1:hover{
      background-color: white;
      color: black;
      border: 1px solid black; 
   }
   .title{
   margin-left:80%;
   font-size: 25px;
   font-weight:bold;
   }
   
   #add1{
      position: absolute;
    margin-top: 70%;
    margin-left: 75%;
    width: 77%;
    height: 21.7px;
    background-color: black;
    font-size: 10px;
    color: white;
    cursor: pointer;
   } 
   #add1:hover{
      background-color: white;
      color: black;
      font-size: 12px;
   }
   #proid{
      margin-top: 6.5%;
      margin-left: 20.7%;
      position: absolute;      
      width: 300%;
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
  border: 0px;
  background-color: black;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
  text-decoration: none;
}

a.btn-layerClose:hover {
  border: 0px;
  background-color: white;
  color: black;

}
 .content{
   width:1232px;
   height:1000px;
   margin:0 auto;
   border:none;
   position:relative; 
   margin-top :55px;
   }
   #heart {
    position: absolute;
        top: 31%;
    left:59.2%;
    width: 100px;
    height: 90px;
    margin:0 auto;
    animation:none;
}
   #call{
    position: absolute;
       top: 25.9%;
    left:65.6%;
    width: 100px;
    height: 90px;
    margin:0 auto
   }
#heart:before,
#heart:after {
    position: absolute;
    content: "";
    left: 50px;
    top: 0;
    width: 50px;
    height: 80px;
    background: #e6526c;
    -moz-border-radius: 50px 50px 0 0;
    border-radius: 50px 50px 0 0;
    -webkit-transform: rotate(-45deg);
       -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
         -o-transform: rotate(-45deg);
            transform: rotate(-45deg);
    -webkit-transform-origin: 0 100%;
       -moz-transform-origin: 0 100%;
        -ms-transform-origin: 0 100%;
         -o-transform-origin: 0 100%;
            transform-origin: 0 100%;
}
#heart:after {
    left: 0;
    -webkit-transform: rotate(45deg);
       -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
         -o-transform: rotate(45deg);
            transform: rotate(45deg);
    -webkit-transform-origin: 100% 100%;
       -moz-transform-origin: 100% 100%;
        -ms-transform-origin: 100% 100%;
         -o-transform-origin: 100% 100%;
            transform-origin :100% 100%;
}
@keyframes heartbeat
{
  0%
  {
    transform: scale( .85 );
  }
  20%
  {
    transform: scale( 1 );
  }
  40%
  {
    transform: scale( .85 );
  }
  60%
  {
    transform: scale( 1 );
  }
  80%
  {
    transform: scale( .85 );
  }
  100%
  {
    transform: scale( .85);
  }
}
   
   
</style>
</head>
<body>
   <c:if test="${sessionScope.pathSession ne null}">
      <c:remove var="pathSession" scope="session"/>
   </c:if>

   <jsp:include page="./head.jsp"/>
   <div class="content">
   <%@include file="./fly.jsp"%>
   <div id="mainParent" align="center">           
         <c:if test="${product.pro_state eq '판매중'}">
              <img width="300px" height="250px" src="resources/upload/${product.img_main}"/>   
          </c:if>
          <c:if test="${product.pro_state eq '판매완료'}">
              <img width="300px" height="250px" src="resources/soldOut.jpg"/>   
          </c:if>                 
         <input id="pro_idx" class="proo" type="hidden" value="${product.pro_idx}"/>
   </div>
   
   <div id="proid">
         <input type="button" value="${product.mem_id}님의 상점가기" id="mypage1" 
            onclick="location.href = './myproduct?shopIdx=${product.shop_idx}'">
   </div>

   <div id="proInfo">
   
     <input id="cartState" type="hidden" value='<c:forEach items="${cartList}" var="cart">${cart.cart_idx} / ${cart.pro_idx} / ${cart.mem_id} </br> </c:forEach>'/>
     
     <input class="title" id="proname" type="text" value="${product.pro_name}" readonly="readonly"/><br/><br/>    
      <input class="title" id="price" type="text" value="${product.pro_price}원" readonly="readonly"/><br/><br/>
      
      
    <c:if test="${product.brand_idx eq 1}">
       <strong>브랜드</strong><input id="brand" type="text" value="NIKE" readonly="readonly"/><br/><br/> 
    </c:if>
    <c:if test="${product.brand_idx eq 2}">
       <strong>브랜드</strong><input id="brand" type="text" value="Adidas" readonly="readonly"/><br/><br/> 
    </c:if>         
    <c:if test="${product.brand_idx eq 3}">
       <strong>브랜드</strong><input id="brand" type="text" value="FILA" readonly="readonly"/><br/><br/> 
    </c:if>
    <c:if test="${product.brand_idx eq 4}">
       <strong>브랜드</strong><input id="brand" type="text" value="Reebok" readonly="readonly"/><br/><br/> 
    </c:if>
    <c:if test="${product.brand_idx eq 5}">
       <strong>브랜드</strong><input id="brand" type="text" value="Descente" readonly="readonly"/><br/><br/> 
    </c:if>
    
    <c:if test="${product.gender_idx eq 1}">
       <strong>성별</strong><input id="gender" type="text" value="남" readonly="readonly"/><br/><br/>
    </c:if>
    <c:if test="${product.gender_idx eq 2}">
       <strong>성별</strong><input id="gender" type="text" value="여" readonly="readonly"/><br/><br/>
    </c:if>
    
    <c:if test="${product.shoes_idx eq 1}">
       <strong>종류</strong><input id="category" type="text" value="운동화" readonly="readonly"/><br/><br/>
    </c:if>
    <c:if test="${product.shoes_idx eq 2}">
       <strong>종류</strong><input id="category" type="text" value="캔버스화" readonly="readonly"/><br/><br/>
    </c:if> 
    <c:if test="${product.shoes_idx eq 3}">
       <strong>종류</strong><input id="category" type="text" value="구두" readonly="readonly"/><br/><br/>
    </c:if>
    <c:if test="${product.shoes_idx eq 4}">
       <strong>종류</strong><input id="category" type="text" value="하이힐" readonly="readonly"/><br/><br/>
    </c:if>
    <c:if test="${product.shoes_idx eq 5}">
       <strong>종류</strong><input id="category" type="text" value="슬리퍼" readonly="readonly"/><br/><br/>
    </c:if>
                                               
      <strong>사이즈</strong><input id="size" type="text" value="${product.pro_size}" readonly="readonly"/><br/><br/> 
      
       <strong>거래지역</strong><input id="addr" type="text" value="${addr}" readonly="readonly"/><br/><br/> 
   </div>
   
  
   
  
    
    <div id="memo">
    <br/>
          <div id="subimg2">
          <c:if test="${subImg['0'] ne null}">
             <c:forEach items="${subImg}" var="sub">
                   <img width="290px" height="290px" src="resources/upload/${sub}"/> 
             </c:forEach>
          </c:if>
          <c:if test="${subImg['0'] eq null }">
                <h3>서브이미지가 없는 상품.</h3>
          </c:if>
           </div>   
           <h4 style="height: 0px">상품내용</h4>
          <textarea id="proText" rows="10" cols="60" readonly="readonly">${product.pro_memo}</textarea>  
    </div>
    <div id="heart">
 	   <input type="button" value="찜 하기 ${cartcount}" id="cart1" onclick="cartInsert()"/>
    </div>
    
    <div id="call">
 	   <a href="#layer2" id="add1" class="btn-example" style="text-decoration: none; font-size: 12px; text-align: center;">연락하기</a> 
    </div>             
         
<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts" style="text-align: center;">
                <!--content //-->
                <p class="ctxt mb20">${product.mem_id}<br>
                    <h4>${product.mem_phone}</h4>
                <p></p>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose" onclick="history.back()">닫기</a>
                </div>
                <!--// content-->
            </div>
        </div>
   </div>
   </div>
</body>

<script>

console.log($('#cartState').val());
var state = $('#cartState').val();

if(state.indexOf('${product.pro_idx}') != -1 && state.indexOf('${sessionScope.loginId}') != -1){
   console.log("값이 있다");
   
   $.ajax({
        type:"post",
        url:"./getCartIdx",
        data:{
           id:'${sessionScope.loginId}',
           proIdx:'${product.pro_idx}'
        },
        dataType:"JSON",
        success:function(data){
          console.log(data);
          console.log("인덱스" + data.idx);
          $('#cart1').val('찜 취소'+'${cartcount}');
          $('#cart1').css('color', 'yellow');
           $('#cart1').attr("id", "cart2");
          $('#cart2').attr("onclick", '');
          $('#heart').css('animation', 'heartbeat 1s infinite');          
              $('#cart2').click(function(){
           cartDel(data.idx);
              }); 
        },
        error : function(err){
           console.log(err);
        }
     });   
}

function cartInsert(){
   $.ajax({
        type:"post",
        url:"./cartInsert",
        data:{
           id:'${sessionScope.loginId}',
           shopIdx:'${product.shop_idx}',
           proIdx:'${product.pro_idx}'
        },
        dataType:"JSON",
        success:function(data){
           if(data.success > 0){
              console.log(data);
              console.log(data.cartIdx);
 
              $('#cart1').val('찜 취소'+'${cartcount}');
              $('#cart1').attr("id", "cart2");
               $('#cart2').attr("onclick", '');
              $('#cart2').css("color", "yellow");
             location.reload();
              $('#cart2').click(function(){
                 cartDel(data.cartIdx);
                 
              });
           }
        },
        error : function(err){
           console.log(err);
        }
     });
}

function cartDel(cartIdx){
       $.ajax({
           type:"post",
           url:"./cartdel",
           data:{
              cartdel : cartIdx
           },
           dataType:"JSON",
           success:function(data){
              if(data.success > 0){
                 console.log(data.success); 
              
                 $('#cart2').val('찜 하기'+'${cartcount}');
                 $('#cart2').attr("id", "cart1");
                 $('#cart1').attr("onclick", 'cartInsert()'); 
                 $('#cart1').css("color", "white");
                 location.reload();
              }
           },
           error : function(err){
              console.log(err);
           }
        });
}

$('.btn-example').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});

function layer_popup(el){

    var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

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
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

}

$(document).ready(function () {
   $.ajax({
      url:"./RecentPrd",
      type:"get",
      dataType : "json",
      data : {
         idx : $("#pro_idx").val(),
         mem_id :"${sessionScope.loginId}"
      },
      success: function (data) {
         console.log(data)
         if(data.length >3){
         $.ajax({
            url : "./RecentCnt",
            type : "get",
            dataType : "json",
            data :{
               mem_id :"${sessionScope.loginId}"
            },
            success: function (data) {
               console.log(data)
               
            }
         });
        }
      }
      
   });
});


</script>
</html>