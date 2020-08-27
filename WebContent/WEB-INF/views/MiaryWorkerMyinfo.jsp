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
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" type="text/css" href="css/Modal.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="js/timedropper.js"></script>
<link rel="stylesheet" type="text/css" href="js/timedropper.css">

<style type="text/css">

<style type="text/css">

div .nav-btns
{
	padding: 0px 0px 0px 0%;
	margin: 20px 0px 5px 0px;
}


.nav-tabs
{
	padding: 0px 0px 0px 0px;
	margin: 10px 10px 0px 20px;

}

th, td
{
	text-align: center;                               
}


/* css 파일 안먹어서 중복으로 작성 */
.container
{
	padding: 0px 0px 0px 0px;
	border-radius: 0px 0px 0px 0px;
}

/* 너비 맞춤 */
.content-wrap
{	
	width :100%;
	margin : 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
	border-radius: 0px 0px 0px 0px;
	background-color: var(--blue);
}

.menus
{
	margin: 30px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}

.txt
{
	margin: 10px 0px 0px 70px;
	padding: 0px 0px 0px 0px;
	font-size: 18px;
	font-weight: bold;
	text-align: left;
}

.innerBtn
{
	color: #ffffff;
	background-color: #3F6ABF;
	font-weight: bold;
	border: 0px;
	border-radius: 12px;
	outline: 0;
	letter-spacing: 0.05em;
	/* box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19); */
	font-size: 14px;
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
}

.innerBtn:hover
{
	color: #2B4071;
	background-color: #F0F2E7;
}



/* 메뉴탭(메인, 기록...) 효과 정리 */
  
.flex-column > li > a:hover,
.flex-column > li > a:focus 
{
  text-decoration: none;
  background-color: #fff;
  border-radius: 0 10px 10px 0;
}

 .nav-tabs > li > a 
{
  margin-right: 0px;
  line-height: 1.42857143;
  border: 1px solid transparent;
  border-radius: 10px 10px 0 0;
} 
 

