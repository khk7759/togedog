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
		<div class="col-md-4 col-sm-4 col-4" style="width: 500px;">
			<br><br><br><br><br>
				<span style="font-size: 20px; font-weight: bold; color: #3F6ABF">
				추천인에게 친구신청을 하시겠습니까?
				</span><br><br>
				<span style="font-size: 13px;">※ 친구신청을 하지 않아도 추천인으로 등록됩니다.</span><br><br><br>
				<button type="button" class="btn" style="font-size: 15px;">확인</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn" style="font-size: 15px;">취소</button>
			<br><br><br><br><br><br>
		</div>
		<div class="col-md-4 col-sm-4 col-4"></div>
		</div>
	</div>
</div>

</body>
</html>