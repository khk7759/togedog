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

<!-- <link rel="stylesheet" type="text/css" href="css/MiaryStyle.css"> -->
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
	
	textarea 
	{ 
		padding: 12px 12px 12px 12px;
	}
	
	textarea:focus 
	{
 		outline: none;
	}

	body 
	{
		font-family: Handon3gyeopsal300g;
	}

	p 
	{
		text-align: left;
		margin: 2px 0px 2px 0px;
		padding: 0px 0px 0px 0px;
	}
	
	.nav-tabs
	{
		padding: 0px 0px 0px 0px;
		margin: 10px 0px 0px 0px;
	}
	
	.nav-bar
	{
		margin: 0px 0px 0px 0px;
		padding:0px 0px 0px 0px;
	}
	
	/* 메뉴탭(메인, 기록...) 효과 정리 */
	.flex-column>li>a:hover, .flex-column>li>a:focus 
	{
		text-decoration: none;
		background-color: #fff;
		border-radius: 0 10px 10px 0;
		
	}
	
	.nav-tabs>li>a 
	{
		margin-right: 0px;
		line-height: 1.42857143;
		border: 1px solid transparent;
		border-radius: 10px 10px 0 0;
	}
	
	/* .css 안먹어서 중복 추가 */
	
	.content-wrap
	{	
		width :100%;
		margin : 0px 0px 0px 0px;
		padding: 0px 0px 0px -10px;
		border-radius: 0px 0px 0px 0px;
		background-color: #75c3f8;
	}
	
	/* 알림, 쪽지 */
	.badge
	{
		z-index:1; 
		position: relative;
		
		font-size: 10px;
	    font-weight: 700;
	    line-height: 18px;
	    display: inline-block;
	    min-width: 5px;
	    height: 18px;
	    padding: 0 4px;
	    vertical-align: top;
	    letter-spacing: 0;
	    color: #fff;
		border-radius: 18px;
	    left: -5px;
	    top : 3px;
	}
	
	.icon
	{
		font-size: 16px; 
		position: relative; 
		top:-7px;
		left:5px;
	}
	/* 추가 200726 */
	.nav-item:hover
	{
		background-color: #FFFFFF;
		cursor: pointer;
	}
	
	div.main
	{
		width: 83.3%;
		height: 100%;
		margin: 15px 0px 15px 0px;
		padding: 0px 0px 0px 0px;
		border-radius: 4px 0px 4px 4px;
		background-color: white;
		
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
					location.href="<%=cp%>/addwokform.action";
				}
				else
				{
					return;
				}
			}
			else // 그렇지 않으면 ... (견주겸워커인경우는 견주 마이어리로 가게된다.)
			{
				location.href="<%=cp%>/ownermiarymain.action";
			}
			
		});// click end
	
		
		// 체크리스트 수정버튼 클릭
		$("#checkListBtn").click(function()
		{
			var checkList = $("#checkList").val();
			
			//alert(checkList);
			
			$.ajax({
				type: 'GET',
				url : 'updateCheckList.action',
				data : {checkList : checkList},
				success : function(data)
				{
					//alert(data);
					$("#checkList").val($.trim(data));
				}
				
			});
			
		});
		
		
		
	});// ready end

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
					<li class="nav-item" style="margin-left: 20px;">
						<a class="nav-link" id="ownertab" data-toggle="tab">견주</a>
					</li>
					<li class="nav-item" style="background-color: #E8E8E8;">
						<a class="nav-link" id="workertab" data-toggle="tab">워커</a>
					</li>
				</ul>
			</div>

			<!-- side 와 main 감싸는 content -->
			<div class="content col-md-11">

				<!-- profile 감싸는 side -->
				<div class="side col-md-2">

					<!-- 사진, 닉네임, 회원단계 감싸는 profile -->
					<div class="profile col-md-12">
						<div class="photo col-md-5">
							<img src="${ownInfo.photo }" onerror="this.src='images/profile.PNG'" alt="photo" style="width: 100%; height: 200%;"/>
						</div>
						<div class="nick-grade col-md-7">
							<div class="nick">${nickName }</div>
							<div class="grade">${ownInfo.grade }</div>
						</div>

					</div>

					<!-- 알림, 쪽지 감싸는 noti-note -->
					<div class="noti-note">
						<div class=" noti col-md-6">
							<c:if test="${notiCount == 0 }">
							</c:if>
							
							<c:if test="${notiCount != 0 }">
								<span class="badge badge-pill" style="background-color: #F25C69;">${notiCount }</span>
							</c:if>
							<br>	
							<a href="ownernotilist.action">
								<svg class="icon" width="1.4em" height="1.4em" viewBox="0 0 16 16" class="bi bi-bell-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  									<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
								</svg>
							</a>
						</div>
						<div class=" note col-md-6">
							<c:if test="${noteCount == 0 }">
							</c:if>
							
							<c:if test="${noteCount != 0 }">
								<span class="badge badge-pill" style="background-color: #F25C69;">${noteCount }</span>
							</c:if>
							<br>	
							<a href="ownernotelist.action">
								<svg class="icon" width="1.4em" height="1.4em" viewBox="0 0 16 16" class="bi bi-envelope-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd" d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
								</svg>
							</a>
						</div>
					</div>

					<!-- 체크리스트, 당일 산책정보 감싸는 check-today -->
					<div class="check-today" style="margin-top: 5px;">
							<p>체크리스트</p>
							<div class="checklist col-md-12">
								<textarea name="checkList" id="checkList" rows="15" cols="23" style="resize: none; border: none">${checkList }</textarea>
							</div>
							<div class="col-md-6"></div>
							<div class="col-md-6">
								<button type="button" id="checkListBtn" class="btn btn-xs" style="margin: 10px 0px 10px 0px;">수정</button>
							</div>
						<p>당일산책정보</p>
						<div class="todayInfo col-md-12">
						<%-- 
							<c:catch var="err">
  								<c:import var="weather" url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=4113153000"></c:import>
							  <!-- xml 파싱하기 -->
							  <x:parse var="wrss" xml="${weather}"></x:parse>
							  <x:out select="$wrss/rss/channel/title"></x:out><br/>
							  
							  <table border="1">
							     <tr>
							         <td colspan="2" align="center">현재날씨</td>
							     </tr>
							     <tr>
							         <td>기준시간</td>
							         <td>
							               <x:out select="$wrss/rss/channel/pubDate">
							               </x:out>
							         </td>
							     </tr>
							     <tr>
							         <td>기온 </td>
							         <td>
							               <x:out select="$wrss/rss/channel/item/description/body/data/temp">
							               </x:out>
							        </td>
							     </tr>
							     <tr>
							         <td>습도 </td>
							         <td>
							              <x:out select="$wrss/rss/channel/item/description/body/data/reh">
							              </x:out> %
							         </td>
							     </tr>
							     <tr>
							         <td>강수확률 </td>
							         <td>
							              <x:out select="$wrss/rss/channel/item/description/body/data/pop">
							              </x:out> %
							         </td>
							     </tr>
							  </table>
							</c:catch>
							<c:if test="${err!=null}">
							   ${err}
							</c:if>
							 --%>
						</div>
					</div>


				</div>
				<!-- end side -->

				<!-- 메인 영역 -->
				<div class="main col-md-10">
					<!-- 캘린더 -->
					<c:import url="Cal.jsp"></c:import>
             		 
					<table id="calList"></table>
				  
				</div>
			</div>
			<!-- end content  -->

			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1" style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item" style="background-color: #FFFFFF;"><a class="nav-link active" href="<%=cp %>/ownermiarymain.action">메 인</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownergrouptab.action">그 룹</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerstatisticstab.action">통 계</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerfriendlist.action">정 보</a></li>
				</ul>
			</div>
			<!--  end nav_bar -->
		</div>

	</div>
	<!-- end container -->

	<c:import url="Footer.jsp"></c:import>
	<c:import url="CalModal.jsp"></c:import>
</body>
</html>