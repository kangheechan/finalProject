<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<title>Insert title here</title>
		<style>
			 *{margin:0px;padding:0px;}
            .sangpum{
                border-bottom: 1px solid #212121; 
            }
            .san1{
                width: 300px;
                height: 300px;
                float: left;
                border: 1px solid #190707;
                margin: 10px;
            }
            .sann1{
                width: 300px;
                height: 300px; 
                float: left
                
            }
            .san2{
                float: left;
                width: 323px;
                height: 400px;
                margin: 10px;
                border: 1px solid #190707;
                    
            }
            .sann2{
                height: 200px;
                width: 323px;
                text-align: center;
                /*border:  1px solid #190707;*/
                
            }
            .sannn2{
                text-align: center;
            }
            .sna3{
                text-align: center;
            }
            
            .tr1{
                text-align: center;
            }
            
            .btn{
                width: 100px;
                height: 50px;
                font-size:15px;
                font-family: 'Nanum Gothic';
                color: #FFFFFF;
                line-height: 25px;
                text-align: center;
                background: black;
                border: solid 2px black;
                border-radius: 12px;
                
            }
		</style>
	</head>
	<body>
		<div class="sangpum"></div>
        <div>
	        <div style="margin:0 auto;width:690px;height:420px">
	            <div class="san1">
	                <img class="sann1" src="%EB%B3%B4%EB%85%B8%EB%B3%B4%EB%85%B8.PNG">
	            </div>&nbsp;&nbsp;&nbsp;&nbsp;
	            <div class="san2">
	                <table class="sann2">
	                    <tr class="tr1">
	                        &nbsp;<td colspan=2>상품이름</td>
	                    </tr>
	                    <tr>
	                        <td>판매자</td>
	                        &nbsp;<td >아이디 </td>&nbsp;<td><a href="./shop">상점으로 가기</td>
	                    </tr>
	                    <tr>
	                        <td>판매가(희망가격)</td>
	                        &nbsp;<td>5,0000원</td>
	                    </tr>
	                    <tr>
	                        <td>사이즈</td>
	                        &nbsp;<td>275</td>
	                    </tr>
	                    <tr>
	                        <td>찜 개수</td>
	                        &nbsp;<td>7</td>
	                    </tr>
	                </table>
	                <br/><br/><br/><br/><br/>
	                <div class="sna3">
	                    <button class="btn" onclick="javascript:cart()">찜</button>
	                    <button class="btn">상점가기</button>
	                    <button class="btn" onclick="javascript:phone()">연락하기</button>
	               </div>
            	</div>
       		</div> 
        </div>
	</body>
	<script>
		function cart() {
        	window.open("./prd_detailcart", "찜", "left=50, top=50, width=320, height=300, resizeable=no");
       }
	</script>
</html>