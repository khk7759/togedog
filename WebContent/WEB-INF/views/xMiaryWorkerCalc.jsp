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
<title>MiaryWorkerCalc.jsp</title>
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
	background-color: #666666;
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
			<span style="font-weight: bold; font-size: 25px; color: #ABABAB; position: relative;">정산리스트</span>
			<br>
		</div>
		<div class="col-md-9"></div>
	</div>
</div>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-5" style="line-height: 30px;">
		<span style="font-weight: bold; color: #828282;">즐겁게 산책 후, 자동으로 정산되는 수익을 확인하세요!</span>
	</div>
	<div class="col-md-4" style="text-align: right; line-height: 30px;">
		<span style="color: #666666;">정산문의 : ☎ 02)1234-1234</span>
	</div>
	<div class="col-md-1">
		<select class="form-control" name="category" style="font-size: small; width: 120px; height: 30px;">
			<option value="1">모두 보기</option>
			<option value="2">정산대기중</option>
			<option value="3">정산완료</option>
		</select>
	</div>
</div><br>
	
<div class="container" style="width: 90%; background-color: #FFFFFF; color: #666666; line-height: 30px; text-align: center;">
	<div class="row">
		<div class="col-sm-12">
			<br>
			<div class="row">
				<div class="container" style="border: 0; width: 80%; height: 80px; line-height: 25px; text-align: left;
					background-color: #F0F0F0; border-radius: 8px;">
					<div class="col-sm-2">
						<img src="images/멍멍이1.jpg" alt="멍멍이1" style="width: 80px; height: 80px; border: 0; border-radius: 8px;">
					</div>
					<div class="col-sm-10">
						<table class="table" style="text-align: center;">
							<tr>
								<th>산책날짜</th>
								<th> </th>
								<th>견주</th>
								<th>대표반려견</th>
								<th>정산액</th>
								<td><!-- 상세보기 누르면 매칭완료상세 띄워줌 -->
									<input type="button" class="innerBtn" id="state" name="state" disabled="disabled"
									value="상세보기"  style="color:#FFFFFF; font-weight: bold;">
								</td>

							</tr>
							<tr>
								<td>2020-06-20</td>
								<td> </td>
								<td>으하하</td>
								<td>미미 (2세, 말티즈, 암컷, 중성화O)</td>
								<td> - </td>
								<td>
									<input type="button" class="innerBtn" id="state" name="state" disabled="disabled"
									value="정산대기중" style="background-color: #FFD000; color:#FFFFFF; font-weight: bold;">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="container" style="border: 0; width: 80%; height: 80px; line-height: 25px; text-align: left;
					background-color: #F0F0F0; border-radius: 8px;">
					<div class="col-sm-2">
						<img src="images/멍멍이3.png" alt="멍멍이3" style="width: 80px; height: 80px; border: 0; border-radius: 8px;">
					</div>
					<div class="col-sm-10">
						<table class="table" style="text-align: center;">
							<tr>
								<th>산책날짜</th>
								<th> </th>
								<th>견주</th>
								<th>대표반려견</th>
								<th>정산액</th>
								<td>
									<input type="button" class="innerBtn" id="state" name="state" disabled="disabled"
									value="상세보기"  style="color:#FFFFFF; font-weight: bold;">
								</td>

							</tr>
							<tr>
								<td>2020-06-20</td>
								<td> </td>
								<td>으하하</td>
								<td>미미 (2세, 말티즈, 암컷, 중성화O)</td>
								<td>39,000￦</td>
								<td>
									<input type="button" class="innerBtn" id="state" name="state" disabled="disabled"
									value="정산완료" style="background-color: #76E038; color:#FFFFFF; font-weight: bold;">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="container" style="border: 0; width: 80%; height: 80px; line-height: 25px; text-align: left;
					background-color: #F0F0F0; border-radius: 8px;">
					<div class="col-sm-2">
						<img src="images/멍멍이4.jpg" alt="멍멍이4" style="width: 80px; height: 80px; border: 0; border-radius: 8px;">
					</div>
					<div class="col-sm-10">
						<table class="table" style="text-align: center;">
							<tr>
								<th>산책날짜</th>
								<th> </th>
								<th>견주</th>
								<th>대표반려견</th>
								<th>정산액</th>
								<th>
									<input type="button" class="innerBtn" id="state" name="state" disabled="disabled"
									value="상세보기"  style="color:#FFFFFF; font-weight: bold;">
								</th>

							</tr>
							<tr>
								<td>2020-06-20</td>
								<td> </td>
								<td>으하하</td>
								<td>미미 (2세, 말티즈, 암컷, 중성화O)</td>
								<td>69,000￦</td>
								<td>
									<input type="button" class="innerBtn" id="state" name="state" disabled="disabled"
									value="정산완료"  style="background-color: #76E038; color:#FFFFFF; font-weight: bold;">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<br>
			
			
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
			

		</div>
	</div>
</div>			
							
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