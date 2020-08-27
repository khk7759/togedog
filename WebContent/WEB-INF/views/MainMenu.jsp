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

<style type="text/css">
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
		height: 25px;
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
	
	#notice > a:hover
	{
		color: orange;
		font-weight: bold;
	}

</style>
<script type="text/javascript">
</script>
</head>
<body>

<div id="header">
	<c:import url="HeaderLogin.jsp"></c:import>
</div>

<br><br>
<div id="MainMenu" class="container">
<br><br>
	<div class="container" style="text-align: center; line-height: 20px;">

		<div class="row">
			<div class="col-sm-12" style="line-height: 30px;">
				<br><br><br>
				<span style="font-weight: bold; font-size: 15px; color: #666666;">
				<span style="font-size: 20px; font-weight: bold; color: #75C3F8;">${sessionScope.user.getName() }</span> ${sessionScope.user.getUserType()}님,
				 투게도그와 행복한 하루 되세요 :)<br>
				</span><br><br>
			</div>
		</div>
	
		<div class="row" id="mainNoti">
			<div class="col-md-12" align="center" style="color: #666666;">
			<span style="font-size: 20px; font-weight: bold;">공지사항</span>&nbsp;<span style="font-size: 15px; font-weight: bold;">Notice</span><br><br>
				<table class="table table-condensed" style="width: 60%; font-size: 12px; border: 1px solid #C0C0C0;">
					<thead>
						<tr style="background-color: #E0E0E0;">
							<th style="text-align: center;">Title</th>
							<th style="text-align: center;">Date</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="noti" items="${mainNotiList }">
							<tr>
								<td style="text-align: center;">
									<a href="<%=cp%>/mainnoticearticleform.action?notiCd=${noti.notiCd2 }">${noti.title }</a>
								</td>
								<td style="text-align: center;">
									${noti.insDate }
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<span id="notice" style="font-weight: bold; margin-left: 600px; font-size: 16px; color: #75C3F8;">
					<a href="<%=cp%>/mainnoticelistform.action">
						More > 
					</a>
				</span>
			</div>
		</div>
		
	</div><br><br>
</div>

<c:if test="${sessionScope.user.getUserType() eq '워커'}">
	<div id="menuButtons" class="container" style="width: 100%; background-color: #DAF5FD;">
		<br><br>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px;">
				<span style="font-weight: bold; color: #666666;">산책 신청하고 맞춤 메이트 추천받기</span>
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-5" style="line-height: 30px;">
				<span style="font-weight: bold; color: #666666;">나와 맞는 산책 커뮤니티 활동하기</span>
			</div>
		</div>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px;">
				<button type="submit" class="btn" id="matching" name="matching" disabled>일대일산책</button>
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-5" style="line-height: 30px;">
				<button type="submit" class="btn" id="commu" name="commu" disabled>커뮤니티</button>
			</div>
		</div>
		<br>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 20px;"></div>
			<div class="col-sm-4" style="line-height: 20px;">
				<span style="font-size: 13px; color: #666666;">
				반려견 산책, 혼자 하기 외롭고 지루하셨나요?<br>
				나에게 꼭 맞는 동네 산책 친구를 추천해드려요.<br>
				매칭된 산책 메이트와 동행하면 더욱 즐거운 산책!<br>
				</span>
			</div>
			<div class="col-sm-1" style="line-height: 20px;"></div>
			<div class="col-sm-5" style="line-height: 20px;">
				<span style="font-size: 13px; color: #666666;">
				반려견과 모임에 참여하는 꿈, 투게도그에서 이루세요.<br>
				나와 반려견에게 꼭 맞게 추천된 커뮤니티에 가입하고<br>
				재미와 활력이 넘치는 그룹 산책에 참여해보세요!<br>
				</span>
			</div>
		</div>
		<br><br>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px;">
				<span style="font-weight: bold; color: #666666;">안전하게 산책대행 맡기기</span>
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-5" style="line-height: 30px;">
				<span style="font-weight: bold; color: #666666;">기록, 매칭, 정보 한 번에 관리하기</span>
			</div>
		</div>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px;">
				<button type="submit" class="btn" id="matching" name="matching" disabled>산책대행</button>
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-5" style="line-height: 30px;">
				<button type="submit" class="btn" id="commu" name="commu" onclick="location.href='<%=cp%>/workermiarymain.action'">마이어리</button>
			</div>
		</div>
		<br>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 20px;"></div>
			<div class="col-sm-4" style="line-height: 20px;">
				<span style="font-size: 13px; color: #666666;">
				바쁜 일정 탓에 반려견과 산책이 어려우신가요?<br>
				안전하게 케어 받는 특별한 산책을 선물하면 어떨까요?<br>
				오늘 산책은 전문 워커님께 맡기세요!<br>
				
				</span>
			</div>
			<div class="col-sm-1" style="line-height: 20px;"></div>
			<div class="col-sm-5" style="line-height: 20px;">
				<span style="font-size: 13px; color: #666666;">
				반려견과 함께하는 일상을 기록으로 남길 수 있어요.<br>
				소중한 정보와 기록들을 한 곳에서 관리하세요.<br>
				중요한 일정은 잊지 마시고 한 눈에 확인하세요.<br>
				나의 워커 활동도 관리할 수 있답니다.<br>
				</span>
			</div>
		</div>
		<br><br>
	</div>
