<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>New Document</title>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">
<meta name="Generator" content="EditPlus">
<meta name="Author" content="kimhojin">
<meta name="Keywords" content="popup">
<meta name="Description" content="modal_popup">
<style type="text/css">
   #fullBackground 
   {
      position: absolute;
      left: 0px;
      top: 0px;
      width: 100%;
      height: 200%;
      background-color: black;
      filter: alpha(opacity = 55);
      opacity: 0.5;
      display: none;
      z-index: 100;
   }
   
   #popup 
   {
      position: absolute;
      left: 100px;
      top: 100px;
      z-index: 101;
      display: none;
   }
   
   .titleBar 
   {
      clear: both;
      height: 30px;
      background: skyblue;
      width: 100%;
      cursor: move;
      border-top-left-radius : 50px;
      border-top-right-radius : 50px;
   }
   
   .title 
   {
      line-height: 25px;
      background: skyblue;
      cursor: move;
      text-align : center;
      padding-top : 1px;  
   }
   
   #moBody th
   {
      text-align : left;
   }
   
   .modal-content
   {
      border-radius : 0px;
      border : 0px;
   }
   
   .modal-footer
   {
      text-align : center;
   }
</style>
<script type="text/javascript">
   var on_off = 0;
   var x_margin, y_margin;
   var popup, fullBackground;

   function openFrame() 
   {
      popup = document.getElementById("popup");
      fullBackground = document.getElementById("fullBackground");

      fullBackground.style.top = document.body.scrollTop;
      fullBackground.style.left = document.body.scrollLeft;

      popup.style.top = ((screen.height / 2) - 300 + document.body.scrollTop)   + "px";
      popup.style.left = ((screen.width / 2) - 200) + "px";

      fullBackground.style.display = "block";
      popup.style.display = "block";
      document.body.style.overflow = "hidden";
      
      window.scrollTo(0, 0);
   }

   function closeFrame() 
   {
      fullBackground.style.display = "none";
      popup.style.display = "none";
      document.body.style.overflow = "auto";
   }

   function move_onoff(chk, e) 
   {
      if (chk == 1) 
      {
         x_margin = e.clientX - popup.offsetLeft;
         y_margin = e.clientY - popup.offsetTop;
      }
      on_off = chk;
   }

   function moven(e) 
   {
      if (on_off == 1) 
      {
         var x_result = e.clientX - x_margin;
         var y_result = e.clientY - y_margin;

         if (x_result > 0)
            popup.style.left = x_result + "px";
         if (y_result > 0)
            popup.style.top = y_result + "px";
      }
   }
</script>
</head>

<body onmouseup="move_onoff(0, event);" onmousemove="moven(event);">
   <div id='fullBackground'></div>
      <div id="popup">
         <div class="titleBar" onmousedown="move_onoff(1, event);">
            <div class="title"><h4>일정 등록</h4></div>
         </div>
      
      <div class="modal-content">
         <div class="modal-body">      
            <form>
               <table id="moBody">
                  <tr>
                     <th>일정 제목</th>
                     <td><input type="text" id="title" name="title"></td>
                  </tr>
                  
                  <tr>
                     <th>날씨</th>
                     <td>맑음...</td>
                  </tr>
                  
                  <tr>
                     <th>카테고리</th>
                     <td>
                        <select name="category" id="category">
                           <option value="1">건강</option>
                           <option value="2">용품</option>
                           <option value="3">미용</option>
                           <option value="4">산책</option>
                           <option value="5">교육</option>
                           <option value="6">기타</option>
                        </select>
                     </td>
                  </tr>
                  
                  <tr>
                     <th>지역</th>
                     <td>
                        <select name="region" id="region">
                           <option value="1">서울</option>
                           <option value="2">부천</option>
                           <option value="3">수원</option>
                        </select>
                     </td>
                  </tr>
                  
                  <tr>
                     <th>주소</th>
                     <td><input type="text" id="address" name="address"></td>
                  </tr>
                  
                  <tr>
                     <th>날짜</th>
                     <td><input type="date" id="date" name="date"></td>
                  </tr>
                  
                  <tr>
                     <th>시작 시간</th>
                     <td><input type="time" id="start" name="start"></td>
                  </tr>
                  
                  <tr>
                     <th>일정 시간</th>
                     <td><input type="time" id="end" name="end"></td>
                  </tr>
               </table>
            </form>
         </div>
         
         <div class="modal-footer">
            <button type="button" class="btn btn-default" onclick="closeFrame()">취소</button>
            <button type="button" class="btn btn-primary">일정 등록</button>
         </div>
      </div>
   </div>
</body>
</html>