<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<style>
   button:HOVER
   {
      color: orange;
   }
   
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
      height: 20px;
      width: 100%;
      cursor: move;
   }
   
   .title 
   {
      line-height: 15px;
      cursor: move;
      text-align : center;
      font-size: 16px;
      font-weight: bold;
   }
   
   #moBody
   {
      margin-top : 5%;
      margin-bottom : 5%;
   }
   
   #moBody th
   {
      text-align : left;
   }
   
   .modal-footer
   {
      text-align : center;
   }
</style>
<script type="text/javascript">
   

	$(document).ready(function()
	{
		/* 
        $('#date').change(function (){
            var date = $('#date').val();
            $('#date').val(date);
        }); */
        
     // 시도 변경 시 
		$("#addrSel1").change( function()
		{
			// alert("시 도 변경"); -- 테스트
			
			var addrSel1 = $("#addrSel1").val();
			
			//alert(addrSel1);  -- 테스트
			$.ajax(
			{
				type : 'GET',
				data :
				{
					addrSel1 : addrSel1
				},
				url : "getsgglist.action",
				success : function(data)
				{
					
					$("#addrSel2").html(data);
				}
			});// end ajax
			
		});	
		 
		// 시군구 변경시
		$("#addrSel2").change(function()
		{
			// alert("시 도 변경"); -- 테스트
			
			var addrSel2 = $("#addrSel2").val();
			
			//alert(addrSel2);  -- 테스트
			$.ajax(
			{
				type : 'GET',
				data :
				{
					addrSel2 : addrSel2
				},
				url : "getdemlist.action",
				success : function(data)
				{
					
					$("#addrSel3").html(data);
				}
			});// end ajax
			
		});	
	        
		
		// 등록버튼 클릭하면 일정 테이블에 submit
		$("#insertSch").click(function()
		{
			// 유효성 검사
			if( $("#title").val() == ""
			|| !$("#weather").val()
			|| !$("#category").val()
			|| !$("#addrSel1").val()
			|| !$("#addrSel2").val()
			|| !$("#addrSel3").val()
			|| !$("#address").val()
			|| !$("#date").val()
			|| !$("#start").val()
			|| !$("#end").val()
			)
			{
				alert("값을 모두 입력해주세요.");
				
				return;
			}	
			
			// 폼 제출
			$("#schForm").submit();
		});
	
	
});

   
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
      <!-- 
         <div class="titleBar" onmousedown="move_onoff(1, event);">
            <div class="title">일정 등록</div>
         </div> 
      -->
      
      <div class="modal-content">
      	<div class="modal-header">
	      	<div class="titleBar" onmousedown="move_onoff(1, event);">
	            <div class="title">일정 등록</div>
	         </div>
      	</div>
         <div class="modal-body">      
            <form action="insertSch.action" method="post" id="schForm">
               <table align="center" id="moBody">
                  <tr>
                     <th style="width: 80px; height: 40px;">일정 제목</th>
                     <td><input type="text" id="title" name="title" class="form-control" ></td>
                  </tr>
                  
                  <tr>
                     <th style="height: 40px;">날씨</th>
                     <td>
                     	<!-- <input type="text" class="form-control" id="weather" value="맑음"/> -->
                     	<!-- 임시 추가 -->
						 <select name="weather" id="weather" class="form-control">
                        	<c:forEach var="weather" items="${weatherList }">
                        		<option value="${weather.weatherCd }">${weather.weather }</option>
                        	</c:forEach>
                        	
                        </select>
                     </td>
                  </tr>
                  
                  <tr>
                     <th style="height: 40px;">카테고리</th>
                     <td>
                        <select name="category" id="category" class="form-control">
                        	<option value="SCHI1">산책</option>
                        	<option value="SCHI2">대행</option>
                        	<!-- <option value="SCH3">그룹</option> -->
                        	<option value="SCHI4">교육</option>
                        	<option value="SCHI5">미용</option>
                        	<option value="SCHI6">건강</option>
                        	<option value="SCHI7">용품</option>
                        	<option value="SCHI8">기타</option>
                        </select>
                     </td>
                  </tr>
                  
                  <tr>
                     <th style="height: 40px;">지역</th>
                     <td>
                        <select name="addrSel1" id="addrSel1" class="form-control">
                        	<option>시·도를 선택해주세요</option>
                        	<c:forEach var="sd" items="${sdList }">
                        		<option value="${sd.addrCd1}">${sd.addr1 }</option>
                        	</c:forEach>
                           <!-- 
                           <option value="1">서울</option>
                           <option value="2">부천</option>
                           <option value="3">수원</option>
                     		 --> 
                        </select>
                        <select name="addrSel2" id="addrSel2" class="form-control">
                        	<c:forEach var="sgg" items="${sggList }">
                        		<option value="${sgg.addrCd2}">${sgg.addr2 }</option>
                        	</c:forEach>
                           <!-- 
                           <option value="1">서울</option>
                           <option value="2">부천</option>
                           <option value="3">수원</option>
                     		 --> 
                        </select>
                        <select name="addrSel3" id="addrSel3" class="form-control">
                        	<c:forEach var="dem" items="${demList }">
                        		<option value="${dem.addrCd3}">${dem.addr3 }</option>
                        	</c:forEach>
                           <!-- 
                           <option value="1">서울</option>
                           <option value="2">부천</option>
                           <option value="3">수원</option>
                     		 --> 
                        </select>
                     </td>
                  </tr>
                  
                  <tr>
                     <th style="height: 40px;">장소</th>
                     <td><input type="text" id="address" name="address" class="form-control"></td>
                  </tr>
                  
                  <tr>
                     <th style="height: 40px;">날짜</th>
                     <td><input type="date" id="date" name="date" class="form-control"></td>
                  </tr>
                  
                  <tr>
                     <th style="height: 40px;">시작 시간</th>
                     <td><input type="time" id="start" name="start" class="form-control"></td>
                  </tr>
                  
                  <tr>
                     <th style="height: 40px;">종료 시간</th>
                     <td><input type="time" id="end" name="end" class="form-control"></td>
                  </tr>
               </table>
            </form>
         </div>
         
         <div class="modal-footer">
            <button id="insertSch" type="button" class="btn btn-primary">일정 등록</button>
            <button type="button" class="btn btn-default" onclick="closeFrame()">취소</button>
         </div>
      </div>
   </div>
</body>
</html>