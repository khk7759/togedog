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

<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/signup.css">
<style type="text/css">
	#content
	{
		color: #787878;
		font-size: 15px;
	}
</style>
</head>
<body>

<div id="content">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4 col-sm-4 col-4"></div>
		<div class="col-md-4 col-sm-4 col-4" style="width: 600px;">
			<br><br><br><br><br>
				<span style="font-size: 15px; font-weight: bold;">
					<span style="font-size: 20px; font-weight: bold; color: #3F6ABF">견주회원 전용 서비스</span> 입니다.<br><br>
					혹시 반려견을 키우고 계시다면 견주로도 활동해 보시면 어떨까요?<br><br><br>
					<span style="font-size: 13px;">조금의 추가정보만 입력해주시면 간단하게 가입이 완료됩니다!<br>
					계정 하나로 견주 / 펫워커의 모든 서비스를 누려보세요!</span><br><br>
				</span><br><br>
				<button type="button" class="btn" style="width: 250px; font-size: 15px;">견주 되러 GoGo!</button>
			<br><br><br><br><br><br>
		</div>
		<div class="col-md-4 col-sm-4 col-4"></div>
		</div>
	</div>
</div>

</body>
</html>