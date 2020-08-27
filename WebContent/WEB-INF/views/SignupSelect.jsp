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

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/signup.css">

<style type="text/css">

	body 
	{
		margin: 0;
		padding: 0;
	}

</style>

</head>
<body>

<div id="header">
	<c:import url="HeaderLogin.jsp"></c:import>
</div>

<div class="container "id="signupStepsFirst" style="margin-bottom: 50px;">
	<div class="col-md-12" style="margin-top: 50px; margin-bottom: 50px;">
		<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">회원가입</span>
	</div>
	
	<div class="col-md-12" style="border-bottom: 1px solid #DCDCDC;"></div>

	
	<!-- ③ 가입구분 선택 -->
	<div class="col-md-12" style="margin-top: 30px; margin-bottom:30px;">
		<img src="images/Step1.png" alt="step1">
		<span style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">가입구분 선택</span>
	</div>
	
	<div class="col-md-12" style="margin-top: 60px; margin-bottom: 100px;">
		<div class="col-md-6" style="text-align:center;">
			<div class="col-md-12">
				<button type="button" class="btn" id="btn signup-owner" name="btn btn-lg signup-owner" style="height: 100px; font-size: 20px; text-align: center; font-weight: bold;"
				onclick="location.href='<%=cp%>/ownsignupform.action'">견주로 가입하기</button>
			</div>
			<div class="col-md-12" style="margin-top: 10px;">
				<span style="font-size: 13px; font-weight: bold; color: #828282;">반려견 산책매칭, 커뮤니티, 산책대행 서비스를 이용하실 수 있어요.</span>
			</div>
		</div>
		
		<div class="col-md-6" style="text-align:center;">
			<div class="col-md-12">
				<button type="button" class="btn" id="btn apply-walker" name="btn apply-walker" style="height: 100px; font-size: 20px; text-align: center; font-weight: bold;"
				onclick="location.href='<%=cp%>/woksignupform.action'">펫워커 신청하기</button>
			</div>
			<div class="col-md-12" style="margin-top: 10px;">
			<span style="font-size: 13px; font-weight: bold; color: #828282;">반려견 산책대행 서비스의 전문 펫워커로 활동하실 수 있어요.</span>
			</div>
		</div>
	</div>
</div>


<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>

</body>
</html>