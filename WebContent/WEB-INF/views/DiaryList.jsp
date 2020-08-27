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
						<!-- main 안에 들어갈 아이들 -->
						<!-- 기록 항목들의 드롭다운 -->
						<br />
						<div class="mainFirstline pull-right" style="margin: 0px 20px 0px 0px;">
							<select class="form-control" style="width: 150px;">
								<option>--정렬--</option>
								<option>날짜순</option>
								<option>작성자순</option>
								<option>항목순</option>
							</select>
						</div>
						
						<div class="mainFirstline pull-right" style="margin: 0px 20px 0px 0px;">
							<select class="form-control" style="width: 150px;">
								<option>전체보기</option>
								<option>산책기록</option>
								<option>미용기록</option>
								<option>건강기록</option>
								<option>교육기록</option>
								<option>용품기록</option>
								<option>기타기록</option>
							</select>
						</div>
						
						<br /><br /><br />
						
						<!-- 게시판 -->
						<div class="col-md-12">
							<table class="table table-condensed">
								<tr>
									<th style="text-align: center;">
										글번호
									</th>
									<th style="text-align: center;">
										분류
									</th>
									<th style="text-align: center;">
										제목
									</th>
									<th style="text-align: center;">
										작성일
									</th>
									<th style="text-align: center;">
										글쓴이
									</th>						
								</tr>
								<tr>
									<td>
										5
									</td>
									<td>
										용품
									</td>
									<td>
										강아지 용품들 구입
									</td>
									<td>
										2020.07.07 19:50
									</td>
									<td>
										김홍경
									</td>
								</tr>	
								<tr>
									<td>
										4
									</td>
									<td>
										교육
									</td>
									<td>
										미미 배변 교육 성공~!
									</td>
									<td>
										2020.07.06 11:25
									</td>
									<td>
										김홍경
									</td>
								</tr>	
								<tr>
									<td>
										3
									</td>
									<td>
										미용
									</td>
									<td>
										우리 미미 미용했다~!~!
									</td>
									<td>
										2020.07.05 17:30
									</td>
									<td>
										김홍경
									</td>
								</tr>									
								<tr>
									<td>
										2
									</td>
									<td>
										건강
									</td>
									<td>
										미미의 첫 병원
									</td>
									<td>
										2020.07.04 16:00
									</td>
									<td>
										김홍경
									</td>
								</tr>	
								<tr>
									<td>
										1
									</td>
									<td>
										산책
									</td>
									<td>
										<a href="DiaryRead.jsp" style="color: black;">미미의 첫 산책</a>
									</td>
									<td>
										2020.07.04 13:00
									</td>
									<td>
										김홍경
									</td>
								</tr>							
							</table>

							<button class="btn btn-xs pull-left" onclick="location.href='DiaryWrite.jsp'">글쓰기</button>
						</div>
						<!-- 페이지 -->
						<nav class="pagination-sm">
							<ul class="pagination">
								<li class="page-item">
									<a class="page-link" href="#">Previous</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">1</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">2</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">3</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">4</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">5</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
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