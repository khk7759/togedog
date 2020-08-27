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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/signup.css">

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
/* 버튼 */
.btn {
	color: #ffffff;
	background-color: #75C3F8;
	font-weight: bold;
	border: 0px;
	border-radius: 12px;
	outline: 0;
	padding: 0.75em 2.5em 0.75em 2.5em;
	letter-spacing: 0.05em;
	/* box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19); */
}

.btn:hover {
	color: #ffffff;
	background-color: #41B0FA;
	/* box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19); */
}

/* 별 색  */
.star {
	color: #FFCC4F;
}

.password {
	width: 250px;
}

.check {
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.find {
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.form-control {
	width: 150px;
	height: 30px;
	font-size: 12px;
}

.time {
	width: 100px;
}

body {
	margin: 0;
	padding: 0;
}

.container {
	width: 100%;
	height: 100%
}

input[type=checkbox] {
	display: none;
}

input[type=checkbox]+label {
	display: inline-block;
	cursor: pointer;
	line-height: 22px;
	padding-left: 22px;
	background: url('/img/check_off.png') left/22px no-repeat;
}

input[type=checkbox]:checked+label {
	background-image: url('/img/check_on.png');
}

* / /*
[data-tooltip]:hover {
	position: relative;
}

[data-tooltip]:after {
	-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	background-color: #F0F0F0;
	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	color: #757575;
	font-size: 15px;
	margin-bottom: 10px;
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 350px;
	max-width: 500px;
	word-wrap: break-word;
	z-index: 9999;
	opacity: 0;
	left: -9999px;
	top: 90%;
	content: attr(data-tooltip);
}

[data-tooltip]:hover:after {
	content: attr(data-tooltip);
	top: 130%;
	left: 0;
	opacity: 1;
}
</style>
<script type="text/javascript">
	//툴팁
	/* $('#preFeedback').tooltip(); */
</script>
</head>
<body>

	<div id="header" class="container-fluid"
		style="margin: 0; top: 0; left: 0; right: 0; background-color: #DAF5FD; height: 70px;">
		<div class="row">
			<div class="col-md-3">
				<br> <span
					style="font-weight: bold; font-size: 35px; color: #00B1F7; position: relative;">상세정보
					<img src="images/FOOT.png" alt="icon"
					style="width: 32px; height: 30px;">
				</span>
			</div>
			<div class="col-md-9"></div>
		</div>
	</div>

	<div id="content" class="container-fluid"
		style="width: 1028px; height: 800px;">
		<br>
		<br>
		<br>
		<div class="row">
			<div class="col-sm-3" style="line-height: 30px; text-align: left;">
				<div class="container"
					style="border: 1px solid #E0E0E0; border-radius: 5px;">
					<br>
					<img src="images/woman.png" alt="사진없음 아이콘!"
						style="width: 200px; height: 200px;"><br> <input
						type="button" class="btn find" value="산책대기"
						style="width: 200px; background-color: #FFD900;"
						disabled="disabled"> <br>
					<br> <span
						style="color: #4ABAFF; font-size: 20px; font-weight: bold;">으하하</span>
					&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">
						23 / 여 </span><br>
					<div align="left">
						<img src="images/단계.png" alt="단계"
							style="width: 50px; height: 30px;"> &nbsp;<span
							class="star">★★★★☆</span>
					</div>
					<table class="table table-hover table-condensed">
						<tr>
							<th style="text-align: center;">최근산책일</th>
							<td>2020-06-03</td>
						</tr>
						<tr>
							<th style="text-align: center;">산책완료</th>
							<td> 17회</td>
						</tr>
						<tr>
							<th style="text-align: center;">산책할 펫</th>
							<td> 2마리</td>
						</tr>
						<tr>
							<td>
								<button type="button" class="btn btn-default btn-xs">산책기록</button>
							</td>
							<td>
								<button type="button" class="btn btn-default btn-xs">신고</button>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="col-sm-9" style="line-height: 20px; text-align: left;">
				<div class="container"
					style="border: 1px solid #E0E0E0; border-radius: 5px;">
					<br>

					<div id="firstPet" class="row" style="height: 80px;">
						<div class="col-sm-1"
							style="line-height: 20px; text-align: center;">
							<div class="container" style="width: 80px; height: 100px;">
								<img src="images/crown.png" alt="대표"
									style="width: 50px; height: 10px;"> <br>
								<img src="images/멍멍이4.jpg" alt=""
									style="width: 60px; height: 60px;">
							</div>
						</div>
						<div class="col-sm-2"
							style="line-height: 25px; text-align: center;">
							<br>
							<div class="container" style="width: 200px; height: 100px;">
								<span
									style="color: #828282; font-size: 15px; font-weight: bold;">서투른
									골목대장 </span> <span
									style="color: #4ABAFF; font-size: 18px; font-weight: bold;">미미</span>
								<br> <span
									style="color: #666666; font-size: 12px; font-weight: bold;">
									말티즈 / 암 </span> <br>
							</div>
						</div>
						<div class="col-sm-1"
							style="line-height: 20px; text-align: center;"></div>
						<div class="col-sm-7"
							style="line-height: 25px; text-align: center;">
							<br>
							<div class="container" style="width: 450px; height: 100px;">
								<table class="table" id="pet" name="pet"
									style="font-size: 11px;">
									<tr style="background-color: #DAF5FD;">
										<th style="text-align: center;">생년월일(나이)</th>
										<th style="text-align: center;">몸무게</th>
										<th style="text-align: center;">중성화여부(날짜)</th>
									</tr>
									<tr>
										<td>2013-07-10 (7세)</td>
										<td>3.4 kg</td>
										<td>O (2014-08-12)</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<hr>

					<div id="secondPet" class="row" style="height: 60px;">
						<div class="col-sm-1"
							style="line-height: 20px; text-align: center;">
							<div class="container" style="width: 80px; height: 100px;">
								<img src="images/멍멍이4.jpg" alt=""
									style="width: 60px; height: 60px;">
							</div>
						</div>
						<div class="col-sm-2"
							style="line-height: 25px; text-align: center;">
							<div class="container" style="width: 200px; height: 100px;">
								<span
									style="color: #828282; font-size: 15px; font-weight: bold;">서투른
									골목대장 </span> <span
									style="color: #4ABAFF; font-size: 18px; font-weight: bold;">미미</span>
								<br> <span
									style="color: #666666; font-size: 12px; font-weight: bold;">
									말티즈 / 암 </span> <br>
							</div>
						</div>
						<div class="col-sm-1"
							style="line-height: 20px; text-align: center;"></div>
						<div class="col-sm-7"
							style="line-height: 25px; text-align: center;">
							<div class="container" style="width: 450px; height: 100px;">
								<table class="table" id="pet" name="pet"
									style="font-size: 11px;">
									<tr style="background-color: #DAF5FD;">
										<th style="text-align: center;">생년월일(나이)</th>
										<th style="text-align: center;">몸무게</th>
										<th style="text-align: center;">중성화여부(날짜)</th>
									</tr>
									<tr>
										<td>2013-07-10 (7세)</td>
										<td>3.4 kg</td>
										<td>O (2014-08-12)</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<hr>

					<div id="thirdPet" class="row" style="height: 60px;">
						<div class="col-sm-1"
							style="line-height: 20px; text-align: center;">
							<div class="container" style="width: 80px; height: 100px;">
								<img src="images/멍멍이4.jpg" alt=""
									style="width: 60px; height: 60px;">
							</div>
						</div>
						<div class="col-sm-2"
							style="line-height: 25px; text-align: center;">
							<div class="container" style="width: 200px; height: 100px;">
								<span
									style="color: #828282; font-size: 15px; font-weight: bold;">서투른
									골목대장 </span> <span
									style="color: #4ABAFF; font-size: 18px; font-weight: bold;">미미</span>
								<br> <span
									style="color: #666666; font-size: 12px; font-weight: bold;">
									말티즈 / 암 </span> <br>
							</div>
						</div>
						<div class="col-sm-1"
							style="line-height: 20px; text-align: center;"></div>
						<div class="col-sm-7"
							style="line-height: 25px; text-align: center;">
							<div class="container" style="width: 450px; height: 100px;">
								<table class="table" id="pet" name="pet"
									style="font-size: 11px;">
									<tr style="background-color: #DAF5FD;">
										<th style="text-align: center;">생년월일(나이)</th>
										<th style="text-align: center;">몸무게</th>
										<th style="text-align: center;">중성화여부(날짜)</th>
									</tr>
									<tr>
										<td>2013-07-10 (7세)</td>
										<td>3.4 kg</td>
										<td>O (2014-08-12)</td>
									</tr>
								</table>

							</div>
						</div>
					</div>
					<hr>

					<div id="thirdPet" class="row" style="height: 60px;">
						<div class="col-sm-1"
							style="line-height: 20px; text-align: center;">
							<div class="container" style="width: 80px; height: 100px;">
								<img src="images/멍멍이4.jpg" alt=""
									style="width: 60px; height: 60px;">
							</div>
						</div>
						<div class="col-sm-2"
							style="line-height: 25px; text-align: center;">
							<div class="container" style="width: 200px; height: 100px;">
								<span
									style="color: #828282; font-size: 15px; font-weight: bold;">서투른
									골목대장 </span> <span
									style="color: #4ABAFF; font-size: 18px; font-weight: bold;">미미</span>
								<br> <span
									style="color: #666666; font-size: 12px; font-weight: bold;">
									말티즈 / 암 </span> <br>
							</div>
						</div>
						<div class="col-sm-1"
							style="line-height: 20px; text-align: center;"></div>
						<div class="col-sm-7"
							style="line-height: 25px; text-align: center;">
							<div class="container" style="width: 450px; height: 100px;">
								<table class="table" id="pet" name="pet"
									style="font-size: 11px;">
									<tr style="background-color: #DAF5FD;">
										<th style="text-align: center;">생년월일(나이)</th>
										<th style="text-align: center;">몸무게</th>
										<th style="text-align: center;">중성화여부(날짜)</th>
									</tr>
									<tr>
										<td>2013-07-10 (7세)</td>
										<td>3.4 kg</td>
										<td>O (2014-08-12)</td>
									</tr>
								</table>

							</div>
						</div>
					</div>
					<hr>

					<br>
					<div id="walkInfo" class="row">
						<div class="col-sm-12"
							style="line-height: 20px; text-align: center;">
							<div class="container">
								<div
									style="text-align: left; font-size: 14px; font-weight: bold; margin: 0px 0px 10px 10px;">
									산책정보</div>
								<table class="table table-hover table-condensed" id="walk" name="walk"
									style="font-size: 11px;">
									<tr>
										<th style="text-align: center;">산책날짜</th>
										<td>2020-07-10</td>
									</tr>
									<tr>
										<th style="text-align: center;">산책시간</th>
										<td>18:30 ~ 20:00</td>
									</tr>
									<tr>
										<th style="text-align: center;">산책장소</th>
										<td>홍대사거리 라인프렌즈샵</td>
									</tr>
									<tr>
										<th style="text-align: center;">신청일</th>
										<td>2020-06-25 19:27</td>
									</tr>
									<td></td>
									<td></td>
									<tr>
									</tr>
								</table>


								<div
									style="text-align: left; font-size: 14px; font-weight: bold; margin: 0px 0px 10px 10px;">장애·알러지
									정보</div>

								<table class="table table-hover table-condensed">
									<tr>
										<th style="text-align: center;">구분</th>
										<th style="text-align: center;">이름</th>
										<th style="text-align: center;">내용</th>
									</tr>
									<tr>
										<td>장애</td>
										<td>마루</td>
										<td>뒷다리를 절어요</td>
									</tr>
									<tr>
										<td>알러지</td>
										<td>마루</td>
										<td>치킨알러지가 있어요</td>
									</tr>
									<tr>
										<td>알러지</td>
										<td>미미</td>
										<td>참치알러지가 있어요</td>
									</tr>
								</table>

								<br>
								<div style="color: #666666; line-height: 20px; text-align: center;">
									<div
										style="text-align: left; font-size: 14px; font-weight: bold; margin: 0px 0px 10px 10px;">
										이전 매칭 피드백 정보 <span
											class="tooltip_event glyphicon glyphicon-question-sign"
											id="preFeedback" style="margin-left: 5px;"
											data-toggle="tooltip" data-placement="right"
											title="최근에 상대에게 준 항목별 피드백 점수입니다."> </span>
									</div>
									<table class="table table-hover table-condensed">
										<tr>
											<td>배변처리를 잘했나요</td>
											<td class="star">★★★★☆</td>
										</tr>
										<tr>
											<td>자신의 반려견을 잘 통제하나요</td>
											<td class="star">★★★★☆</td>
										</tr>
										<tr>
											<td>강아지를 함부로 대했나요</td>
											<td class="star">★★★☆☆</td>
										</tr>
										<tr>
											<td>강아지에게 먹을 것을 허락없이 주지 않았나요?</td>
											<td class="star">★★★★☆</td>
										</tr>
										<tr>
											<td>매칭 정보와 실제 정보가 일치했나요?</td>
											<td class="star">★★★★★</td>
										</tr>
										<tr>
											<td>약속시간을 준수했나요?</td>
											<td class="star">★★★★★</td>
										</tr>
									</table>
								</div>

							</div>
							<!-- end container -->

						</div>



					</div>

				</div>
			</div>
		</div>


	</div>

</body>
</html>