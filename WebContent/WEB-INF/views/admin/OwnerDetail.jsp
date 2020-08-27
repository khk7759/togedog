<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Togedog</title>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">

<!-- Custom fonts for this template-->
<link href="<%=cp %>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<%=cp %>/css/sb-admin-2.css" rel="stylesheet">
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<c:import url="Sidebar.jsp"></c:import>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<c:import url="Topbar.jsp"></c:import>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Content Row -->
					
					<div class="row">
						<div class="col-lg-10 m-auto">
							<div class="card">
								<div class="card-header py-3">
									<span class="font-weight-bold">견주 정보 상세보기</span>
								</div>
								<div class="card-body">
									<div class="row m-auto text-center">
										<div class="col-md-1 ml-5">									
											<label class="col-form-label ml-3" for="id">이름</label>
										</div>
										<div class="col-md-2">
											<input type="text" value="${dto.name }" class="form-control" readonly="readonly"/>
										</div>
										<div class="col-md-2">									
											<label class="col-form-label ml-3" for="id">생년월일</label>
										</div>
										<div class="col-md-2">
											<input type="text" value="${dto.birthday }" class="form-control" readonly="readonly"/>
										</div>
										<div class="col-md-2">									
											<label class="col-form-label ml-3" for="id">나이</label>
										</div>
										<div class="col-md-2">
											<input type="text" value="${dto.age }" class="form-control" readonly="readonly"/>
										</div>
									</div>
									
									<div class="row m-auto text-center">
										<div class="col-md-1 mt-3 ml-5">									
											<label class="col-form-label ml-3" for="id">아이디</label>
										</div>
										<div class="col-md-2 mt-3">
											<input type="text" value="${dto.id }" class="form-control" readonly="readonly"/>
										</div>
										<div class="col-md-2 mt-3">									
											<label class="col-form-label ml-3" for="id">닉네임</label>
										</div>
										<div class="col-md-2 mt-3">
											<input type="text" value="${dto.nickName }" class="form-control" readonly="readonly"/>
										</div>
										<div class="col-md-2 mt-3">									
											<label class="col-form-label ml-3" for="id">성별</label>
										</div>
										<div class="col-md-2 mt-3">
											<input type="text" value="${dto.gender }" class="form-control" readonly="readonly"/>
										</div>
									</div>
									
									<div class="row m-auto text-center">
										<div class="col-md-1 mt-3 ml-5">									
											<label class="col-form-label ml-3" for="id">단계</label>
										</div>
										<div class="col-md-2 mt-3">
											<input type="text" value="${dto.grade }" class="form-control" readonly="readonly"/>
										</div>
										<div class="col-md-2 mt-3">									
											<label class="col-form-label ml-3" for="id">통합포인트</label>
										</div>
										<div class="col-md-2 mt-3">
											<input type="text" value="${dto.point }" class="form-control" readonly="readonly"/>
										</div>
										<div class="col-md-2 mt-3">									
											<label class="col-form-label ml-3" for="id">평점</label>
										</div>
										<div class="col-md-2 mt-3">
											<input type="text" value="${dto.rate }" class="form-control" readonly="readonly"/>
										</div>
									</div>
									
									<div class="row m-auto text-center">
										<div class="col-md-1 mt-3 ml-5">									
											<label class="col-form-label ml-3" for="id">전화번호</label>
										</div>
										<div class="col-md-4 mt-3">
											<input type="text" value="${dto.tel }" class="form-control" readonly="readonly"/>
										</div>
										<div class="col-md-2 mt-3">									
											<label class="col-form-label ml-3" for="id">이메일</label>
										</div>
										<div class="col-md-4 mt-3">
											<input type="text" value="${dto.email }" class="form-control" readonly="readonly"/>
										</div>
									</div>
									
									<div class="row m-auto text-center">
										<div class="col-md-1 mt-3 ml-5">									
											<label class="col-form-label ml-3" for="id">주소</label>
										</div>
										<div class="col-md-10 mt-3">
											<input type="text" value="${dto.addr3 }" class="form-control" readonly="readonly"/>
										</div>
									</div>
									
									<div class="row m-auto text-center">
										<div class="col-md-1 ml-5"></div>
										<div class="col-md-10 mt-3">
											<input type="text" value="${dto.addrDetail }" class="form-control" readonly="readonly"/>
										</div>
									</div>
									
									<div class="row m-auto text-center">
										<div class="col-md-1 mt-3 ml-5">									
											<label class="col-form-label ml-3" for="id">계좌번호</label>
										</div>
										<div class="col-md-2 mt-3">
											<input type="text" value="${dto.bank }" class="form-control" readonly="readonly"/>
										</div>
										<div class="col-md-8 mt-3">
											<input type="text" value="${dto.accNum }" class="form-control" readonly="readonly"/>
										</div>
									</div>
									
									<br>
									<hr />
									
									<div class="row m-auto text-center">
										<div class="col-md-1 mt-3 ml-5">									
											<label class="col-form-label ml-3" for="id">공유회원</label>
										</div>
										<div class="col-md-10 mt-3">
											<table class="table">
												<thead class="table-primary">
													<tr>
														<th class="w-50">아이디</th>
														<th class="w-50">이름</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="list1" items="${shareUser }">
														<tr>
															<td>${list1.id }</td>
															<td>${list1.name }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									
									<div class="row m-auto text-center">
										<div class="col-md-1 mt-3 ml-5">									
											<label class="col-form-label ml-3" for="id">소유 펫</label>
										</div>
										<div class="col-md-10 mt-3">
											<table class="table">
												<thead class="table-primary">
													<tr>
														<th class="w-15">이름</th>
														<th class="w-15">견종</th>
														<th class="w-15">사이즈</th>
														<th class="w-15">연령</th>
														<th class="w-15">성별</th>
														<th class="w-25">중성화 시기</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="list2" items="${sharePet }">
														<tr>
															<td>${list2.petName }</td>
															<td>${list2.dogItem }</td>
															<td>${list2.petSize }</td>
															<td>${list2.petAge }</td>
															<td>${list2.petGender }</td>
															<td>${list2.neutralDate }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
								<div class="card-footer text-center">
									<button type="button" class="btn btn-primary mr-5" data-toggle="modal" data-target="#stopModal">활동정지</button>
									<button type="button" class="btn btn-info" data-toggle="modal" data-target="#withdrawModal">강제탈퇴</button>
								</div>
							</div>
						</div>
					</div>
				
				</div>				
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			
			<footer class="sticky-footer bg-white">
				<c:import url="Footer.jsp"></c:import>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<c:import url="LogoutModal.jsp"></c:import>
	
	<!-- 활동정지 -->
	<c:import url="StopTermInsertModal.jsp"></c:import>
	
	<!-- 강제탈퇴 -->
	<c:import url="WithdrawalReasonInsertModal.jsp"></c:import>
	
	<!-- Bootstrap core JavaScript-->
	<script src="<%=cp %>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=cp %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="<%=cp %>/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=cp %>/js/sb-admin-2.js"></script>

</body>

</html>