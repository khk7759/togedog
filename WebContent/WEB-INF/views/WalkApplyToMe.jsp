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
	height: 30px;
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

<!-- <div id="innertitle">
<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">
<br><br><br><br><br><br><br><br><br><br><br>1차 추천리스트</span>
<hr>
<br><br>
</div> -->

<br><br>

<div id="firstList" style="line-height: 23px; text-align: left;">
	<div class="row">
		<div class="container" style="width: 900px; border: 1px solid #E0E0E0; border-radius: 10px;">
		<br>
			<div class="col-sm-1">
				<div id="ownerInfo" class="container" style="width: 150px; text-align: center;">
					<img src="images/woman.png" alt="견주프로필" style="width: 100px; height: 100px;">
					<br>
					<span style="color:#3F6ABF; font-size: 15px; font-weight: bold;">으하하</span><br>
					<span style="color:#828282; font-size: 14px; font-weight: bold;">23 / 여</span><br>
					<span style="color:#666666; font-size: 12px;">평점</span>
					<span style="font-size:15px; color:#FFF700;">★★★★☆</span>
				</div>
			</div>
			
			<div class="col-sm-1">
				<div id="heart" class="container" style="width: 110px; text-align: right;">
				<br><br>
					<img src="images/hearticon.png" alt="♡" style="width: 50px; height: 50px;">
				</div>
			</div>
			
			<div class="col-sm-1">
				<div id="petInfo" class="container" style="width: 140px; text-align: center;">
					<img src="images/crown.png" alt="MMM" style="width: 40px; height: 20px;">
					<img src="images/멍멍이1.jpg" alt="펫프로필" style="width: 70px; height: 70px;">
					<br><br>
					<span style="color:#3F6ABF; font-size: 15px; font-weight: bold;">코야</span><br>
					<span style="color:#828282; font-size: 14px; font-weight: bold;">웰시코기 / ♀</span><br>
				</div>
			</div>
			
			<div class="col-sm-1"></div>
			
			<div class="col-sm-6">
				<div id="walkInfo" class="container" style="text-align: center; line-height: 0px;">
					<table class="table table-responsible table-bordered" style="width: 500px;">
						<tr style="background-color: #E0E0E0; font-size: 13px;">
							<th style="text-align: center;">산책날짜</th>
							<th style="text-align: center;">산책시간</th>
							<th style="text-align: center;">산책장소</th>
							<th style="text-align: center;">신청날짜</th>
						</tr>
						<tr>
							<td>2020-07-10</td>
							<td>18:30 ~ 20:00</td>
							<td>홍대사거리...</td>
							<td>2020-06-25 19:27</td>
						</tr>
					</table>
					<div align="right" style="width: 500px; line-height: 0px;">
						<img src="images/신고.png" alt="<!>" style="width: 20px; height: 10px;">
						<span style="font-size: 12px;">신고</span>
					</div>
					
					<br>
					<div align="center" style="width: 500px;">
						<button type="button" id="state" 
						style="color: #FFFFFF; font-weight: bold; background-color: #FFD900; border: 0px; border-radius: 5px; 
						width: 250px; height: 40px;">
						대기중 </button>
					</div>
				</div>
			</div>					
		<br>
		</div>
	</div>
</div><br>



