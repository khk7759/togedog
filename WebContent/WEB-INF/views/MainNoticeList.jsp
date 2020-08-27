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
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- <link rel="stylesheet" type="text/css" href="css/signup.css"> -->

<style type="text/css">

body 
{
	text-align: center; 
	margin: 0;
	padding: 0;
}

.btn
{
	color: #ffffff;
	background-color: #75C3F8;
	font-weight: bold;
	border: 0px;
	letter-spacing: 0.05em;
}

.btn:hover
{
	color: #ffffff;
	background-color: #41B0FA;
}

#footer-text
{
	color: #8F8F8F;
	font-size: small;
}

</style>
<script type="text/javascript">

	$(document).on('click', '#btnSearch', function(e)
	{
		e.preventDefault();
	
		var url = "<%=cp%>/mainnoticelistform.action";

		url = url + "?searchValue=" + $('#searchValue').val();
	
		location.href = url;
	
	});	
	
	function selChange() 
	{
		var numPerPage = document.getElementById("numPerPage").value;
		location.href="<%=cp%>/mainnoticelistform.action?pageNum=${currentPage }&numPerPage="+numPerPage;
	}
</script>
</head>
<body>

<div id="header">
	<c:import url="HeaderLogin.jsp"></c:import>
</div>

<div class="container">
	<div id="innertitle" class="col-md-12" style="margin-top:50px; margin-bottom: 50px;">
		<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">
			공지사항 <span style="font-size: 18px;">Notice</span>
		</span>
	</div>
	
	<div class="col-md-12" style="border-bottom: 1px solid #DCDCDC; margin-bottom: 70px;"></div>
	

	<div class="container col-md-12">

		<div id="filterForm" class="container col-md-12" style="text-align: left; line-height: 20px;">
		
			<div class="row col-md-12">
				<div class="col-md-2" style="margin-bottom:10px;">
					<select class="form-control" name="numPerPage" id="numPerPage" onchange="selChange()">
						<option value="5" <c:if test="${numPerPage == 5}">selected</c:if>>5개씩 보기</option>
						<option value="10" <c:if test="${numPerPage == 10}">selected</c:if>>10개씩 보기</option>
						<option value="15" <c:if test="${numPerPage == 15}">selected</c:if>>15개씩 보기</option>
						<option value="20" <c:if test="${numPerPage == 20}">selected</c:if>>20개씩 보기</option>
					</select>
				</div>
				<div class="col-md-5" style="margin-bottom:10px;"></div>
				
				<div class="col-md-4" style="margin-bottom:10px;">
					<input type="text" name="searchValue" id="searchValue" class="form-control" placeholder="검색 결과는 제목과 내용이 모두 포함됩니다.">
				</div>
				<div class="col-md-1" style="margin-bottom:10px;" align="right">
					<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>		
					
			</div>
			<div class="col-md-6" align="left">
				<c:if test="${!empty searchValue }">
					<span style="color: #3f6abf;">${searchValue }에 대한 검색 결과입니다.</span>
				</c:if>
				<c:if test="${empty searchValue }">
					<span style="color: #3f6abf;"> </span>
				</c:if>
			</div>
			<div class="col-md-6" align="right">
				<span style="color: #3f6abf;">총 ${dataCount }개의 게시물이 있습니다.</span>
			</div>
			<div class="col-md-12">
				<table class="table" style="text-align: center">
					<thead class="table-primary" style="background-color: #E0E0E0;">
						<tr>
							<th style="text-align: center;">Index</th>
							<th style="text-align: center;">Title</th>
							<th style="text-align: center;">Date</th>
							<th style="text-align: center;">Views</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty notiList }">
							<c:forEach var="noti" items="${notiList }">
								<tr>
									<td>${noti.notiCd1 }</td>
									<td class="title"><a href="<%=cp%>/mainnoticearticleform.action?notiCd=${noti.notiCd2 }&pageNum=${currentPage }">${noti.title }</a></td>
									<td>${noti.insDate }</td>
									<td>${noti.views }</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty notiList }">
								<tr>
									<td colspan="3">등록된 공지 사항이 없습니다.</td>
		
								</tr>
						</c:if>
					</tbody>
				</table>
			
				<!-- 페이징처리 시작 -->
				<div class="row" align="center" style="margin-top: 40px;">
					<nav class="pagination-sm">
						<ul class="pagination">
							<c:if test="${dataCount != 0 }">
								${pageIndexList }
							</c:if>
							<c:if test="${dataCount == 0 }">
							
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- 페이징처리 끝 -->
				
			</div>
		</div>
	</div>
</div>

			
<div id="footer" style="margin-top: 50px;">
	<c:import url="FooterWeb.jsp"></c:import>
</div>

</body>
</html>