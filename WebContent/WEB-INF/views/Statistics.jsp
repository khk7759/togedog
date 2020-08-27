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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 제이쿼리 적용 -->
<script src="http://code.jquery.com/jquery.min.js"></script>


<style>

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
		width: 100%;
		margin: 0px 0px 0px 0px;
		padding: 0px 0px 0px 0px;
		border-radius: 0px 0px 0px 0px;
		background-color: var(- -blue);
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
	
	/* 메뉴탭(메인, 기록...) 효과 정리 */
	.flex-column>li>a:hover, .flex-column>li>a:focus 
	{
		text-decoration: none;
		background-color: #fff;
		border-radius: 0 10px 10px 0;
	}
	
	.nav-tabs>li>a 
	{
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

<script type="text/javascript">

	$(document).ready(function() 
	{
		$("#ownertab").click(function() 
		{
			location.href="<%=cp%>/ownermiarymain.action";	
		});
		
		$("#workertab").click(function() 
		{
			// 세션에 들어간 유저코드가 누구인지 jstl 로 알아냄 그리고 usercd 에 담는다.
			var usercd = "<c:out value='${sessionScope.user.getUserType()}' />";
			
			//alert(usercd);
			
			// 유저코드가 견주이면
			if(usercd == "견주")
			{
				// 이렇게 띄워주고
				if(confirm("워커가 되시면 워커 마이어리를 이용하실 수 있습니다." + "\n" + "확인 버튼을 누르시면 워커 지원 페이지로 전환됩니다!") == true)
				{
					location.href="<%=cp%>/mainworkerrec.action";
				}
				else
				{
					return;
				}
			}
			else // 그렇지 않으면 ... (견주겸워커인경우는 워커마이어리로 가게된다.)
			{
				location.href="<%=cp%>/workermiarymain.action";
			}
			
		});
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
					<li class="nav-item">
						<a class="nav-link" id="ownertab" data-toggle="tab">견주</a>
					</li>
					<li class="nav-item" style="background-color: #E8E8E8;">
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

						<!-- 통계/가계부/포인트 탭 -->
						<div class="tabbable" id="tabs-437564" style="width: 100%;">
							<ul class="nav nav-tabs">
								<li class="nav-item">
									<a class="nav-link active" href="<%=cp %>/ownerstatisticstab.action" data-toggle="tab">통계</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="<%=cp %>/owneraccount.action" data-toggle="tab">가계부</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="<%=cp %>/ownerpoint.action" data-toggle="tab">포인트</a>
								</li>
							</ul>
						</div>


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
							<span class="info"><b class="super">78</b>명의 산책친구를 만났고
							</span><br> 
							<span class="info"><b class="super">101</b>마리의 강아지와 함께 산책했어요.
							</span><br> 
							<span class="info">으하하님은<b class="super">금요일</b>의 산책을 좋아해요.
							</span><br> 
							<span class="info">으하하님이 TOGEDOG 와 걸은 거리는<b class="super">183</b>km에요.
							</span><br> 
							<span class="info">으하하님은 TOGEDOG 와 <b class="super">367</b>시간을 산책했어요.
							</span> 
							<br><br><br>
						</div>
						
						<!-- 기록 차트 -->
						<div class="pull-left" style="margin-left: 10%">
							<span class="glyphicon glyphicon-book"
								style="font-size: 18px; color: #F25C69;"></span> <span
								class="pull left" style="font-weight: bold; font-size: 18px;">
								기록 차트</span>
						</div>
						<br> <br>
						<div class="statistics" style="width: 60%; margin-bottom: 5%; margin-left: 15%;" align="center">
							<c:import url="RecChart.jsp"></c:import>
						</div>
						<br>

						<!-- 몸무게 차트 -->
						<div class="pull-left" style="margin-left: 10%">
							<span class="glyphicon glyphicon-scale"
								style="font-size: 18px; color: #F25C69;"></span>
							<span class ="pull
								left" style="font-weight: bold; font-size: 18px;">
							몸무게 차트</span>
						</div>
						<br> <br>
						<div class="statistics" style="width: 60%; margin-left: 15%;" align="center">
							<c:import url="WeightChart.jsp"></c:import>
						</div>
						<br>


					</div>
					<!-- end StatisticsContent -->


				</div>
				<!-- end main -->

			</div>
			<!-- end content  -->

			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1" style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownermiarymain.action">메 인</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownergrouptab.action">그 룹</a></li>
					<li class="nav-item" style="background-color: #FFFFFF;"><a class="nav-link active" href="<%=cp %>/ownerstatisticstab.action">통 계</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerfriendlist.action">정 보</a></li>
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