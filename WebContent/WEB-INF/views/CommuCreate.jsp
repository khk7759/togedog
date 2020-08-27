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
	height: 100%;
}
</style>

</head>
<body>

<div id="header" class="container-fluid" style="margin: 0; top: 0; left: 0; right: 0; background-color: #DAF5FD; height: 70px;">
	<div class="row">
		<div class="col-md-3">
		<br>
			<span style="font-weight: bold; font-size: 35px; color: #00B1F7; position: relative;">커뮤니티 생성   
			<img src="images/FOOT.png" alt="icon" style="width: 32px; height: 30px;"></span>
		</div>
		<div class="col-md-9">
		</div>
	</div>
</div>

<br><br><br><br>

<div class="container" style="line-height: 30px; text-align: left;">
	<div class="row">
		<div class="col-sm-6" style="line-height: 30px;">
			<!-- ●Left Parcel -->
			<div id="content1">
				<div class="row">
					<div class="col-md-1" style="line-height: 30px;"></div>
					<div class="col-md-3" style="line-height: 30px; text-align: left;">
						<span style="color: #828282; font-size: 14px; font-weight: bold;">커뮤니티 이름</span>
					</div>
					<div class="col-md-2" style="line-height: 30px;">
						<input type="text" class="form-control" id="communame" name="communame" placeholder="커뮤니티 이름을 입력하세요" required="required"
						style="width: 300px;">
					</div>
				</div>
				
				<div class="row">
					<span id="space" style="line-height: 8px;">&nbsp;</span>
				</div>
				
				<div class="row">
					<div class="col-md-1" style="line-height: 30px;"></div>
					<div class="col-md-3" style="line-height: 30px; text-align: left;">
						<span style="color: #828282; font-size: 14px; font-weight: bold;">커뮤니티 소개</span>
					</div>
					<div class="col-md-8" style="line-height: 30px; text-align: left;">
						<textarea class="form-control" rows="10" cols="50" name="intro" id="intro" style="width: 300px; height: 100px;" placeholder="커뮤니티 소개를 작성해주세요(1000자 이내)"></textarea>
					</div>
				</div>
				
				<div class="row">
					<span id="space" style="line-height: 10px;">&nbsp;</span>
				</div>
				
				<div class="row">
					<div class="col-md-1" style="line-height: 30px;"></div>
					<div class="col-md-3" style="line-height: 30px; text-align: left;">
						<span style="color: #828282; font-size: 14px; font-weight: bold;">공지사항</span>
					</div>
					<div class="col-md-8" style="line-height: 30px; text-align: left;">
						<textarea class="form-control" rows="10" cols="50" name="notice" id="notice" style="width: 300px; height: 100px;" placeholder="공지사항을 작성해주세요(1000자 이내)"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-6" style="line-height: 30px;">
			<!-- ●Right Parcel -->
				<div id="content2">
				
					<div class="row">
						<div class="col-md-3" style="line-height: 35px; text-align: left;">
							<span style="color: #828282; font-size: 14px; font-weight: bold;">가입조건 설정</span>
						</div><br><br>
					</div>
					
					<div class="row">
						<div class="col-md-3" style="line-height: 35px; text-align: left;">
							<span style="color: #828282; font-size: 13px;"> * 연령대</span>
						</div>
						<div class="col-md-2" style="line-height: 35px;">
							<select class="form-control" name="old" style="font-size: small; width: 150px; height: 30px;" required="required">
								<option value="0">연령대 선택</option>
								<option value="1">20대</option>
								<option value="2">30대</option>
								<option value="3">40대</option>
								<option value="4">50대</option>
								<option value="5">60대</option>
								<option value="6">70대 이상</option>
							</select>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-3" style="line-height: 35px; text-align: left;">
							<span style="color: #828282; font-size: 13px;"> * 가입가능 성별</span>
						</div>
						<div class="col-sm-5" style="line-height: 35px; text-align: left;">
							<label><input type="radio" name="female" value="1">&nbsp;<span style="color: #828282; font-size: 13px; font-weight: bold;"> 여성만</span></label>
							&nbsp;
							<label><input type="radio" name="male" value="2">&nbsp;<span style="color: #828282; font-size: 13px; font-weight: bold;"> 남성만</span></label>
							&nbsp;
							<label><input type="radio" name="nomatter" value="3" checked="checked">&nbsp;<span style="color: #828282; font-size: 13px; font-weight: bold;"> 상관없음</span></label>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-3" style="line-height: 35px; text-align: left;">
							<span style="color: #828282; font-size: 13px;"> * 가입인원 제한</span>
						</div>
						<div class="col-md-2" style="line-height: 35px;">
							<input type="number" class="form-control" id="full" name="full" placeholder="ex) 10" required="required"
							style="width: 90px;">
						</div>
						<div class="col-md-1" style="line-height: 35px;" align="center">
							<span style="font-size: 13px; color: gray;">명</span>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-3" style="line-height: 35px; text-align: left;">
							<span style="color: #828282; font-size: 13px;"> * 펫 사이즈 제한</span>
						</div>
						<div class="col-md-2" style="line-height: 35px;">
							<select class="form-control" name="old" style="font-size: small; width: 150px; height: 30px;" required="required">
								<option value="0">사이즈 선택</option>
								<option value="1">소형</option>
								<option value="2">중형</option>
								<option value="3">대형</option>
								<option value="3">초대형</option>
							</select>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-3" style="line-height: 35px; text-align: left;">
							<span style="color: #828282; font-size: 13px;"> * 가입방식 지정</span>
						</div>
						<div class="col-sm-5" style="line-height: 35px; text-align: left;">
							<label><input type="radio" name="auto" value="1" checked="checked">&nbsp;<span style="color: #828282; font-size: 13px; font-weight: bold;"> 자동승인</span></label>
							&nbsp;
							<label><input type="radio" name="passive" value="2">&nbsp;<span style="color: #828282; font-size: 13px; font-weight: bold;"> 직접승인</span></label>
						</div>
					</div>				
					
				</div><br><br>
			</div>
	</div>
</div>

<div class="container" style="line-height: 30px; text-align: center;">
	<div class="row">
		<div class="col-sm-11" style="line-height: 35px;">
			<button type="submit" class="btn" id="makeGo" name="makeGo">생성하기</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn" id="cancel" name="cancel" style="background-color: #828282;">취소하기</button>
		</div>
	</div>
</div>









</body>
</html>