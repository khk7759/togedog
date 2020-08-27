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
<title>Togedog.jsp</title>
<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">

	div .nav-btns
	{
		padding: 0px 0px 0px 0%;
		margin: 20px 0px 5px 0px;
	}
	
	
	.nav-tabs
	{
		padding: 0px 0px 0px 0px;
		margin: 10px 10px 0px 20px;
	
	}
	
	th, td
	{
		text-align: center;                               
	}
	
	
	/* css 파일 안먹어서 중복으로 작성 */
	.container
	{
		padding: 0px 0px 0px 0px;
		border-radius: 0px 0px 0px 0px;
	}
	
	/* 너비 맞춤 */
	.content-wrap
	{	
		width :100%;
		margin : 0px 0px 0px 0px;
		padding: 0px 0px 0px 0px;
		border-radius: 0px 0px 0px 0px;
		background-color: var(--blue);
	}
	
	.menus
	{
		margin: 30px 0px 0px 0px;
		padding: 0px 0px 0px 0px;
	}
	
	.txt
	{
		margin: 10px 0px 0px 70px;
		padding: 0px 0px 0px 0px;
		font-size: 18px;
		font-weight: bold;
		text-align: left;
	}
	
	
	
	/* 메뉴탭(메인, 기록...) 효과 정리 */
	  
	.flex-column > li > a:hover,
	.flex-column > li > a:focus 
	{
		text-decoration: none;
		background-color: #fff;
		border-radius: 0 10px 10px 0;
	}
	
	 .nav-tabs > li > a 
	{
		margin-right: 0px;
		line-height: 1.42857143;
		border: 1px solid transparent;
		border-radius: 10px 10px 0 0;
	} 
	
	/* The heart of the matter */
	.testimonial-group > .row 
	{
		overflow-x: auto;
		white-space: nowrap;
	}
	.testimonial-group > .row > .col-md-3 
	{
		display: inline-block;
		float: none;
	}

	/* Decorations */
	.puppyList  
	{ 
		color: #fff; 
		font-size: 48px; 
		padding-bottom: 20px; 
		padding-top: 18px; 
		height: 200px; 
		border: 1px solid black; 
		border-radius: 100px;
	}

	/* 추가 200726 */
	.nav-item:hover
	{
		background-color: #FFFFFF;
		cursor: pointer;
	}
</style>

<script type="text/javascript">

	$(document).ready(function() 
	{	
		$("#ownertab").click(function() 
		{
			location.href="<%=cp%>/ownermiarymain.action";	
		});
		
		$("#workertab").click(function() 
		{
			// 세션에 들어간 유저코드가 누구인지 jstl 로 알아냄 그리고 usercd 에 담는다.
			var usercd = "<c:out value='${sessionScope.user.getUserType()}' />";
			
			//alert(usercd);
			
			// 유저코드가 견주이면
			if(usercd == "견주")
			{
				// 이렇게 띄워주고
				if(confirm("워커가 되시면 워커 마이어리를 이용하실 수 있습니다." + "\n" + "확인 버튼을 누르시면 워커 지원 페이지로 전환됩니다!") == true)
				{
					location.href="<%=cp%>/mainworkerrec.action";
				}
				else
				{
					return;
				}
			}
			else // 그렇지 않으면 ... (견주겸워커인경우는 워커마이어리로 가게된다.)
			{
				location.href="<%=cp%>/workermiarymain.action";
			}
		});
			
		// 시도 변경 시 
		$("#addrSel1").change( function()
	    {
	        
			var addrSel1 = $("#addrSel1").val();
	        
			$.ajax(
			{
				type : 'GET',
				data :
				{
					addrSel1 : addrSel1
				},
				url : "getsgglist.action",
				success : function(data)
				{
					$("#addrSel2").html(data);
				}
			});// end ajax
	        
		});   
	      
		// 시군구 변경시
		$("#addrSel2").change(function()
		{
			var addrSel2 = $("#addrSel2").val();
	        
			$.ajax(
			{
				type : 'GET',
				data :
				{
					addrSel2 : addrSel2
				},
				url : "getdemlist.action",
				success : function(data)
				{
					$("#addrSel3").html(data);
				}
			});// end ajax
	        
		});   
	});

</script>

