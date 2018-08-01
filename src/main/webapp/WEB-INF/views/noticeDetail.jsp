<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <title>슈마니커</title>
      <style>
         #board{
            position: relative; 
            top: 100px; 
            left: 400px; 
            /* border: 1px solid black;  */
            width: 500px;
            height: 500px;            
          }
            
            #tabb{
               position: absolute;                
               margin-left: -19%; 
               margin-top: 5%;
               width: 200%;  
               border: 2px solid black;    
            }
                                     
            #tabb th{
               width: 117px; 
               height: 30px;
            }
            
           #tabb td{
               width: 116px; 
               height: 30px;               
               text-align: center;               
             }
            
            #exit{
                position: absolute;
                border: none; 
                background-color: black; 
                color: white; 
                border-radius: 2px; 
                font-size: 15px; 
                margin-top: 97%; 
                margin-left: 60%;
                cursor: pointer;
             }
             #exit:hover{
                background-color: white;
                color: black;
             } 
            
            #board_category{
               width: 100%; 
               height: 100%;
            }
            
            #user_id{
               text-align: center;
            }
            
            #board_subject{
               width: 100%;
               height: 100%;
            }
            
            #board_content{
                resize: none;
			    width: 100%;
			    height: 312px;
			    margin-left: 0%;
			    border: 0;
			    margin-top: 0%;
			    border-top: 1px solid;
			    font-size: 15px;
            }
            
            #delete{
               position: absolute; 
               border: none; 
               background-color: black; 
               color: white; 
               border-radius: 2px; 
               font-size: 15px;
               cursor: pointer; 
               margin-top: 97%; 
               margin-left: 80%;
            } 
            #delete:hover{ 
               background-color: white;
               color: black;
            }
            
            #update{
               position: absolute; 
               border: none; 
               background-color: black;
               color: white;
               border-radius: 2px; 
               font-size: 15px;
               cursor: pointer; 
               margin-top: 97%;
               margin-left: 50%;
            }
            #update:hover {
             background-color: white; 
               color:black;
         }
      </style>
   </head>
   <body  style="overflow-x:hidden; overflow-y:auto;">
      <%@include file="./head.jsp"%>
      <div id="board">
         <table id="tabb">
            <tr>
               <th>제목</th>
                          <td colspan="5">${dto.notice_subject }</td>
               <th>작성날짜</th>
               <td>
                  <span id="board_date">${dto.notice_date }</span>
               </td>
            </tr>
            <tr>
               <th>작성자</th>
               <td>
                  <span id="user_name">${dto.admin_id }</span>
               </td>
            </tr> 
            
                <tr>
                    <td colspan="10"><textarea rows="15" id="board_content" readonly="readonly">${dto.notice_content }</textarea></td>
                </tr>
                
         </table>
         <input type="button" id="exit" value="뒤로가기">
      </div>
   </body>
   <script>
   $("#exit").click(function () {
      location.href="notice";
   });
   </script>
</html>