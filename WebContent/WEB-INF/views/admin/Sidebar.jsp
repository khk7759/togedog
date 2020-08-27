<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=cp %>/adminmain.action">
		<div class="sidebar-brand-icon">
			<img src="images/dogfoot.png" alt="dogfoot" style="width: 30px; height: 30px;" />
		</div>
		<div class="sidebar-brand-text mx-3">TOGEDOG</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Home -->
	<li class="nav-item">
		<a class="nav-link" href="<%=cp %>/adminmain.action">
		<i class="fas fa-fw fa-home"></i>
		<span>메인화면</span></a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">
		<p>공지사항</p>
	</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="<%=cp %>/noticelist.action" >
			<i class="fas fa-fw fa-list"></i>
			<span>공지사항</span>
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">
		<p>회원 & 신고 관리</p>
	</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities1" aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-user"></i>
			<span>회원 관리</span>
		</a>
		<div id="collapseUtilities1" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header"> 회원 관리 </h6>
				<a class="collapse-item" href="<%=cp %>/ownerlist.action">견주 관리</a>
				<a class="collapse-item" href="<%=cp %>/workerlist.action">워커 관리</a>
				<a class="collapse-item" href="<%=cp %>/userbyeownerlist.action">탈퇴 회원</a>
				<a class="collapse-item" href="<%=cp %>/userstoplist.action">활동정지 회원</a>
				<a class="collapse-item" href="<%=cp %>/blacklist.action">블랙리스트</a>
				<a class="collapse-item" href="<%=cp %>/adminlist.action">관리자</a>
				<h6 class="collapse-header"></h6>
				<h6 class="collapse-header"> 신청 확인 </h6>
				<a class="collapse-item" href="<%=cp %>/workerapplylist.action">워커 신청</a>
			</div>
		</div>
	</li>
	<!-- 
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities2" aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-balance-scale"></i>
			<span>신고 관리</span>
		</a>
		<div id="collapseUtilities2" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">신고관리</h6>
				<a class="collapse-item" href="ReportApplyList.jsp">신고 내역</a>
				<a class="collapse-item" href="ReportCompleteList.jsp">처리 내역</a>
				<a class="collapse-item" href="ReportInCompleteList.jsp">비처리 내역</a>
			</div>
		</div>
	</li>
	
	<hr class="sidebar-divider">

	<div class="sidebar-heading">
		<p>회계</p>
	</div>

	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities3" aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fas fa-fw fa-won-sign"></i> <span>회계 관리</span>
	</a>
		<div id="collapseUtilities3" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">결제 내역</h6>
				<a class="collapse-item" href="PaymentList.jsp">결제 내역</a>
				<h6 class="collapse-header"></h6>
				<h6 class="collapse-header">환불 내역</h6>
				<a class="collapse-item" href="RefundApplyList.jsp">환불 신청</a>
				<a class="collapse-item" href="RefundCompleteList.jsp">환불 완료</a>
				<h6 class="collapse-header"></h6>
				<h6 class="collapse-header">정산 내역</h6>
				<a class="collapse-item" href="SettlementApplyList.jsp">정산 신청</a>
				<a class="collapse-item" href="SettlementCompleteList.jsp">정산 완료</a>
			</div>
		</div></li>
	
	<hr class="sidebar-divider">

	<div class="sidebar-heading">
		<p>서비스 관리</p>
	</div>

	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities4" aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-edit"></i>
			<span>서비스관리</span>
		</a>
		<div id="collapseUtilities4" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">서비스관리</h6>
				<h6 class="collapse-header"></h6>
				<h6 class="collapse-header">회원</h6>
				<a class="collapse-item" href="LicenseList.jsp">자격증항목</a>
				<a class="collapse-item" href="BankList.jsp">은행사</a>
				<a class="collapse-item" href="AddressList.jsp">주소</a>
				
				<h6 class="collapse-header"></h6>
				<h6 class="collapse-header">펫</h6>
				<a class="collapse-item" href="MedalList.jsp">칭호</a>
				<a class="collapse-item" href="DogTypeList.jsp">견종</a>
				<a class="collapse-item" href="VaccinationList.jsp">예방접종 항목</a>
				
				<h6 class="collapse-header"></h6>
				<h6 class="collapse-header">서비스</h6>
				<a class="collapse-item" href="GradeStandardList.jsp">단계기준</a>
				<a class="collapse-item" href="AgencyPolicyList.jsp">대행 정책</a>
				<a class="collapse-item" href="PointPlusList.jsp">통합포인트 가중치</a>
				<a class="collapse-item" href="PointMinusList.jsp">통합포인트 감산치</a>
				<a class="collapse-item" href="ReportReasonList.jsp">신고사유</a>
				<a class="collapse-item" href="ReportPenaltyList.jsp">신고패널티</a>
				<a class="collapse-item" href="FeedbackTypeList.jsp">피드백 분류</a>
				<a class="collapse-item" href="FeedbackItemList.jsp">피드백 항목</a>
				<a class="collapse-item" href="RecordTypeList.jsp">기록 종류 항목</a>
				
			</div>
		</div>
	</li>
	
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities5" aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-exchange-alt"></i>
			<span>변경이력</span>
		</a>
		<div id="collapseUtilities5" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">변경이력</h6>
				<a class="collapse-item" href="UserChangeHistoryList.jsp">회원</a>
				<a class="collapse-item" href="PetChangeHistoryList.jsp">펫</a>
				<a class="collapse-item" href="AgencyChangeHistoryList.jsp">대행</a>
				<a class="collapse-item" href="FeedbackChangeHistoryList.jsp">피드백</a>
				<a class="collapse-item" href="RecordChangeHistoryList.jsp">기록</a>
			</div>
		</div>
	</li>
	
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities6" aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-boxes"></i>
			<span>수익관리</span>
		</a>
		<div id="collapseUtilities6" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">수익관리</h6>
				<a class="collapse-item" href="ServiceRevenueAnnual.jsp">연간</a>
				<a class="collapse-item" href="ServiceRevenueMonthly.jsp">월간</a>
				<a class="collapse-item" href="ServiceRevenueWeekly.jsp">주간</a>
				<a class="collapse-item" href="ServiceRevenueDaily.jsp">일간</a>
			</div>
		</div>
	</li>
	 -->
	<hr class="sidebar-divider d-none d-md-block">
	
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>