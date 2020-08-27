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

</head>
<body>
    <c:import url="Header.jsp"></c:import>
    
		<!-- 전체 감싸는 container -->
		<div class="container col-md-12">
		

			<!-- 견주/워커 탭과 content 와 nav-bar 를 감싸는 content-wrap -->
			<div class="content-wrap col-md-12">
		
		
		
		
		
		
				<div class="tabbable" id="tabs-460097">
				
					<!-- 견주/워커 탭 -->
					<ul class="nav nav-tabs col-md-3" style="border-bottom: none;">
						<li class="nav-item">
							<a class="nav-link" href="#tab1" data-toggle="tab">견주</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#tab2" data-toggle="tab">워커</a>
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
			<option value="2">정산</option>
			<option value="3">회원</option>
			<option value="4">신고</option>
		</select>
	</div>
</div>
	
<div class="row">
	<div class="col-md-12">
	<br>
		<table class="table table-condensed" style="width: 90%;" align="center">
			<tr>
				<td style="color: #75C3F8;">「우리코코」워커님의 신청승인이 완료되었습니다. </td>
				<td>2020-06-22</td>
				<td><img src="" alt="×"></td>
			</tr>
			<tr>
				<td>「멍멍이」님에 대해 접수하신 신고 처리가 완료되었습니다.</td>
				<td>2020-06-18</td>
				<td><img src="" alt="×"></td>
			</tr>
			<tr>
				<td>「으하하」님이 산책대행을 신청하셨습니다.</td>
				<td>2020-06-15</td>
				<td><img src="" alt="×"></td>
			</tr>
			<tr>
				<td>「땀다」견주님과 산책완료 건에 대한 정산이 완료되었습니다.</td>
				<td>2020-06-04</td>
				<td><img src="" alt="×"></td>
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
					<ul class="nav flex-column" >
						<li class="nav-item"><a class="nav-link active" href="#">메 인</a></li>
						<li class="nav-item"><a class="nav-link" href="#">매 칭</a></li>
						<li class="nav-item"><a class="nav-link" href="#">기 록</a></li>
						<li class="nav-item"><a class="nav-link" href="#">그 룹</a></li>
						<li class="nav-item"><a class="nav-link" href="#">통 계</a></li>
						<li class="nav-item"><a class="nav-link" href="#">정 보</a></li>
					</ul>
				</div><!--  end nav_bar -->
			</div><!-- end content-wrap  -->

		</div><!-- end container -->
		
		
	<c:import url="Footer.jsp"></c:import>
		
</body>
</html>