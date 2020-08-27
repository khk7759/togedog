<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecommendFirst.jsp</title>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" type="text/css" href="css/Modal.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/signup.css">
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
        z-index: 300;
        display: none;
    }

	.star 
	{
		color: #FFCC4F;
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
		width: 160px;
	}

	th, td 
	{
		text-align: center;
		vertical-align: middle;
	}


	input[type=checkbox] 
	{
		display: none;
	}

	input[type=checkbox]+label 
	{
		display: inline-block;
		cursor: pointer;
		line-height: 22px;
		padding-left: 22px;
		background: url('/img/check_off.png') left/22px no-repeat;
	}

	input[type=checkbox]:checked+label 
	{
		background-image: url('/img/check_on.png');
	}
	
	[data-tooltip]:hover 
	{
		position: relative;
	}

	[data-tooltip]:after 
	{
		-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
		-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
		transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
		background-color: #F0F0F0;
		-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
		-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
		box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
		color: #757575;
		font-size: 15px;
		margin-bottom: 10px;
		padding: 7px 12px;
		position: absolute;
		width: auto;
		min-width: 350px;
		max-width: 500px;
		word-wrap: break-word;
		z-index: 9999;
		opacity: 0;
		left: -9999px;
		top: 90%;
		content: attr(data-tooltip);
	}
	
	[data-tooltip]:hover:after 
	{
		content: attr(data-tooltip);
		top: 130%;
		left: 0;
		opacity: 1;
	}

	.bt
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
	<br><br>

	<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">일대일매칭
		추천리스트</span>
	<br><br>

	<div id="firstList" style="line-height: 23px; text-align: center;">
		<div class="row">
			<div class="container" style="border: 0; text-align: center;">
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-12">
						<table class="table table-responsible" style="font-size: 13px;">
							<tr style="background-color: #DAF5FD;">
								<th style="text-align: center;">추천순위</th>
								<th style="text-align: center;">사진</th>
								<th style="text-align: center;">닉네임</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">평점(개수)</th>
								<th style="text-align: center;">펫이름</th>
								<th style="text-align: center;">견종</th>
								<th style="text-align: center;">펫성별(중성화)</th>

								<th style="text-align: center;">산책날짜</th>
								<th style="text-align: center;">산책시간</th>
								<th style="text-align: center;">상세</th>
								<th style="text-align: center;">산책 신청하기 ↓</th>
							</tr>
							
							<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.rowN }</td>
									<td>${dto.photo }</td>
									<td>${dto.nickName }</td>
									<td>${dto.age }</td>
									<td><span class="star">${dto.fdbAvg }</span>(${dto.fdbCount })</td>

									<td style="text-align: center;">${dto.petName }</td>
									<td style="text-align: center;">${dto.dogType }</td>
									<td style="text-align: center;">
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

									<td style="text-align: center;">${dto.walkDate }</td>
									<td style="text-align: center;">${dto.startTime } ~ ${dto.endTime }</td>
									<td><button type="button" class="btn detail bt" style="width: 80px; height: 25px;" value="${dto.walkCd }">상세보기</button></td>
									<td><button type="button" name="apply" class="btn bt apply" style="width: 50px; height: 25px;" value="${dto.walkCd }">신청</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<br><br>	
			
			<div class="container" style="text-align: center;">
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-12" style="text-align: center;">
						<span style="color: #828282; font-size: 13px;">원하는 산책메이트가
							없나요?</span><br> <a href="recommandsecond.action">더 많은 견주님들 보러가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br>


	<div id="modal" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<h3 style="font-weight: bold;">상세정보</h3>
			</div>

			<div class="row">
				<div class="col-sm-12">

					<div
						style="text-align: left; font-size: 17px; font-weight: bold; margin: 0px 0px 10px 10px;">
						견주 정보</div>
					<table id="own" class="table table-hover table-condensed">
						<thead>
							<tr>
								<th style="text-align: center;">사진</th>
								<th style="text-align: center;">닉네임</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">취미</th>
								<th style="text-align: center;">관심사</th>
								<th style="text-align: center;">산책날짜</th>
								<th style="text-align: center;">산책시간</th>
								<th style="text-align: center;">최근산책일</th>
							</tr>
						</thead>
						
						<tbody></tbody>
					</table>

					<div
						style="text-align: left; font-size: 17px; font-weight: bold; margin: 0px 0px 10px 10px;">
						강아지 정보</div>
					<table id="pet" class="table table-hover table-condensed">
						<thead>
							<tr>
								<th style="text-align: center;">사진</th>
								<th style="text-align: center;">칭호</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">생년월일</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">중성화</th>
								<th style="text-align: center;">견종</th>
								<th style="text-align: center;">몸무게</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>

					<!-- 장애·알러지 정보 -->
					<div
						style="text-align: left; font-size: 17px; font-weight: bold; margin: 0px 0px 10px 10px;">장애·알러지
						정보</div>

					<table id="petsub" class="table table-hover table-condensed">
						<thead>
							<tr>
								<th style="text-align: center;">구분</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">내용</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>


					<!-- 이전 매칭 정보 -->
					<!-- 단계 높아야 제공 -->
					<div
						style="text-align: left; font-size: 17px; font-weight: bold; margin: 0px 0px 10px 10px;">
						피드백 항목 별 평점
						<!-- <span class="tooltip_event glyphicon glyphicon-question-sign" id="preFeedback"
                  style="margin-left: 5px;" 
                  data-toggle="tooltip" data-placement="right" title="최근에 상대에게 준 항목별 피드백 점수입니다."
                  > 
                  </span> -->

					</div>
					<table id="ownfdb" class="table table-hover table-condensed">
						<thead>
							<tr>
								<th style="text-align: center;">항목</th>
								<th style="text-align: center;">평점</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			<br><br>
			
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="closeModal();">
				<span class="pop_bt modalCloseBtn" style="font-size: 11pt;">
					닫기</span>
			</div>
		</div>
	</div>
	<!-- end modal1 -->
	
	<div id="popup" style="background-color: #E0E0E0; border: 0; border-radius: 5px; width: 500px;">	
		<form id="myForm" action="walkmatchinsertcomp.action">
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
	     </form>
	</div>

	<c:import url="FooterWeb.jsp"></c:import>
