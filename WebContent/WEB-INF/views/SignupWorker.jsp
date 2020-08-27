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
<title>SignupWorker.jsp</title>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">

<!-- 제이쿼리 적용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!--  푸쉬-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">




<link rel="stylesheet" type="text/css" href="css/signup.css">

<style type="text/css">

/* 데이트피커 */
label{margin-left: 20px;}
#datepicker{width:180px; margin: 0 20px 20px 20px;}
#datepicker > span:hover{cursor: pointer;}


/* body {overflow-x: hidden;} */

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

.time 
{
	width: 100px;
}

body 
{
	margin: 0;
	padding: 0;
}

textarea 
{
	resize: none;	
}

</style>



<script defer type="text/javascript">


	$(document).ready(function()
	{
		/* $("#timeErr").css("display","none"); */
		
		// 근무시간 변경시 유효성 검사
		$("#favStart").change(function()
		{	
			$("#timeErr").css("display","none");
			alert("시작시간 변경!"+ $("#favStart").val() +"/"+ $("#favEnd").val());
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
			$("#timeErr").css("display","none");
			alert("끝시간 변경!"+ $("#favStart").val() +"/"+ $("#favEnd").val());
			
			if($("#favStart").val() >=   $("#favEnd").val())
			{
				$("#timeErr").html("시간을 확인해주세요.");
		    	$("#timeErr").css("display","inline");			
			}
			else($("#favStart").val() < $("#favEnd").val())
			{
				$("#timeErr").css("display","none");
			}
		});

		
		
		
		
		// 가입하기 버튼 클릭 시 유효성 체크
		$("#joinBtn").click(
		function()
		{   
			// 필수 입력값 검사  
    		if ($("#question1").val() == ""
	    		|| $("#question2").val() == ""
                || $("#accNum").val() == ""
	      		|| workdays.length == 0
	      		
		   ){
		         $("#err").html("필수 입력 항목이 누락되었습니다.");
		         $("#err").css("display", "inline");
		  
		         return;
		    }
		  
		
		   // 근무시간 맞게 입력했는지 검사 
		   if( $("favStart").val() >= $("#favEnd").val() )
		   { 
			   $("#err").html("근무시간을 확인해주세요.");
			   $("#err").css("display", "inline");
			   
			   return;
		   }
		   
		   
		   //$("#addOwnFom").array.value = workdays;
	
		   // 최종 submit
		   $("#addWokForm").submit();
		   
		}); // end Click


		// 시도 변경 시 
		$("#addrSel1").change( function()
		{
			// alert("시 도 변경"); -- 테스트
			
			var addrSel1 = $("#addrSel1").val();
			
			//alert(addrSel1);  -- 테스트
			$.ajax(
			{
				type : 'GET',
				data :
				{
					addrSel1 : addrSel1
				},
				url : "getsgglist.action",
				success : function(data)
				{
					
					$("#addrSel2").html(data);
				}
			});// end ajax
			
		});	
		 
		// 시군구 변경시
		$("#addrSel2").change(function()
		{
			// alert("시 도 변경"); -- 테스트
			
			var addrSel2 = $("#addrSel2").val();
			
			//alert(addrSel2);  -- 테스트
			$.ajax(
			{
				type : 'GET',
				data :
				{
					addrSel2 : addrSel2
				},
				url : "getdemlist.action",
				success : function(data)
				{
					
					$("#addrSel3").html(data);
				}
			});// end ajax
			
		});	
		
	}); /* end ready */
	
	
	// 근무요일 및 시간담는 객체 workday 를 저장할 배열 전역변수선언
	var workdays = [];
	
	// ajax 데이터 저장하고 있을 변수
	var selWorkday = "";
	
	// 근무요일 및 시간 추가하기 버튼 클릭 시 
	function addWorkdays()
	{
		//alert("추가하기 버튼 클릭!");
		
		// 객체 생성 
		var workday = 
		{  dayCd : $("#dayCd").val()
		 , favStart : $("#favStart").val()
		 , favEnd : $("#favEnd").val()
		};

		
		// 배열에 객체 추가  
		workdays.push(workday);
		//alert(workdays.length);
		
		//alert($("#dayCd").val());
		//alert($("#favStart").val());
		//alert($("#favEnd").val());
		
				
		// 선택한 요일 및 시간이 사용자에게 보이도록 ajax 처리
		$.ajax({
			type: 'POST',
			data :
			{	dayCd : $("#dayCd").val()
				, favStart : $("#favStart").val()
				, favEnd : $("#favEnd").val()
			},
			url: "addWorkdays.action",
			success : function(data)
			{
				selWorkday += data;
				
				//alert(selWorkday);
				
				$("#workdays").html(selWorkday);
			}
		});
		
	}// end addWorkdays()
	
	
