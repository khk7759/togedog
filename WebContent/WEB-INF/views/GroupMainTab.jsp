<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// @@파일 순서대로 번호 추가하기(0715)

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
<link rel="stylesheet" type="text/css" href="css/MiaryStyle.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">

.todayInfo
{
	margin: 0px 0px 3px 0px;
}

p
{
	text-align : left;
	margin: 2px 0px 2px 0px;
	padding: 0px 0px 0px 0px;
}


/* 메뉴탭(메인, 기록...) 효과 정리 */

.flex-column>li>a:hover, .flex-column>li>a:focus {
	text-decoration: none;
	background-color: #fff;
	border-radius: 0 10px 10px 0;
}

/* 견주/워커 */
.nav-tabs>li>a {
	margin-right: 0px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 10px 10px 0 0;
}


/* .css 안먹어서 중복 추가 */

.nav-bar
{
	margin: 0px 0px 0px 0px;
	padding:0px 0px 0px 0px;
}
</style>

</head>
<body>
    <c:import url="Header.jsp"></c:import>
    
		<!-- 전체 감싸는 container -->
		<div class="container col-md-12">
		
		
		<!-- 견주/워커 탭 content 와 nav-bar 를 감싸는 content-wrap -->
		<div class="content-wrap col-md-12">
			
		 	<!-- 견주/워커 탭 -->
			<div class="tabbable" id="tabs-460097">
				<ul class="nav nav-tabs" style="border-bottom: none;">
					<li class="nav-item" style="margin-left: 20px;">
						<a class="nav-link" href="#tab1" 
							data-toggle="tab">견주</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#tab2"
						data-toggle="tab">워커</a>
					</li>
				</ul>
			</div>
			
			<!-- profile 과 main 감싸는 content -->
			<div class="content col-md-11" >
			
					<!-- profile 감싸는 side -->
					<div class="side col-md-2"	>

						<!--그룹소개 -->
						<p style="margin: 30px 0px 10px 0px; font-weight: bold;
						 font-size: 18px; text-align: center;">그룹명</p>
						
						<p style="margin-top: 40px;">그룹소개</p>
						<div class="todayInfo col-md-12">그룹소개입니다.</div>
				
						<p>공지사항</p>
						<div class="todayInfo col-md-12">공지사항입니다.</div>	
						
						<p>당일산책정보</p>
						<div class="todayInfo col-md-12">당일산책정보 제공
							<br />
							<br />
							<br />
							<br />
							<br />
						</div>
						
						
					</div>
					<!-- end side -->

					<!-- 메인 영역 -->
					<div class="main col-md-10">
						<!-- 캘린더 -->
            			<c:import url="Cal.jsp"></c:import>					 	 
					</div>
					
			</div><!-- end content  -->
				
			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1" style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="#">메 인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">일 정</a></li>
					<li class="nav-item"><a class="nav-link" href="#">멤 버</a></li>
					<li class="nav-item"><a class="nav-link" href="#">게 시 판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">통 계</a></li>
					<li class="nav-item"><a class="nav-link" href="#">관 리</a></li>
				</ul>
			</div><!--  end nav_bar -->
		</div>

		</div><!-- end container -->
		
		
		
		<c:import url="Footer.jsp"></c:import>
		   <c:import url="CalModal.jsp"></c:import>
		
</body>
</html>