</body>
<script>
	$().ready(function()
	{
		// 닉네임 클릭하면 상세정보 볼 수 있음
		$(document).on("click", ".detail", function()
		{
			$("#modal").show();

			$.ajax(
			{
				url : "recommandfirstownajax.action",
				method : "POST",
				async : false,
				data :
				{
					walkCd : $(this).val()
				},
				success : function(data)
				{
					$("#own > tbody").empty();
					$("#own > tbody").append(data);
				}
			});

			$.ajax(
			{
				url : "recommandfirstpetajax.action",
				method : "POST",
				async : false,
				data :
				{
					walkCd : $(this).val()
				},
				success : function(data)
				{
					$("#pet > tbody").empty();
					$("#pet > tbody").append(data);
				}
			});

			$.ajax(
			{
				url : "recommandfirstpetdisableajax.action",
				method : "POST",
				async : false,
				data :
				{
					walkCd : $(this).val()
				},
				success : function(data)
				{
					$("#petsub > tbody").empty();
					$("#petsub > tbody").append(data);
				}
			});

			$.ajax(
			{
				url : "recommandfirstpetallergeajax.action",
				method : "POST",
				async : false,
				data :
				{
					walkCd : $(this).val()
				},
				success : function(data)
				{
					$("#petsub > tbody").append(data);
				}
			});

			$.ajax(
			{
				url : "recommandfirstownfdbitemajax.action",
				method : "POST",
				async : false,
				data :
				{
					walkCd : $(this).val()
				},
				success : function(data)
				{
					$("#ownfdb > tbody").empty();
					$("#ownfdb > tbody").append(data);
				}
			});
		});
		
		$(document).on("click", ".apply", function()
		{
			$("#walkCd").val($(this).val());
			openFrame();
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

	function closeModal()
	{
		$('.searchModal').hide();
	};
	
	var on_off = 0;
	var x_margin, y_margin;
	var popup, fullBackground; 
	
	function openFrame() 
    {
        popup = document.getElementById("popup");
        fullBackground = document.getElementById("fullBackground"); 

        fullBackground.style.top = document.body.scrollTop; 
        fullBackground.style.left = document.body.scrollLeft;

        popup.style.top = ((screen.height / 2) - 200 + document.body.scrollTop) + "px";
        popup.style.left = ((screen.width / 2) - 250) + "px";
 
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