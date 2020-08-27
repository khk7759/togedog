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
<link rel="stylesheet" type="text/css" href="css/Modal.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
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
		
		// 닉네임 클릭하면 상세정보 볼 수 있음
		$("a").filter(".detail1").click(function()
		{	
			//견주아이디 = $(this).val();
			$("#modal1").show();
		});
		
		$("a").filter(".detail2").click(function()
		{
			//견주아이디 = $(this).val();
			$("#modal2").show();
		});
		
	});
	
	function closeModal()
	{
		$('.searchModal').hide();
	};


</script>


<style type="text/css">

	.star
	{
		color : var(--yellow-color);
	}
	
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
		width :100%;
		margin : 0px 0px 0px 0px;
		padding: 0px 0px 0px 0px;
		border-radius: 0px 0px 0px 0px;
		background-color: var(--blue);
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
	  
	.flex-column > li > a:hover,
	.flex-column > li > a:focus 
	{
		text-decoration: none;
		background-color: #fff;
		border-radius: 0 10px 10px 0;
	}
	
	 .nav-tabs > li > a 
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
				<div class="content col-md-11">
				
					<!-- 메인 영역 -->
					<div class="main col-md-12">
						<!-- 마이 정보 / 마이펫 정보 / 소셜 탭 -->
						<div class="tabbable col-md-12" id="tabs-460097">
							<ul class="nav nav-tabs" style="border-bottom: none;">
								<li class="nav-item col-md-4">
		                           <a class="nav-link" href="<%=cp %>/ownerfriendlist.action">소셜</a>
		                        </li>
								<li class="nav-item col-md-4">
									<a class="nav-link" href="<%=cp %>/ownerinfotab.action">마이 정보</a>
								</li>
		                        <li class="nav-item col-md-4">
		                           <a class="nav-link" href="<%=cp %>/ownerpetinfo.action">마이펫 정보</a>
		                        </li>
							</ul>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-12" >
							<div class="col-md-12"> 
								<!-- 친구/가족/차단 버튼  --> 
								<div style="margin: 10px 0px 10px 10px; padding:0px;"class="pull-center">
									<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='ownerfriendlist.action'">소셜목록</button>
									<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='ownerfriendapply.action'">신청목록</button>
									<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='ownerblocklist.action'">차단목록</button>
								</div>	
							</div>
							
							<div class="col-md-12">
								<!-- 내가 받은 친구 신청 -->
								<div class="txt"><span><img src="images/FOOT.png" alt="🐾" style="width: 30px; margin-right: 10px;"/>받은 친구 신청</span></div>
								<div style=" width: 90%; margin: 20px 5% 0% 5%;">
								<table class="toMeList table table-hover table-condensed">
								<tr>
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">상세정보</th>
									<th style="text-align: center;">지역</th>
									<th style="text-align: center;">닉네임</th>
									<th style="text-align: center;">평점</th>
									<th style="text-align: center;">강아지 수</th>
									<th style="text-align: center;">관심사</th>
									<th style="text-align: center;">메세지</th>
									<th style="text-align: center;">신청날짜</th>
									<th style="text-align: center;">버튼</th>									
								</tr>
								
								<tr>
									<td>4</td>
									<td><a class="detail1">상세정보보기</a></td>
									<td>서울</td>
									<td>으하하</td>
									<td><span class="star">★★★☆☆</span> [7]</td>
									<td>3마리</td>
									<td>운동</td>
									<td>친구 신청해요 ㅎㅎ </td>
									<td>2020.07.05</td>
									<td>
										<button type="button" class="btn btn-default btn-xs">수락</button>
										<button type="button" class="btn btn-default btn-xs">거절</button>
										<!-- 거절 시 안보이게 / 수락 시 친구테이블로..
											 버튼 클릭하면 수락/거절할거냐는 확인 버튼
										-->
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td><a class="detail1">상세정보보기</a></td>
									<td>서울</td>
									<td>으하하</td>
									<td><span class="star">★★★☆☆</span> [5]</td>
									<td>3마리</td>
									<td>운동</td>
									<td>친구 신청해요 ㅎㅎ </td>
									<td>2020.07.05</td>
									<td>
										<button type="button" class="btn btn-default btn-xs">수락</button>
										<button type="button" class="btn btn-default btn-xs">거절</button>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td><a class="detail1">상세정보보기</a></td>
									<td>서울</td>
									<td>으하하</td>
									<td><span class="star">★★★☆☆</span> [13]</td>
									<td>3마리</td>
									<td>운동</td>
									<td>친구 신청해요 ㅎㅎ </td>
									<td>2020.07.05</td>
									<td>
										<button type="button" class="btn btn-default btn-xs">수락</button>
										<button type="button" class="btn btn-default btn-xs">거절</button>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td><a class="detail1">상세정보보기</a></td>
									<td>서울</td>
									<td>으하하</td>
									<td><span class="star">★★★☆☆</span> [34]</td>
									<td>3마리</td>
									<td>운동</td>
									<td>친구 신청해요 ㅎㅎ </td>
									<td>2020.07.05</td>
									<td>
										<button type="button" class="btn btn-default btn-xs">수락</button>
										<button type="button" class="btn btn-default btn-xs">거절</button>
									</td>
								</tr>
							</table>
						</div><!-- end JoinGroupList -->
						
						<div class="txt"><span><img src="images/FOOT.png" alt="🐾" style="width: 30px; margin-right: 10px;"/>보낸 친구 신청</span></div>
						<div style=" width: 90%; margin: 20px 5% 0% 5%;">
							<table class="toYouList table table-hover table-condensed">
								<tr>
									<td>번호</td>
									<th>지역</th>
									<th>닉네임</th>
									<th>메세지</th>
									<th>신청날짜</th>
									<th>진행상태</th>
									<th>버튼</th>									
								</tr>
								<tr>
									<td>3</td>
									<td>서울</td>
									<td>으하하</td>
									<td>잘부탁해요~~!!! </td>
									<td>2020.07.05</td>
									<td>
										대기중
									</td>
									<td>
										<button type="button" class="btn btn-default btn-xs">취소</button>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>서울</td>
									<td>으하하</td>
									<td>잘부탁해요~~!!! </td>
									<td>2020.07.05</td>
									<td>
										대기중
									</td>
									<td>
										<button type="button" class="btn btn-default btn-xs">취소</button>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>서울</td>
									<td>으하하</td>
									<td>잘부탁해요...</td>
									<td>2020.07.05</td>
									<td>
										거절
									</td>
									<td>
										<button type="button" class="btn btn-default btn-xs">삭제</button>
									</td>
								</tr>
							</table>
						</div>	
						
						<div class="col-lg-6">
							<div class="txt"><span><img src="images/FOOT.png" alt="🐾" style="width: 30px; margin-right: 10px;"/>펫 공유하기</span>
							<span class="tooltip_event glyphicon glyphicon-question-sign" id="preFeedback"
								style="margin-left: 5px;" 
								data-toggle="tooltip" data-placement="right"
								 title="펫을 공유하면 캘린더의 일정과 기록을 연동할 수 있습니다."
							>
							</span>
							</div>
							<div style=" width: 90%; margin: 20px 5% 0% 5%;">
								<form action="" name ="sharePetForm">
								<table class="toYouList table table-hover table-condensed">
									<tr>
										<th>펫을 공유받을 회원 아이디를 입력해주세요</th>
									</tr>
									<tr>
										<td>
											<input type="text" >
											<button type="button" class="btn btn-default btn-xs">확인</button>
											<!-- 확인 버튼 클릭시 
												ㅇㅇㅇ님(닉네임)에게 펫을 공유하시겠습니까?
												 (자기가 등록한)강아지가 2마리 이상이면, 확인 버튼 클릭 시 
											     공유할 펫을 선택해주세요 모달창..  
											     1마리면 바로 공유 테이블 입력-->
										</td>
								</table>
								</form>
							</div>	
						</div>
						
						<div class="col-lg-6">
							<div class="txt"><span><img src="images/FOOT.png" alt="🐾" style="width: 30px; margin-right: 10px;"/>친구 신청하기</span>
							<span class="tooltip_event glyphicon glyphicon-question-sign" id="preFeedback"
								style="margin-left: 5px;" 
								data-toggle="tooltip" data-placement="right"
								 title="친구 신청을하면 매칭 등록을 하지 않아도 같이 산책할 수 있습니다."
							>
							</span>
							</div>
							<div style=" width: 90%; margin: 20px 5% 0% 5%;">
								<form action="" name ="sharePetForm">
								<table class="toYouList table table-hover table-condensed">
									<tr>
										<th>친구 신청할 회원 아이디를 입력해주세요</th>
									</tr>
									<tr>
										<td>
											<input type="text" >
											<button type="button" class="btn btn-default btn-xs">확인</button>
										</td>
								</table>
								</form>
							</div>		
						</div>
					</div>
							
							
						</div>
					
					</div><!-- end main -->
						
				</div><!-- end content  -->
					
				<!-- 탭들 감싸는 nav-bar -->
				<div class="nav-bar col-md-1"  style="margin-top: 15px; padding-left: 0px;">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownermiarymain.action">메 인</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownergrouptab.action">그 룹</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerstatisticstab.action">통 계</a></li>
						<li class="nav-item" style="background-color: #FFFFFF;"><a class="nav-link active" href="<%=cp %>/ownerfriendlist.action">정 보</a></li>
					</ul>
				</div><!--  end nav_bar -->
			</div><!-- end content-wrap  -->

		</div><!-- end container -->
		
		
		<!-- 상세정보 모달창 -->
		<!-- 내가 받은 친구 신청 -->
		<div id="modal1" class="searchModal">
			<div class="search-modal-content">
				<div class="page-header">
					<h3 style="font-weight: bold;">상세정보</h3>
				</div>
				
				<div class="row">
					<div class="col-sm-12">
					
					<div style="text-align: left; font-size: 17px; font-weight:bold;
					  margin: 0px 0px 10px 10px;">견주 정보</div>
					
						<table class="table table-hover table-condensed">
							<tr>
								<th style="text-align: center;">사진</th>
								<th style="text-align: center;">지역</th>
								<th style="text-align: center;">닉네임</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">평점</th>
								<th style="text-align: center;">관심사</th>
								<th style="text-align: center;">상세관심사</th>
								<th style="text-align: center;">선호산책시간</th>
								<th style="text-align: center;">신청날짜</th>
								<th style="text-align: center;">진행상태</th>
							</tr>
							<tr>
								<td>사진</td>
								<td>서울</td>
								<td>으하하</td>
								<td>20</td>
								<td>여</td>
								<td>★★★★☆[8]</td>
								<td>프로그래밍</td>
								<td>자바</td>
								<td>13:30~18:00</td>
								<td>2020.07.05</td>
								<td>대기중</td>
							</tr>
						</table>
						
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">강아지 정보</div>
					
						<table class="table table-hover table-condensed">
							<tr>
								<th style="text-align: center;">사진</th>
								<th style="text-align: center;">칭호</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">생년월일</th>
								<th style="text-align: center;">성별/중성화여부</th>
								<th style="text-align: center;">견종</th>
								<th style="text-align: center;">몸무게</th>
							</tr>
							<tr>
								<td>사진</td>
								<td>특출난 똑똑이</td>
								<td>
									<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-award" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M9.669.864L8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193l-1.51-.229L8 1.126l-1.355.702-1.51.229-.684 1.365-1.086 1.072L3.614 6l-.25 1.506 1.087 1.072.684 1.365 1.51.229L8 10.874l1.356-.702 1.509-.229.684-1.365 1.086-1.072L12.387 6l.248-1.506-1.086-1.072-.684-1.365z"/>
  <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
