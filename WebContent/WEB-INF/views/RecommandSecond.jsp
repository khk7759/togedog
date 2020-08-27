<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecommendSecond.jsp</title>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">
<script src="https://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/signup.css">
<style>
	#fullBackground 
    {
        position: absolute;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 200%;
        background-color: black;
        filter: alpha(opacity = 55);
        opacity: 0.5;
        display: none;
        z-index: 100;
    }
   
    #popup 
    {
        position: absolute;
        left: 100px;
        top: 100px;
        z-index: 200;
        display: none;
    }
	
	#sendBtn
	{
		width: 100px;
		height: 35px;
		padding: 0.1em 0.5em 0.1em 0.5em;
		letter-spacing: 0.05em;
		border-radius: 5px;
		box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
			rgba(0, 0, 0, 0.19);
		font-size: 14px;
	}
	
	.form-control 
	{
		width: 180px;
		height: 30px;
		font-size: 12px;
	}
	
	body 
	{
		margin: 0;
		padding: 0;
	}
	
	.btn
	{
		width : 160px;
	}
	
	#apply
	{
		width: 100px;
		height: 25px;
		padding: 0.1em 0.5em 0.1em 0.5em;
		letter-spacing: 0.05em;
		border-radius: 5px;
		box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
			rgba(0, 0, 0, 0.19);
		font-size: 13px;
	}
</style>
</head>
<body>
	<div id='fullBackground'></div>
	<c:import url="HeaderNotice.jsp"></c:import>
	
	<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">일대일매칭 추천리스트</span>

	<div id="firstList" style="line-height: 23px; text-align: center;">
		<div class="row">
			<div class="container" style="border: 0; text-align: center;">
				<div class="row" style="margin-bottom: 1%;">
					<div class="col-lg-6"></div>
					<div class="col-lg-2">
						<select id="filter" name="filter" class="form-control">
							<option value="">==나이대==</option>
							<option value="10">10대</option>
							<option value="20">20대</option>
							<option value="30">30대</option>
							<option value="40">40대</option>
							<option value="50">50대</option>
							<option value="60">60대</option>
							<option value="70">70대 이상</option>
						</select>
					</div>
					<div class="col-lg-2">
						<select id="order" name="order" class="form-control">
							<option value="">==정렬==</option>
							<option value="NICKNAME">닉네임</option>
							<option value="WALK_DATE">산책날짜</option>
							<option value="LAST_WALK">최근산책</option>
							<option value="PET_COUNT">산책펫수</option>
						</select>
					</div>
					<div class="col-lg-2">
						<select id="by" name="by" class="form-control">
							<option value="">==기준==</option>
							<option value="ASC">오름차순</option>
							<option value="DESC">내림차순</option>
						</select>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-sm-1"></div>
						<div class="col-sm-12">
							<table id="list" class="table table-responsible" style="font-size: 13px;" >
								<thead>
									<tr style="background-color: #DAF5FD;">
										<th style="text-align: center;">닉네임</th>
										<th style="text-align: center;">나이대</th>
										
										<th style="text-align: center;">산책장소</th>
										<th style="text-align: center;">산책날짜</th>
										<th style="text-align: center;">산책시간</th>
		
										<th style="text-align: center;">대표펫</th>
										<th style="text-align: center;">산책펫 수</th>
										<th style="text-align: center;">최근산책</th>
										
										<th style="text-align: center;">산책 신청하기 ↓</th>
									</tr>
								</thead>
								
								<tbody>
								</tbody>
							</table>
							
							<form id="myForm" action="walkmatchinsertcomp.action">
								<div id="popup" style="background-color: #E0E0E0; border: 0; border-radius: 5px; width: 500px;">	
									<div class="modal-content">
								      	<div class="modal-header">
									      	<div class="titleBar">
									            <div class="title">산책 신청</div>
									         </div>
								      	</div>
							         	
							         	<div class="col-sm-12" style="line-height: 30px; text-align: center;">
											<span style="color: #595959; font-size: 15px; font-weight: bold;">선택한 정보로 산책매칭을 신청하시겠습니까?</span>
											<br>
											<span style="color: #595959; font-size: 11px;">※ 입력된 정보와 다른 사실이 있을 경우 불이익을 받을 수 있으니 유의하세요.</span>
											<input type="text" id="walkCd" name="walkCd" class="hidden" />
										</div>   
		
								        <div class="modal-footer">
								        	<div class="col-sm-12" style="text-align: center;">
												<div class="col-sm-12" style="text-align: center;">
													<button type="submit" class="btn" id="matchingGo" name="matchingGo"
													style="width: 90px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
													border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
													font-size: 13px;">OK</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn" id="cancel" name="cancel" style="background-color: #828282;
													width: 90px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
													border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
													font-size: 13px;">Cancel</button>
												</div>
											</div>
								        </div>
							      	</div>
								</div>
							</form>
						</div>
					</div>
					<br><br>
			
				<div class="container" style="text-align: center;">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-12" style="text-align: center;">
							<span style="color: #828282; font-size: 13px;">원하는 산책메이트가 없나요?</span><br>
							<a href="walkmatchinsertcomp.action">나의 산책정보 등록하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br>
				
	<c:import url="FooterWeb.jsp"></c:import>
</body>
<script>
	$().ready(function()
	{
		makeList();
		
		$(document).on("change", "#filter", function()
		{
			makeList();
		});
		
		$(document).on("change", "#order", function()
		{
			makeList();
		});
		
		$(document).on("change, #by", function()
		{
			makeList();
		});
		
		$(document).on("click", ".sendBtn", function()
		{
			openFrame();
			$("#walkCd").val($(this).val());
		});
		
		$(document).on("click", "#cancel", function()
		{
			closeFrame();
		});
		
		$(document).on("click", "#matchingGo", function()
		{
			$("#myForm").submit();
		});
	});
	
	function makeList()
	{
		var filter = $("#filter").val();
		var order = $("#order").val();
		var by = $("#by").val();
		
		$.ajax(
		{
			url : "recommandsecondajax.action",
			method : "POST",
			data : 
			{
				"filter" : filter,
				"order" : order,
				"by" : by
			},
			success : function(data)
			{
				$("#list > tbody").empty();
				$("#list > tbody").append(data);
			}
		});
	}
	
	var on_off = 0;
	var x_margin, y_margin;
	var popup, fullBackground; 
	
	function openFrame() 
    {
        popup = document.getElementById("popup");
        fullBackground = document.getElementById("fullBackground"); 

        fullBackground.style.top = document.body.scrollTop; 
        fullBackground.style.left = document.body.scrollLeft;

        popup.style.top = ((screen.height / 2) - 800 + document.body.scrollTop) + "px";
        popup.style.left = ((screen.width / 2) - 600) + "px";
 
        fullBackground.style.display = "block";
        popup.style.display = "block";
        document.body.style.overflow = "hidden";
        
        window.scrollTo(0, 0);
    }

    function closeFrame() 
    {
    	popup = document.getElementById("popup");
        fullBackground = document.getElementById("fullBackground"); 
 	
        fullBackground.style.display = "none";
        popup.style.display = "none";
        document.body.style.overflow = "auto";
    }
</script>
</html>