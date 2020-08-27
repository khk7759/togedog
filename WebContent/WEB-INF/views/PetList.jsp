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
		<table class="table table-hover table-condensed" id="petList">
			<tr>
				<td>
					<div class="photo" style="width: 120px; height: 90px; overflow: hidden">
					    <img src="images/멍멍이1.jpg" style="width: 120px; height: auto; ">
					</div>
				</td>
				<!-- 펫 사진 추가 -->
				<td>
					<div class="photo" style="width: 120px; height: 90px; overflow: hidden">
						    <img src="images/멍멍이3.png" style="width: 120px; height: auto;">
					</div>
				</td>
				<td >
					<div class="photo" style="width: 120px; height: 90px; overflow: hidden">
						    <img src="images/멍멍이4.jpg" style="width: 120px; height: auto;">
						    							
					</div>
				</td>
			</tr>
			<tr>
				<td>미미</td>
				<td>미미</td>
				<td>미미</td>
			</tr>
			<tr>
				<td>여(Y)</td>
				<td>남(Y)</td>
				<td>남(Y)</td>
			</tr>
			<tr>
				<td>5.6kg</td>
				<td>4.6kg</td>
				<td>4.6kg</td>
			</tr>
		</table>			

	</div>

</body>
</html>