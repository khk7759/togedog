<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Togedog</title>
<link rel="stylesheet" type="text/css" href="css/signup.css">

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">

<!-- 부트스트랩 적용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<style type="text/css">
	body 
	{
		margin: 0;
		padding: 0;
	}
	
	.btn
	{
		font-size: 13px;
		width: 120px;
	}
	
	#header
	{
		top: 0px;
		left: 0px;
		right: 0px;
	}
	
/* 폰트추가 */

	body
	{
		font-family: Handon3gyeopsal600g;
	}

	
</style>
<script>
   function sendLogout()
   {
      if(confirm("로그아웃 하시겠습니까"))
      {
         var outBtn = document.getElementById("logout");
         window.location.href = "logout.action";
      }
   }
</script>


</head>

<body>

<div id="header" class="container col-md-12 col-sm-12 col-12" style="background-color: #DAF5FD; text-align: center; margin-bottom: 5%;">
   <img src="images/HeaderLogo.png" alt="LOGO" style="margin-top: 45px;">
   <br><span style="font-size: 14px; margin-bottom: 10%;">반려견 산책부터 관리까지 투게도그와 함께해요!</span>
   <div id="headerBtn" class="col-md-12 col-sm-12 col-12" style="margin-top: 20px; margin-bottom: 20px;">
      <button type="button" class="btn" id="logout" onclick="sendLogout()">Logout</button>
   </div><br><br>
</div>

</body>
</html>