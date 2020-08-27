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

</head>
<body>

	<div id="signupStepsFirst">
		

		<!-- ① 휴대폰 본인인증 -->
		<img src="images/Step2.png" alt="step2"> <span
			style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">휴대폰
			본인인증</span> <br> <br> <span
			style="text-align: center; font-size: 13px; color: #828282;">본인
			확인 및 중복가입 방지를 위해 휴대폰 본인인증을 진행합니다.</span> <br> <br> <br>

		<!-- 휴대폰번호 입력폼 -->
		<div class="container"
			style="width: 200px; height: 80px; background-color: #F0F0F0; border: 1px solid gray; border-radius: 5px;">
			<div class="row">
				<div class="col-12" style="text-align: center;">
					<div class="col-sm-4 col-12"></div>
					<div class="col-sm-12">
						<span style="color: #828282; font-size: 14px; font-weight: bold;">휴대폰번호</span><br>
						<br>
					</div>
				</div>
			</div>

			<input type="tel" id="certTel" name="certTel" class="form-control" placeholder="ex) 01012341234"
				style="width: 170px;"><br> <br>
		</div>
	</div>
	<button type="button" class="btn" id="certBtn" 
	name="certBtn" style="width: 205px; height: 37px; font-size: 13px; margin-top: 20px;">
		본인인증하기</button>
	
	<!-- 인증번호 입력하기 -->	
	<div class="container"
			style="width: 200px; height: 80px; margin-top:20px; background-color: #F0F0F0; border: 1px solid gray; border-radius: 5px;">
			<div class="row">
				<div class="col-12" style="text-align: center;">
					<div class="col-sm-4 col-12"></div>
					<div class="col-sm-12">
						<span style="color: #828282; font-size: 14px; font-weight: bold;">인증번호</span><br>
						<br>
					</div>
				</div>
			</div>

			<input type="tel" id="certNum" name="certNum" class="form-control" placeholder="ex) 123456"
				style="width: 170px;"><br> <br>
		</div>

	<button type="button" class="btn" id="certNumBtn" 
	name="certNumBtn" style="width: 205px; height: 37px; margin-top: 20px; font-size: 13px;">
		확인</button>	
	<br>
	<br>
	<br>
	<hr>
	<br>
	<br>

	<!-- ② 이용약관 안내 -->
	<img src="images/Step3.png" alt="step3">
	<span
		style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">이용약관
		안내</span>
	<br>
	<br>
	
	<label for="box1">
	<input type="checkbox" id="allBox">
	<span
		style="color: #828282; text-decoration: underline; font-size: 13px;">서비스
			이용약관(필수), 개인정보 취급 방침(필수)에 모두 동의합니다.</span></label>
	<br>
	<br>

	<div class="col-md-6" style="margin-right: 70%;">
		 <label for="box2">
		 <input type="checkbox" id="serviceCheck" name="box" >
		 <span
			style="color: #828282; font-size: 14px;">투게도그 서비스 이용약관 동의</span>
			&nbsp;<span
			style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span></label>
	</div>
	<br>

	<div class="col-sm-12" id="scrollbox" align="center">
		<div
			style="overflow-y: scroll; width: 1100px; height: 150px; padding: 4px; border: 1px solid #ADADAD;">
			<!-- 약관내용 -->
			<c:import url="agree1.jsp"></c:import>
		</div>
		<br>
	</div>


	<br>

	<div class="col-md-4" style="margin-left: 7%; padding: 0px;">
	 <label for="box3">
	 <input type="checkbox" id="personalInfoCheck" name="box" >
	 <span
			style="color: #828282; font-size: 14px;">개인정보 취급 방침 동의</span> &nbsp;<span
			style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span></label>
	</div>
	<div class="col-sm-12" id="scrollbox" align="center" style="margin-bottom: 60px;">
		<div style="overflow-y: scroll; width: 1100px; height: 150px; padding: 4px; border: 1px solid #ADADAD;">
			<!-- 약관내용 -->
			<c:import url="agree2.jsp"></c:import>
		</div>
		<br>
	</div>
	<br>
	<br>
	<hr>
	<br>
	<br>
	
	<!-- 견주 회원가입인지 워커 신청인지 분기 처리 -->
	<c:if test="${type eq 'owner'}">
		<form action="<%=cp%>/ownsignup.action" method="POST" id="addOwnForm">		
	</c:if>	
	<c:if test="${type eq 'worker'}">
		<form action="<%=cp%>/addWorker.action" method="POST" id="addWokForm">		
	</c:if>	
	
		<div id="signupStepsCommon" class="container">
	
	<div style="margin-top: 20px;">
		<img src="images/Step4.png" alt="step4">
		<span style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">
			가입정보 입력</span>
	</div>
	
	

	<div class="container" style="text-align: left; line-height: 20px; margin-left: 6%; margin-top: 30px;">
		
		<!-- 사진 -->
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">사진</span>
			</div>
			
			<div class="txt col-sm-5" style="line-height: 30px;">
	            <span style="color: #828282; font-size: 12px; width: 800px;">
	               ※ 가로 150px 세로 150px 크기의 사진을 권장합니다. 5MB 까지 업로드 가능합니다.
	            </span>
                 <br>
               	<div style="width: 150px; height: 150px; overflow: hidden">
                  		<img id="preview" class="preview" src="#" style="width: 150px; height: auto;"/>
                </div>
                <input type='file' id="photo" name="photo" class="photo"/>
         	</div>
		</div>
		
		
		<!-- 아이디 -->
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">아이디</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-3" style="line-height: 30px;">
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" >
			</div>
			<div class="col-sm-2">
				<button type="button" class="btn check" id="idcheck" name="idcheck">중복확인</button>
			</div>
			<div class="errMsg" id="idMsg"></div>
			
		</div>

		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">비밀번호</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-3" style="line-height: 30px;">
				<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" >
			</div>
		</div>
		
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">비밀번호 재입력</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-3" style="line-height: 30px;">
				<input type="password" class="form-control" id="pwdRe" name="pwdRe" placeholder="비밀번호를 재입력하세요" >
			</div>
		</div>
		
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">이름</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-3" style="line-height: 30px;">
				<input type="text" class="form-control" id="name" name="name" placeholder="이름">
			</div>
		</div>
		
		<!-- 생년월일 -->
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">생년월일</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			
			<input type="text" id="birthday" name="birthday" class="datepicker form-control col-sm-3" value="YYYY-MM-DD"
			 style="line-height: 30px; margin-top: 5px; margin-left: 15px; readonly="readonly">
		</div>
		
		<!-- 이메일 -->
		<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">이메일</span>
					<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
				</div>
				<div>
					<div class="txt col-sm-1" style="padding: 0;">
						<input type="text" class="form-control" id="" name="email1"
							style="width: 100px; height: 30px; margin-left:15px; display: inline-block;" placeholder="이메일"
							> 
						
					</div>
					<div class="txt col-sm-4" style="line-height: 28px; padding:0; ">
						<select class="form-control pull-left " name="email2"
							style="font-size: small; width: 120px; height: 30px; padding:0; margin:0 0 0 25px;
							display: inline-block;">
							<option value="@naver.com">naver.com</option>
							<option value="@gmail.com">gmail.com</option>
							<option value="@hanmail.net">hanmail.com</option>
						</select>
					</div>
				</div>
			</div>
		
		<!-- 주소 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 40px;"></div>
			<div class="col-sm-2" style="line-height: 40px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">주소</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-1" style="line-height: 35px;">
				<select name="addrSel1" id="addrSel1" class="txt form-control" style="width: 110px; height: 35px;" >
					<option>시·도 선택</option>
					<c:forEach var="addr1" items="${sdList }">
						<option value="${addr1.addrCd1 }">${addr1.addr1 }</option>
					</c:forEach>
				</select>
			</div>
			<div class="txt col-sm-1" style="line-height: 35px;">
				<select name="addrSel2" id="addrSel2" class="txt form-control" style="width: 115px; height: 35px; margin-left: 20px;">
					<option>시·군·구 선택</option>
					<!-- AJAX 처리 -->
				</select>
			</div>
			<div class="txt col-sm-2" style="line-height: 35px;">
				<select name="addrSel3" id="addrSel3" class="txt form-control" style="width: 115px; height: 35px; margin-left: 45px;">
					<option>동·읍·면 선택</option>
					<!-- AJAX 처리 -->
				</select>
			</div>
		</div>

		<div class="row txt">
			<div class="con-sm-12" style="line-height: 5px;">
				<span>&nbsp;</span>
			</div>
		</div> 
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">상세주소</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-8" style="line-height: 30px; margin-top: 2px;">
				<input type="text" class="form-control" id="addrDetail" name="addrDetail" style="width: 400px;">
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
		</div>

		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">휴대폰번호</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-8" style="line-height: 30px;">
				<input type="tel" class="form-control" id="tel" name="tel" placeholder="ex) 01012341234" 
				 readonly="readonly">
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
		</div>
		
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">성별</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-8" style="line-height: 30px;">
				<label><input type="radio" id="gender1" name="gender" value="GT1" checked="checked">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">여성</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" id="gender2" name="gender" value="GT2">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">남성</span></label>
			</div>
		</div>
		
		
		
		
	</div>
	
	
</div>
		
		
	
</body>
</html>