<div id="firstList" style="line-height: 23px; text-align: left;">
	<div class="row">
		<div class="container" style="width: 900px; border: 1px solid #E0E0E0; border-radius: 10px;">
		<br>
			<div class="col-sm-1">
				<div id="ownerInfo" class="container" style="width: 150px; text-align: center;">
					<img src="images/woman.png" alt="견주프로필" style="width: 100px; height: 100px;">
					<br>
					<span style="color:#3F6ABF; font-size: 15px; font-weight: bold;">으하하</span><br>
					<span style="color:#828282; font-size: 14px; font-weight: bold;">23 / 여</span><br>
					<span style="color:#666666; font-size: 12px;">평점</span>
					<span style="font-size:15px; color:#FFF700;">★★★★☆</span>
				</div>
			</div>
			
			<div class="col-sm-1">
				<div id="heart" class="container" style="width: 110px; text-align: right;">
				<br><br>
					<img src="images/hearticon.png" alt="♡" style="width: 50px; height: 50px;">
				</div>
			</div>
			
			<div class="col-sm-1">
				<div id="petInfo" class="container" style="width: 140px; text-align: center;">
					<img src="images/crown.png" alt="MMM" style="width: 40px; height: 20px;">
					<img src="images/멍멍이1.jpg" alt="펫프로필" style="width: 70px; height: 70px;">
					<br><br>
					<span style="color:#3F6ABF; font-size: 15px; font-weight: bold;">코야</span><br>
					<span style="color:#828282; font-size: 14px; font-weight: bold;">웰시코기 / ♀</span><br>
				</div>
			</div>
			
			<div class="col-sm-1"></div>
			
			<div class="col-sm-6">
				<div id="walkInfo" class="container" style="text-align: center; line-height: 0px;">
					<table class="table table-responsible table-bordered" style="width: 500px;">
						<tr style="background-color: #E0E0E0; font-size: 13px;">
							<th style="text-align: center;">산책날짜</th>
							<th style="text-align: center;">산책시간</th>
							<th style="text-align: center;">산책장소</th>
							<th style="text-align: center;">신청날짜</th>
						</tr>
						<tr>
							<td>2020-07-10</td>
							<td>18:30 ~ 20:00</td>
							<td>홍대사거리...</td>
							<td>2020-06-25 19:27</td>
						</tr>
					</table>
					<div align="right" style="width: 500px; line-height: 0px;">
						<img src="images/신고.png" alt="<!>" style="width: 20px; height: 10px;">
						<span style="font-size: 12px;">신고</span>
					</div>
					
					<br>
					<div align="center" style="width: 500px;">
						<button type="button" id="state" 
						style="color: #FFFFFF; font-weight: bold; background-color: #FFD900; border: 0px; border-radius: 5px; 
						width: 250px; height: 40px;">
						대기중 </button>
					</div>
				</div>
			</div>					
		<br>
		</div>
	</div>
</div><br>




<div id="firstList" style="line-height: 23px; text-align: left;">
	<div class="row">
		<div class="container" style="width: 900px; border: 1px solid #E0E0E0; border-radius: 10px;">
		<br>
			<div class="col-sm-1">
				<div id="ownerInfo" class="container" style="width: 150px; text-align: center;">
					<img src="images/woman.png" alt="견주프로필" style="width: 100px; height: 100px;">
					<br>
					<span style="color:#3F6ABF; font-size: 15px; font-weight: bold;">으하하</span><br>
					<span style="color:#828282; font-size: 14px; font-weight: bold;">23 / 여</span><br>
					<span style="color:#666666; font-size: 12px;">평점</span>
					<span style="font-size:15px; color:#FFF700;">★★★★☆</span>
				</div>
			</div>
			
			<div class="col-sm-1">
				<div id="heart" class="container" style="width: 110px; text-align: right;">
				<br><br>
					<img src="images/hearticon.png" alt="♡" style="width: 50px; height: 50px;">
				</div>
			</div>
			
			<div class="col-sm-1">
				<div id="petInfo" class="container" style="width: 140px; text-align: center;">
					<img src="images/crown.png" alt="MMM" style="width: 40px; height: 20px;">
					<img src="images/멍멍이1.jpg" alt="펫프로필" style="width: 70px; height: 70px;">
					<br><br>
					<span style="color:#3F6ABF; font-size: 15px; font-weight: bold;">코야</span><br>
					<span style="color:#828282; font-size: 14px; font-weight: bold;">웰시코기 / ♀</span><br>
				</div>
			</div>
			
			<div class="col-sm-1"></div>
			
			<div class="col-sm-6">
				<div id="walkInfo" class="container" style="text-align: center; line-height: 0px;">
					<table class="table table-responsible table-bordered" style="width: 500px;">
						<tr style="background-color: #E0E0E0; font-size: 13px;">
							<th style="text-align: center;">산책날짜</th>
							<th style="text-align: center;">산책시간</th>
							<th style="text-align: center;">산책장소</th>
							<th style="text-align: center;">신청날짜</th>
						</tr>
						<tr>
							<td>2020-07-10</td>
							<td>18:30 ~ 20:00</td>
							<td>홍대사거리...</td>
							<td>2020-06-25 19:27</td>
						</tr>
					</table>
					<div align="right" style="width: 500px; line-height: 0px;">
						<img src="images/신고.png" alt="<!>" style="width: 20px; height: 10px;">
						<span style="font-size: 12px;">신고</span>
					</div>
					
					<br>
					<div align="center" style="width: 500px;">
						<button type="button" id="state" 
						style="color: #FFFFFF; font-weight: bold; background-color: #FFD900; border: 0px; border-radius: 5px; 
						width: 250px; height: 40px;">
						대기중 </button>
					</div>
				</div>
			</div>					
		<br>
		</div>
	</div>
