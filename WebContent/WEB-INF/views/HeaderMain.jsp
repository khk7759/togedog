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
@font-face { font-family: 'Handon3gyeopsal600g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal600g.woff') format('woff'); font-weight: normal; font-style: normal; }


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
	
	#logout 
	{
		color: #337ab7;
		cursor: pointer;
	}
	
	#logout:hover
	{
		text-decoration: underline;
		color: black;
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

<div id="header" class="container col-md-12 col-sm-12 col-12" style="background-color: #DAF5FD; text-align: center; height: 400px;">
	<div style="text-align: right; margin-right: 5%;">

		<c:if test="${!empty sessionScope.user }">
			${sessionScope.user.getName()} 님
			| <span id="logout">로그아웃</span>
			| <a href="#">정보수정</a> | <a href="<%=cp%>/mainmenuform.action">${sessionScope.user.getUserType()} 메인으로</a>
		</c:if>
	</div>
	<img src="images/HeaderLogo.png" alt="LOGO" style="margin-top: 45px;">
	<div style="margin: 5px;">
		<span style="font-size: 14px;">반려견 산책부터 관리까지 투게도그와 함께해요!</span>
	</div>
	<div id="headerBtn" class="col-md-12 col-sm-12 col-12" style="margin-top: 20px;">
		<c:if test="${empty sessionScope.user }">
			<button type="button" class="btn" id="login" style="margin-right: 10px;" onclick="location.href='<%=cp %>/loginform.action'">Login</button>
			<button type="button" class="btn" id="signup" onclick="location.href='<%=cp%>/signupselect.action'">SignUp</button>
		</c:if>
	</div>
</div>

</body>
</html>