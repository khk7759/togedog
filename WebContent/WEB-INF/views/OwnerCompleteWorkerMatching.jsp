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
		
		$("button").filter(".detail").click(function()
		{
			$("#modal").show();
			
			$.ajax(
			{
				url : "agclastdetail.action",
				method : "POST",
				async : false,
				data : {agcCd : $(this).val()},
				success : function(data)
				{	
					$("#getDetail").html(data);
				}
			});
		});
		
		$("#cancel").click(function()
		{
			if(confirm("취소 하시겠습니까?") == true)
			{
				location.href="<%=cp%>/agclastcancel.action?agcCd=" + $(this).val();
			}
			else
			{
				return;
			}
		});
		
	});
	
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
		vertical-align: middle;                               
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
	
	.selBox
	{
		display: inline-block;
		width: 150px;
		height: 25px;	
	}
	
	.icon
	{
		margin-right: 13px;
		margin-top: 5px; 
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
									<a class="nav-link" href="<%=cp %>/ownerworkermatching.action" data-toggle="tab">대행신청 내역</a>
								</li>
								<li class="nav-item col-md-4">
									<a class="nav-link" href="<%=cp %>/ownercompleteworkermatching.action" data-toggle="tab">대행매칭 완료</a>
								</li>
							</ul>
						</div>
						
						<!-- 산책매칭/대행매칭 버튼 -->
					
						<div class="menus col-md-4">
							<button type="button" class="btn btn-xs"  
							 style=" background-color: var(--deep-blue);"
							 onclick="location.href='<%=cp %>/ownerwalkmatching.action'">산책</button>
							<button type="button" class="btn btn-xs"
							 style=" background-color:var(--deep-blue);"
							 onclick="location.href='<%=cp %>/ownerworkermatching.action'">대행</button>
						</div>
		 
						<br><br><br><br>
						
						<!-- 셀렉트박스  -->
						<div class="col-md-6" style="margin: 10px 0px 0px 0px; padding: 0px 20% 0px 0px; text-align: left;">
							<div><span class="txt"><img src="images/FOOT.png" alt="🐾" style="width: 30px; margin-right: 10px;"/>매칭 완료</span></div>
						</div>
						<div class="col-md-6" style="margin: 10px 0px 20px 0px; padding: 0px 0px 0px 20%;">
							<div class="selBox">			
							<select class="form-control" id="">
								<option value="0">==선택==</option>
								<option value="1" selected="selected">10개씩 보기</option>
								<option value="2">20개씩 보기</option>
							</select>
							</div>		
						</div>
						
						<!-- 테이블 -->
						<div style=" width: 90%; margin: 10px 5% 0% 5%;">
							<table class="toMeList table table-hover table-condensed">
								<tr>
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">상세정보</th>
									<th style="text-align: center;">대표반려견</th>
									<th style="text-align: center;">대행일</th>
									<th style="text-align: center;">이름</th>
									<th style="text-align: center;">나이</th>
									<th style="text-align: center;">성별</th>
									<th style="text-align: center;">결제금액</th>
									<th style="text-align: center;">버튼</th>									
								</tr>
								<c:forEach var="list" items="${agcLastList }">
									<tr>
										<td>${list.rowN }</td>
										<td><button class="detail" value="${list.agcCd }">상세정보보기</button></td>
										<td>${list.petName }</td>
										<td>${list.walkDate }(${list.startTime } ~ ${list.endTime })</td>
										<td>${list.name }</td>
										<td>${list.age }</td>
										<td>${list.gender }</td>
										<td>${list.price }</td>
										<td>
											<c:choose>
												<c:when test="${list.lastWalk >= 0}">
													<button type="button" class="btn btn-default btn-xs" id="cancel" value="${list.walkLastCd }">취소</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-xs" disabled="disabled">취소</button>
												</c:otherwise>
											</c:choose>
											<button type="button" class="btn btn-default btn-xs">신고</button>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div><!-- end JoinGroupList -->
							
						<!-- 페이징 -->
						<nav class="pagination-sm">
	                        <ul class="pagination">
	                           <li class="page-item">
	                              <a class="page-link" href="#">Previous</a>
	                           </li>
	                           <li class="page-item">
	                              <a class="page-link" href="#">1</a>
	                           </li>
	                           <li class="page-item">
	                              <a class="page-link" href="#">2</a>
	                           </li>
	                           <li class="page-item">
	                              <a class="page-link" href="#">3</a>
	                           </li>
	                           <li class="page-item">
	                              <a class="page-link" href="#">4</a>
	                           </li>
	                           <li class="page-item">
	                              <a class="page-link" href="#">5</a>
	                           </li>
	                           <li class="page-item">
	                              <a class="page-link" href="#">Next</a>
	                           </li>
	                        </ul>
                     </nav>	
							
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
		
		
		
		
		<!-- 상세정보 모달창 -->
		<div id="modal" class="searchModal">
			<div class="search-modal-content">
				<div class="page-header">
					<h3 style="font-weight: bold;">상세정보</h3>
				</div>
				
				<div class="row">
					<div class="col-sm-12" id="getDetail"></div>
				</div>
				
				<hr>
				<div
					style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
					onClick="closeModal();">
					<span class="pop_bt modalCloseBtn" style="font-size: 11pt;">
					닫기</span>
				</div>
			</div>
		</div><!-- end modal -->

	<c:import url="Footer.jsp"></c:import>
		
</body>
</html>