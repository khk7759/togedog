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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/signup.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script src="js/timedropper.js"></script>
<link rel="stylesheet" type="text/css" href="js/timedropper.css">
<style type="text/css">
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

<div id="header">
	<c:import url="HeaderNotice.jsp"></c:import>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">일대일산책 매칭신청</span>
<hr>
<br><br>
<div id="commuApplyComp" class="container">
<br><br>
	<div class="container" style="text-align: center; line-height: 20px;">
		<div class="row">
			<div class="col-sm-12" style="line-height: 30px;">
				<span style="font-weight: bold; font-size: 15px; color: #828282;"><span style="font-size: 20px; font-weight: bold; color: #3F6ABF">커뮤니티명</span> 
				커뮤니티에 가입신청이 완료되었습니다.<br> 반장님의 수락까지 대기해주세요. (최대 7일)</span><br><br>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12" style="line-height: 50px;">
				<button type="submit" class="btn" id="matchingGo" name="matchingGo"
				style="width: 150px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
				border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
				font-size: 13px;">마이어리에서 확인</button>
				<br>
				<button type="button" class="btn" id="cancel" name="cancel" style="background-color: #828282;
				width: 150px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
				border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
				font-size: 13px;">메인으로</button><br><br>
			</div>
		</div>	
		
	</div>
</div>

<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>

</body>
</html>