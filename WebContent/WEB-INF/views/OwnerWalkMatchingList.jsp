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
		$("#ownertab").click(function() 
		{
			location.href="<%=cp%>/ownermiarymain.action";	
		});
		
		$("#workertab").click(function() 
		{
			// 세션에 들어간 유저타입이 뭔지 jstl 로 알아냄 그리고 userType 에 담는다.
			var userType = "<c:out value='${sessionScope.user.getUserType()}'/>";
			
			//alert(userType);
			
			// 유저타입이 견주이면
			if(userType == "견주")
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
		
		// 산책매칭완료 탭 클릭하면
		$("#walkMatcingComplete").click(function()
		{
			// 세션에 들어간 유저코드를 알아내서 
			var userCd = "<c:out value='${sessionScope.user.getCode()}' />";
			
			//유저 코드 전송
			$(location).attr("href","ownercompletewalkmatching.action?userCd="+userCd);
			
		});
		
		
		$("button").filter(".detail1").click(function()
		{
			$("#modal1").show();
			
			$.ajax(
			{
				url : "ownwalkreceivedetailown.action",
				method : "POST",
				async : false,
				data : {walkCd : $(this).val()},
				success : function(data)
				{	
					$("#own > tbody").empty();
					$("#own > tbody").append(data);
				}
			});
			
			$.ajax(
			{
				url : "ownwalkreceivedetailpet.action",
				method : "POST",
				async : false,
				data : {walkCd : $(this).val()},
				success : function(data)
				{	
					$("#pet > tbody").empty();
					$("#pet > tbody").append(data);
				}
			});
			
			$.ajax(
			{
				url : "ownwalkreceivedetailallerge.action",
				method : "POST",
				async : false,
				data : {walkCd : $(this).val()},
				success : function(data)
				{	
					$("#petsub > tbody").empty();
					$("#petsub > tbody").append(data);
				}
			});
			
			$.ajax(
			{
				url : "ownwalkreceivedetailfdb.action",
				method : "POST",
				async : false,
				data : {walkCd : $(this).val()},
				success : function(data)
				{
					$("#ownfdb > tbody").empty();
					$("#ownfdb > tbody").append(data);
				}
			});
		});
		
		$(".yes").click(function()
		{
			if(confirm("수락 하시겠습니까?") == true)
			{
				location.href="<%=cp%>/ownwalklastinsert.action?walkCd=" + $(this).val();
			}
			else
			{
				return;
			}
		});
		
		$(".no").click(function()
		{
			if(confirm("거절 하시겠습니까?") == true)
			{
				location.href="<%=cp%>/ownwalklastdelete.action?walkCd=" + $(this).val();
			}
			else
			{
				return;
			}
		});
		
		$(".cancel").click(function()
		{
			if(confirm("산책 신청을 취소 하시겠습니까?") == true)
			{
				location.href="<%=cp%>/ownwalkdelete.action?walkCd=" + $(this).val();
			}
			else
			{
				return;
			}
		});
		
		$("button").filter(".detail2").click(function()
		{
			$("#modal2").show();
			
			$.ajax(
			{
				url : "ownwalksenddetailown.action",
				method : "POST",
				async : false,
				data : {walkCd : $(this).val()},
				success : function(data)
				{	
					$("#own2 > tbody").empty();
					$("#own2 > tbody").append(data);
				}
			});
			
			$.ajax(
			{
				url : "ownwalkreceivedetailpet.action",
				method : "POST",
				async : false,
				data : {walkCd : $(this).val()},
				success : function(data)
				{	
					$("#pet2 > tbody").empty();
					$("#pet2 > tbody").append(data);
				}
			});
			
			$.ajax(
			{
				url : "ownwalkreceivedetailallerge.action",
				method : "POST",
				async : false,
				data : {walkCd : $(this).val()},
				success : function(data)
				{	
					$("#petsub2 > tbody").empty();
					$("#petsub2 > tbody").append(data);
				}
			});
		});
		
		
		//툴팁
		//$("#preFeedback").tooltip();

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
				<div class="main col-md-10">						
						
					<!-- 신청내역/매칭 완료 -->
					<div class="tabbable col-md-8" id="tabs-460097">
						<ul class="nav nav-tabs" style="border-bottom: none;">
							<li class="nav-item col-md-4">
								<a class="nav-link active" href="<%=cp %>/ownerwalkmatching.action" data-toggle="tab">산책신청 내역</a>
							</li>
							<li class="nav-item col-md-4">
								<a class="nav-link" id="walkMatcingComplete" data-toggle="tab">산책매칭 완료</a>
							</li>
						</ul>
					</div>
				
					<!-- 산책매칭/대행매칭 버튼 -->
				
					<div class="menus col-md-4">
						<button type="button" class="btn btn-xs"  
						 style="background-color: var(--deep-blue);"
						 onclick="location.href='<%=cp %>/ownerwalkmatching.action'">산책</button>
						<button type="button" class="btn btn-xs"
						 style="background-color: var(--deep-blue);"
						 onclick="location.href='<%=cp %>/ownerworkermatching.action'">대행</button>
					</div>	
 
					<br><br><br><br>
					
					<div class="txt"><span><img src="images/FOOT.png" alt="🐾" style="width: 30px; margin-right: 10px;"/>받은 산책신청</span></div>
					<div style=" width: 90%; margin: 20px 5% 0% 5%;">
						<table class="toMeList table table-hover table-condensed">
							<tr>
								<th style="text-align: center;">번호</th>
								<th style="text-align: center;">상세정보</th>
								<th style="text-align: center;">닉네임</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">산책날짜</th>
								<th style="text-align: center;">산책시간</th>
								<th style="text-align: center;">산책장소</th>
								<th style="text-align: center;">대표반려견</th>
								<th style="text-align: center;">신청날짜</th>
								<th style="text-align: center;">버튼</th>									
							</tr>
							<c:forEach var="list1" items="${walkReceiveList }">
								<tr>
									<td>${list1.rowN }</td>
									<td><button class="detail1" value="${list1.walkCd }">상세정보보기</button></td>
									<td>${list1.nickName }</td>
									<td>${list1.age }</td>
									<td>${list1.gender }</td>
									<td>${list1.walkDate }</td>
									<td>${list1.startTime }</td>
									<td>${list1.addrDetail }</td>
									<td>${list1.petName }(${list1.dogType }/${list1.petGender })</td>
									<td>${list1.insDate }</td>
									<td>
										<button type="button" class="btn btn-default btn-xs yes" value="${list1.walkCd }">수락</button>
										<button type="button" class="btn btn-default btn-xs no" value="${list1.walkCd }">거절</button>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div><!-- end JoinGroupList -->
						
					
					<div class="txt"><span><img src="images/FOOT.png" alt="🐾" style="width: 30px; margin-right: 10px;"/>보낸 산책신청</span></div>
					<div style=" width: 90%; margin: 20px 5% 0% 5%;">
						<table class="toYouList table table-hover table-condensed">
							<tr>
								<th style="text-align: center;">번호</th>
								<th style="text-align: center;">상세보기</th>
								<th style="text-align: center;">닉네임</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">산책날짜</th>
								<th style="text-align: center;">산책시간</th>
								<th style="text-align: center;">산책장소</th>
								<th style="text-align: center;">대표반려견</th>
								<th style="text-align: center;">신청날짜</th>
								<th style="text-align: center;">버튼</th>									
							</tr>
							<c:forEach var="list2" items="${walkSendList }">
								<tr>
									<td>${list2.rowN }</td>
									<td><button class="detail2" value="${list2.walkCd }">상세정보보기</button></td>
									<td>${list2.nickName }</td>
									<td>${list2.age }</td>
									<td>${list2.gender }</td>
									<td>${list2.walkDate }</td>
									<td>${list2.startTime }</td>
									<td>${list2.addrDetail }</td>
									<td>${list2.petName }(${list2.dogType }/${list2.petGender })</td>
									<td>${list2.insDate }</td>
									<td>
										<button type="button" class="btn btn-default btn-xs cancel" value="${list2.walkCd }">취소</button>
										<button type="button" class="btn btn-default btn-xs">신고</button>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>	
					
					
				</div><!-- end main -->
					
			</div><!-- end content  -->
				
			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1"  style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownermiarymain.action">메 인</a></li>
					<li class="nav-item" style="background-color: #FFFFFF;"><a class="nav-link active" href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownergrouptab.action">그 룹</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerstatisticstab.action">통 계</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerfriendlist.action">정 보</a></li>
				</ul>
			</div><!--  end nav_bar -->
		</div><!-- end content-wrap  -->

	</div><!-- end container -->
	
	
	
	
	<!-- 내가 받은 신청 모달창 -->
	<div id="modal1" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<h3 style="font-weight: bold;">상세정보</h3>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
				
				<div style="text-align: left; font-size: 17px; font-weight:bold;
				  margin: 0px 0px 10px 10px;">견주 정보</div>
				
					<table id="own" class="table table-hover table-condensed">
						<thead>
							<tr>
								<th style="text-align: center;">사진</th>
								<th style="text-align: center;">닉네임</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">관심사</th>
								<th style="text-align: center;">상세관심사</th>
								<th style="text-align: center;">평점</th><!-- 단계 높아야 제공 -->
								<th style="text-align: center;">최근산책일</th><!-- 단계 높아야 제공 -->
								<th style="text-align: center;">산책 강아지 수</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
					
					<div style="text-align: left; font-size: 17px; font-weight:bold;
					  margin: 0px 0px 10px 10px;">강아지 정보</div>
				
					<table id="pet" class="table table-hover table-condensed">
						<thead>	
							<tr>
								<th style="text-align: center;">사진</th>
								<th style="text-align: center;">칭호</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">생년월일</th>
								<th style="text-align: center;">성별 / 중성화여부</th>
								<th style="text-align: center;">견종</th>
								<th style="text-align: center;">사이즈</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
						
					<div style="text-align: left; font-size: 17px; font-weight:bold; margin: 0px 0px 10px 10px;">장애·알러지 정보</div>
				
					<table id="petsub" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="text-align: center;">구분</th>
							<th style="text-align: center;">이름</th>
							<th style="text-align: center;">내용</th>
						</tr>
					</thead>
					<tbody></tbody>
					</table>
					
					<!-- 이전 매칭 정보 --><!-- 단계 높아야 제공 -->
					<div style="text-align: left; font-size: 17px; font-weight:bold; margin: 0px 0px 10px 10px;">
						이전 매칭 피드백 정보
						<span class="tooltip_event glyphicon glyphicon-question-sign" id="preFeedback" style="margin-left: 5px;" 
						data-toggle="tooltip" data-placement="right" title="최근에 상대에게 준 항목별 피드백 점수입니다.">
						</span>
					</div>
					<table id="ownfdb" class="table table-hover table-condensed">
						<thead>
							<tr>
								<th style="text-align: center; width: 50%;">항목</th>
								<th style="text-align: center; width: 50%;">점수</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
					
					<br>
					<button type="button" class="btn btn-default btn-xs">수락</button>
					<button type="button" class="btn btn-default btn-xs">거절</button>
					<button type="button" class="btn btn-default btn-xs">신고</button>
				</div>
			</div>
			
			<hr>
			<div style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;" onClick="closeModal();">
				<span class="pop_bt modalCloseBtn" style="font-size: 11pt;">닫기</span>
			</div>
		</div>
	</div><!-- end modal1 -->


<!-- 내가 보낸 신청 모달창 -->
<div id="modal2" class="searchModal">
	<div class="search-modal-content">
		<div class="page-header">
			<h3 style="font-weight: bold;">상세정보</h3>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
			
			<div style="text-align: left; font-size: 17px; font-weight:bold; margin: 0px 0px 10px 10px;">견주 정보</div>
			
				<table id="own2" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="text-align: center;">사진</th>
							<th style="text-align: center;">닉네임</th>
							<th style="text-align: center;">나이</th>
							<th style="text-align: center;">성별</th>
							<th style="text-align: center;">관심사</th>
							<th style="text-align: center;">상세관심사</th>
							<th style="text-align: center;">평점</th>
							<th style="text-align: center;">최근산책일</th>
							<th style="text-align: center;">산책 강아지 수</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				
				<div style="text-align: left; font-size: 17px; font-weight:bold; margin: 0px 0px 10px 10px;">강아지 정보</div>
			
				<table id="pet2" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="text-align: center;">사진</th>
							<th style="text-align: center;">칭호</th>
							<th style="text-align: center;">이름</th>
							<th style="text-align: center;">생년월일</th>
							<th style="text-align: center;">성별/중성화여부</th>
							<th style="text-align: center;">견종</th>
							<th style="text-align: center;">몸무게</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				
				
				<div style="text-align: left; font-size: 17px; font-weight:bold; margin: 0px 0px 10px 10px;">장애·알러지 정보</div>
			
				<table id="petsub2" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="text-align: center;">구분</th>
							<th style="text-align: center;">이름</th>
							<th style="text-align: center;">내용</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		
		<hr>
		<div style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;" onClick="closeModal();">
			<span class="pop_bt modalCloseBtn" style="font-size: 11pt;">닫기</span>
		</div>
	</div>
</div>




<c:import url="Footer.jsp"></c:import>
		
</body>
</html>