</c:if>
<c:if test="${sessionScope.user.getUserType() eq '견주' || sessionScope.user.getUserType() eq '견주&워커'}">
	<div id="menuButtons" class="container" style="width: 100%; background-color: #DAF5FD;">
		<br><br>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px;">
				<span style="font-weight: bold; color: #666666;">산책 신청하고 맞춤 메이트 추천받기</span>
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-5" style="line-height: 30px;">
				<span style="font-weight: bold; color: #666666;">나와 맞는 산책 커뮤니티 활동하기</span>
			</div>
		</div>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px;">
				<button type="submit" class="btn" id="matching" name="matching" onclick="location.href='<%=cp%>/walkmatchinsert.action'">일대일산책</button>
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-5" style="line-height: 30px;">
				<button type="submit" class="btn" id="commu" name="commu" onclick="location.href='<%=cp%>/contentfix.action'">커뮤니티</button>
			</div>
		</div>
		<br>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 20px;"></div>
			<div class="col-sm-4" style="line-height: 20px;">
				<span style="font-size: 13px; color: #666666;">
				반려견 산책, 혼자 하기 외롭고 지루하셨나요?<br>
				나에게 꼭 맞는 동네 산책 친구를 추천해드려요.<br>
				매칭된 산책 메이트와 동행하면 더욱 즐거운 산책!<br>
				</span>
			</div>
			<div class="col-sm-1" style="line-height: 20px;"></div>
			<div class="col-sm-5" style="line-height: 20px;">
				<span style="font-size: 13px; color: #666666;">
				반려견과 모임에 참여하는 꿈, 투게도그에서 이루세요.<br>
				나와 반려견에게 꼭 맞게 추천된 커뮤니티에 가입하고<br>
				재미와 활력이 넘치는 그룹 산책에 참여해보세요!<br>
				</span>
			</div>
		</div>
		<br><br>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px;">
				<span style="font-weight: bold; color: #666666;">안전하게 산책대행 맡기기</span>
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-5" style="line-height: 30px;">
				<span style="font-weight: bold; color: #666666;">기록, 매칭, 정보 한 번에 관리하기</span>
			</div>
		</div>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-4" style="line-height: 30px;">
				<button type="submit" class="btn" id="matching" name="matching" onclick="location.href='<%=cp%>/agencymatchinsert.action'">산책대행</button>
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-5" style="line-height: 30px;">
				<button type="submit" class="btn" id="commu" name="commu" onclick="location.href='<%=cp%>/ownermiarymain.action'">마이어리</button>
			</div>
		</div>
		<br>
		<div class="row" style="text-align: left;">
			<div class="col-sm-2" style="line-height: 20px;"></div>
			<div class="col-sm-4" style="line-height: 20px;">
				<span style="font-size: 13px; color: #666666;">
				바쁜 일정 탓에 반려견과 산책이 어려우신가요?<br>
				안전하게 케어 받는 특별한 산책을 선물하면 어떨까요?<br>
				오늘 산책은 전문 워커님께 맡기세요!<br>
				
				</span>
			</div>
			<div class="col-sm-1" style="line-height: 20px;"></div>
			<div class="col-sm-5" style="line-height: 20px;">
				<span style="font-size: 13px; color: #666666;">
				반려견과 함께하는 일상을 기록으로 남길 수 있어요.<br>
				소중한 정보와 기록들을 한 곳에서 관리하세요.<br>
				중요한 일정은 잊지 마시고 한 눈에 확인하세요.<br>
				나의 워커 활동도 관리할 수 있답니다.<br>
				</span>
			</div>
		</div>
		<br><br>
	</div>
</c:if>
<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>

</body>
</html>