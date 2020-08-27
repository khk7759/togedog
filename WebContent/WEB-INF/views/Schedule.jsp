<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="schedule" style="width : 100%; padding-left : 5%; padding-right : 5%; padding-bottom : 2%; display : none;">
		<table class="table table-hover table-condensed">
			<tr>
				<th style="width : 20%; text-align : center;">날짜</th>
				<th style="width : 20%; text-align : center;">카테고리</th>
				<th style="width : 60%; text-align : center;">제목</th>
			</tr>
			
			<tr>
				<td>1998-02-04</td>
				<td>산책</td>
				<td>birthday</td>
			</tr>
		</table>
		<%
		if(request.getServletPath().contains("Owner"))
		{
		%>
			<button type="button" id="addSch">일정 추가</button>
		<%
		}
		%>
	</div>
</body>
<script>
	$().ready(function()
	{
		$(document).on("click", "#addSch", function()
		{
			openFrame();
		});
	});
</script>
</html>