</script>
</head>
<body>
<div id="header">
	<c:import url="HeaderLogin.jsp"></c:import>
</div>


	<!-- 회원가입 -->
	<div id="row">
		<span style="line-height: 50px;">&nbsp;</span>
	</div>
	<span
		style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">워커 신청</span>
	<hr>
	<br>
	<br>


<div id="signupStepsWalker" class="container">
<br><br>

<!-- 워커신청요건 확인 -->
<img src="images/dogfoot.png" style="height: 30px; width: 30px;" alt="dogfoot">
<span style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">신청 요건 확인</span>
<br><br>
<span style="text-align: center; font-size: 13px; color: #828282;">투게도그는 서비스 신뢰도 확보를 위하여 전문 펫워커 신청자들에 한해 다음과 같은 <span style="color: #75C3F8; font-size: 16px; font-weight: bold;">필수 자격</span>을 확인받고 있습니다.</span>
<br><br>
	<div class="container" style="width: 450px; height: 160px; text-align: left; background-color: #F0F0F0;">
		<span style="color: red; font-weight: bold; font-size: 13px;">
			<br>
			* 강아지를 사랑하시는 분<br>
			* 최소 6개월 이상 근무 가능하신 분<br>
			* 반려동물 양육 경험이 3년 이상이신 분<br>
			* 비흡연자<br>
			* 만 20세 이상이신 분<br>
			* 강력범죄, 절도, 재물손괴, 성범죄 등의 전과 사실이 없는 분<br>
		</span>
	</div>
	<br>
	<input type="checkbox" id="box1"><label for="box1">
	&nbsp;<span style="color: #828282; text-decoration: underline; font-size: 13px;">신청자 본인은 펫워커 <span style="color: #75C3F8; font-size: 16px; font-weight: bold;">필수</span> 신청 요건에 모두 해당함을 확인하였습니다.</span></label>
	<br>
	<div class="container" style="width: 470px; height: 25px; line-height: 12px; text-align: left;">
		<span style="color: #828282; font-size: 11px;">
			※ 추후 허위나 거짓 요건임이 밝혀질 시 서비스 이용에 강력한 불이익이 있을 수 있습니다.<br>
			※ 사실과 다른 확인임이 밝혀질 시 책임은 신청자 본인에게 있습니다.
		</span>
	</div>
	<br><br>
	<div class="container" style="width: 500px; height: 150px; line-height: 15px; text-align: left;">
		<span style="color: #828282; font-size: 13px; font-weight: bold;">※ 우대 자격</span><br><br>
		<span style="color: #828282; font-size: 12px;">
			- 다양한 강아지 핸들링 유경험자 <br>
			   : 대형견 혹은 문제견 케어 가능, 5개월 미만 강아지 혹은 15세 이상 노령견 케어 경험<br>
			- 장애견 간호 가능자<br>
			- 자차 보유자 (차량 이동 가능)<br>
			- 반려동물 관련 자격증 보유자<br>
			- 동물병원 혹은 애견호텔 등 관련업종 근무 경험<br>
			- 펫시터 등 동종업계 활동 경험<br>
		</span>
</div>
<br><br>
</div><!-- 워커신청요건 끝 -->
<hr>


