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
<style type="text/css">
	#content
	{
		color: #787878;
		font-size: 15px;
	}
</style>
</head>
<body>
	
<c:import url="HeaderMain.jsp"></c:import>

<div id="content">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<br><br><br><br><br>
			<span style="font-weight: bold;"><span style="font-size: 20px; font-weight: bold; color: #3F6ABF">워커명</span>님, 워커 신청이 완료되었습니다.<br>
			 관리자 승인 이후 활동 가능합니다.</span><br><br><br>
			<div id="content" class="container col-md-12 col-sm-12 col-12" style="width: 500px; font-size: 13px; line-height: 15px; text-align: left;">
			<span>
			 	※ 승인에는 최대 7일까지 소요될 수 있습니다.<br>
				※ 문의사항이 있으실 경우 아래 번호로 연락해주시기 바랍니다.<br>
		      	   &nbsp;&nbsp;&nbsp;&nbsp;대표전화번호) 010-1234-5678<br>
			</span>
			<br><br><br><br><br>
			</div>
		</div>
		<div class="col-md-4 col-sm-4 col-4"></div>
	</div>
	<!-- 
	<div class="row">
		<div class="col-md-4 col-sm-4 col-4"></div>
		<div class="col-md-4 col-sm-4 col-4">
		<br><br><br><br><br>
			<span style="font-weight: bold;"><span style="font-size: 20px; font-weight: bold; color: #3F6ABF">워커명</span>님, 
		아쉽지만 승인요건을 충족하지 못하여<br> 워커 활동이 불가함을 안내드립니다.<br>
		적합한 요건으로 n일 이후에 다시 신청하세요.</span><br><br><br>
			<div id="content" class="container col-md-12 col-sm-12 col-12" style="width: 500px; font-size: 13px; line-height: 15px; text-align: left;">
			<span>
				※ 문의사항이 있으실 경우 아래 번호로 연락해주시기 바랍니다.<br>
		      	   &nbsp;&nbsp;&nbsp;&nbsp;대표전화번호) 010-1234-5678<br>
			</span>
			</div>
		</div>
		<div class="col-md-4 col-sm-4 col-4"></div>
	</div> 
	-->
<br><br><br><br><br>
</div>
</div>

<c:import url="FooterWeb.jsp"></c:import>


</body>
</html>