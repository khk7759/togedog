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
<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">
<style type="text/css">
	body 
	{
		margin: 0;
		padding: 0;
	}
	
	#footer
	{
	    left: 0;
	    right: 0;
	    bottom: 0px;
	    width: 100%;
		padding: 15px 0;
		color: #828282;
		font-size: 14px;
		text-align: left;
		background-color: #F5F5F5;"
	}
</style>
</head>
<body>

<div id="footer" class="container col-md-12 col-sm-12 col-12" style="">
	<img src="images/FooterLogo.png" alt="LOGO">
	<br>
	<span id="footer-text">
	&nbsp;&nbsp;&nbsp;투게도그    |    사업자등록번호 : 123 - 45 - 00678    |    대표이사 : 강수경    |    개인정보관리책임자 : 김태균
	<br>
	&nbsp;&nbsp;&nbsp;서울특별시 마포구 월드컵북로 21 풍성빌딩 4층 F강의장 투게도그
	<br>
	&nbsp;&nbsp;&nbsp;Tel : 010-1234-5678    월-금 ( 09:00  -  18:00 )    Email : hello@togedog.co.kr
	<br>
	&nbsp;&nbsp;&nbsp;ⓒ 2020 Harness Team. All Rights Reserved.
	<br><br>
	</span>
</div>

</body>
</html>