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
				
					<div class="d-sm-flex align-items-center justify-content-between ml-2 mt-5">
						<h1 class="h3 mb-0 text-gray-800">워커 신청 리스트</h1>
					</div>
					
					<!-- Content Row -->
					<div class=" row m-5">
						<div class="mb-3 w-100">
							
							<div class="float-right">
								<form action="" name="filterForm" method="post">
									<div class="row">
										<div class="col-sm-12">
											<select name="listFilter" class="form-control">
												<option value="list10">10개씩 보기</option>
												<option value="list15">15개씩 보기</option>
												<option value="list20">20개씩 보기</option>
												<option value="list25">25개씩 보기</option>
												<option value="list30">30개씩 보기</option>
											</select>
										</div>
									</div>
								</form>
							</div>
						
						</div>
						<div class="table-responsive">
			                <table class="table">
							<thead class="table-primary">
								<tr>
  									<th style="text-align: center;">아이디</th>
  									<th style="text-align: center;">이름</th>
  									<th style="text-align: center;">신청일자</th>
  									<th style="text-align: center;"></th>
  								</tr>
  							</thead>
  							<tbody>
  								<c:forEach var="list" items="${workerApplyList }">
  									<tr>
  										<td>${list.id }</td>
  										<td>${list.name }</td>
  										<td>${list.id }</td>
  										<td>
	  										<input type="button" class="btn btn-outline-primary btn-sm" value="내용확인" onclick="location.href='<%=cp %>/workerapplydetail.action?wokApplyCd=${list.wokCd }'"/>
	  									</td>
  									</tr>
  								</c:forEach>
  							</tbody>
  							</table>
  							
              			</div>
						<div class="row ml-auto mr-auto mt-5">
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
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
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