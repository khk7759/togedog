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
<!-- <link rel="stylesheet" type="text/css" href="css/MiaryStyle.css"> -->
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" type="text/css" href="css/Modal.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
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
					location.href="<%=cp%>/addownform.action";
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
		
		// 상세정보 보기 클릭하면 상세정보 볼 수 있음
		$("a").filter(".detail1").click(function()
		{
			//견주아이디 = $(this).val();
			$("#modal1").show();
		});

		
		
		// 체크리스트 수정버튼 클릭
		$("#checkListBtn").click(function()
		{
			var checkList = $("#checkList").val();
			
			alert(checkList);
			
			$.ajax({
				type: 'GET',
				url : 'updateWokCheckList.action',
				data : {checkList : checkList},
				success : function(data)
				{
					alert(data);
					$("#checkList").val($.trim(data));
				}
				
			});
			
		});// end click
		
		
		
	});

	function closeModal()
	{
		$('.searchModal').hide();
	};
	
	
	
	
</script>

<style type="text/css">

	textarea 
	{ 
		border-radius : 4px;
		padding: 12px 12px 12px 12px;
	}
	
	textarea:focus 
	{
 		outline: none;
	}
	

	p 
	{
		text-align: left;
		margin: 2px 0px 2px 0px;
		padding: 0px 0px 0px 0px;
	}
	
	.nav-tabs 
	{
		padding: 0px 0px 0px 0px;
		margin: 10px 0px 0px 0px;
	}
	
	.nav-bar 
	{
		margin: 0px 0px 0px 0px;
		padding: 0px 0px 0px 0px;
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
	
	/* .css 안먹어서 중복 추가 */
	.content-wrap 
	{
		width: 100%;
		margin: 0px 0px 0px 0px;
		padding: 0px 0px 0px -10px;
		border-radius: 0px 0px 0px 0px;
		background-color: var(- -blue);
	}
	
	/* 알림, 쪽지 */
	.badge 
	{
		background-color: var(--red);
		z-index: 1;
		position: relative;
		font-size: 10px;
		font-weight: 700;
		line-height: 18px;
		display: inline-block;
		min-width: 5px;
		height: 18px;
		padding: 0 4px;
		vertical-align: top;
		letter-spacing: 0;
		color: #fff;
		border-radius: 18px;
		left: -5px;
		top: 3px;
	}
	
	.icon 
	{
		font-size: 16px;
		position: relative;
		top: -7px;
		left: 5px;
	}

	/* 추가 200726 */
	.nav-item:hover
	{
		background-color: #FFFFFF;
		cursor: pointer;
	}
	
	div.main
	{
		width: 83.3%;
		height: 100%;
		margin: 15px 0px 15px 0px;
		padding: 0px 0px 0px 0px;
		border-radius: 4px 0px 4px 4px;
		background-color: white;
		
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
					<li class="nav-item" style="margin-left: 20px; background-color: #E8E8E8;">
						<a class="nav-link" id="ownertab" data-toggle="tab">견주</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="workertab" data-toggle="tab">워커</a>
					</li>
				</ul>
			</div>
			<!-- side 와 main 감싸는 content -->
			<div class="content col-md-11">

				<!-- profile 감싸는 side -->
				<div class="side col-md-2">

					<!-- 사진, 닉네임, 회원단계 감싸는 profile -->
					<div class="profile col-md-12">
						<div class="photo col-md-5">
							<img src="images/woman.png" width="100%;" height="100%;"
								style="border-radius: 100px; border: solid 1.5px;"></img>
						</div>
						<div class="nick-grade col-md-7" style="text-align: center;">
							<div class="nick">
								<span
									style="color: #42BDFF; font-size: 13px; font-weight: bold;">${name }</span>
							</div>
						</div>

					</div>

					<!-- 알림, 쪽지 감싸는 noti-note -->
					<div class="noti-note" style="margin-bottom: 30px;">
						<div class=" noti col-md-6">
							<c:if test="${notiCount == 0 }">
							</c:if>
							
							<c:if test="${notiCount != 0 }">
								<span class="badge badge-pill" style="background-color: #F25C69;">${notiCount }</span>
							</c:if>
							<br>	
							<a href="#">
								<svg class="icon" width="1.4em" height="1.4em" viewBox="0 0 16 16" class="bi bi-bell-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  									<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
								</svg>
							</a>
						</div>
						<div class=" note col-md-6">
							<c:if test="${noteCount == 0 }">
							</c:if>
							
							<c:if test="${noteCount != 0 }">
								<span class="badge badge-pill" style="background-color: #F25C69;">${noteCount }</span>
							</c:if>
							<br>	
							<a href="#">
								<svg class="icon" width="1.4em" height="1.4em" viewBox="0 0 16 16" class="bi bi-envelope-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd" d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
								</svg>
							</a>
						</div>
					</div>

					<!-- 체크리스트, 당일 산책정보 감싸는 check-today -->
					<div class="check-today" style="margin-bottom: 12px;">
						<p>체크리스트</p>
							<div class="checklist col-md-12">
								<textarea name="checkList" id="checkList" rows="15" cols="23" style="resize: none; border: none">${checkList }</textarea>
							</div>
							<div class="col-md-6"></div>
							<div class="col-md-6">
								<button type="button" id="checkListBtn" class="btn btn-xs" style="margin: 10px 0px 10px 0px;">수정</button>
							</div>
						<p>당일산책정보</p>
						<div class="todayInfo col-md-12" style="height: 118px;">
							당일산책정보 제공 <br>
							<br>
							<br>
							<br>
							<br>
						</div>
					</div>


				</div>
				<!-- end side -->

				<!-- 메인 영역 -->
				<div class="main col-md-10"
					style="height: 470px; text-align: center; line-height: 25px;">

					<br>
					<br> <span
						style="color: #42BDFF; font-size: 15px; font-weight: bold;">${name } 워커님,
						어서오세요.</span><br> <span
						style="color: #666666; font-size: 15px; font-weight: bold;">현재
						예정된 산책을 확인하세요 :)</span> <br>
					<br>
					<div style="width: 90%; margin: 10px 5% 0% 5%;">
						<table class="toMeList table table-hover table-condensed">
							<tr>
								<th style="text-align: center;">상세정보</th>
								<th style="text-align: center;">닉네임</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">산책날짜</th>
								<th style="text-align: center;">산책시간</th>
								<th style="text-align: center;">산책장소</th>
								<th style="text-align: center;">대표반려견</th>
								<th style="text-align: center;">금액</th>
								<th style="text-align: center;">진행상태</th>
								<th style="text-align: center;">버튼</th>
							</tr>
							<tr>
								<td><a class="detail1">상세정보보기</a></td>
								<td>으하하</td>
								<td>23</td>
								<td>여</td>
								<td>2020.07.17</td>
								<td>12:00~12:30</td>
								<td>홍대</td>
								<td>미미(말티즈/여)</td>
								<td>25,000원</td>
								<td>산책대기</td>
								<td>
									<button type="button" class="btn btn-default btn-xs"
										style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">피드백</button>
									<button type="button" class="btn btn-default btn-xs"
										style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">산책기록</button>
								</td>
							</tr>
							<tr>
								<td><a class="detail1">상세정보보기</a></td>
								<td>으하하</td>
								<td>23</td>
								<td>여</td>
								<td>2020.07.17</td>
								<td>12:00~12:30</td>
								<td>홍대</td>
								<td>미미(말티즈/여)</td>
								<td>25,000원</td>
								<td>산책대기</td>
								<td>
									<button type="button" class="btn btn-default btn-xs"
										style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">피드백</button>
									<button type="button" class="btn btn-default btn-xs"
										style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">산책기록</button>
								</td>
							</tr>
							<tr>
								<td><a class="detail1">상세정보보기</a></td>
								<td>으하하</td>
								<td>23</td>
								<td>여</td>
								<td>2020.07.17</td>
								<td>12:00~12:30</td>
								<td>홍대</td>
								<td>미미(말티즈/여)</td>
								<td>25,000원</td>
								<td>기록대기</td>
								<td>
									<button type="button" class="btn btn-default btn-xs"
										style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">피드백</button>
									<button type="button" class="btn btn-default btn-xs"
										style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">산책기록</button>
								</td>
							</tr>
							<tr>
								<td><a class="detail1">상세정보보기</a></td>
								<td>으하하</td>
								<td>23</td>
								<td>여</td>
								<td>2020.07.17</td>
								<td>12:00~12:30</td>
								<td>홍대</td>
								<td>미미(말티즈/여)</td>
								<td>25,000원</td>
								<td>기록대기</td>
								<td>
									<button type="button" class="btn btn-default btn-xs"
										style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">피드백</button>
									<button type="button" class="btn btn-default btn-xs"
										style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">산책기록</button>
								</td>
							</tr>
						</table>
					</div>
					<!-- end JoinGroupList -->




				</div>

			</div>
			<!-- end content  -->

			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1"
				style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item" style="background-color: #ffffff;"><a class="nav-link" href="<%=cp%>/workermiarymain.action">메 인</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/agencyapplylist.action">매 칭</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/workeraccount.action">정 산</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/workerstatistics.action">통 계</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/workermyinfo.action">정 보</a></li>
				</ul>
			</div>
			<!--  end nav_bar -->
		</div>

	</div>
	<!-- end container -->


	<!-- 상세정보 모달 -->
	<div id="modal1" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<h3 style="font-weight: bold;">상세정보</h3>
			</div>

			<div class="row">
				<div class="col-sm-12">

					<div
						style="text-align: left; font-size: 17px; font-weight: bold; margin: 0px 0px 10px 10px;">견주
						정보</div>

					<table class="table table-hover table-condensed">
						<tr>
							<th style="text-align: center;">사진</th>
							<th style="text-align: center;">닉네임</th>
							<th style="text-align: center;">나이</th>
							<th style="text-align: center;">성별</th>
							<th style="text-align: center;">산책날짜</th>
							<th style="text-align: center;">산책시간</th>
							<th style="text-align: center;">산책장소</th>
							<th style="text-align: center;">산책 강아지 수</th>
							<th style="text-align: center;">금액</th>
							<!-- 워커가 받는 금액 -->
						</tr>
						<tr>
							<td>사진</td>
							<td>으하하</td>
							<td>23</td>
							<td>여</td>
							<td>2020.07.17</td>
							<td>12:00~12:30</td>
							<td>서교동 풍성빌딩 앞</td>
							<td>2</td>
							<td>29,000원</td>
						</tr>
					</table>

					<div
						style="text-align: left; font-size: 17px; font-weight: bold; margin: 0px 0px 10px 10px;">강아지
						정보</div>

					<table class="table table-hover table-condensed">
						<tr>
							<th style="text-align: center;">사진</th>
							<th style="text-align: center;">이름</th>
							<th style="text-align: center;">나이</th>
							<th style="text-align: center;">성별</th>
							<th style="text-align: center;">중성화여부</th>
							<th style="text-align: center;">견종</th>
							<th style="text-align: center;">사이즈</th>
							<th style="text-align: center;">몸무게</th>
						</tr>
						<tr>
							<td>사진</td>
							<td>마루</td>
							<td>3살</td>
							<td>여</td>
							<td>Y</td>
							<td>말티즈</td>
							<td>소형</td>
							<td>5.8kg</td>
						</tr>
						<tr>
							<td>사진</td>
							<td>미미</td>
							<td>3살</td>
							<td>여</td>
							<td>Y</td>
							<td>말티즈</td>
							<td>소형</td>
							<td>6.5kg</td>
						</tr>
					</table>

					<br>
					<br>
					<button type="button" class="btn btn-default btn-xs"
						style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">피드백</button>
					<button type="button" class="btn btn-default btn-xs"
						style="width: 100px; height: 25px; padding: 0; letter-spacing: 0.05em; border-radius: 5px; font-size: 13px; box-shadow: none;">산책기록</button>
				</div>
			</div>
			<br>

			<!-- 워커는 취소 없음 -->

			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="closeModal();">
				<span class="pop_bt modalCloseBtn" style="font-size: 11pt;">
					닫기</span>
			</div>
		</div>
	</div>


	<c:import url="Footer.jsp"></c:import>
	<c:import url="CalModal.jsp"></c:import>
</body>
</html>