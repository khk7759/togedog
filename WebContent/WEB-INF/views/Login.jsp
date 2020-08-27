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
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<style type="text/css">
	#find
	{
		text-align: right;
	}
	
	#findBtn
	{
		color: #75C3F8;
		background-color: #ffffb3;
		width: 100px;
		height: 25px;
		padding: 0.07em 0.6em 0.07em 0.6em;
		border: 0px;
		border-radius: 3px;
	}
	
	#findBtn:hover
	{
		color: #FFFFFF;
		background-color: #3F6ABF;
		width: 100px;
		height: 25px;
		padding: 0.07em 0.6em 0.07em 0.6em;
	}
	
	.input-group
	{
	    margin-top: 1em;
	    margin-bottom: 1em;
	}

	.login-box
	{
	    line-height: 2.3em;
	    font-size: 1em;
	    color: #aaa;
	    margin-top: 1em;
	    margin-bottom: 1em;
	    padding-top: 0.5em;
	    padding-bottom: 0.5em;
	}
</style>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function()
	{	
		if("${msg}" != "")
		{
			alert("${msg}");
		}
		
		$("#loginBtn").click(function()
		{		
			if( $("#id").val()=="")
			{
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return;
			}
			
			if( $("#pwd").val()=="" )
			{
				alert("패스워드를 입력하세요");
				$("#pwd").focus();
				return;
			}

			$("#form").submit();
		});
		
		
	});
</script>
</head>
<body>

	<div id="header">
		<c:import url="HeaderLogin.jsp"></c:import>
	</div>
	
	<div id="content" class="container col-md-12 col-sm-12 col-12" style="font-size: 15px;">
		<div style="margin: 100px;"></div>
		<div style="margin-bottom: 10px;">
			<span style="color: #75C3F8; font-size: 30px; font-weight: bold;">로그인하기</span>
		</div>
		<form action="login.action" method="post" id="form">
			<div style="margin-bottom: 10px;">
				<label><input type="radio" name="userSelect" value="0" checked="checked"> 
				<span style="color: #666666;">회원(견주/워커)</span></label>
				<span>&nbsp;&nbsp;</span>
				<label><input type="radio" name="userSelect" value="1"> 
				<span style="color: #666666;">관리자</span></label>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<div class="login-box well">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" id="id" name="id" value='' placeholder="아이디를 입력하세요" class="form-control" required="required">
							</div>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" id="pwd" name="pwd" value='' placeholder="비밀번호를 입력하세요" class="form-control" required="required">
							</div>
							<div id="button">
								<button type="button" class="btn" id="loginBtn" style="margin-right: 10px;">Login</button>
								<!-- <button type="button" class="btn" id="logout">Logout</button> -->
								<button type="button" class="btn" id="signupBtn"
								onclick="location.href='<%=cp%>/signupselect.action'">SignUp</button>
								<!-- <button type="button" class="btn" id="myinfo">MyInfo</button> -->
							</div>
							<div id="find" style="font-size: 12px; line-height: 25px; text-align: right; margin-top: 10px;">
								<a href="<%=cp %>/loginfindform.action">아이디 혹은 비밀번호를 잊어버리셨나요?</a>
							</div>
						</div>
					</div>
					<div class="col-sm-3"></div>
				</div>
			</div>
		</form>
		<div style="margin: 110px;"></div>
		
	</div>
	<c:import url="FooterWeb.jsp"></c:import>

</body>
</html>