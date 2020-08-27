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

<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 부트스트랩 적용  -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<!-- 제이쿼리 적용 -->

<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>


<!-- 데이트피커 -->
<link rel="stylesheet" href="css/jquery.datetimepicker.css">
<script type="text/javascript" src="js/jquery.datetimepicker.full.js"></script>

<style type="text/css">
div .nav-btns {
	padding: 0px 0px 0px 0%;
	margin: 20px 0px 5px 0px;
}

.nav-tabs {
	padding: 0px 0px 0px 0px;
	margin: 10px 10px 0px 20px;
}

.table th, td {
	text-align: center;
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
					location.href="<%=cp%>/addwokform.action";
				}
				else
				{
					return;
				}
			}
			else // 그렇지 않으면 ... (견주겸워커인경우는 견주 마이어리로 가게된다.)
			{
				location.href="<%=cp%>/ownermiarymain.action";
			}
			
		});// click end
	
		
		// 체크리스트 수정버튼 클릭
		$("#checkListBtn").click(function()
		{
			var checkList = $("#checkList").val();
			
			//alert(checkList);
			
			$.ajax({
				type: 'GET',
				url : 'updateCheckList.action',
				data : {checkList : checkList},
				success : function(data)
				{
					//alert(data);
					$("#checkList").val($.trim(data));
				}
				
			});
			
		});
		
		$("#deleteBtn").click(function()
		{
			if(confirm("삭제 하시겠습니까?") == true)
			{
				location.href="<%=cp%>/recdelete.action?recCd=" + $(this).val();
			}
			else
			{
				return;
			}
		});
		
	});// ready end

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
			<div class="content col-md-11">
				<!-- 0708 수정 -->

				<!-- 메인 영역 -->
				<div class="main col-md-12">
					<!-- 0708 수정 -->

					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<h2 class="text-center" style="font-weight: bold;">
								<span class="glyphicon glyphicon-pencil" style="color: #2E9AFE; margin-right: 1%;"></span>게시글 보기
							</h2>
						</div>
						<div class="col-md-1"></div>
						
						<div class="col-md-12">
	
							<div class="col-md-1"></div>
					
							<div class="col-md-10">
								<table class="table">
									<tr>
										<th style="width: 20%; background-color: #E0E0E0;">카테고리</th>
										<td style="text-align: left;">&nbsp;&nbsp;${article.item }</td>
										<th style="width: 20%; background-color: #E0E0E0;">날씨</th>
										<td style="text-align: left;">&nbsp;&nbsp;${article.weather }</td>
									</tr>
									<tr>
										<th style="width: 20%; background-color: #E0E0E0;">시간</th>
										<td colspan="3" style="text-align: left;">&nbsp;&nbsp;${article.schDate }(${article.startTime } ~ ${article.endTime })</td>
									</tr>
									<tr>
										<th style="width: 20%; background-color: #E0E0E0;">장소</th>
										<td style="text-align: left;">&nbsp;&nbsp;${article.addr }</td>
									</tr>
									<tr>
										<th style="width: 20%; background-color: #E0E0E0;">제목</th>
										<td colspan="3" style="text-align: left;">&nbsp;&nbsp;${article.title }</td>
									</tr>
									<tr>
										<th style="background-color: #E0E0E0;">작성자</th>
										<td style="text-align: left;">&nbsp;&nbsp;${article.name }</td>
										<th style="width: 20%; text-align: center; background-color: #E0E0E0;">작성일</th>
										<td style="text-align: left;">&nbsp;&nbsp;${article.insDate }</td>
									</tr>
									<tr>
										<td colspan="4">
											<div style="margin-top: 20px; margin-bottom: 20px;">
												${article.content }
											</div>
										</td>
									</tr>
									<tr>
										<th colspan="4" style="background-color: #E0E0E0;">가계부</th>
									</tr>
									<c:forEach var="acc" items="${accList }">
										<tr>
											<th>${acc.item }</th>
											<td colspan="2">${acc.content }</td>
											<td>${acc.price }</td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan="4" style="text-align: right">
											<button type="button" class="btn btn-xs" onclick="location.href='<%=cp %>/recupdate.action?recCd=${article.recCd }'">수정</button>
											<button type="button" class="btn btn-xs" id="deleteBtn" value="${article.recCd }">삭제</button>
										</td>
									</tr>
								</table>
							</div>
							
							<div class="col-md-1"></div>
							
						</div>	
					</div>

				</div>
				<!-- end main -->

			</div>
			<!-- end content  -->

			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1" style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownermiarymain.action">메 인</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
						<li class="nav-item" style="background-color: #FFFFFF;"><a class="nav-link active" href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownergrouptab.action">그 룹</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerstatisticstab.action">통 계</a></li>
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