</svg>
									미미
								</td>
								<td>2017.05.08</td>
								<td>여/Y</td>
								<td>말티즈</td>
								<td>6.3kg</td>
							</tr>
							<tr>
								<td>사진</td>
								<td>서투른 골목대장</td>
								<td>마루</td>
								<td>2018.09.08</td>
								<td>여/Y</td>
								<td>말티즈</td>
								<td>5.8kg</td>
							</tr>
						</table>
						
						
						<!-- 친구 신청 메세지 -->
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">친구신청 메세지</div>
						<textarea rows="4" cols="10" style="width: 100%; border: none;" readonly="readonly"
						>자주 산책하고 친하게 지내요 ㅎㅎ 
						</textarea>
						
						<br>
						<button type="button" class="btn btn-default btn-xs">수락</button>
						<button type="button" class="btn btn-default btn-xs">거절</button>
						<button type="button" class="btn btn-default btn-xs">신고</button>
					</div>
				</div>
				
				<hr>
				<div
					style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
					onClick="closeModal();">
					<span class="pop_bt modalCloseBtn" style="font-size: 11pt;">
					닫기</span>
				</div>
			</div>
			
		</div><!-- end modal 받은 친구 신청 -->
		
		
		<!-- 펫 리스트 모달창 -->
		<!-- 펫 리스트 -->
		<div id="modal2" class="searchModal">
			<div class="search-modal-content">
				<div class="page-header">
					<h3 style="font-weight: bold;">상세정보</h3>
				</div>
				
				<div class="row">
					<div class="col-sm-12">
					
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">펫 정보</div>
					
						<table class="table table-hover table-condensed">
							<tr>
								<th text-align: center; >사진</th>
								<th text-align: center; >칭호</th>
								<th text-align: center; >이름</th>
								<th text-align: center; >생년월일</th>
								<th text-align: center; >성별/중성화여부</th>
								<th text-align: center; >견종</th>
								<th text-align: center; >몸무게</th>
								<th text-align: center; >
									선택
								</th>
							</tr>
							<tr>
								<td>사진</td>
								<td>특출난 똑똑이</td>
								<td>
									<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-award" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M9.669.864L8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193l-1.51-.229L8 1.126l-1.355.702-1.51.229-.684 1.365-1.086 1.072L3.614 6l-.25 1.506 1.087 1.072.684 1.365 1.51.229L8 10.874l1.356-.702 1.509-.229.684-1.365 1.086-1.072L12.387 6l.248-1.506-1.086-1.072-.684-1.365z"/>
  <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
</svg>
									미미
								</td>
								<td>2017.05.08</td>
								<td>여/Y</td>
								<td>말티즈</td>
								<td>6.3kg</td>
								<td>
									<input type="checkbox">
								</td>
							</tr>
							<tr>
								<td>사진</td>
								<td>서투른 골목대장</td>
								<td>마루</td>
								<td>2018.09.08</td>
								<td>여/Y</td>
								<td>말티즈</td>
								<td>5.8kg</td>
							</tr>
						</table>
						
						<br>
						<button type="button" class="btn btn-default btn-xs">확인</button>
					</div>
				</div>
				
				<hr>
				<div
					style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
					onClick="closeModal();">
					<span class="pop_bt modalCloseBtn" style="font-size: 11pt;">
					닫기</span>
				</div>
			</div>
			
		</div><!-- end modal 받은 친구 신청 -->
		
	<c:import url="Footer.jsp"></c:import>
		
</body>
</html>