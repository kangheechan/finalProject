<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<!-- <script src="http://code.jquery.com/jquery-3.1.0.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
   <script src="./resources/js/paging.js" type="text/javascript"></script>
	<style>	

			.top{width:100%;height: 100px;background-color: #000;color:#fff;}
            .top_wrap{width:700px;height: 100px;margin:0 auto;}
            li{list-style: none;}
            *{margin:0px;padding:0px}
            .top_right ul li{float: left;padding-right: 10px}
            .top_left{float: left}
            .top_right{float: right}
            a{text-decoration:none}
            .top_right ul li a{color:#fff}
	

	</style>
</head>
<body>
<c:if test="${sessionScope.adminId != null}">
	 <div class="top">
               <div class="top_wrap">
            <div class="top_left">
                <h2 id="mainimg" onclick="location.href='./'"> 슈마니커</h2>
            </div>
               <div class="top_right">
                   <ul>
                       <li><h5 id="mainimg" onclick="location.href='./admin_menual'"> 슈마니커 관리자</h5></li>
                    <li><a href="adminmem">회원관리</a></li>
                       <li><a href="adminreply">후기관리</a></li>
                       <li><a href="a_notice">공지사항</a></li>
                       <li><a href="./adminlogout">로그아웃</a></li>
                    </ul>
               </div>
            </div>
          </div>
</c:if>

<c:if test="${sessionScope.adminId == null}">
	<h3>관리자만 접근 가능합니다.</h3>
</c:if>

</body>
<script>

	
</script>
</html>