</head>
<body>
    <c:import url="Header.jsp"></c:import>
    
		<!-- 전체 감싸는 container -->
		<div class="container col-md-12">
		
			<!-- 견주/워커 탭과 content 와 nav-bar 를 감싸는 content-wrap -->
			<div class="content-wrap col-md-12">

			<!-- 견주/워커 탭 -->
			<div class="tabbable" id="tabs-460097">
				<ul class="nav nav-tabs" style="border-bottom: none;">
					<li class="nav-item">
						<a class="nav-link" id="ownertab" data-toggle="tab">견주</a>
					</li>
					<li class="nav-item" style="background-color: #E8E8E8;">
						<a class="nav-link" id="workertab" data-toggle="tab">워커</a>
					</li>
				</ul>
			</div>
				
			<!-- main 감싸는 content -->
			<div class="content col-md-11">
			
				<!-- 메인 영역 -->
				<div class="main col-md-12">
					<div class="tabbable col-md-12" id="tabs-460097">
						<ul class="nav nav-tabs" style="border-bottom: none;">
							<li class="nav-item col-md-4">
	                           <a class="nav-link" href="<%=cp %>/ownerfriendlist.action">소셜</a>
	                        </li>
							<li class="nav-item col-md-4">
								<a class="nav-link" href="<%=cp %>/ownerinfotab.action">마이 정보</a>
							</li>
	                        <li class="nav-item col-md-4">
	                           <a class="nav-link" href="<%=cp %>/ownerpetinfo.action">마이펫 정보</a>
	                        </li>
						</ul>
					</div>
					
					<div class="col-md-12" style="border: 1px solid #F2F2F2; margin: 10px 0px 10px 0px;">
						<div class="col-md-12">
							<h1 style="font-weight: bold; color:#58ACFA;">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm8.93 4.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM8 5.5a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
								</svg>
								내 정보 보기 
							</h1>
						</div>
						
						<div class="col-md-12">
							<table class="table">
								<tr>
									<td rowspan="7" style="width:20%">
										<img src="${ownInfo.photo }" onerror="this.src='images/profile.PNG'" alt="photo" style="width: 100%;"/>
									</td>
									<td style="background-color: #CEECF5; width: 15%;">아이디</td>
									<td style="width: 25%;">${ownInfo.id }</td>
									<td style="background-color: #CEECF5; width: 15%;">닉네임</td>
									<td style="width: 25%;"><input type="text" class="form-control" value="${ownInfo.nickName }"/></td>
								</tr>
								<tr>
									<td style="background-color: #CEECF5; width: 15%;">이름</td>
									<td style="width: 25%;">${ownInfo.name }</td>
									<td style="background-color: #CEECF5; width: 15%;">성별</td>
									<td style="width: 25%;">${ownInfo.gender }</td>
								</tr>
								<tr>
									<td style="background-color: #CEECF5;">생년월일</td>
									<td>${ownInfo.birthday }</td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td style="background-color: #CEECF5;">전화번호</td>
									<td><input type="text" class="form-control" value="${ownInfo.tel }"/></td>
									<td style="background-color: #CEECF5;">이메일</td>
									<td><input type="email" class="form-control" value="${ownInfo.email }"/></td>
								</tr>
								<tr>
									<td colspan="1" style="background-color: #CEECF5;">주소</td>
									<td colspan="3">
										<div class="col-lg-3">
											<select name="addrSel1" id="addrSel1" class="form-control" required="required">
												<option>시·도 선택</option>
												<c:forEach var="addr1" items="${sdList }">
													<c:choose>
														<c:when test="${addr1.addrCd1 == ownInfo.addrCd1 }">
															<option value="${addr1.addrCd1 }" selected="selected">${addr1.addr1 }</option>
														</c:when>
														<c:otherwise>
															<option value="${addr1.addrCd1 }">${addr1.addr1 }</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
			                             
										<div class="col-lg-4">
											<select name="addrSel2" id="addrSel2" class="form-control" required="required">
												<option>시·군·구 선택</option>
												<c:forEach var="addr2" items="${sggList }">
													<c:choose>
														<c:when test="${addr2.addrCd2 == ownInfo.addrCd2 }">
															<option value="${addr2.addrCd2 }" selected="selected">${addr2.addr2 }</option>
														</c:when>
														<c:otherwise>
															<option value="${addr2.addrCd2 }">${addr2.addr2 }</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
		                             
										<div class="col-lg-5">
											<select name="addrSel3" id="addrSel3" class="form-control" required="required">
												<option>동·읍·면 선택</option>
												<c:forEach var="addr3" items="${demList }">
													<c:choose>
														<c:when test="${addr3.addrCd3 == ownInfo.addrCd3 }">
															<option value="${addr3.addrCd3 }" selected="selected">${addr3.addr3 }</option>
														</c:when>
														<c:otherwise>
															<option value="${addr3.addrCd3 }">${addr3.addr3 }</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
									<td>
								</tr>
								
								<tr>
									<td colspan="1" style="background-color: #CEECF5;">상세 주소</td>
									<td colspan="3"><input type="text" class="form-control" value="${ownInfo.addrDetail }"/></td>
								</tr>
								<tr>
									<td style="background-color: #CEECF5;">평점</td>
									<td>${ownInfo.rate }</td>
									<td style="background-color: #CEECF5;">통합 포인트</td>
									<td>${ownInfo.point }</td>
								</tr>	
								
								<tr>
									<td  colspan="5">
										<button type="button" class="btn btn-primary btn-sm btn-block" style="margin: 10px 0px 10px 0px;"><span style="font-weight: bold; font-size: 10pt;">수정완료</span></button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div><!-- end main -->
					
			</div><!-- end content  -->
					
				<!-- 탭들 감싸는 nav-bar -->
				<div class="nav-bar col-md-1"  style="margin-top: 15px; padding-left: 0px;">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownermiarymain.action">메 인</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownergrouptab.action">그 룹</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerstatisticstab.action">통 계</a></li>
						<li class="nav-item" style="background-color: #FFFFFF;"><a class="nav-link active" href="<%=cp %>/ownerfriendlist.action">정 보</a></li>
					</ul>
				</div><!--  end nav_bar -->
			</div><!-- end content-wrap  -->

		</div><!-- end container -->
		
		
	<c:import url="Footer.jsp"></c:import>
		
</body>
</html>