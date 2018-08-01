<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
		<script src="./resources/js/paging.js" type="text/javascript"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>슈마니커</title>
   <style>
	  .di{
		width: 500px;
		height: 500px;
		position: relative;
		margin: 0 auto;
		top: 5px;
		}   
   
      #wrapper {
         width: 1000px;
         margin-left: 15%;
         margin-top: 1%; 
      }
      #mainImg {
         margin-top: 1%;
         width: 1100px;
         height: 300px;
         border-bottom: 1px solid black;
         
      }
      .newImg {
         
         width: 1200px;
         height: 200px;
         
      }
      .new {
         
         float: left;
         width: 200px;
         height: 200px;
         border: 1px solid black;
         margin: 1%;
      }
      .new:hover {
         cursor: pointer;
         background-color: black;
      }
      #oper{
         cursor: pointer;
      }
      #oper:hover {         
         cursor: pointer;
      }
      #mainImg a:hover{
         background-color: #EAEAEA;
      }
      
      #sel3{
         margin-left: 0%;  
         margin-top: 0%;      
         position: absolute;
         background-color: black;
         color: white;
         outline: 0;
         border: 0;
         font-size: 15px;  
      }
      #sel3:hover{
         background-color: white;
         cursor: pointer;
         color: black;
         outline: 0;
         border: 0;
      }
      
      .imgbtn{
				width: 190px;
   				height: 190px;
		}
		
		#listTable{
				border: 0px;
			    margin-left: -50%;
 			    width: 219%;
    			height: 105%;
    			border-spacing: 20px;
				border-collapse: collapse;
				padding: 10 10;
				text-align: center;
			} 
			
			#list tr{
			 float: left;
			 height: 48%;
  			 width: 20%;
			}
			#list td:hover {
               background-color: #EAEAEA;
              
            }
			#list td{
				font-size: 15px;
				 
			}
			
			#list a{
				color: black;
			}
			/*링크가 걸린 상황*/
		    #list a:link{
		        text-decoration: none;
		        color: black;
		    }    
		   	  
		    /*방문 후 */
		    #list a:visited{
		        text-decoration: none;
		        color: gray;
		    }
		    
		    .paging-nav {
			  text-align: center;
			  padding-top: 15px;
			  width: 50%;
   			  margin-left: 25%;
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
			  background: #187ed5;
			  font-weight: bold;
			}
			
			#listTable td,th{
				border-collapse: collapse;
				padding: 18px;
				font-size:13px;
			}

		
   </style>
</head>
<body>
   <%@include file="./head.jsp"%>
   
   <div id="wrapper">

      <div id="mainImg" style="height: 200;" class="cycle-slideshow"; data-cycle-loader="wait";    data-cycle-timeout="1000">
      	<form name=brandform>
         <a><input type="checkbox" onclick="javascript:checkdbrand(0)" id="oper" name=brand value="1">나이키</a>
         <a><input type="checkbox" onclick="javascript:checkdbrand(1)" id="oper" name=brand value="2">아디다스</a>
         <a><input type="checkbox" onclick="javascript:checkdbrand(2)" id="oper" name=brand value="3">휠라</a>
         <a><input type="checkbox" onclick="javascript:checkdbrand(3)" id="oper" name=brand value="4">리복</a>
         <a><input type="checkbox" onclick="javascript:checkdbrand(4)" id="oper" name=brand value="5">데쌍트</a></br></br></br></br>
        </form>   
              
         <form name=genderform>
         <a><input type="checkbox" onclick="javascript:checkdgender(0)" id="oper1" name=gender value="1">남</a>
         <a><input type="checkbox" onclick="javascript:checkdgender(1)" id="oper1" name=gender value="2">여</a></br></br></br></br>
         </form>
         
         <form name=shoesform>
         <a><input type="checkbox" onclick="javascript:checkdshoes(0)" id="oper2" name=shoes value="1">운동화</a>
         <a><input type="checkbox" onclick="javascript:checkdshoes(1)" id="oper2" name=shoes value="2">캔버스화</a>
         <a><input type="checkbox" onclick="javascript:checkdshoes(2)" id="oper2" name=shoes value="3">구두</a>
         <a><input type="checkbox" onclick="javascript:checkdshoes(3)" id="oper2" name=shoes value="4">샌들</a>
         <a><input type="checkbox" onclick="javascript:checkdshoes(4)" id="oper2" name=shoes value="5">하이힐</a>
         <a><input type="checkbox" onclick="javascript:checkdshoes(5)" id="oper2" name=shoes value="6">슬리퍼</a></br></br></br></br>
        </form>
        
         <input type="button" id="sel3" value="완료">
      </div>
      <br />
      
      <div class="di">
				<table id="listTable">
				<thead class="th">
					</thead>
					<tbody id="list">
					</tbody>
				</table>
	  </div>
      <br/>
      </div>
   
</body>
<script>

var obj = {};//초기화   
obj.type = "post";
obj.dataType = "json";
/* obj.enctype = "multipart/form-data"; */
obj.error = function(e) {
   console.log(e)
};
 
 function checkdbrand(cb) {
		for (j = 0; j < 4; j++) {
		if (eval("document.brandform.brand[" + j + "].checked") == true) {
			document.brandform.brand[j].checked = false;
			if (j == cb) {
				document.brandform.brand[j].checked = true;
		         }
	      }
	   }
	}
 function checkdgender(cb) {
		for (j = 0; j < 1; j++) {
		if (eval("document.genderform.gender[" + j + "].checked") == true) {
			document.genderform.gender[j].checked = false;
			if (j == cb) {
				document.genderform.gender[j].checked = true;
		         }
	      }
	   }
	}
 function checkdshoes(cb) {
		for (j = 0; j < 5; j++) {
		if (eval("document.shoesform.shoes[" + j + "].checked") == true) {
			document.shoesform.shoes[j].checked = false;
			if (j == cb) {
				document.shoesform.shoes[j].checked = true;
		         }
	      }
	   }
	}

 		$("#sel3").click(function() {
 			var brand = $("#oper:checked").val();
 			var gender = $("#oper1:checked").val();
 			var shoes = $("#oper2:checked").val();
 			
 			$.ajax({
                type : "post",
                url : "./categoryList",
                data : {
                	brand: brand,
                	gender: gender,
                	shoes: shoes
                },
                dataType : "json",
                success : function(data) {
                    console.log(data);
                    console.log(data.list);
                    console.log(data.list.length);
                    var content = "";
                	for(var i = 0;i<data.list.length;i++){
                		content += "<tr id='list[i]' class = 'tr1'>";
                		content += "<td class ='td1'><a href='./detail?idx="+data.list[i].pro_idx+"'><img class='imgbtn' src='resources/upload/"+data.list[i].img_main+"'/>"+"<br/>"+data.list[i].pro_name+"<br/>"+data.list[i].pro_price+"원"+"<br/>"+data.list[i].pro_size+"</td></br></br>";
                		content += "</tr>"
                	}              	
                	$("#list").empty();
                	$("#list").append(content);
                	
                	 $('#listTable').paging({
     	            	limit: 10,
     	            	rowDisplayStyle: 'block',
     	            	activePage: 0,
     	            	rows: data.list
     	            	});
                	
                },
                error : function(error) {
                   console.log(error);
                }
             });
 		}); 	
 			
 function ajaxCall(param) {
     console.log(param);
     $.ajax(param);
  }



</script>
</html>