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
<title>SignupOwn.jsp</title>

<!-- 제이쿼리 적용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">

<!-- css 적용 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/signup.css">
<link rel="stylesheet" href="css/Modal.css">


<!-- 부트스트랩 적용  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 제이쿼리 적용 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- js -->
<script src="js/util.js"></script>


<style>
 	body 
	{
 		overflow-x: hidden; 
 		margin: 0;
		padding: 0;
		font-family: Handon3gyeopsal600g;
 	}
 
 	#fullBackground 
   	{
     	position: absolute;
      	left: 0px;
      	top: 0px;
      	width: 100%;
      	height: 200%;
      	background-color: black;
      	filter: alpha(opacity = 55);
      	opacity: 0.5;
      	display: none;
      	z-index: 100;
   	}
 
	.pop_bt
	{
		border-radius: 4px;
	}
	
	.txt
	{
		margin-top: 5px;
	}
	
	
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
	

	/* 데이트피커 */
	label{margin-left: 20px;}
	#datepicker{width:180px; margin: 0 20px 20px 20px;}
	#datepicker > span:hover{cursor: pointer;}
</style>


<script defer type="text/javascript">

	//id, nickName 중복확인 했는지 체크하기 위한 변수
	var idFlag = 0;
	var nickFlag = 0;
	
	// 본인인증했는지 체크하기 위한 변수 
	var certFlag = 0;
	
	// 추천인 확인했는지 체크하기 위한 변수
	var recFlag = 0;
	
	$(document).ready(function()
	{
		// 가입하기 버튼 클릭 시 유효성 체크
		$("#joinBtn").click(
		function()
		{
			
			// 필수 입력값 검사  
    		if ( $("#intr").val() == ""
	      		|| $("#favStart").val() == ""
	      		|| $("#favEnd").val() == ""
	      		|| $("input[name=day]").val() == ""
	      		|| $("#nickName").val() == ""
		   ){
		         $("#err").html("필수 입력 항목이 누락되었습니다.");
		         $("#err").css("display", "inline");
		  
		         return;
		    }
		  
		   // 닉네임 중복확인 했는지 검사
		   if( $("#nickName").val()!="" && nickFlag == 0 )
		   {
				$("#err").html("닉네임 중복검사를 해주세요.");
		    	$("#err").css("display","inline");
		    	
		    	return;
		   }
		   
		   // 추천인 확인 했는지 검사
		   if( $("#recId").val()!="" && recFlag == 0 )
		   {
				$("#err").html("추천인을 확인해주세요.");
		    	$("#err").css("display","inline");
		    	
		    	return;
		   }
		   
		   
		   
		   // 선호산책시간 맞게 입력했는지 검사 
		   if( $("favStart").val() >= $("#favEnd").val() )
		   { 
			   $("#err").html("선호 산책시간을 확인해주세요.");
			   $("#err").css("display", "inline");
			   
			   return;
		   }
		      
		   // 최종 submit
		   $("#addOwnForm").submit();

		}); // end Click

		
		
		// 선호산책시간 변경시 유효성 검사
		$("#favStart").change(function()
		{
			//alert("시작시간 변경!"+ $("#favStart").val() + $("#favEnd").val());
			
			if($("#favStart").val() >= $("#favEnd").val())
			{
				$("#timeErr").html("시간을 확인해주세요.");
		    	$("#timeErr").css("display","inline");
			}
			else
			{
				$("#timeErr").css("display","none");
			}
		});
		
		$("#favEnd").change(function()
		{
			if($("#favStart").val() >= $("#favEnd").val())
			{
				$("#timeErr").html("시간을 확인해주세요.");
		    	$("#timeErr").css("display","inline");
			}
			else
			{
				$("#timeErr").css("display","none");
			}
		});

		
		//닉네임 중복체크 클릭 시 
		$("#nickCheck").click(function()
		{
			if (!$("#nickName").val())
			{
				alert("닉네임을 입력해주세요");

				return false;
			}

			$.ajax(
			{
				type : "GET",
				data :
				{
					nickName : $("#nickName").val()
				},
				url : "nickCheck.action",
				success : function(data)
				{
					if (data > 0)
					{
						alert("사용 불가능한 닉네임입니다.");
						$("#nickName").val("");
						$("#nickName").focus();

					} else
					{
						alert("사용 가능한 닉네임입니다.");
						nickFlag = 1;
					}
				}

			});
		});/* end nickCheck */
		
		//추천인 확인 클릭 시 
		$("#recIdCheck").click(function()
		{
			if (!$("#recId").val())
			{
				alert("아이디를 입력해주세요");

				return false;
			}

			$.ajax(
			{
				type : "GET",
				data :
				{
					recId : $("#recId").val()
				},
				url : "recIdCheck.action",
				success : function(data)
				{
					if (data > 0)
					{
						alert("존재하는 회원입니다.");
						recFlag = 1;

					} else
					{
						alert("존재하지 않는 회원입니다.");
						$("#nickName").val("");
						$("#nickName").focus();
					}
				}

			});
		});/* end nickCheck */
		
	}); /* end ready */
	
	
