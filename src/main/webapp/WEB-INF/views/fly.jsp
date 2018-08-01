<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
   <head>
      	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
		<script src="./resources/js/paging.js" type="text/javascript"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>슈마니커</title>
      <style>
         .fly{
         display: block;
	    right: -90px;
	    top: 0px;
	    position: absolute;
	    z-index: 9999;
	    width: 82px;
	    background-color: #ffffff;
	    height: 200px;
	    margin-top: 4%;
	    border: 1px solid;
          
          }
         
            .divimg{border: 1px solid black; text-align: center;  margin-top: 15px;}
         
         .imgbtn{
            width: 80px;
            height: 66px;
            margin-top: 56px;
            text-align: center;
            margin : 0 auto;
            
         }
         .the{
            width: 80px;
		    height: 66px;
		    text-align: center;
		    margin-top: 67px;
		    border: 1px solid aqua;
         }
         .noview{width:75px}
         .img{
     	    width: 82px;
		    height: 65px;
		    text-align: center;
		    margin-top: 1px;
		    }
    
         .C_totop{
         width: 50px;
	    height: 48px;
	    background-color: black;
	    color: #fff;
	    border-radius: 24px;
	    text-align: center;
	    line-height: 47px;
	    z-index: 999999;
	    opacity: .8;
	    cursor: pointer;
	    font-size: 14px;
	    margin: 0 auto;
	    margin-left: 13px;
	    margin-top: -49px;
         }
         .C_totop:hover{transition:all .3s ease-out;}
         
      </style>
   </head>
   <body>
       <div class="fly">
          <div class="C_totop">
                    <span>TOP</span>
                </div>
             
          <div class ="img"></div>
          <c:if  test ="${sessionScope.loginId eq null}">
             <img class=noview src="resources/noview.jpg">
          </c:if>
          <a href="https://thecheat.co.kr/rb/?mod=_search"><img class="the" src="resources/theCheat.jpg" /></a> 
       </div>
      <%--  <input id="pro_idx" class="proo" type="hidden" value="${product.pro_idx}"/> --%>
   </body>
   <script>
          $(window).scroll(function(){
        
          var sct = $(this).scrollTop();

          $('.fly').stop().animate({
           'top':sct

          },500)

         })
         
         $(function(){
           $('.C_totop').click(function(){
               $('body,html').animate({
                'scrollTop':0
               },1500)
           })

          var spotarr = [];

          $('body section').each(function(i,e){
           spotarr.push($(e).offset().top)
          })


          $(window).scroll(function(){
           var sct= $(window).scrollTop()  
           $('body section').each(function(i,e){
            bg(sct)
           })
          })



          $(window).trigger('scroll')
          function bg(x){
           if(x > 200){
            $('.C_totop').css({
             'opacity':'1'
            })
           }else{
            $('.C_totop').css({
             'opacity':'0'
            })
           }
          }
          $('.C_totop').on({
           mouseenter:function(){
            $(this).css({
             'background-color':'#e2d056'
            })
           },
           mouseleave:function(){
            $(this).css({
             'background-color':'#000'
            })
           }
          })
        })
         
         var loginId = "${sessionScope.loginId}";
         
         $(document).ready(function () {
         $.ajax({
            type : "post",
            url : "./recentList",
            dataType : "json",
            /* data : {
               mem_id : loginId
            }, */
            success : function (data) {
               console.log(data);
               printList(data.list);
            },
            error : function (error) {
               console.log(error);
            }
         });
      });
          
      //받아온 리스트
       function printList(list) {
         console.log("최근 어팬트 여부");
         var content = "";
         list.forEach(function(item, idx) {
                     content += "<div>";
                      content+="<a href='./detail?idx="+item.pro_idx+"'><img class='imgbtn' src='resources/upload/"+item.img_main+"'/></a>";
                    content +="</div>";
         });
           $(".img").empty();
            $(".img").append(content);
            
      } 
     
   </script>
</html>