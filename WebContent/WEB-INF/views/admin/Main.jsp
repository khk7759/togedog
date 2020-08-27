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
				
				<div class="container-fluid">

					<div class="d-sm-flex align-items-center justify-content-between m-4">
						<h1 class="h3 mb-0 text-gray-800">서비스 통계</h1>
					</div>

					<div class="row m-3">
						
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-sm font-weight-bold text-secondary text-uppercase mb-1"><span class="text-info text-sm">올해</span><br>산책 매칭 횟수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${yearWalkLastCount } 번</div>
											<br>
											<div class="text-sm font-weight-bold text-secondary text-uppercase mb-1"><span class="text-info text-sm">이번달</span><br>산책 매칭 횟수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${monthWalkLastCount } 번</div>
										</div>
										<div class="col-auto">
											<div class="col-auto">
												<img src="images/pet1.png" alt="산책"  width="128px" height="128px"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-sm font-weight-bold text-secondary text-uppercase mb-1"><span class="text-info text-sm">올해</span><br>대행 매칭 횟수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${yearAgcLastCount } 번</div>
											<br>
											<div class="text-sm font-weight-bold text-secondary text-uppercase mb-1"><span class="text-info text-sm">이번달</span><br>대행 매칭 횟수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${monthAgcLastCount } 번</div>
										</div>
										<div class="col-auto">
											<img src="images/pet2.png" alt="산책"  width="120px" height="120px"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-sm font-weight-bold text-secondary text-uppercase mb-1"><span class="text-info text-sm">올해</span><br>신규 회원 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${yearUserCount } 명</div>
											<br>
											<div class="text-sm font-weight-bold text-secondary text-uppercase mb-1"><span class="text-info text-sm">이번달</span><br>신규 회원 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${monthUserCount } 명</div>
										</div>
										<div class="col-auto">
											<img src="images/pet3.png" alt="산책" width="128px" height="128px"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-xl-12 col-md-12 mb-4">
							<div class="card shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-sm font-weight-bold text-primary text-uppercase mb-1">총 회원 & 펫 수</div>
											<div class="chart-pie pt-4">
												<canvas id="myPieChart"></canvas>
											</div>
										</div>
									</div>
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

	<!-- Bootstrap core JavaScript-->
	<script src="<%=cp %>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=cp %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="<%=cp %>/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=cp %>/js/sb-admin-2.js"></script>

	<!-- Page level plugins -->
	<script src="<%=cp %>/js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="<%=cp %>/js/chart-pie.js"></script>

</body>

</html>