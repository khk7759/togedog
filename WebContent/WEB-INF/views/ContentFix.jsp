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
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
body 
{
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>

<div id="header">
	<c:import url="HeaderLogin.jsp"></c:import>
</div>

<div class="col-md-12" style="margin: 40px 0 60px 0" align="center">
	<img alt="" src="<%=cp%>/images/contents.jpg">
</div>
		
<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>

</body>
</html>