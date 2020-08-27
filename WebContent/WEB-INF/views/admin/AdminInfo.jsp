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

<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function() 
	{
		$("#err1").css("display", "none");
		$("#err2").css("display", "none");
		
		if("${msg}" != "")
		{
			alert("${msg}");
		}
		
		$("#submitBtn").click(function()
		{
			if($("#name").val() == "")
			{
				$("#err1").css("display", "block");
				$("#err1").html("입력값이 누락되었습니다.");
				$("#name").focus();
				return;
			}
			
			if($("#tel").val() == "")
			{
				$("#err1").css("display", "block");
				$("#err1").html("입력값이 누락되었습니다.");
				$("#tel").focus();
				return;
			}
			
			if(confirm("정보를 수정하시겠습니까?") == true)
			{
				$("#infoForm").submit();
			}
			else
			{
				return;
			}
		});
		
		$("#updateBtn").click(function()
		{
			if($("#pw").val() == "")
			{
				$("#err2").css("display", "block");
				$("#err2").html("입력값이 누락되었습니다.");
				$("#pw").focus();
				return;
			}
			
			if($("#pw1").val() == "")
			{
				$("#err2").css("display", "block");
				$("#err2").html("입력값이 누락되었습니다.");
				$("#pw1").focus();
				return;
			}
			
			if($("#pw2").val() == "")
			{
				$("#err2").css("display", "block");
				$("#err2").html("입력값이 누락되었습니다.");
				$("#pw2").focus();
				return;
			}
			
			if($("#pw1").val() == $("#pw2").val())
			{
				if(confirm("정보를 수정하시겠습니까?") == true)
				{
					$("#pwForm").submit();
				}
				else
				{
					return;
				}
			}
			else
			{
				$("#err2").css("display", "block");
				$("#err2").html("비밀번호가 일치하지 않습니다.");
				$("#pw2").focus();
				return;
			}
			
		});
	});

</script>


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
					
					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-5 mt-5">
						<h1 class="h3 mb-0 text-gray-800">내 정보</h1>
					</div>
					
					<!-- Content Row -->
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-4 m-auto">
							<div class="card">
								<div class="card-header py-3">
									<span class="ml-2 font-weight-bold">정보 수정</span>
								</div>
								<form action="<%=cp %>/admininfoupdate.action" method="post" id="infoForm">
									<div class="card-body">
										<div class="row mt-5 mb-5">
											<div class="col-lg-3">
												<label class="col-form-label ml-3" for="id">아이디</label>
											</div>
											<div class="col-lg-8">
												<input type="text" value="${adminInfo.id }" id="id" name="id" readonly="readonly" class="form-control"/>
											</div>
										</div>
										
										<div class="row mb-5">
											<div class="col-lg-3">
												<label class="col-form-label ml-3" for="name">이름</label>
											</div>
											<div class="col-lg-8">
												<input type="text" value="${adminInfo.name }" id="name" name="name" class="form-control"/>
											</div>
										</div>
										
										<div class="row mb-5">
											<div class="col-lg-3">
												<label class="col-form-label ml-3" for="tel">전화번호</label>
											</div>
											<div class="col-lg-8">
												<input type="tel" value="${adminInfo.tel }" id="tel" name="tel" class="form-control"/>
											</div>
										</div>
										
										<div class="row mb-5">
											<div class="col-lg-11 ml-3 text-danger">
												<span id="err1"></span>
											</div>
										</div>
									</div>
									<div class="card-footer text-center">
										 <button type="button" id="submitBtn" class="btn btn-primary ml-3">수정</button>
									</div>
							</form>
						</div>
					</div>
					<div class="col-lg-2 m-auto" style="visibility: hidden;">&nbsp;</div>
					<div class="col-lg-4 m-auto">

						<div class="card">
							<div class="card-header py-3">
								<span class="ml-2 font-weight-bold">비밀번호 변경</span>
							</div>
							<form action="<%=cp %>/adminpw.action" method="post" id="pwForm">
								<div class="card-body">
									<div class="row mt-5 mb-5">
										<div class="col-lg-4">
											<label class="col-form-label ml-3" for="pw">현재 비밀번호</label>
										</div>
										<div class="col-lg-7">
											<input type="password" id="pw" name="pw" class="form-control"/>
										</div>
									</div>
									
									<div class="row mb-5">
										<div class="col-lg-4">
											<label class="col-form-label ml-3" for="id">변경할 비밀번호</label>
										</div>
										<div class="col-lg-7">
											<input type="password" id="pw1" name="pw1" class="form-control"/>
										</div>
									</div>
									
									<div class="row mb-5">
										<div class="col-lg-4">
												<label class="col-form-label ml-3" for="id">비밀번호 재확인</label>
										</div>
										<div class="col-lg-7">
											<input type="password" id="pw2" name="pw2" class="form-control"/>
										</div>
									</div>
									
									<div class="row mb-5">
										<div class="col-lg-11 ml-3 text-danger">
											<span id="err2"></span>
										</div>
									</div>
								</div>
								<div class="card-footer text-center">
									 <button type="button" id="updateBtn" class="btn btn-primary ml-3">변경</button>
								</div>
							</form>
						</div>
					</div>
					<div class="col-lg-1"></div>
					
				</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- End of Main Content -->

		<!-- Footer -->
		
		<footer class="sticky-footer bg-white mt-5">
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