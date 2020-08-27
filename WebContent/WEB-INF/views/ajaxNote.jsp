<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<div class="search-modal-content" style="width: 475px;">
	
<div id="header" class="container-fluid"
	style="margin: 0; top: 0; left: 0; right: 0; background-color: #DAF5FD; height: 70px;">
	<div class="row">
		<div class="col-md-12">
			<br> 
			<span style="font-weight: bold; font-size: 30px; color: #00B1F7; position: relative;">
				<img src="images/FOOT.png" alt="icon" style="width: 32px; height: 30px;"> 쪽지 
			</span>
		</div>
	</div>
</div>

<div id="content" class="container-fluid" style="width: 350px; margin: 0 0 0 0;">
	
	<div class="row" style="margin-top: 15px;">
		<div class="col-md-3 pull-left" style="line-height: 30px; text-align: left;">
			<span style="color: #828282; font-size: 15px; font-weight: bold;">닉네임</span>
		</div>
		<div class="col-md-3" style="line-height: 30px;" align="left">
			<input type="text" class="form-control" id="sender" name="sender"
				value="${article.nickName }" 
				style="width: 200px;">
		</div>
	</div>

	<div class="row col-md-12" style="margin-top: 15px;">
		<textarea class="nContent form-control" rows="40" cols="60" style="width: 400px; height: 300px;">${article.content }
		</textarea>
	</div>

	<div class="row">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="col-md-10"
		style="line-height: 30px; margin-left: 30px;" align="right">
		<br>
		<button type="button" class="btn btn-s" id="resendBtn">답장</button><!--  id="sendBtn" -->
		<button type="button" style="background-color: #DDDDDD;"
			class="btn btn-s" onClick="closeModal();">닫기</button>
	</div>
	
<!-- test -->
</div>
</div>
<hr>
</div>