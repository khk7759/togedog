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
#sendBtn {
	width: 100px;
	height: 35px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 14px;
}

.form-control {
	width: 180px;
	height: 25px;
	font-size: 12px;
}

body {
	margin: 0;
	padding: 0;
	font-family: Handon3gyeopsal600g;
}

.btn {
	width: 160px;
}

* {
	margin: 0px;
	padding: 0px;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}

img {
	border: none;
	vertical-align: top;
}

.c_wrap {
	width: 100%;
	margin: 0 auto;
	position: relative;
	border: 0;
	background-color: #F0FCFF;
}

.carousel {
	width: 400px;
	margin: 0 auto;
	border: 0;
	overflow: hidden;
}

.carousel .list {
	width: 1600px;
	margin-left: -400px;
}

.carousel .list:after {
	content: "";
	display: block;
	clear: both;
}

.carousel .list li {
	float: left;
	height: 350px;
	width: 400px;
	color: #00B1F7;
	font-size: 40px;
	line-height: 40px;
}

.carousel .list li.a1 {
	background-color: #F0FCFF;
}

.carousel .list li.a2 {
	background-color: #F0FCFF;
}

.carousel .list li.a3 {
	background-color: #F0FCFF;
}

.carousel .list li.a4 {
	background-color: #F0FCFF;
}

.prev {
	position: absolute;
	left: 0px;
	top: 50%;
	width: 25px;
	height: 50px;
	background-color: #F0FCFF;;
	color: #fff;
	margin-top: -25px;
}

.next {
	position: absolute;
	right: 0px;
	top: 50%;
	width: 25px;
	height: 50px;
	background-color: #F0FCFF;;
	color: #fff;
	margin-top: -25px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.prev').click(function() {
			$('.list').stop().animate({
				'margin-left' : '-800px'
			}, function() {
				$('.list li:first-child').appendTo('.list');
				$('.list').css({
					'margin-left' : '-400px'
				});
			});
		});
		$('.next').click(function() {
			$('.list').stop().animate({
				'margin-left' : '0px'
			}, function() {
				$('.list li:last-child').prependTo('.list');
				$('.list').css({
					'margin-left' : '-400px'
				});
			});
		});
	});
