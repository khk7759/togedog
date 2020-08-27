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

<script src="js/timedropper.js"></script>
<link rel="stylesheet" type="text/css" href="js/timedropper.css">
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
</style>
<script type="text/javascript">
	// DatePicker
	$(function() {
		$('#datePicker').datepicker(
		{
			format : "yyyy-mm-dd", 				//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			startDate : '-10d', 				//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			endDate : '+10d', 					//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			autoclose : true, 					//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			calendarWeeks : false, 				//캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			clearBtn : false, 					//날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			datesDisabled : [ '2019-06-24', '2019-06-26' ],		//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
			daysOfWeekDisabled : [ 0, 6 ], 		//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			daysOfWeekHighlighted : [ 3 ], 		//강조 되어야 하는 요일 설정
			disableTouchKeyboard : false, 		//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			immediateUpdates : false, 			//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
			multidate : false, 					//여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
			multidateSeparator : ",", 			//여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			templates : 
			{
				leftArrow : '&laquo;',
				rightArrow : '&raquo;'
			}, 									//다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			showWeekDays : true,				// 위에 요일 보여주는 옵션 기본값 : true
			title : "테스트", 					//캘린더 상단에 보여주는 타이틀
			todayHighlight : true, 				//오늘 날짜에 하이라이팅 기능 기본값 :false 
			toggleActive : true, 				//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			weekStart : 0,						//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			language : "ko" 					//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		});	//datepicker end
	});	//ready end
	
	// Time Dropper
	$(document).ready(function()
	{
		$("#startTime").timeDropper();
		$("#endTime").timeDropper();
	});
</script>
</head>
<body>

<div id="header">
	<c:import url="HeaderNotice.jsp"></c:import>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">일대일산책 등록정보 수정</span>
<hr>
<br><br>
<div id="matchingModify" class="container">
<br><br>
	<div class="container" style="text-align: left; line-height: 20px;">
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px; text-align: left;">
				<img src="images/FOOT.png" style="width: 30px; height: 27px;">
				&nbsp;&nbsp;&nbsp;
				<span style="color: #828282; font-size: 15px;">산책할 날짜를 선택해주세요.</span>
			</div>
		</div>
		<br>

		<div class="row">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-3" style="line-height: 30px; text-align: left;">
				<input type="text" id="datePicker" class="datePicker form-control" value="2020-01-01" required="required">
			</div>
		</div>
		<br><br><br>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px; text-align: left;">
				<img src="images/FOOT.png" style="width: 30px; height: 27px;">
				&nbsp;&nbsp;&nbsp;
				<span style="color: #828282; font-size: 15px;">산책할 시간을 선택해주세요.</span>
			</div>
		</div>
		<br>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-11" style="line-height: 30px; text-align: left;">
				<div id="timedropper">
					<div class="col-sm-2" style="width: 80px;">
						<span style="text-align: center; font-size: 12px; color: #828282;">시작시간 </span>&nbsp;
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control time" id="startTime" name="startTime" required="required">
					</div>
					<div class="col-sm-2" style="width: 80px;">
						<span style="text-align: center; font-size: 12px; color: #828282;">종료시간 </span>&nbsp;
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control time" id="endTime" name="endTime" required="required">
					</div>
				</div>
			</div>
		</div>
		<br><br>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-11" style="line-height: 30px; text-align: left;">
				<img src="images/FOOT.png" style="width: 30px; height: 27px;">
				&nbsp;&nbsp;&nbsp;
				<span style="color: #828282; font-size: 15px;">매칭을 원하는 견주 성별을 선택해주세요.</span>
			</div>
		</div>
		<br>
		
		<div class="row">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px; text-align: left;">
				<label><input type="radio" name="same" value="1" checked="checked">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">동성만</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" name="diff" value="2">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">이성만</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" name="nomatter" value="3">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">상관없음</span></label>
			</div>
		</div>
		<br><br>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px; text-align: left;">
				<img src="images/FOOT.png" style="width: 30px; height: 27px;">
				&nbsp;&nbsp;&nbsp;
				<span style="color: #828282; font-size: 15px;">산책할 반려견을 선택해주세요.</span>
			</div>
		</div>
		<br>
		
		<div class="container">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-11" style="line-height: 30px; text-align: left;">
				<!-- import 펫리스트.. -->
				<c:import url="PetSelect.jsp"></c:import>
			</div>
		</div>
		
		<div class="container">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-11" style="line-height: 30px; text-align: left;">
				<br>
				<div style="text-align: right;">
					<button type="button" class="btn" id="modifyPet" name="modifyPet"
					style="width: 120px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
					border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
					font-size: 13px;">마이펫 정보 수정</button>
				</div>
			</div>
		</div>
		<br><br><br>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-11" style="line-height: 30px; text-align: center;">
				<button type="submit" class="btn" id="modify" name="modify">수정하기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn" id="cancel" name="cancel" style="background-color: #828282;">취소하기</button>
			</div>
		</div>
		<br><br><br><br>
			
	</div>
</div>

<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- ★ 별도! : 수정버튼 클릭시 나타나는 확인창!!!!! -->
		<div class="container" style="width: 500px; height: 50px;">
			<div class="row">
				<div class="col-sm-12" style="line-height: 30px; text-align: center;">
					 <span style="color: #595959; font-size: 15px; font-weight: bold;">등록정보를 수정하시겠습니까?</span>
					 <br>
					 <span style="color: #595959; font-size: 11px;">※ 입력된 정보와 다른 사실이 있을 경우 불이익을 받을 수 있으니 유의하세요.</span>
				<br><br>
				</div>
				<div class="col-sm-12" style="line-height: 30px; text-align: center;">
					<button type="submit" class="btn" id="updateGo" name="updateGo"
					style="width: 90px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
					border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
					font-size: 13px;">OK</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn" id="cancel" name="cancel" style="background-color: #828282;
					width: 90px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
					border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
					font-size: 13px;">Cancel</button><br><br>
				</div>
			</div>
		</div>


</body>
</html>