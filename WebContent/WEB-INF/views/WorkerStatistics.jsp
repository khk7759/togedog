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

<!-- css 파일 적용 -->
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" type="text/css" href="css/Modal.css">

<!-- 부트스트랩 적용 -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 제이쿼리 적용 -->
<script src="http://code.jquery.com/jquery.min.js"></script>

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

<style>

div .nav-btns {
	padding: 0px 0px 0px 0%;
	margin: 20px 0px 5px 0px;
}

.nav-tabs {
	padding: 0px 0px 0px 0px;
	margin: 10px 10px 0px 20px;
}

th, td {
	text-align: center;
}

/* css 파일 안먹어서 중복으로 작성 */
.container {
	padding: 0px 0px 0px 0px;
	border-radius: 0px 0px 0px 0px;
}

/* 너비 맞춤 */
.content-wrap {
	width: 100%;
	margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
	border-radius: 0px 0px 0px 0px;
	background-color: var(- -blue);
}

.menus {
	margin: 30px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}

.txt {
	margin: 10px 0px 0px 70px;
	padding: 0px 0px 0px 0px;
	font-size: 18px;
	font-weight: bold;
	text-align: left;
}

/* 메뉴탭(메인, 기록...) 효과 정리 */
.flex-column>li>a:hover, .flex-column>li>a:focus {
	text-decoration: none;
	background-color: #fff;
	border-radius: 0 10px 10px 0;
}

.nav-tabs>li>a {
	margin-right: 0px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 10px 10px 0 0;
}

.super
{
	font-size: 20px;
	font-weight: bold;
	color: var(--deep-blue);
}

.info
{
	font-size: 18px;
}

	/* 추가 200726 */
	.nav-item:hover
	{
		background-color: #FFFFFF;
		cursor: pointer;
	}

</style>

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
			<div class="content col-md-10">

				<!-- 메인 영역 -->
				<div class="main col-md-12">

					<!-- 통계 내용 StatisticsContent -->
					<div class="StatisticsContent">

						<div class="pull-left" style="margin-left: 10%; margin-top: 3%;">
							<span class="glyphicon glyphicon-list-alt"
								style="font-size: 18px; color: #F25C69;"></span>
							<span class ="pull
								left" style="font-weight: bold; font-size: 18px;">
							정보</span>
						</div>
						<br> <br> <br> <br> 
						
						<div align="center">
							<span class="info">으하하님이
								TOGEDOG와 만난지 <b class="super">143</b>일이 되었어요.
							</span><br> 
							<span class="info">으하하님은 <b class="super">78</b>건의 대행으로
							</span><br> 
							<span class="info"><b class="super">101</b>마리의 강아지와 함께 산책해서
							</span><br> 
							<span class="info"><b class="super">678,000</b>원을 얻었어요!
							</span><br> 
							<br><br><br>
						</div>
						
						<br> <br>
						
						<!-- 정산 차트 -->
						<div class="pull-left" style="margin-left: 10%">
							<span class="glyphicon glyphicon-scale"
								style="font-size: 18px; color: #F25C69;"></span>
							<span class ="pull
								left" style="font-weight: bold; font-size: 18px;">
							정산 차트</span>
						</div>
						<br> <br>
						<div class="statistics" style="width: 100%; margin-left: 15%;">
							<c:import url="WorkerChart.jsp"></c:import>
						</div>
						<br>


					</div>
					<!-- end StatisticsContent -->


				</div>
				<!-- end main -->

			</div>
			<!-- end content  -->

			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1"
				style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/workermiarymain.action">메 인</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/agencyapplylist.action">매 칭</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/workeraccount.action">정 산</a></li>
					<li class="nav-item" style="background-color: #ffffff;"><a class="nav-link" href="<%=cp%>/workerstatistics.action">통 계</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/workermyinfo.action">정 보</a></li>
				</ul>
			</div>
			<!--  end nav_bar -->
		</div>
		<!-- end content-wrap  -->

	</div>
	<!-- end container -->


	<c:import url="Footer.jsp"></c:import>

</body>
</html>