</script>
</head>
<body>

	<div id="header">
		<c:import url="HeaderMain.jsp"></c:import>
	</div>

	<br>
	<br>
	<div id="mainmenu" class="container" align="center">
		<br> <br>
		<div class="container"
			style="text-align: left; line-height: 20px; width: 500px; height: 500px; letter-spacing: -1.2px;">
			<div class="row">
				<div class="col-sm-2" style="line-height: 30px;"></div>
				<div class="col-sm-9" style="line-height: 30px; margin-top: 10%; margin-bottom: 10%;">
					<span style="color: #666666; font-weight: bold; font-size: 30px; line-height: 5px;">오늘</span><br>
					<span style="color: #666666; font-weight: bold; font-size: 16px; line-height: 2px;">
						투게도그를 통해 산책한 펫<span style="color: #38C7FF; font-size: 33px;">${count1 } </span>마리
					</span><br>
					<span style="color: #666666; font-weight: bold; font-size: 14px; line-height: 2px; margin-left: 11%;">
						전문 펫워커님과 산책한 펫<span style="color: #38C7FF; font-size: 33px;">
							${count2 } </span>마리
					</span><br>
					<span style="color: #666666; font-weight: bold; font-size: 30px; line-height: 40px; margin-left: 35%;">이제까지</span><br>
					<span style="color: #666666; font-weight: bold; font-size: 16px;">
						<span style="color: #38C7FF; font-size: 33px; margin-left: 10%;">${count3 } </span>명의 멋진 견주님들
					</span><br>
					<span style="color: #666666; font-weight: bold; font-size: 16px; line-height: 10px; margin-left: 25%;">
						<span style="color: #38C7FF; font-size: 33px;">${count4 } </span>마리
						반려견들
					</span><br>
					<span style="color: #666666; font-weight: bold; font-size: 16px; line-height: 10px; margin-left: 20%;">
						<span style="color: #38C7FF; font-size: 33px;">${count5 } </span>명의 전문 펫워커님들이
					</span><br>
					<%-- 
					<span style="color: #666666; font-weight: bold; font-size: 16px; line-height: 10px; margin-left: 10%;">
						<span style="color: #38C7FF; font-size: 33px;">${count6 } </span>곳의 즐거운 산책 커뮤니티가
					</span><br>
					--%>
					<span
						style="color: #666666; font-weight: bold; font-size: 30px; line-height: 40px;">투게도그 </span>
					<span style="color: #666666; font-weight: bold; font-size: 16px;">하셨어요!</span>
				</div>
			</div>
		</div>
	</div>

	<div class="row" style="width: 700px;">
		<div class="col-md-7" align="left" style="color: #666666;">
			<span style="font-size: 35px; font-family: Handon3gyeopsal600g; font-weight: bold;">&nbsp;&nbsp;&nbsp;차별화된 산책 서비스</span><br>
			<br>
		</div>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<div class="c_wrap">
		<div class="carousel">
			<ul class="list" style="text-align: center;">
				<!-- 순서 : 2-1-4-3... -->
				<li class="a1"><br> <br>산책대행<br> <br> <span
					style="font-size: 16px; line-height: 0px; color: #666666;">
						바쁜 일정 탓에 반려견과 산책이 어려우신가요?<br> 안전하게 케어 받는 특별한 산책을 선물하면 어떨까요?<br>
						오늘 산책은 전문 워커님께 맡기세요!<br>
				</span></li>
				<li class="a2" style="font-family: Handon3gyeopsal600g; font-weight: bold;"><br> <br>일대일산책<br> <br> <span
					style="font-size: 16px; line-height: 0px; color: #666666;">
						반려견 산책, 혼자 하기 외롭고 지루했나요?<br> 나에게 꼭 맞는 동네 산책 친구를 추천해드려요.<br>
						매칭된 산책 메이트와 동행하면 더욱 즐거운 산책!<br>
				</span></li>
				<li class="a3"><br> <br>마이어리<br> <br> <span
					style="font-size: 16px; line-height: 0px; color: #666666;">
						반려견과 함께하는 일상을 기록으로 남길 수 있어요.<br> 소중한 정보와 기록들을 한 곳에서 관리하세요.<br>
						중요한 일정은 잊지 마시고 한 눈에 확인하세요.<br> 나의 워커 활동도 관리할 수 있답니다.<br>
				</span></li>
				<li class="a4"><br> <br>커뮤니티<br> <br> <span
					style="font-size: 16px; line-height: 0px; color: #666666;">
						반려견과 모임에 참여하는 꿈, 투게도그에서 이루세요.<br> 나와 반려견에게 꼭 맞게 추천된 커뮤니티에
						가입하고<br> 재미와 활력이 넘치는 그룹 산책에 참여해보세요!<br>
				</span></li>
			</ul>
		</div>
		<p class="prev"><img src="images/left1.png" style="width:25px; height: 50px;"></p>
		<p class="next"><img src="images/right1.png" style="width:25px; height: 50px;"></p>
	</div>

	<div class="container" style="text-align: left; line-height: 20px;">

		<div class="row">
			<div class="col-sm-6" style="line-height: 30px;">
				<br><br><br>
				<span style="font-size: 36px; color: #666666; line-height: 55px; font-family: Handon3gyeopsal600g; font-weight: bold;">
					펫워커 지원해보세요!<br>
				</span><br>
				<span style="font-size: 15px; color: #666666;">
					편안한 동네에서 원하는 날 자유롭게<br>
					강아지와 산책하며 부수입을 벌어보세요
				</span><br><br>
				<input type="button" class="btn apply" id="apply" name="apply" value="자세히 보기"
				style="font-size: 18px; font-weight: bold; width: 230px; height: 60px; border-radius: 30px; margin-bottom: 50px;" onclick="location.href='<%=cp%>/mainworkerrec.action'">
			</div>
		</div>
	</div>


	<div class="container">
	</div>

	<div id="footer">
		<c:import url="FooterWeb.jsp"></c:import>
	</div>

</body>
</html>