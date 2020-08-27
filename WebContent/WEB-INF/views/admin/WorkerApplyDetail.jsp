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
									<span class="font-weight-bold">워커 신청서</span>
								</div>
								<div class="card-body">
									<div class="row m-auto text-center">
										<div class="col-sm-1 ml-5">
											<label class="col-form-label ml-3">이름</label>
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control float-right" value="${dto.name }" readonly="readonly"/>
										</div>
										<div class="col-sm-1"></div>
										<div class="col-sm-1">
											<label class="col-form-label ml-3">성별</label>
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control float-right" value="${dto.gender }" readonly="readonly"/>
										</div>
										<div class="col-sm-1"></div>
										<div class="col-sm-1">
											<label class="col-form-label ml-3">직업</label>
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control float-right" value="${dto.job }" readonly="readonly"/>
										</div>
										<div class="col-sm-1 ml-5 mt-3">
											<label class="col-form-label ml-3">생년월일</label>
										</div>
										<div class="col-sm-2 mt-3">
											<input type="text" class="form-control float-right" value="${dto.birthday }" readonly="readonly"/>
										</div>
										<div class="col-sm-1 mt-3"></div>
										<div class="col-sm-1 mt-3">
											<label class="col-form-label ml-3">나이</label>
										</div>
										<div class="col-sm-2 mt-3">
											<input type="text" class="form-control float-right" value="${dto.age }" readonly="readonly"/>
										</div>
										<div class="col-sm-4"></div>
										<div class="col-sm-1 ml-5 mt-3">
											<label class="col-form-label ml-3">전화번호</label>
										</div>
										<div class="col-sm-4 mt-3">
											<input type="text" class="form-control float-right" value="${dto.tel }" readonly="readonly"/>
										</div>
										<div class="col-sm-1 mt-3"></div>
										<div class="col-sm-1 mt-3">
											<label class="col-form-label ml-3">이메일</label>
										</div>
										<div class="col-sm-4 mt-3">
											<input type="text" class="form-control float-right" value="${dto.email }" readonly="readonly"/>
										</div>
										<div class="col-sm-1 ml-5 mt-3">
											<label class="col-form-label ml-3">주소</label>
										</div>
										<div class="col-sm-4 mt-3">
											<input type="text" class="form-control float-right" value="${dto.addr3 }" readonly="readonly"/>
										</div>
										<div class="col-sm-6 mt-3">
											<input type="text" class="form-control float-right" value="${dto.addrDetail }" readonly="readonly"/>
										</div>
										<div class="col-sm-1 ml-5 mt-3">
											<label class="col-form-label ml-3">자격증</label>
										</div>
										<div class="col-sm-10 mt-3">
											<table class="table">
												<thead class="table-secondary">
													<tr>
														<td>이름</td>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="crtList" items="${crtList }">
														<tr>
															<td>${crtList.crtItem }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div class="col-sm-1 ml-5 mt-3">
											<label class="col-form-label ml-3">근무 선호 요일/시간</label>
										</div>
										<div class="col-sm-10 mt-3">
											<table class="table">
												<thead class="table-secondary">
													<tr>
														<td>요일</td>
														<td>시간</td>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="psbList" items="${psbList }">
														<tr>
															<td>${psbList.day }</td>
															<td>${psbList.favStart } : 00 ~ ${psbList.favEnd } : 00</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row m-auto text-left">
										<div class="col-sm-12 ml-5 mt-3">
											<label class="col-form-label ml-3">① 경력사항</label>
										</div>
										<div class="col-sm-11 ml-5 mt-3">
											<textarea cols="55" rows="5" class="form-control" readonly="readonly">${dto.careerName }</textarea>
										</div>
										<div class="col-sm-12 ml-5 ml-5 mt-3">
											<label class="col-form-label ml-3">② 양육경험</label>
										</div>
										<div class="col-sm-11 ml-5 mt-3">
											<textarea cols="55" rows="5" class="form-control" readonly="readonly">${dto.nurtureExp }</textarea>
										</div>
										<div class="col-sm-12 ml-5 mt-3">
											<label class="col-form-label ml-3">③ 펫워커 활동 중 강아지가 경계하거나 이빨을 보이며 공격하려 하는 경우 어떻게 대처하시겠습니까?</label>
										</div>
										<div class="col-sm-11 ml-5 mt-3">
											<textarea cols="55" rows="8" class="form-control" readonly="readonly">${dto.question1 }</textarea>
										</div>
										<div class="col-sm-12 ml-5 mt-3">
											<label class="col-form-label ml-3">④ 강아지와 산책할 때 가장 중요하게 생각하는 부분에 대해 작성해주세요.</label>
										</div>
										<div class="col-sm-11 ml-5 mt-3 mb-3">
											<textarea cols="55" rows="8" class="form-control" readonly="readonly">${dto.question2 }</textarea>
										</div>
										<div class="col-sm-12 ml-5 mt-3">
											<label class="col-form-label ml-3">⑤ 자유 메시지</label>
										</div>
										<div class="col-sm-11 ml-5 mt-3 mb-3">
											<textarea cols="55" rows="5" class="form-control" readonly="readonly">${dto.msg }</textarea>
										</div>
									</div>
								</div>
								
								<div class="card-footer text-center">
									<button class="btn btn-primary" type="button" onclick="location.href='<%=cp %>/workerok.action?wokApplyCd=${dto.wokCd }'">등록</button>
									<button class="btn btn-danger ml-3" type="button"  data-toggle="modal" data-target="#workerNoModal">거절</button>
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
	
	<!-- 워커 거절 모달 -->
	<c:import url="WorkerNoModal.jsp"></c:import>
	
	<!-- Bootstrap core JavaScript-->
	<script src="<%=cp %>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=cp %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="<%=cp %>/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=cp %>/js/sb-admin-2.js"></script>

</body>

</html>