</script>
</head>
<body>
	<div id=""></div>

	<div id="header">
		<c:import url="HeaderLogin.jsp"></c:import>
	</div>

	<!-- 회원가입 -->
	<div id="row">
		<span style="line-height: 50px;">&nbsp;</span>
	</div>
	<span
		style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">견주 등록</span>
	<hr>
	<br>
	<br>


	<!-- 회원가입 공통 -->

	<form action="<%=cp%>/addown.action" method="POST" id="addOwnForm">		
 		
		<div id="signupStepsOwner" class="container" style="margin-left: 20%;">
			
			<div class="row txt">
				<div class="col-sm-1" style="line-height: 35px;"></div>
				<div class="col-sm-2" style="line-height: 35px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">관심사</span> <span
						style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
				</div>
				<div class="col-sm-2" style="line-height: 35px;">
					<select class="form-control" id="intr" name="intr"
						style="font-size: small; width: 150px; height: 35px;"
						required="required">
						<c:forEach var="intr" items="${intrList }">
							<option value="${intr.intrCd }">${intr.intr }</option>
						</c:forEach>
					</select>

					<!-- <select class="form-control" id="intr" name="intr"
						style="font-size: small; width: 150px; height: 28px;"
						required="required">
						<option value="1">관심사 선택</option>
						<option value="2">음악</option>
						<option value="3">영화</option>
						<option value="4">관광</option>
						<option value="5">언어</option>
						<option value="6">쇼핑</option>
					</select> -->
				</div>
				<br>

			</div>

			<!-- 상세 관심사 -->
			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">상세 관심사</span>
				</div>
				<div class="txt col-sm-3" style="line-height: 30px;">
					<input type="text" class="form-control" id="intrDetail"
						name="intrDetail" placeholder="상세관심사를 입력하세요"
						onkeyup="onlyHangul()">
				</div>
			</div>

			<!-- 닉네임 -->
			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">닉네임</span>
				</div>
				<div class="txt col-sm-3" style="line-height: 30px;">
					<input type="text" class="form-control" id="nickName"
						name="nickName" placeholder="닉네임을 입력하세요">
				</div>
				<div class="col-sm-1">
					<button type="button" class="btn check" id="nickCheck"
						name="nickCheck">중복확인</button>
				</div>
			</div>

			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">선호 산책요일</span>
					<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
				</div>
				
				<div class="txt col-sm-6" style="line-height: 30px; margin-left: 1%; padding: 0;" align="left">
				
				<!-- 요일 -->
					<label><input type="radio" value="DI1" name="day"
						value="1">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">월</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI2" name="day"
						 value="2">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">화</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI3" name="day"
						 value="3">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">수</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI4" name="day"
						 value="4">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">목</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI5" name="day"
						 value="5">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">금</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI6" name="day"
						 value="6">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">토</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI7" name="day"
						 value="0">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">일</span></label>
					&nbsp;&nbsp; <br>
				</div>
			</div>
			
			<!-- 선호시간 -->
			<div class="row">
				<div class="col-sm-1" style="line-height: 35px;"></div>
				<div class="col-sm-2" style="line-height: 35px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">선호 산책시간</span>
					<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
				</div>
				
				<div class="txt col-sm-5" style="line-height: 28px;">
					<select class="form-control" id="favStart" name="favStart"
						style="font-size: small; width: 150px; height: 35px;"> 
							<option>시작시간</option>
							<c:forEach var="i" begin="6" end="23">
								<option value="${i }">${i }:00</option>
							</c:forEach>
					</select>
					
					<select class="txt form-control" id="favEnd" name="favEnd"
						style="font-size: small; width: 150px; height: 35px;"> 
							<option>끝시간</option>
							<c:forEach var="i" begin="6" end="23">
								<option value="${i }">${i }:00</option>
							</c:forEach>
					</select>
					
				<!-- 	<input type="text" id="favStart" name="favStart" class="timepicker form-control col-sm-3"
					 style="line-height: 30px; margin-top: 5px; required="required">
			 		
					<input type="text" id="favEnd" name="favEnd" class="timepicker form-control col-sm-3"
			 		 style="line-height: 30px; margin-top: 5px; margin-left: 5px; required="required"> -->
					<div class="col-sm-4" id="timeErr" style="color: #F25C69; width: 200px;"></div><br>
				</div>
				
			</div>

			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">추천인</span>
				</div>
				<div class="col-sm-3" style="line-height: 30px;">
					<input type="text" class="form-control" id="recId" name="recId"
						placeholder="추천인 아이디를 입력하세요">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn check" id="recIdcheck"
						name="recIdcheck">회원확인</button>
				</div>
			</div>
			
		<div class="col-md-9" style="margin-right:50%; margin-top:20px;" >
			<div id="err" style="color: #F25C69;"></div><br>
			<button type="button" id="joinBtn" class="btn btn-md" style=" font-size: 14px; margin-top: 30px;"
			>가입하기</button>
		</div>
	
	</div>
		<!-- end container -->
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div id="footer">
		<c:import url="FooterWeb.jsp"></c:import>
	</div>
	
	
</body>
</html>