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
.btn
{
	width: 70px;
	height: 35px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 14px;
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

a:hover
{
	font-weight:bold;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>

<div id="content" class="container-fluid" style="width: 900px; height: 350px;"">
<br>
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<span style="color: #828282; font-size: 15px; font-weight: bold;">보낸사람</span>
		</div>
		<div class="col-md-1" style="line-height: 30px;">
			<span style="font-size: 15px; color: #828282;" id="sendNick" name="sendNick" align="left">징징이</span>
		</div>
		<div class="col-md-8" style="line-height: 30px;"></div>
	</div>
	
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<span style="color: #828282; font-size: 15px;">받은시간</span>
		</div>
		<div class="col-md-2" style="line-height: 30px;">
			<span style="font-size: 15px; color: #828282;" id="recTime" name="recTime" align="left">2020-06-20 23:33</span>
		</div>
		<div class="col-md-3" style="line-height: 30px;">
			<a style="font-size: 12px;"><img src="" alt="차단">&nbsp; 차단</a>
			&nbsp;|&nbsp;
			<a style="font-size: 12px;"><img src="" alt="신고">&nbsp; 신고</a>
		</div>
		<div class="col-md-4" style="line-height: 30px;"></div>
	</div>
	
	<hr>
	
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<textarea class="form-control" rows="50" cols="100" name="nContent" id="nContent" 
			style="width: 720px; height: 200px; background-color: #FFFFFF;" readonly="readonly"></textarea>
		</div>
		<div class="col-md-9" style="line-height: 30px;"></div>
	</div>
	<span style="line-height: 10px;">&nbsp;</span>
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-4" style="line-height: 30px; text-align: left;">
			<span style="font-size: 13px;">읽은쪽지는 30일 후에 자동으로 삭제됩니다.</span>
		</div>
		<div class="col-md-7" style="line-height: 30px;" align="right">
			<a style="font-size: 12px;">◀ 이전</a>
			&nbsp;&nbsp;
			<a style="font-size: 12px;">다음 ▶</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12" style="line-height: 30px;">
			<br>
			<button type="submit" class="btn">답장</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn">보관</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn">삭제</button>
		</div>
	</div>
</div>

</body>
</html>