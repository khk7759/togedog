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

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- css  -->
<link rel="stylesheet" href="css/signup.css">

<style>
.password 
{
	width: 250px;
}

.check 
{
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.find 
{
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.form-control 
{
	width: 180px;
	height: 25px;
	font-size: 12px;
}

.time 
{
	width: 100px;
}

body 
{
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<c:import url="HeaderNotice.jsp"></c:import>

	<div id="agencyApplyComp" class="container">
	<br><br>
		<div class="container" style="text-align: center; line-height: 20px;">
			<div class="row">
				<div class="col-sm-12" style="line-height: 30px;">
					<span style="font-weight: bold; font-size: 15px; color: #828282;"><span style="font-size: 20px; font-weight: bold; color: #3F6ABF">날짜및시간</span> 에 
					산책대행 매칭정보 등록이 완료되었습니다.<br> 산책대행 정보는 마이어리 > 매칭에서 확인 가능합니다. </span><br><br>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12" style="line-height: 50px;">
					<button type="submit" class="btn" id="miary" name="miary"
					style="width: 150px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
					border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
					font-size: 13px;" onclick="location.href='<%=cp %>/ownermiarymain.action'">마이어리에서 확인</button>
					<br>
					<button type="button" class="btn" id="main" name="main" style="background-color: #828282;
					width: 150px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
					border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
					font-size: 13px;" onclick="location.href='<%=cp%>/firstmain.action'">메인으로</button><br><br>
				</div>
			</div>	
		</div>
	</div>

	<c:import url="FooterWeb.jsp"></c:import>
</body>
</html>