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
<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="css/login.css">
<!-- 제이쿼리 적용 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
<!-- 부트스트랩 적용 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function()
	{	 	
		$("#findid").click(function()
        {
			
			var name = $("#name").val();
			var tel = $("#tel").val();
			
			if(name == null || name == "")
			{
				alert("이름을 입력해주세요");
				
				$("#name").focus();
				return;
			}
			
			if(tel == null || tel == "")
			{
				alert("전화번호를 입력해주세요");
				
				$("#tel").focus();
				return;
			}
			
			$("#idfindform").submit();
			
        });
		
		if("${msg1}" != "")
		{
			alert("${msg1}");
		}
		
		$("#findpwd").click(function()
        {
			
			var id2 = $("#id2").val();
			var name2 = $("#name2").val();
			var tel2 = $("#tel2").val();
			
			if(id2 == null || id2 == "")
			{
				alert("아이디를 입력해주세요");
				
				$("#id2").focus();
				return;
			}
			
			if(name2 == null || name2 == "")
			{
				alert("이름을 입력해주세요");
				
				$("#name2").focus();
				return;
			}
			
			if(tel2 == null || tel2 == "")
			{
				alert("전화번호를 입력해주세요");
				
				$("#tel2").focus();
				return;
			}
			
			$("#pwdfindform").submit();
			
        });
		
		if("${msg2}" != "")
		{
			alert("${msg2}");
		}
		
	});
</script>

</head>
<body>

<div id="header">
	<c:import url="HeaderLogin.jsp"></c:import>
</div>

<div id="test">
</div>

<div id="content" style="font-size: 15px;">
	<div class="row col-md-12">
		<div class="col-md-2"></div>
		<div class="col-md-3" style="line-height: 30px; text-align: center;">
			<div class="col-md-12" style="margin-top: 25px; margin-bottom: 25px;">
				<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">아이디 찾기</span>
			</div>
			<div class="well col-md-12" style="width: 100%; height: 300px;">
				<form class="form-horizontal" action="idfind.action" method="get" id="idfindform" style="margin-top: 55px;">	
					<div class="form-group">
					  <label for="name" class="col-sm-4 control-label">이름</label>
					  <div class="col-sm-8">
					    <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요" required="required">
					  </div>
					</div>
					<div class="form-group">
					  <label for="tel" class="col-sm-4 control-label">전화번호</label>
					  <div class="col-sm-8">
					    <input type="tel" id="tel" name="tel" class="form-control" placeholder="010-1234-1234" required="required">
					  </div>
					</div>
					<div class="form-group">
					  <div class="col-sm-12">
					    <button type="submit" class="btn btn-block" id="findid">아이디찾기</button>
					  </div>
					</div>
				</form>
			</div>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-3" style="line-height: 30px; text-align: center;">
			<div class="col-md-12" style="margin-top: 25px; margin-bottom: 25px;">
				<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">비밀번호 찾기</span>
			</div>
			<div class="well col-md-12 center-block" style="width: 100%; height: 300px; line-height: 30px;">
				<form class="form-horizontal" action="pwdfind.action" method="get" id="pwdfindform" style="margin-top: 25px;">
					<div class="form-group">
					  <label for="id2" class="col-sm-4 control-label">아이디</label>
					  <div class="col-sm-8">
					    <input type="text" id="id2" name="id2" class="form-control" placeholder="아이디를 입력하세요" required="required">
					  </div>
					</div>
					<div class="form-group">
					  <label for="name2" class="col-sm-4 control-label">이름</label>
					  <div class="col-sm-8">
					    <input type="text" id="name2" name="name2" class="form-control" placeholder="이름을 입력하세요" required="required">
					  </div>
					</div>
					<div class="form-group">
					  <label for="tel2" class="col-sm-4 control-label">전화번호</label>
					  <div class="col-sm-8">
					    <input type="tel" id="tel2" name="tel2" class="form-control" placeholder="010-1234-1234" required="required">
					  </div>
					</div>
					<div class="form-group">
					  <div class="col-sm-12">
					    <button type="submit" class="btn btn-block" id="findpwd">비밀번호찾기</button>
					  </div>
					</div>	
				</form>
			</div>
		</div>
		<div class="col-md-2"></div>	
	</div>
	<div class="col-md-12" style="margin-top: 25px; margin-bottom: 25px;">
	</div>
</div>

<c:import url="FooterWeb.jsp"></c:import>

</body>
</html>