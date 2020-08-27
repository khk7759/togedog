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
		
		// 상세정보 보기 클릭하면 상세정보 볼 수 있음
		$("a").filter(".detail1").click(function()
		{
			//견주아이디 = $(this).val();
			$("#modal1").show();
		});
		
		$("a").filter(".detail2").click(function()
		{
			$("#modal2").show();
		});
		
		
		//툴팁
		//$('#preFeedback').tooltip();
	
		// 페이지 접속할 때 
		$.ajax({
			type:"POST",
			url : "agencyapplylist.action"
		});
		
		// 수락 버튼 클릭 시 
		$("button[name=okBtn]").click(function()
		{
			var msg = prompt("신청메세지를 입력해주세요.");
			//alert(msg);
			var agcCd = $(this).val();
			//alert(agcCd);
	
			$.ajax({
				type: "POST",
				url: "wokAgcAccept.action",
				data : { agcCd : agcCd,
						 msg : msg }
			});
		});
		
		

	}); // end ready
	
	function closeModal()
	{
		$('.searchModal').hide();
	};
	
	
	
</script>


<style type="text/css">

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
	padding: 0px 0px 0px 90px;
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
					<div class="main col-md-10">						
							
						<!-- 신청내역/매칭 완료 -->
						<div class="tabbable col-md-8" id="tabs-460097">
							<ul class="nav nav-tabs" style="border-bottom: none;">
								<li class="nav-item col-md-4">
									<a class="nav-link" href="<%=cp%>/agencyapplylist.action" data-toggle="tab">대행신청 내역</a>
								</li>
								<li class="nav-item col-md-4">
									<a class="nav-link" href="<%=cp%>/agencycompletematchinglist.action" data-toggle="tab">대행매칭 완료</a>
								</li>
							</ul>
						</div>
					
						<br><br><br><br>
						
						<div class="txt"><span><img src="images/FOOT.png" alt="🐾" style="width: 30px; margin-right: 10px;"/>도착한 대행신청</span></div>
						<div style=" width: 90%; margin: 20px 5% 0% 5%;">
							<table class="toMeList table table-hover table-condensed">
								<tr>
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">상세정보</th>
									<th style="text-align: center;">사진</th>
									<th style="text-align: center;">이름</th>
									<th style="text-align: center;">나이</th>
									<th style="text-align: center;">성별</th>
									<th style="text-align: center;">산책날짜</th>
									<th style="text-align: center;">산책시간</th>
									<th style="text-align: center;">산책장소</th>
									<th style="text-align: center;">금액</th><!-- 워커가 받는 금액 -->
									<th style="text-align: center;">버튼</th>							
								</tr>
								<c:forEach var="agc" items="${agcList }">
								<tr>
									<td>${agc.rowN }</td>
									<td><a class="detail1">상세정보보기</a></td>
									<td>${agc.photo }</td>
									<td>${agc.name }</td>
									<td>${agc.age }</td>
									<td>${agc.gender }</td>
									<td>${agc.walkDate }</td>
									<td>${agc.startTime } ~ ${agc.endTime }</td>
									<td>${agc.addr2 } ${agc.addr3 } ${agc.addrDetail }</td>
									<td>금액</td>
									<td>
										<button type="button" name="okBtn" value="${agc.agcCd }" class="btn btn-default btn-xs">수락</button>
										<button type="button" class="btn btn-default btn-xs">거절</button>
									</td>
								</tr>
								</c:forEach>
								
							</table>
						</div><!-- end JoinGroupList -->
							
							
						<div class="txt"><span><img src="images/FOOT.png" alt="🐾" style="width: 30px; margin-right: 10px;"/>대기중 대행신청</span></div>
						<div style=" width: 90%; margin: 20px 5% 0% 5%;">
							<table class="toYouList table table-hover table-condensed">
								<tr>
									<th>번호</th>
									<th>상세정보</th>
									<th>사진</th>
									<th>이름</th>
									<th>나이</th>
									<th>성별</th>
									<th>산책날짜</th>
									<th>산책시간</th>
									<th>산책장소</th>
									<th>금액</th><!-- 워커가 받는 금액 -->
									<!-- 워커는 취소 불가라서 취소 버튼 없음 -->
								</tr>	
								<c:forEach var="waiting" items="${waitingList }">
									<tr>
										<td style="text-align: center;">${waiting.rowN }</td>
										<td style="text-align: center;"><a class="detail2">상세정보보기</a></td>
										<td style="text-align: center;">${waiting.photo }</td>
										<td style="text-align: center;">${waiting.name }</td>
										<td style="text-align: center;">${waiting.age }</td>
										<td style="text-align: center;">${waiting.gender }</td>
										<td style="text-align: center;">${waiting.walkDate }</td>
										<td style="text-align: center;">${waiting.startTime } ~ ${waiting.endTime }</td>
										<td style="text-align: center;">${waiting.addr2 } ${waiting.addr3 } ${waiting.addrDetail }</td>
										<td style="text-align: center;">금액</td>
									</tr>
								</c:forEach>							
							</table>
						</div>	
							
							
					</div><!-- end main -->
						
				</div><!-- end content  -->
					
				<!-- 탭들 감싸는 nav-bar -->
				<div class="nav-bar col-md-1"
					style="margin-top: 15px; padding-left: 0px;">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%=cp%>/workermiarymain.action">메 인</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a class="nav-link" href="<%=cp%>/agencyapplylist.action">매 칭</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp%>/workeraccount.action">정 산</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp%>/workerstatistics.action">통 계</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp%>/workermyinfo.action">정 보</a></li>
					</ul>
				</div>
				<!--  end nav_bar -->
			</div><!-- end content-wrap  -->

		</div><!-- end container -->
		
		
		
		
		<!-- 내게 도착한 대행신청 모달창 -->
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
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">산책날짜</th>
								<th style="text-align: center;">산책시간</th>
								<th style="text-align: center;">산책장소</th>
								<th style="text-align: center;">산책 강아지 수</th>
								<th style="text-align: center;">금액</th><!-- 워커가 받는 금액 -->
							</tr>
							<tr>
								<td>사진</td>
								<td>이채빈</td>
								<td>23</td>
								<td>여</td>
								<td>2020.07.17</td>
								<td>12:00~12:30</td>
								<td>서교동 풍성빌딩 앞</td>
								<td>2</td>
								<td> 29,000원</td>
							</tr>
						</table>
						
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">강아지 정보</div>
					
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
						
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">장애·알러지 정보</div>
					
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
						<!-- 수락 누르면 대행 메세지 작성하는 폼 떠야함 -->
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
		</div><!-- end modal1 -->


		<!-- 대기중 대행신청 모달창 -->
		<div id="modal2" class="searchModal">
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
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">산책날짜</th>
								<th style="text-align: center;">산책시간</th>
								<th style="text-align: center;">산책장소</th>
								<th style="text-align: center;">산책 강아지 수</th>
								<th style="text-align: center;">금액</th><!-- 워커가 받는 금액 -->
							</tr>
							<tr>
								<td>사진</td>
								<td>이채빈</td>
								<td>23</td>
								<td>여</td>
								<td>2020.07.17</td>
								<td>12:00~12:30</td>
								<td>서교동 풍성빌딩 앞</td>
								<td>2</td>
								<td> 29,000원</td>
							</tr>
						</table>
						
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">강아지 정보</div>
					
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
						
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">장애·알러지 정보</div>
					
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
		
</body>
</html>