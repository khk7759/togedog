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
<link rel="stylesheet" type="text/css" href="css/signup.css">

</head>
<body>

<div id="header">
	<c:import url="HeaderLogin.jsp"></c:import>
</div>

<div class="content col-md-12">
	<div style="margin-top: 40px; margin-bottom: 40px;">
		<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">
			공지사항 <span style="font-size: 18px;">Notice</span>
		</span>
	</div>

	<div class="container col-md-12">
	
		<div class="col-md-1"></div>

		<div class="table-responsive col-md-10">
			<table class="table">
				<tr>
					<th class="w-15" style="text-align: center; background-color: #E0E0E0;">제목</th>
					<td style="text-align: left;">&nbsp;&nbsp;${article.title }</td>
				</tr>
				<tr>
					<th class="w-15" style="text-align: center; background-color: #E0E0E0;">작성일</th>
					<td style="text-align: left;">&nbsp;&nbsp;${article.insDate }</td>
				</tr>
				<tr>
					<th class="w-15" style="text-align: center; background-color: #E0E0E0;">조회수</th>
					<td style="text-align: left;">&nbsp;&nbsp;${article.views }</td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="margin-top: 20px; margin-bottom: 20px;">
							${article.content }
						</div>
					</td>
				</tr>
				<tr>
					<th class="w-15" style="text-align: center; background-color: #E0E0E0;">이전 글</th>
					
					<c:if test="${beforeTitle eq '-1' }">
						<td style="text-align: left;">&nbsp;&nbsp;이전 글이 존재하지 않습니다.</td>
					</c:if>
					<c:if test="${beforeTitle ne '-1' }">
						<td style="text-align: left;">&nbsp;&nbsp;<a style="color: black;" href="<%=cp%>/mainnoticearticleform.action?notiCd=${beforeStr }">${beforeTitle }</a></td>
					</c:if>
				</tr>
				<tr>
					<th class="w-15" style="text-align: center; background-color: #E0E0E0;">다음 글</th>
					
					<c:if test="${nextTitle eq '-1' }">
						<td style="text-align: left;">&nbsp;&nbsp;다음 글이 존재하지 않습니다.</td>
					</c:if>
					<c:if test="${nextTitle ne '-1' }">
						<td style="text-align: left;">&nbsp;&nbsp;<a style="color: black;" href="<%=cp%>/mainnoticearticleform.action?notiCd=${nextStr }">${nextTitle }</a></td>
					</c:if>
				</tr>
			</table>
		</div>
		
		<div class="col-md-1"></div>
		
	</div>	

</div>

<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>
			
</body>
</html>