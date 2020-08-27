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

<link rel="stylesheet" type="text/css" href="css/signup.css">

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
	width: 180px;
	height: 25px;
	font-size: 12px;
}

body 
{
	margin: 0;
	padding: 0;
}

.btn
{
	width : 160px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>

<div id="header">
	<c:import url="HeaderMain.jsp"></c:import>
</div>

<br><br>
<div id="MainMenu" class="container">
<br><br>
	<div class="container" style="text-align: left; line-height: 20px;">

		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-5" style="line-height: 30px;">
				<br><br><br>
				<span style="font-size: 36px; color: #666666; line-height: 55px;">
					미래 유망직, 펫워커<br>
					투게도그에서 함께해요<br>
				</span><br>
				<span style="font-size: 15px; color: #666666;">
					사랑스러운 강아지와 산책하며 돈도 벌 수 있어요.
					혼자 남겨진 반려견에게 행복한 시간을 선물해볼까요?
				</span>
				<div style="margin: 30px 0px 60px 0px;">
					<a type="button" href="#apply" style="font-size: 30px;">
					신청 바로가기 click! ↓
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
	
<div id="process" class="container" style="width: 100%; text-align: left; line-height: 20px; background-color: #F0FCFF;">
	<br><br>
	<div class="row"><br><br>
		<div class="col-sm-2"></div>
		<div class="col-sm-4">
			<span style="font-size: 23px; color: #666666;">
				투게도그 펫워커 방문 프로세스
			</span><br><br><br>
			<img src="images/wprc.png" alt="" style="width:762px;height:34px;margin-top:51px"><br><br><br>
		</div>
	</div>
	<div class="row" style="text-align: left;">
		<div class="col-sm-2"></div>
		<div class="col-sm-2" style="width: 364px;">
			<span style="font-size: 17px; color: #666666;">투게도그 로그인</span>
		</div>
		<div class="col-sm-2" style="width: 364px;">
			<span style="font-size: 17px; color: #666666;">방문하여 산책</span>
		</div>
		<div class="col-sm-2" style="width: 364px;">
			<span style="font-size: 17px; color: #666666;">정산 받기</span>
		</div>
	</div><br>
	<div class="row" style="line-height: 25px; text-align: left;">
		<div class="col-sm-2"></div>
		<div class="col-sm-3" style="width: 364px;">
			<span style="font-size: 14px; color: #666666;">마이어리 > 매칭 메뉴에서<br>고객님의 예약을 받을 수 있습니다.</span>			
		</div>
		<div class="col-sm-3" style="width: 364px;">

			<span style="font-size: 14px; color: #666666;">고객님의 집에 방문하여<br>인계증을 확인하고 반려견과 산책합니다.</span>	
		</div>
		<div class="col-sm-3" style="width: 364px;">
			<span style="font-size: 14px; color: #666666;">산책기록과 피드백을 작성하고<br>편리한 자동 정산을 받아보세요.</span>	
		</div>
	</div>
	<br><br><br>
</div>

<div id="benefits" class="container">
<br><br><br>
	<div class="container" style="text-align: left; line-height: 20px;">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-2">
				<img src="images/benefit1.png" alt="1" style="width: 170px; height: 170px; display: block; margin: 0px auto;">
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<img src="images/benefit2.png" alt="2" style="width: 170px; height: 170px; display: block; margin: 0px auto;">
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<img src="images/benefit3.png" alt="3" style="width: 170px; height: 170px; display: block; margin: 0px auto;">
			</div>
		</div>
		
		<div class="row" style="line-height: 25px;">
			<div class="col-sm-1"></div>
			<div class="col-sm-3"><hr>
			<span style="font-size: 14px; color: #666666;">점심 시간, 저녁 시간 혹은 주말<br>
			원하는 시간을 펫워커님이 결정하여<br>
			자유로운 스케쥴 관리가 가능해요<br></span>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"><hr>
			<span style="font-size: 14px; color: #666666;">자동차, 대중교통, 도보 등<br>
			원하는 이동수단으로 고객님의<br>
			집까지 편하게 방문할 수 있어요<br></span>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"><hr>
			<span style="font-size: 14px; color: #666666;">한마리당 산책 30분에<br>
			최소 29,000원부터<br>
			원하는 만큼 수익을 올려보세요<br></span>
			</div>
		</div><br><br><br><hr>

		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px;">
				<br><br><br>
				<span style="font-size: 22px; color: #666666; line-height: 40px;">
					예약 관리와 정산까지<br>
					마이어리에서 스마트하게<br>
				</span><br>
			</div>
			<div class="col-sm-7" style="line-height: 30px;">
				<br><br><br>
				<span style="font-size: 14px; color: #666666;">
고객 예약 관리, 수입 통계, 산책기록 작성 등 앱 내의 다양한 기능들을 활용하여<br>
처음 펫워커로 활동하시더라도 어려움 없이 활동할 수 있도록 하고 있습니다.<br>
또한, 상황별 대처방법과 펫산책 단계별 주의 사항 및 방법 등의 팁을 제공해<br>
보다 전문적인 펫시터로 활동하는데 있어서도 어려움이 없도록 도와드립니다.<br>
				</span>
			</div>
		</div><br><br><br><br><hr>
	</div>
</div>
		
<div id="conditions" class="container" style="width: 100%; text-align: left; line-height: 20px; background-color: #F7F7F7;">
	<br><br>
	<div class="row"><br><br>
		<div class="col-sm-12" style="text-align: center;">
			<span style="font-size: 25px; color: #666666; ">이런 분과 함께하고 있어요</span>
		</div><br>
	</div>
	<br><br><br>
</div>

<div style="width: 100%; height: 900px; display: flex; align-items: center;">
	<div style="display: inline-block; margin: 0px auto;">
		<div style="width: 960px; display: flex; row-direction: row; justify-content: space-between">
			<div style="display: flex; flex-decoration: row; height: 267px; margin-right: 41px;">
				<div style="border-bottom: 1px #EBEBEB solid; width: 265px; padding-left: 17.5px; text-align: left;"">
					<p style="font-size: 59px; color: #75C3F8; font-weight: 200;">1</p>
					<p style="padding-top: 21px; padding-bottom: 70px; font-size: 28px; color: #4D5055; font-weight: 300; line-height: 42px;">
						<span style="font-weight: 400">대한민국<br></span>거주자
					</p>
				</div>
			<div style="width: 41px; height: 235px; border-right: 1px #EBEBEB solid;"></div>
			</div>
		<div style="display: flex; flex-direction: row; height: 267px; margin-right: 41px;">
			<div style="border-borrom: 1px #EBEBEB solid; width: 265px; padding-left: 17.5px; text-align: left;"">
				<p style="font-size: 59px; color: #75C3F8; font-weight: 200;">2</p>
				<p style="padding-top: 21px; padding-bottom: 70px; font-size: 28px; color: #4D5055; font-weight: 300; line-height: 42px;">
					강아지와<br><span style="font-weight: 400">3년 이상</span>함께했어요
				</p>
			</div>
			<div style="width: 41px; height: 235px; border-right: 1px #EBEBEB solid;"></div>
		</div>
		<div style="display: flex; flex-direction: row; height: 267px; margin-right: 41px;">
			<div style="border-borrom: 1px #EBEBEB solid; width: 265px; padding-left: 17.5px; text-align: left;"">
				<p style="font-size: 59px; color: #75C3F8; font-weight: 200;">3</p>
				<p style="padding-top: 21px; padding-bottom: 70px; font-size: 28px; color: #4D5055; font-weight: 300; line-height: 42px;">
					<span style="font-weight: 400">20세</span>이상<br>(성인부터 가능)
				</p>
			</div>
		</div>
		</div>
	
		<div style="width: 960px; display: flex; row-direction: row; justify-content: space-between">
			<div style="display: flex; flex-decoration: row; height: 267px; margin-right: 41px; margin-top: 34px;">
				<div style="width: 265px; padding-left: 17.5px; text-align: left;">
					<p style="font-size: 59px; color: #75C3F8; font-weight: 200;">4</p>
					<p style="padding-top: 21px; padding-bottom: 70px; font-size: 28px; color: #4D5055; font-weight: 300; line-height: 42px;">
						모든 일에 있어서<br><span style="font-weight: 400">책임감</span>이 강해요
					</p>
				</div>
				<div style="width: 41px; height: 235px; border-right: 1px #EBEBEB solid;"></div>
			</div>
			<div style="display: flex; flex-direction: row; height: 267px; margin-right: 41px; margin-top: 34px;">
				<div style="width: 265px; padding-left: 17.5px; text-align: left;"">
					<p style="font-size: 59px; color: #75C3F8; font-weight: 200;">5</p>
					<p style="padding-top: 21px; padding-bottom: 70px; font-size: 28px; color: #4D5055; font-weight: 300; line-height: 42px;">
						<span style="font-weight: 400">친절하게</span><br>대응할 수 있어요
					</p>
				</div>
				<div style="width: 41px; height: 235px; border-right: 1px #EBEBEB solid;"></div>
			</div>
			<div style="display: flex; flex-direction: row; height: 267px; margin-right: 41px; margin-top: 34px;">
				<div style="width: 265px; padding-left: 17.5px; text-align: left;"">
					<p style="font-size: 59px; color: #75C3F8; font-weight: 200;">6</p>
					<p style="padding-top: 21px; padding-bottom: 70px; font-size: 28px; color: #4D5055; font-weight: 300; line-height: 42px;">
						<span style="font-weight: 400">시간 약속</span>은<br>철저하게 지켜요
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container" style="width: 70%; height: 200px; background-color: #F7F7F7; text-align: center;" align="center">
	<div class="row"><br><br>
		<div class="col-sm-12" style="text-align: center;">
			<span style="font-size: 20px; color: #666666; ">지금 바로 온라인 지원해보세요!</span><br><br><br>
			<input type="button" class="btn apply" id="apply" name="apply" value="온라인 신청하기"
				style="font-size: 16px; width: 230px; height: 60px; border-radius: 5px;"
				onclick="location.href='<%=cp%>/woksignupform.action'"><br><br><br><br>
		</div><br><br>
	</div>
</div><br><br><br>
		
<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>

</body>
</html>