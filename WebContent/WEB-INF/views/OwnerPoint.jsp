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


<style>
	<!--css 추가 -->
	
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

					<!-- 가계부 내용 -->
					<div class="accountContent">
					
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
								
						<br>
						<div class="pull-left" style="margin-left: 10%">
							<svg style="color: var(--yellow-color);" width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trophy" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path d="M3 1h10c-.495 3.467-.5 10-5 10S3.495 4.467 3 1zm0 15a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1H3zm2-1a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1H5z"/>
							  <path fill-rule="evenodd" d="M12.5 3a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-3 2a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm-6-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-3 2a3 3 0 1 1 6 0 3 3 0 0 1-6 0z"/>
							  <path d="M7 10h2v4H7v-4z"/>
							  <path d="M10 11c0 .552-.895 1-2 1s-2-.448-2-1 .895-1 2-1 2 .448 2 1z"/>
							</svg>
							<span class="pull left"
							style="font-weight: bold; font-size: 18px;">포인트 현황</span>
						</div>		
						<br><br>

						<div>
							<!-- 합계 테이블 -->
							<table class="table table-hover table-condensed"
								style="width: 85%;">
								<tr>
									<th style="text-align: center;">총 포인트</th>
								</tr>
								<tr>
									<td>11점</td>
								</tr>

								<tr>
									<th style="text-align: center;">회원단계</th>
								</tr>
								<tr>
									<td>1단계</td>
								</tr>
							</table>
						</div>


						<!-- 가계부 -->
						<br>
						<div class="pull-left" style="margin-left: 10%">
							<svg style="color: var(--yellow-color);" width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trophy" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path d="M3 1h10c-.495 3.467-.5 10-5 10S3.495 4.467 3 1zm0 15a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1H3zm2-1a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1H5z"/>
							  <path fill-rule="evenodd" d="M12.5 3a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-3 2a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm-6-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-3 2a3 3 0 1 1 6 0 3 3 0 0 1-6 0z"/>
							  <path d="M7 10h2v4H7v-4z"/>
							  <path d="M10 11c0 .552-.895 1-2 1s-2-.448-2-1 .895-1 2-1 2 .448 2 1z"/>
							</svg>
							<span class="pull left"
							style="font-weight: bold; font-size: 18px;">포인트 내역</span>
						</div>				
						<div id="select" style="margin: 0 0 15px 60%;">
							<div class="selBox" style="width: 150px; height: 25px; display: inline-block;">
								<select class="form-control" id="">
									<option value="0">==선택==</option>
									<option value="1" selected="selected">증가 내역</option>
									<option value="2">감소 내역</option>
								</select>
							</div>
							<div class="selBox" style="width: 150px; height: 25px; display: inline-block;">
								<select class="form-control" id="">
									<option value="0">==선택==</option>
									<option value="1" selected="selected">10개씩 보기</option>
									<option value="2">20개씩 보기</option>
								</select>
							</div>
						</div> <!-- end select -->
						<table class="toMeList table table-hover table-condensed"
							style="width: 85%;">
							<tr>
								<th style="text-align: center;">번호</th>
								<th style="text-align: center;">날짜</th>
								<th style="text-align: center;">내용</th>
								<th style="text-align: center;">점수</th>
								<th style="text-align: center;">구분</th>
							</tr>
							<tr>
								<td>6</td>
								<td>2020.07.20</td>
								<td>출석</td>
								<td>1점</td>
								<td>증가</td>
							</tr>
							<tr>
								<td>5</td>
								<td>2020.07.19</td>
								<td>출석</td>
								<td>1점</td>
								<td>증가</td>
							</tr>
							<tr>
								<td>4</td>
								<td>2020.07.18</td>
								<td>출석</td>
								<td>1점</td>
								<td>증가</td>
							</tr>
							<tr>
								<td>3</td>
								<td>2020.07.17</td>
								<td>출석</td>
								<td>1점</td>
								<td>증가</td>
							</tr>
							<tr>
								<td>2</td>
								<td>2020.07.16</td>
								<td>출석</td>
								<td>1점</td>
								<td>증가</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2020.07.15</td>
								<td>회원가입</td>
								<td>6점</td>
								<td>증가</td>
							</tr>
						</table>
						<br>
						
						<!-- 페이징 -->
						<nav class="pagination-sm">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">Previous</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
						

					</div>
					<!-- end accountContent -->


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