.btn
{
	color: #ffffff;
	background-color: #75C3F8;
	font-weight: bold;
	border: 0px;
	border-radius: 12px;
	outline: 0;
	padding: 0.75em 2.5em 0.75em 2.5em;
	letter-spacing: 0.05em;
	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
	font-size: 14px;
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

	/* 추가 200726 */
	.nav-item:hover
	{
		background-color: #FFFFFF;
		cursor: pointer;
	}

</style>

<script type="text/javascript">

	$(document).ready(function()
	{
		$("#workertab").click(function() 
		{
			location.href="<%=cp%>/workermiarymain.action";
		});		
		
		$("#ownertab").click(function() 
		{
			// 세션에 들어간 유저코드가 누구인지 jstl 로 알아냄
			var usercd = "<c:out value='${sessionScope.user.getUserType()}' />"; 
			
			//alert(usercd);
			
			// 유저코드가 워커이면
			if(usercd == "워커") 
			{
				// 이렇게 띄워주고
				if(confirm("견주가 되시면 견주 마이어리를 이용하실 수 있습니다." + "\n" + "확인 버튼을 누르시면 견주 가입 페이지로 전환됩니다!") == true)
				{
					location.href="<%=cp%>/ownsignupform.action";
				}
				else
				{
					return;
				}
			}
			else // 그렇지 않으면 ... (견주겸워커인경우는 견주마이어리로 가게된다.)
			{
				location.href="<%=cp%>/ownermiarymain.action";
			}
			
		});
	});

</script>

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
    <c:import url="Header.jsp"></c:import>
    
		<!-- 전체 감싸는 container -->
		<div class="container col-md-12">
		

			<!-- 견주/워커 탭과 content 와 nav-bar 를 감싸는 content-wrap -->
			<div class="content-wrap col-md-12">
		
				<!-- 견주/워커 탭 -->
				<div class="tabbable" id="tabs-460097">
					<ul class="nav nav-tabs" style="border-bottom: none;">
						<li class="nav-item" style="background-color: #E8E8E8;">
							<a class="nav-link" id="ownertab" data-toggle="tab">견주</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="workertab" data-toggle="tab">워커</a>
						</li>
					</ul>
				</div>
				
				<!-- main 감싸는 content -->
				<div class="content col-md-11">
				
					<!-- 메인 영역 -->
					<div class="main col-md-12">						
							
<div id="innerHeader" class="container-fluid" style="margin: 0; top: 0; left: 0; right: 0; height: 70px;">
	<div class="row">
		<div class="col-md-3">
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-weight: bold; font-size: 25px; color: #ABABAB; position: relative;">마이정보</span>
			<br><br><br>
		</div>
		<div class="col-md-9"></div>
	</div>
</div>
	
<div class="row">
	<div class="col-md-12">
	<br>
		
		<div class="container" style="text-align: left; line-height: 20px; background-color: #FFFFFF; width: 100%">
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">아이디</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required="required"
				readonly="readonly">
			</div>
			<div class="col-sm-1">
				<button type="button" class="btn check" id="idcheck" name="idcheck"
				style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px;">중복확인</button>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">비밀번호</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요" required="required">
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">비밀번호 재입력</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="password" class="form-control" id="pwre" name="pwre" placeholder="비밀번호를 재입력하세요" required="required">
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">이름</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" required="required">
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">생년월일</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="text" id="datePicker" class="datePicker form-control" value="1990-01-01" required="required">
			</div>
		</div>

		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">주소</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-1" style="line-height: 30px;">
				<input type="text" class="form-control" id="post" name="post" readonly="readonly" style="width: 75px;" required="required">
			</div>
			<div class="col-sm-1">
				<button type="button" class="btn find" id="findpost" name="findpost"
				style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px;">주소찾기</button>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;"></div>
			<div class="col-sm-8" style="line-height: 30px;">
				<input type="text" class="form-control" id="addr" name="addr" readonly="readonly" style="width: 400px;" required="required">
			</div>
			<div class="col-sm-1" style="line-height: 35px;"></div>
		</div>

		<div class="row">
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
			<div class="col-sm-8" style="line-height: 30px;">
				<input type="text" class="form-control" id="addrDetail" name="addrDetail" style="width: 400px;" required="required">
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
		</div>

		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">휴대폰번호</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-8" style="line-height: 30px;">
				<input type="tel" class="form-control" id="phoneNum" name="phoneNum" placeholder="ex) 010-1234-1234" data-validation="number" data-validation-allowing="negative,number" input name="color"
					data-validation="number" datavalidation-ignore="$" required="required">
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">성별</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-8" style="line-height: 30px;">
				<label><input type="radio" name="gender" value="1" checked="checked">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">여성</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" name="gender" value="2">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">남성</span></label>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">경력사항</span>
			</div>
			<div class="col-sm-9" style="line-height: 30px;">
				<textarea class="form-control" rows="3" cols="20" style="width:200px;" placeholder="경력사항을 기재하세요"></textarea>
			</div>
		</div>
		
		<div class="row">
			<div class="con-sm-12" style="line-height: 5px;">
				<span>&nbsp;</span>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">반려동물 관련 자격증</span>
			</div>
			<div class="col-sm-9" style="line-height: 30px;">
				<select class="form-control" name="interest" style="font-size: small; width: 200px; height: 30px;">
					<option value="1">자격증 선택</option>
					<option value="2">반려동물관리사</option>
					<option value="3">반려동물행동교정사</option>
					<option value="4">반려동물장례지도사</option>
				</select>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">선호 근무 요일 / 시간</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-9" style="line-height: 30px;">
				<label><input type="radio" name="yoil" class="yoil" value="1">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">월</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" name="yoil" class="yoil" value="2">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">화</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" name="yoil" class="yoil" value="3">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">수</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" name="yoil" class="yoil" value="4">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">목</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" name="yoil" class="yoil" value="5">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">금</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" name="yoil" class="yoil" value="6">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">토</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" name="yoil" class="yoil" value="0">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">일</span></label>
				&nbsp;&nbsp;
				<br>
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

		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">정산 계좌 정보</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-2" style="line-height: 30px;">
				<select class="form-control" name="interest" style="font-size: small; width: 120px; height: 30px;" required="required">
					<option value="1">입금은행</option>
					<option value="2">국민은행</option>
					<option value="3">기업은행</option>
					<option value="4">우리은행</option>
				</select>
			</div>
			<div class="col-sm-7" style="line-height: 30px;">
				<input type="text" class="form-control" id="accNum" name="accNum" style="width: 200px; height: 30px;" placeholder="-없이 계좌번호 입력" required="required">
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;"></div>
			<div class="col-sm-9" style="line-height: 30px;">
				<span style="color: #828282; font-size: 12px; width: 500px;">
				※ 반드시 예금주가 <span style="color: red;">본인 명의</span>인 계좌를 입력해주세요. 그렇지 않을 경우 정산시 문제가 발생할 수 있습니다.
				</span>
			</div>
		</div>
		
		
		
	</div>
		
		
		
		
		
	</div>
</div>

<br><br>
		
		<div class="row">
			<div class="col-sm-5" style="line-height: 0px;"></div>
			<div class="col-sm-1" style="line-height: 0px;">
				<button type="submit" class="btn" id="btn myinfo-submit" name="btn myinfo-submit" style="width: 180px; height: 80px; font-size: 20px;">수정하기</button>
			</div>
			<div class="col-sm-3" style="line-height: 0px;"></div>
			
			<div class="col-sm-3" style="line-height: 30px;" align="right">
				<br>
				<button type="button" class="btn check" id="btn exit" name="btn exit"
				style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px;">
				탈퇴하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		
		<br><br>
							
							
					</div><!-- end main -->
						
				</div><!-- end content  -->
					
				<!-- 탭들 감싸는 nav-bar -->
				<div class="nav-bar col-md-1"
					style="margin-top: 15px; padding-left: 0px;">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%=cp%>/workermiarymain.action">메 인</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp%>/agencyapplylist.action">매 칭</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp%>/workeraccount.action">정 산</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp%>/workerstatistics.action">통 계</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a class="nav-link" href="<%=cp%>/workermyinfo.action">정 보</a></li>
					</ul>
				</div>
				<!--  end nav_bar -->
			</div><!-- end content-wrap  -->

		</div><!-- end container -->
		
		
	<c:import url="Footer.jsp"></c:import>
		
</body>
</html>