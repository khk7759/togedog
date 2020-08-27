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
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" type="text/css" href="css/Modal.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>

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

.innerBtn
{
	color: #ffffff;
	background-color: #3F6ABF;
	font-weight: bold;
	border: 0px;
	border-radius: 12px;
	outline: 0;
	letter-spacing: 0.05em;
	/* box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19); */
	font-size: 14px;
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
}

.innerBtn:hover
{
	color: #2B4071;
	background-color: #F0F2E7;
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
 
</style>

<script type="text/javascript">

	$(document).ready(function() 
	{
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
	});

</script>

</head>
<body>
    <c:import url="Header.jsp"></c:import>
    
		<!-- 전체 감싸는 container -->
		<div class="container col-md-12">
		

			<!-- 견주/워커 탭과 content 와 nav-bar 를 감싸는 content-wrap -->
			<div class="content-wrap col-md-12">
		
				<div class="tabbable" id="tabs-460097">
				
					<!-- 견주/워커 탭 -->
					<ul class="nav nav-tabs" style="border-bottom: none;">
						<li class="nav-item" style="margin-left: 0px;">
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
							
<div id="innerHeader" class="container-fluid" style="margin: 0; top: 0; left: 0; right: 0; height: 70px;">
	<div class="row">
		<div class="col-md-3">
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-weight: bold; font-size: 25px; color: #ABABAB; position: relative;">알림리스트</span>
			<br>
		</div>
		<div class="col-md-9"></div>
	</div>
</div>

<div class="row">
	<div class="col-md-7"></div>
	<div class="col-md-3" style="text-align: right; line-height: 30px;">
		<span style="color: #666666; font-weight: bold;">확인하실 알림 항목을 선택해주세요 &nbsp;&nbsp;→</span>
	</div>
	<div class="col-md-1">
		<select class="form-control" name="category" style="font-size: small; width: 120px; height: 30px;">
			<option value="1">산책</option>
			<option value="2">회원</option>
			<option value="3">커뮤니티</option>
			<option value="4">신고</option>
		</select>
	</div>
</div>
	
<div class="row">
	<div class="col-md-12">
	<br>
		<table class="table table-condensed" style="width: 90%;" align="center">
			<tr>
				<td style="color: #75C3F8;">「우리코코」님이 「코코」의 새로운 미용기록을 작성했습니다. </td>
				<td>2020-06-22</td>
			</tr>
			<tr>
				<td>「멍멍이」님의 일대일산책 매칭 신청이 수락되었습니다.</td>
				<td>2020-06-18</td>
			</tr>
			<tr>
				<td>「으하하」님이 산책대행을 신청하셨습니다.</td>
				<td>2020-06-15</td>
			</tr>
		</table>
	</div>
</div>

<div class="row" align="right">
	<div class="col-md-12">
	<br>
		<button type="button" id="readAll" name="readAll" class="innerBtn">모두 읽음</button>
		&nbsp;&nbsp;
		<button type="button" id="deleteAll" name="deleteAll" class="innerBtn">모두 삭제</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
</div><br>
							
							
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
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerfriendlist.action">정 보</a></li>
					</ul>
				</div><!--  end nav_bar -->
			</div><!-- end content-wrap  -->

		</div><!-- end container -->
		
		
	<c:import url="Footer.jsp"></c:import>
		
</body>
</html>