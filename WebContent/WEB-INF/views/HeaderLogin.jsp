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

<style type="text/css">
	body 
	{
		margin: 0;
		padding: 0;
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


<div id="headerBtn" class="col-md-12 col-sm-12 col-12">

</div>

<div id="header" class="container col-md-12 col-sm-12 col-12" style="background-color: #DAF5FD; text-align: center;">
	<div style="text-align: right; margin-right: 5%;">
		
		<c:if test="${empty sessionScope.user }">
			| <a href="<%=cp %>/loginform.action">로그인</a>
			| <a href="<%=cp%>/signupselect.action">회원가입</a> |
		</c:if>		
		
		<c:if test="${!empty sessionScope.user }">
			${sessionScope.user.getName()} 님
			| <span id="logout">로그아웃</span>
			| <a href="<%=cp %>/mainmyinfo.action">정보수정</a> |
		</c:if>
		
	
	</div>	
	<a href="<%=cp%>/firstmain.action"><img src="images/HeaderLogo.png" alt="LOGO"></a>
</div>

</body>
</html>