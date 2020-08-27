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
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">

	div .nav-btns
	{
		padding: 0px 0px 0px 0%;
		margin: 7px 0px 5px 0px;
	}
	
	.nav-tabs
	{
		padding: 0px 0px 0px 0px;
		margin: 10px 0px 0px 0px;
	}
	
	th, td
	{
		text-align: center;
	}
	
	.txt
	{
	 	text-align: left; 
	 	font-weight: bold;
	 	font-size: 20px;
	 	
	 	margin: 30px 0px 20px 60px;
	 	padding: 0px 0px 0px 10px; 
	 	
	}
	
	/* css 파일 안먹어서 중복으로 작성 */
	.container
	{
		padding: 0px 0px 0px 0px;
		border-radius: 0px 0px 0px 0px;
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
	
	
	.button
	{
		background-color: var(--deep-blue);
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
						<li class="nav-item" style="margin-left: 20px;">
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
						<div class="main col-md-10">
							
							
							<!-- 그룹생성/그룹가입 버튼 -->
							<div style="margin:20px 0px 0px 0px;">
								<span class="txt" style="margin-right: 45%; margin-left: 0.1%;">(발바닥)그룹리스트</span>		
								<span style="margin-right: 15px;"> n개의 그룹에 더 가입할 수 있어요! </span>
								<button type="button" class="btn btn-default btn-xs">그룹 생성</button>
								<button type="button" class="btn btn-default btn-xs">그룹 가입</button>
							</div>
						
							<!-- 가입그룹리스트/가입신청리스트-->
							<div class="tabbable col-md-12" id="tabs-460097">
							
								<ul class="nav nav-tabs" style="border-bottom: none;">
									<li class="nav-item col-md-6"">
										<a class="nav-link" href="#tab1" data-toggle="tab">가입그룹리스트</a>
									</li>
									<li class="nav-item col-md-6">
										<a class="nav-link" href="#tab2" data-toggle="tab">가입신청리스트</a>
									</li>
								</ul>
							</div>	
							<br><br><br><br>	
							<!-- 가입그룹리스트 -->
							<div class="JoinGroupList"
							 style=" width: 90%; margin: 0% 5% 0% 5%;">
							 
								<table class="table table-hover table-condensed"
								>
									<tr>
										<th>번호</th>
										<th>그룹명</th>
										<th>그룹장</th>
										<th>그룹인원</th>
										<th>강아지수</th>
										<th>그룹소개</th>
										<th>그룹가입일</th>
										<th>버튼</th>
									</tr>
									<tr>
										<td>3</td>
										<td>멋진 그룹</td>
										<td>멋쟁이</td>
										<td>3</td>
										<td>4</td>
										<td>저희는 멋진 그룹이에요</td>
										<td>2020.07.04</td>
										<td>
											<button type="button" class="btn btn-default btn-xs">탈퇴</button>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>고양이좋아</td>
										<td>힝노</td>
										<td>5</td>
										<td>8</td>
										<td>고양이좋아파</td>
										<td>2020.06.30</td>
										<td>
											<button type="button" class="btn btn-default btn-xs"">탈퇴</button>
										</td>
									</tr>
									<tr>
										<td>1</td>
										<td>햄스터좋아</td>
										<td>대장군</td>
										<td>5</td>
										<td>6</td>
										<td>햄사모입니다</td>
										<td>2020.06.23</td>
										<td>
											<button type="button" class="btn btn-default btn-xs">탈퇴</button>
										</td>
									</tr>
								</table>
							</div><!-- end JoinGroupList -->
							
							
							
						</div><!-- end main -->
						
				</div><!-- end content  -->
					
				<!-- 탭들 감싸는 nav-bar -->
				<div class="nav-bar col-md-1"  style="margin-top: 15px; padding-left: 0px;">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownermiarymain.action">메 인</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
						<li class="nav-item" style="background-color: #FFFFFF;"><a class="nav-link active" href="<%=cp %>/ownergrouptab.action">그 룹</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerstatisticstab.action">통 계</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerinfotab.action">정 보</a></li>
					</ul>
				</div><!--  end nav_bar -->
			</div>

		</div><!-- end container -->
		
		
		
		<c:import url="Footer.jsp"></c:import>
		
</body>
</html>