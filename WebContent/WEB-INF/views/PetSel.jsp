<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/signup.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
	#petList
	{
		border-spacing: 3px;
		cellspacing : 0; 
		cellpadding : 0;
		border: 0;
	}
	
	#petList th,td
	{
		text-align: center;	
		width: 120px;
		align : center;
	}
	
	.photo img
	{
		width: 40%;
		display: block;
		margin-left: 0;
		margin-right: auto;
	}
	
	.photo
	{
		margin:0 auto;
	}
</style>
</head>
<body>
	<div class="container" style="width: 100%; height: 100%;">
		<form action="recommandfirst.action">
			<table class="table table-hover table-condensed" id="petList">
				<thead>
					<tr>
						<td colspan="${fn:length(pet_list) }"><!-- 강아지 수만큼 -->
							산책 강아지 선택
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<c:forEach var="dto" items="${pet_list }">
							<td>
								<input type="checkbox" value="${dto.petCd }" name="petSel">
							</td>
						</c:forEach>
					</tr>
				</tbody>
					
				<thead>
					<tr>
						<c:forEach var="dto" items="${pet_list }">
							<td>
								<div class="photo" style="width: 120px; height: 90px; overflow: hidden">
								    <img src="${dto.photo }" onerror="this.src='images/animals.ico'" style="width: 120px; height: auto; ">
								</div>
							</td>
						</c:forEach>
					</tr>
				</thead>
					
				<tbody>
					<tr>
						<c:forEach var="dto" items="${pet_list }">
							<td>${dto.petName }</td>
						</c:forEach>
					</tr>
					
					<tr>
						<c:forEach var="dto" items="${pet_list }">
							<td>
								${dto.petGender }
								(
									<c:if test="${dto.neutralDate != null }">
										O
									</c:if>
									<c:if test="${dto.neutralDate == null }">
										X
									</c:if>
								)
							</td>
						</c:forEach>
					</tr>
			
					<tr>
						<c:forEach var="dto" items="${pet_list }">
							<td>${dto.weight }Kg</td>
						</c:forEach>
					</tr>
				</tbody>
				
				<thead>
					<tr>
						<td colspan="${fn:length(pet_list) }"><!-- 강아지수만큼 -->
							대표 강아지 선택
						</td>
					</tr>
				</thead>
				
				<tbody>			
					<tr>
						<c:forEach var="dto" items="${pet_list }">
							<td>
								<input type="radio" value="${dto.petCd }" name="petRep" />
							</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</form>	
	</div>
</body>
</html>