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

<link rel="stylesheet" type="text/css" href="css/togedogweb.css">


<!-- 부트스트랩 적용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<style type="text/css">

/* 폰트 추가 */
@font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal600g.woff') format('woff'); font-weight: normal; font-style: normal; }
body {
	font-family: Handon3gyeopsal300g;
}

/* 메뉴탭(메인, 기록...) 효과 정리 */
.flex-column>li>a:hover, .flex-column>li>a:focus {
	text-decoration: none;
	background-color: #fff;
	border-radius: 0 10px 10px 0;
}

.nav-tabs>li>a {
	margin-right: 0px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 10px 10px 0 0;
}
</style>

<script type="text/javascript">

	$(document).ready(function()
	{
		$("#logout").click(function() 
		{
			if (confirm("로그아웃하시겠습니까?") == true)
			{
				location.href="<%=cp%>/logout.action";
			}
			else
			{
				return;
			}
		});
	});

</script>

</head>
<body>

<div id="miary-header" style="background-color: #DAF5FD; text-align: left;">   
   
   <div id="headerBtn" class="col-md-12 col-sm-12 col-12">
		  <div style="text-align: right; margin-right: 5%;"><a id="logout">로그아웃</a> &nbsp; <a href="<%=cp %>/mainmenuform.action">메인화면 가기</a></div>
	</div>
	<img src="images/MiaryHeaderLogo.png" alt="LOGO">
</div>
