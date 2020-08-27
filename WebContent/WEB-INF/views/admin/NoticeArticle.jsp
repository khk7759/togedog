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

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-5 mt-5">
						<h1 class="h3 mb-0 text-gray-800">공지사항</h1>
					</div>

					<!-- Content Row -->
					<div class="container col-lg-10">
						<table class="table">
							<tr>
								<th class="w-15 border-left-primary border-right">제목</th>
								<td class="w-50">${article.title }</td>
								<th class="w-15 border-left-primary border-right">조회수</th>
								<td>${article.views }</td>
							</tr>
							<tr>
								<th class="w-15 border-left-primary border-right">작성일</th>
								<td>${article.insDate }</td>
								<th class="w-15 border-left-primary border-right">작성자</th>
								<td>${article.adminName }</td>
							</tr>
							<tr class="border-left-primary">
								<th class="border-right">첨부파일</th>
								<td colspan="3">${article.fileName }</td>
							</tr>
							<tr><td></td></tr>
							<tr>
								<td colspan="4" class="border-0">${article.content }</td>
							</tr>
							<tr><td class="border-0"></td></tr>
							<tr class="border-left-primary">
								<th>이전글</th>
								<c:if test="${beforeTitle eq '-1' }">
									<td colspan="3" style="text-align: left;">이전 글이 존재하지 않습니다.</td>
								</c:if>
								<c:if test="${beforeTitle ne '-1' }">
									<td colspan="3" style="text-align: left;"><a style="color: black;" href="<%=cp%>/noticearticleform.action?notiCd=${beforeStr }">${beforeTitle }</a></td>
								</c:if>
							</tr>
							<tr class="border-left-primary">
								<th>다음글</th>
								<c:if test="${nextTitle eq '-1' }">
									<td colspan="3" style="text-align: left;">다음 글이 존재하지 않습니다.</td>
								</c:if>
								<c:if test="${nextTitle ne '-1' }">
									<td colspan="3" style="text-align: left;"><a style="color: black;" href="<%=cp%>/noticearticleform.action?notiCd=${nextStr }">${nextTitle }</a></td>
								</c:if>
							</tr>
						</table>
						
						<div class="mb-3 w-100">
							<div class="float-right">
								<input type="button" value="목록" class="btn btn-primary" onclick="location.href='<%=cp %>/noticelist.action'">
								<c:choose>
									<c:when test="${article.adminCd == adminInfo.code}">
										<input type="button" value="수정" class="btn btn-info" onclick="location.href='<%=cp %>/noticeupdateform.action?notiCd=${article.notiCd2}'">
										<input type="button" value="삭제" class="btn btn-warning" onclick="location.href='<%=cp %>/noticedelete.action?notiCd=${article.notiCd2}'">
									</c:when>
									<c:otherwise>
										<input type="button" value="수정" class="btn btn-info" disabled="disabled">
										<input type="button" value="삭제" class="btn btn-warning" disabled="disabled">
									</c:otherwise>
								</c:choose>
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