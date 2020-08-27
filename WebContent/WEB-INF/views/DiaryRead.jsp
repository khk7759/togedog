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
						<div class="row">				
						<div class="col-md-1"></div>
						
						<div class="col-md-10">
							<br />
							<div class="col-md-12">
								<table class="table table-condensed" style="margin: 0px 0px 0px 0px;">
									<tr style="background-color: #CEECF5;">
										<td style="width: 10%; text-align:center;">
											<span style="font-weight: bold;">[산책]</span>
										</td>
										<td style="width: 45%; text-align:center;">
											<span style="font-weight: bold;">미미의 첫 산책</span>
										</td>
										<td style="width: 25%; text-align:center;">
											<span style="font-size: 10pt; color: #848484;">2020/07/04 13:00</span>
										</td>
										<td style="width: 20%; text-align:center;">
											<span style="font-size: 10pt; color: #848484; cursor: pointer;"><a>수정</a></span>
											 | <span style="font-size: 10pt; color: #848484; cursor: pointer;"><a>삭제</a></span>
										</td>
									</tr>
								</table>
							</div>
							
							<div class="col-md-12">
								<table class="table table-condensed" style="margin: 0px 0px 0px 0px;">
									<tr>
										<td style="background-color: #CEECF5;" colspan="1">날짜</td>
										<td style="text-align: center;" colspan="3">2020/07/02 13:00 ~ 2020/07/02 14:00</td>
									</tr>
									<tr>
										<td style="background-color: #CEECF5; width: 15%;">날씨</td>
										<td style="width: 35%;">맑음</td>
										<td style="background-color: #CEECF5; width: 15%;">반려견</td>
										<td style="width: 35%;">미미</td>
									</tr>
									<tr>
										<td style="background-color: #CEECF5; width: 15%;">산책장소</td>
										<td style="width: 35%;">근린공원</td>
										<td style="background-color: #CEECF5; width: 15%;">산책거리</td>
										<td style="width: 35%;">1km</td>
									</tr>
									<tr>
										<td style="background-color: #CEECF5; width: 15%;">미용장소</td>
										<td style="width: 35%;"></td>
										<td style="background-color: #CEECF5; width: 15%;">미용종류</td>
										<td style="width: 35%;"></td>
									</tr>
									<tr>
										<td style="background-color: #CEECF5; width: 15%;">건강장소</td>
										<td style="width: 35%;"></td>
										<td style="background-color: #CEECF5; width: 15%;">건강종류</td>
										<td style="width: 35%;"></td>
									</tr>
									<tr>
										<td style="background-color: #CEECF5; width: 15%;">교육장소</td>
										<td style="width: 35%;"></td>
										<td style="background-color: #CEECF5; width: 15%;">교육종류</td>
										<td style="width: 35%;"></td>
									</tr>
								</table>
							</div>
							
							<div class="col-md-12">
								<table class="table table-condensed">
									<tr>
										<td>
											오늘은 미미랑 산책했다~~~ <br />
											귀엽당~~~~~~~~~~
										</td>
									</tr>
								</table>
							</div>
							
							<div class="col-md-12" style="text-align: left;">
								<span class="glyphicon glyphicon-piggy-bank" style="color: #F25C69; font-size: 18pt;"></span>
								&nbsp;&nbsp;<span style="font-weight: bold; font-size: 15pt;">가계부</span>
							
							</div>
							
							<div class="col-md-12">
								<table class="table table-condensed">
									<tr>
										<td style="background-color: #CEECF5; width: 25%; text-align: center;">항목</td>
										<td style="background-color: #CEECF5; width: 50%; text-align: center;">내용</td>
										<td style="background-color: #CEECF5; width: 25%; text-align: center;">금액</td>
									</tr>
									<tr>
										<td style="width: 25%; text-align: center;">
											지출
										</td>
										<td style="width: 50%; text-align: center;">
											아메리카노
										</td>
										<td style="width: 25%; text-align: center;">
											4,000 원
										</td>
									</tr>
									<tr>
										<td style="width: 25%; text-align: center;">
											지출
										</td>
										<td style="width: 50%; text-align: center;">
											산책 중 미미를 위한 물
										</td>
										<td style="width: 25%; text-align: center;">
											1,000 원
										</td>
									</tr>
									<tr>
										<td style="width: 25%; text-align: center;">
											지출
										</td>
										<td style="width: 50%; text-align: center;">
											미미를 위한 수제 푸딩
										</td>
										<td style="width: 25%; text-align: center;">
											3,000 원
										</td>
									</tr>
								</table>
								<table class="table">
						            <tr>   
						                <td colspan="4"  class="text-center">
						                    <button type="button"  class="btn btn-primary" onclick="location.href='DiaryList.jsp'">전체 게시글보기</button>
						                </td>
						            </tr>
						             
						       </table>
							</div>
						</div>
						
						
						<div class="col-md-1"></div>
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