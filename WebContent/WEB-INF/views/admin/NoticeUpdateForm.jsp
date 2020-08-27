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
					<div class="row mt-5">
						<div class="col-lg-10 m-auto">

							<div class="card">
								<div class="card-header">
									<h1 class="h3 mb-2 mt-2 text-gray-600">공지사항 수정</h1>
								</div>
								<form action="<%=cp %>/noticeupdate.action?notiCd=${article.notiCd2}" method="post">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-2">
												<label class="col-form-label ml-3">제목</label>
											</div>
											<div class="col-sm-8">
												<input type="text" id="title" name="title" class="form-control float-right" value="${article.title }"/>
											</div>
										</div>
										
										<div class="row mt-3">
											<div class="col-sm-2">
												<label class="col-form-label ml-3">첨부파일</label>
											</div>
											<div class="col-sm-8">
												<input type="file" id="input-file" class="btn"/>
											</div>
										</div>
										
										<div class="row mt-3">
											<div class="col-md-12">
												<div class="form-group">
													<label class="col-form-label ml-3">내용</label>
													<div class="col-md-12">
														<textarea name="content" id="content" class="textarea form-control" rows="20">${article.content }</textarea>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card-footer text-center">
										 <button type="submit" class="btn btn-primary">수정</button>
										 <button type="reset" class="btn btn-danger ml-3">초기화</button>
									</div>
							</form>
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
</body>
</html>