</div><br>




<div id="firstList" style="line-height: 23px; text-align: left;">
	<div class="row">
		<div class="container" style="width: 900px; border: 1px solid #E0E0E0; border-radius: 10px;">
		<br>
			<div class="col-sm-1">
				<div id="ownerInfo" class="container" style="width: 150px; text-align: center;">
					<img src="images/woman.png" alt="견주프로필" style="width: 100px; height: 100px;">
					<br>
					<span style="color:#3F6ABF; font-size: 15px; font-weight: bold;">으하하</span><br>
					<span style="color:#828282; font-size: 14px; font-weight: bold;">23 / 여</span><br>
					<span style="color:#666666; font-size: 12px;">평점</span>
					<span style="font-size:15px; color:#FFF700;">★★★★☆</span>
				</div>
			</div>
			
			<div class="col-sm-1">
				<div id="heart" class="container" style="width: 110px; text-align: right;">
				<br><br>
					<img src="images/hearticon.png" alt="♡" style="width: 50px; height: 50px;">
				</div>
			</div>
			
			<div class="col-sm-1">
				<div id="petInfo" class="container" style="width: 140px; text-align: center;">
					<img src="images/crown.png" alt="MMM" style="width: 40px; height: 20px;">
					<img src="images/멍멍이1.jpg" alt="펫프로필" style="width: 70px; height: 70px;">
					<br><br>
					<span style="color:#3F6ABF; font-size: 15px; font-weight: bold;">코야</span><br>
					<span style="color:#828282; font-size: 14px; font-weight: bold;">웰시코기 / ♀</span><br>
				</div>
			</div>
			
			<div class="col-sm-1"></div>
			
			<div class="col-sm-6">
				<div id="walkInfo" class="container" style="text-align: center; line-height: 0px;">
					<table class="table table-responsible table-bordered" style="width: 500px;">
						<tr style="background-color: #E0E0E0; font-size: 13px;">
							<th style="text-align: center;">산책날짜</th>
							<th style="text-align: center;">산책시간</th>
							<th style="text-align: center;">산책장소</th>
							<th style="text-align: center;">신청날짜</th>
						</tr>
						<tr>
							<td>2020-07-10</td>
							<td>18:30 ~ 20:00</td>
							<td>홍대사거리...</td>
							<td>2020-06-25 19:27</td>
						</tr>
					</table>
					<div align="right" style="width: 500px; line-height: 0px;">
						<img src="images/신고.png" alt="<!>" style="width: 20px; height: 10px;">
						<span style="font-size: 12px;">신고</span>
					</div>
					
					<br>
					<div align="center" style="width: 500px;">
						<button type="button" id="state" 
						style="color: #FFFFFF; font-weight: bold; background-color: #FFD900; border: 0px; border-radius: 5px; 
						width: 250px; height: 40px;">
						대기중 </button>
					</div>
				</div>
			</div>					
		<br>
		</div>
	</div>
</div><br>





<br><br>
			
<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>

</body>
</html>