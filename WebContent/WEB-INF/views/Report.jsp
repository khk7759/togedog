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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/ bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/signup.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
	width: 150px;
	height: 30px;
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

.container
{
	width: 100%;
	height: 100%
}
</style>
<script type="text/javascript">

</script>
</head>
<body>

<div id="header" class="container-fluid" style="margin: 0; top: 0; left: 0; right: 0; background-color: #DAF5FD; height: 70px;">
	<div class="row">
		<div class="col-md-3">
		<br>
			<span style="font-weight: bold; font-size: 35px; color: #00B1F7; position: relative;">신고하기  
			<img src="images/FOOT.png" alt="icon" style="width: 32px; height: 30px;"></span>
		</div>
		<div class="col-md-9">
		</div>
	</div>
</div>

<div id="content" class="container-fluid" style="width: 1028px; height: 800px;"">
<br><br><br>
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<span style="color: #828282; font-size: 15px;">신고 대상 회원</span>
		</div>
		<div class="col-md-1" style="line-height: 30px; text-align: left;">
			<span style="font-size: 15px; color: #828282;" id="repNick" name="repNick" align="left">징징이</span>
		</div>
		<div class="col-md-8" style="line-height: 30px;"></div>
	</div>
	
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<span style="color: #828282; font-size: 15px;">신고 대상</span>
		</div>
		<div class="col-md-1" style="line-height: 30px; text-align: left;">
			<span style="font-size: 15px; color: #828282;" id="repPlace" name="repNick" align="left">댓글</span>
		</div>
		<div class="col-md-8" style="line-height: 30px;"></div>
	</div>
	
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<span style="color: #828282; font-size: 15px;">신고 사유</span>
			<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
		</div>
		<div class="col-md-1" style="line-height: 30px;">
			<select class="form-control" name="repReason" style="font-size: small; width: 150px; height: 30px;" required="required">
				<option value="0">신고사유 선택</option>
				<option value="1">욕설 및 비하발언</option>
				<option value="2">허위 사실 유포</option>
				<option value="3">개인정보 침해</option>
			</select>
		</div>
		<div class="col-md-8" style="line-height: 30px;"></div>
	</div>
	
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<textarea class="form-control" rows="50" cols="100" name="repDetail" id="repDetail" 
			style="width: 720px; height: 200px;" placeholder="상세 내용을 작성해주세요"></textarea>
		</div>
		<div class="col-md-9" style="line-height: 30px;"></div>
	</div>
	<span style="line-height: 10px;">&nbsp;</span>
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<span style="color: #828282; font-size: 15px;">증거 이미지파일</span>
		</div>
		<div class="col-md-3" style="line-height: 30px;">
			<input type="text" class="form-control" id="repImg" name="repImg" style="width: 430px; height: 30px;" readonly="readonly">
		</div>
		<div class="col-md-6" style="line-height: 30px;" align="center;">
			<button type="button" class="find btn">첨부하기</button>
		</div>
	</div>

	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-11" align="left">
		<br>
			<span style="color: #828282; font-size: 11px;">
				<span style="font-size: 13px; font-weight: bold;">※ 주의사항</span><br>
				&nbsp;&nbsp;&nbsp;- 신고시 신고할 부분에 대한 이미지 파일 등 명확한 증거를 제시해주셔야 빠르고 명확한 처리가 가능합니다.<br>
				&nbsp;&nbsp;&nbsp;- 신고하셨더라도 운영정책에 위반되는 사항으로 판단하기 어렵다면 처리가 어렵습니다.<br>
				&nbsp;&nbsp;&nbsp;- 금전 사기 및 신체적 피해에 대해서는 내부 처리가 어렵습니다. 증거자료를 마련하시고 가까운 경찰서에 방문 신고해 주세요.<br>
			</span>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-11" style="line-height: 30px;">
			<br>
			<button type="submit" class="btn">신고</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn">취소</button>
		</div>
	</div>
</div>

</body>
</html>