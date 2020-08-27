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
#sendBtn
{
	width: 100px;
	height: 35px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 14px;
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
</style>
<script type="text/javascript">

</script>
</head>
<body>

<div id="header" class="container-fluid" style="margin: 0; top: 0; left: 0; right: 0; background-color: #DAF5FD; height: 70px;">
	<div class="row">
		<div class="col-md-3">
		<br>
			<span style="font-weight: bold; font-size: 35px; color: #00B1F7; position: relative;">쪽지쓰기  
			<img src="images/FOOT.png" alt="icon" style="width: 32px; height: 30px;"></span>
		</div>
		<div class="col-md-9">
		</div>
	</div>
</div>

<div id="content" class="container-fluid" style="width: 800px; height: 200px;"">
<br><br><br>
	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<span style="color: #828282; font-size: 15px; font-weight: bold;">받는사람</span>
		</div>
		<div class="col-md-2" style="line-height: 30px;" align="left">
			<input type="text" class="form-control" id="recNick" name="recNick"
			 placeholder="받는회원의 닉네임을 입력하세요" required="required" style="width: 200px;">
		</div>
		<div class="col-md-7" style="line-height: 30px;"></div>
	</div>

	<div class="row">
		<div class="col-md-1" style="line-height: 30px;"></div>
		<div class="col-md-2" style="line-height: 30px; text-align: left;">
			<textarea class="form-control" rows="50" cols="80" name="nContent" id="nContent" 
			style="width: 600px; height: 200px;" placeholder="내용을 작성해주세요(1000자 이내)">
		
			</textarea>
		</div>
		<div class="col-md-9" style="line-height: 30px;"></div>
	</div>
	
	<div class="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="col-md-10" style="line-height: 30px;" align="right">
			<br>
			<button type="submit" class="btn" id="sendBtn">→ 보내기</button>
		</div>
	</div>
</div>

</body>
</html>