<form action="<%=cp %>/addworker.action" method="POST" id="addWokForm">

	<!-- 테스트 -->
	<input type="hidden" value="workdays">
	<!-- 워커신청 정보 등록 -->	
	<div class="container" style="text-align: left; line-height: 20px; margin-left:21%; padding:0;">
		<!-- 직업 등록 -->
		<div class="txt row">
			<div class="col-sm-1" style="line-height: 35px;"></div>
			<div class="col-sm-2" style="line-height: 35px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">직업</span>
			</div>
			<div class="col-sm-8" style="line-height: 35px; padding: 0px; margin-left: 7px;">
				<select class="form-control" id="jobCd" name="jobCd" style="font-size: small; width: 200px; height: 35px;">
					<c:forEach var="dto" items="${jobList }">
						<option value="${dto.jobCd }">${dto.jobItem }</option>
					</c:forEach>
				</select>
			</div>
		</div>
	
		<!-- 자격증 등록 -->
		<div class="txt row">
			<div class="col-sm-1" style="line-height: 35px;"></div>
			<div class="col-sm-2" style="line-height: 35px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">반려동물 관련 자격증</span>
			</div>
			<div class="txt col-sm-8" style="line-height: 35px; padding:0px; margin-left: 7px; ">
				<select class="form-control" id="crtList" name="crtList" multiple="multiple" style="font-size: small; width: 200px; height: 120px;">
					<c:forEach var="dto" items="${crtList }">
						<option value="${dto.crtCd }">${dto.crtItem }</option>
					</c:forEach>
				</select>
			</div>
		</div>
	
	
	<!-- 선호 근무시간, 요일 -->
	<div class="row txt">
		<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">근무요일 및 시간</span> 
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			
			<div class="row">
			
			
			<div class="txt col-sm-8" style="padding: 0;">
					<!-- 요일 -->
					<select class="form-control" id="dayCd" name="dayCd"
						style="font-size: small; width: 80px; height: 30px; display: inline-block">
						<c:forEach var="day" items="${dayList }">
							<option value="${day.dayCd }">${day.day }</option>
						</c:forEach>
					</select>
					
					<!-- 시작시간 -->
					<select class="form-control" id="favStart" name="favStart" class="favStart"
						style="font-size: small; width: 120px; height: 30px; display: inline-block">
						<c:forEach var="i" begin="6" end="23">
							<option value="${i }">${i }:00</option>
						</c:forEach>
					</select>
					 
					<!-- 끝시간 -->
					<select class="txt form-control" id="favEnd" name="favEnd" class="favEnd"
						style="font-size: small; width: 120px; height: 30px; display: inline-block;">
						<c:forEach var="i" begin="6" end="23">
							<option value="${i }">${i }:00</option>
						</c:forEach>
					</select>
					
					<input type="button" id="workdayBtn" onclick="addWorkdays()" class="btn btn-xs" value="추가하기">
					
					<!-- 에러메세지 -->
					<div class="row" id="timeErr" style="color: #F25C69; width: 200px; margin-left: 50%;"></div><br>	
					
					<!-- 추가되는 공간 -->
					<div class="row" style="margin-top: 5px; margin-left: 5px;">
						<table id="workdays" style="text-align: center; font-weight: normal;"></table>
					</div>
					
					<!-- 객체 배열 넘기기 -->
					<input type="hidden" name="array" value="" />

			</div>
			
		
</div>



		<!-- 주관식 문답 -->
		<div class="txt row" style="margin-top: 15px;">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">주관식 문답</span>
				
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-11" style="line-height: 30px;">
				
				<!-- 경력사항 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">1) 경력사항을 작성해주세요.</span>
				<textarea class="form-control" name="careerName" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)" ></textarea>
				<br>
				<!-- 양육경험 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">2) 양육경험을 작성해주세요.</span>
				<textarea class="form-control" name="nurtureExp" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)" ></textarea>
				<br>
				<!-- 질문1 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">3) 펫워커 활동 중 강아지가 경계하거나 이빨을 보이며 공격하려 하는 경우 어떻게 대처하시겠습니까?</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span><br>
				<textarea class="form-control" name="question1" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)" ></textarea>
				<br>
				<!-- 질문2 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">4) 강아지와 산책할 때 가장 중요하게 생각하는 부분에 대해 작성해주세요.</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span><br>
				<textarea class="form-control" name="question2" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)"></textarea>
				<br>
				<!-- 신청메세지 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">5) 자유롭게 워커 신청 메세지를 작성해주세요.</span>
				<textarea class="form-control" name="msg" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)"></textarea>
				
			</div>
		</div>
	</div>


</div>	
	
	<div style="margin: 3% 0 7% 5%" >
		<div id="err" style="color: #F25C69;"></div><br>
		<button type="button" id="joinBtn" class="btn btn-s" style=" font-size: 14px; margin-top: 30px;"
		>신청하기</button>
	</div>
 </div>
</form>
<br>
<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>
</body>
</html>