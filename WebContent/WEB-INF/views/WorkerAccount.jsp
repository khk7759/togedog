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


<!-- css 파일 적용 -->
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" type="text/css" href="css/Modal.css">

<!-- 부트스트랩 적용 -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 제이쿼리 적용 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function()
	{
		$("#workertab").click(function() 
		{
			location.href="<%=cp%>/workermiarymain.action";
		});		
		
		$("#ownertab").click(function() 
		{
			// 세션에 들어간 유저코드가 누구인지 jstl 로 알아냄
			var usercd = "<c:out value='${sessionScope.user.getUserType()}' />"; 
			
			//alert(usercd);
			
			// 유저코드가 워커이면
			if(usercd == "워커") 
			{
				// 이렇게 띄워주고
				if(confirm("견주가 되시면 견주 마이어리를 이용하실 수 있습니다." + "\n" + "확인 버튼을 누르시면 견주 가입 페이지로 전환됩니다!") == true)
				{
					location.href="<%=cp%>/ownsignupform.action";
				}
				else
				{
					return;
				}
			}
			else // 그렇지 않으면 ... (견주겸워커인경우는 견주마이어리로 가게된다.)
			{
				location.href="<%=cp%>/ownermiarymain.action";
			}
			
		});
		
		// 닉네임 클릭하면 상세정보 볼 수 있음
		$("a").filter(".detail1").click(function()
		{
			//견주아이디 = $(this).val();
			$("#modal1").show();
		});

	}); // end ready

	function closeModal()
	{
		$('.searchModal').hide();
	};
</script>


<style>



div .nav-btns {
	padding: 0px 0px 0px 0%;
	margin: 20px 0px 5px 0px;
}

.nav-tabs {
	padding: 0px 0px 0px 0px;
	margin: 10px 10px 0px 20px;
}

th, td {
	text-align: center;
}

/* css 파일 안먹어서 중복으로 작성 */
.container {
	padding: 0px 0px 0px 0px;
	border-radius: 0px 0px 0px 0px;
}

/* 너비 맞춤 */
.content-wrap {
	width: 100%;
	margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
	border-radius: 0px 0px 0px 0px;
	background-color: var(- -blue);
}

.menus {
	margin: 30px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}

.txt {
	margin: 10px 0px 0px 70px;
	padding: 0px 0px 0px 0px;
	font-size: 18px;
	font-weight: bold;
	text-align: left;
}

/* 메뉴탭(메인, 기록...) 효과 정리 */
.flex-column>li>a:hover, .flex-column>li>a:focus {
	text-decoration: none;
	background-color: #fff;
	border-radius: 0 10px 10px 0;
}

.nav-tabs>li>a {
	margin-right: 0px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 10px 10px 0 0;
}

	/* 추가 200726 */
	.nav-item:hover
	{
		background-color: #FFFFFF;
		cursor: pointer;
	}
</style>

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
					<li class="nav-item" style="background-color: #E8E8E8;">
						<a class="nav-link" id="ownertab" data-toggle="tab">견주</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="workertab" data-toggle="tab">워커</a>
					</li>
				</ul>
			</div>

			<!-- main 감싸는 content -->
			<div class="content col-md-10">

				<!-- 메인 영역 -->
				<div class="main col-md-12">

					<!-- 가계부 내용 -->
					<div class="accountContent">
								
						<!-- 합계 -->
						<br>
						<div class="pull-left" style="margin-left: 10%">
							<span class="glyphicon glyphicon-piggy-bank" 
								style="color: #F25C69; font-size: 20pt; margin : 10px;"></span>
							<span class="pull left"
							style="font-weight: bold; font-size: 18px;">정산 합계</span>
						</div>		
						<br><br>

						<div>
							<!-- 합계 테이블 -->
							<table class="table table-hover table-condensed"
								style="width: 85%;">
								<tr>
									<th style="text-align: center;">이번 달 정산</th>
								</tr>
								<tr>
									<td>2,000원</td>
								</tr>

								<tr>
									<th style="text-align: center;">총 정산</th>
								</tr>
								<tr>
									<td>35,000원</td>
								</tr>
							</table>
						</div>


						<!-- 가계부 -->
						<br>
						<div class="pull-left" style="margin-left: 10%">
							<span class="glyphicon glyphicon-piggy-bank" 
								style="color: #F25C69; font-size: 20pt; margin : 10px;"></span>
							<span class="pull left"
							style="font-weight: bold; font-size: 18px;">정산 내역</span>
						</div>				
						<div id="select" style="margin: 0 0 15px 50%;">
							<div class="selBox" style="width: 150px; height: 25px; display: inline-block;">
								<select class="form-control" id="">
									<option value="0">==선택==</option>
									<option value="1" selected="selected">날짜 순</option>
									<option value="2">금액 순</option>
								</select>
							</div>
							<div class="selBox" style="width: 150px; height: 25px; display: inline-block;">
								<select class="form-control" id="">
									<option value="0">==선택==</option>
									<option value="1" selected="selected">정산완료</option>
									<option value="2">부분정산</option>
								</select>
							</div>
							<div class="selBox" style="width: 150px; height: 25px; display: inline-block;">
								<select class="form-control" id="">
									<option value="0">==선택==</option>
									<option value="1" selected="selected">10개씩 보기</option>
									<option value="2">20개씩 보기</option>
								</select>
							</div>
						</div> <!-- end select -->
						<table class=" table table-hover table-condensed"
							style="width: 85%;">
							<tr>
								<th style="text-align: center;">번호</th>
								<th style="text-align: center;">상세정보 보기</th>
								<th style="text-align: center;">정산날짜</th>
								<th style="text-align: center;">견주이름</th>
								<th style="text-align: center;">대표강아지이름</th>
								<th style="text-align: center;">산책마리수</th>
								<th style="text-align: center;">금액</th>
								<th style="text-align: center;">구분</th>
							</tr>
							<tr>
								<td>6</td>
								<td><a class="detail1">상세정보보기</a></td>
								<td>2020.07.20</td>
								<td>김홍경</td>
								<td>미미</td>
								<td>1마리</td>
								<td>26,000원</td>
								<td>정산완료</td>
							</tr>
							<tr>
								<td>5</td>
								<td><a class="detail1">상세정보보기</a></td>
								<td>2020.07.19</td>
								<td>김홍경</td>
								<td>마마</td>
								<td>2마리</td>
								<td>26,000원</td>
								<td>부분정산</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a class="detail1">상세정보보기</a></td>
								<td>2020.07.18</td>
								<td>김홍경</td>
								<td>미미</td>
								<td>1마리</td>
								<td>27,000원</td>
								<td>정산완료</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a class="detail1">상세정보보기</a></td>
								<td>2020.07.18</td>
								<td>김홍경</td>
								<td>미미</td>
								<td>1마리</td>
								<td>27,000원</td>
								<td>정산완료</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a class="detail1">상세정보보기</a></td>
								<td>2020.07.16</td>
								<td>김홍경</td>
								<td>미미</td>
								<td>1마리</td>
								<td>27,000원</td>
								<td>정산완료</td>
							</tr>
							<tr>
								<td>1</td>
								<td><a class="detail1">상세정보보기</a></td>
								<td>2020.07.18</td>
								<td>김홍경</td>
								<td>미미</td>
								<td>1마리</td>
								<td>27,000원</td>
								<td>정산완료</td>
							</tr>
						</table>
						<br>
						
						<!-- 페이징 -->
						<nav class="pagination-sm">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">Previous</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
						

					</div>
					<!-- end accountContent -->


				</div>
				<!-- end main -->

			</div>
			<!-- end content  -->

			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1"
				style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/workermiarymain.action">메 인</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/agencyapplylist.action">매 칭</a></li>
					<li class="nav-item" style="background-color: #ffffff;"><a class="nav-link" href="<%=cp%>/workeraccount.action">정 산</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/workerstatistics.action">통 계</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp%>/workermyinfo.action">정 보</a></li>
				</ul>
			</div>
			<!--  end nav_bar -->
		</div>
		<!-- end content-wrap  -->

	</div>
	<!-- end container -->

	<!-- 상세정보 모달창 -->

		<!-- 매칭완료 모달창 -->
	<div id="modal1" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<h3 style="font-weight: bold;">상세정보</h3>
			</div>

			<div class="row">
				<div class="col-sm-12">

					<div
						style="text-align: left; font-size: 17px; font-weight: bold; margin: 0px 0px 10px 10px;">견주
						정보</div>

					<table class="table table-hover table-condensed">
						<tr>
							<th style="text-align: center;">사진</th>
							<th style="text-align: center;">이름</th>
							<th style="text-align: center;">나이</th>
							<th style="text-align: center;">성별</th>
							<th style="text-align: center;">산책날짜</th>
							<th style="text-align: center;">산책시간</th>
							<th style="text-align: center;">산책장소</th>
							<th style="text-align: center;">산책 강아지 수</th>
							<th style="text-align: center;">금액</th>
							<!-- 워커가 받는 금액 -->
						</tr>
						<tr>
							<td>사진</td>
							<td>김홍경</td>
							<td>23</td>
							<td>여</td>
							<td>2020.07.17</td>
							<td>12:00~12:30</td>
							<td>서교동 풍성빌딩 앞</td>
							<td>2</td>
							<td>29,000원</td>
						</tr>
					</table>

					<div
						style="text-align: left; font-size: 17px; font-weight: bold; margin: 0px 0px 10px 10px;">강아지
						정보</div>

					<table class="table table-hover table-condensed">
						<tr>
							<th style="text-align: center;">사진</th>
							<th style="text-align: center;">이름</th>
							<th style="text-align: center;">나이</th>
							<th style="text-align: center;">성별</th>
							<th style="text-align: center;">중성화여부</th>
							<th style="text-align: center;">견종</th>
							<th style="text-align: center;">사이즈</th>
							<th style="text-align: center;">몸무게</th>
						</tr>
						<tr>
							<td>사진</td>
							<td>마루</td>
							<td>3살</td>
							<td>여</td>
							<td>Y</td>
							<td>말티즈</td>
							<td>소형</td>
							<td>5.8kg</td>
						</tr>
						<tr>
							<td>사진</td>
							<td>미미</td>
							<td>3살</td>
							<td>여</td>
							<td>Y</td>
							<td>말티즈</td>
							<td>소형</td>
							<td>6.5kg</td>
						</tr>
					</table>
					
					<!-- 인계증 -->
					<div style="text-align: left; font-size: 17px; font-weight:bold;
					  margin: 0px 0px 10px 10px;">인계증</div>
					<br>
					<textarea rows="14" cols="10" style="width: 100%; border: none;" readonly="readonly">
						이 위치에 인계증 내용
						ㅇㄴ
						ㅇㄴ
						ㅇㄴ
						ㄹㅇㄴ
						ㄹㅇ
						ㄴ
						ㄹㄴㅇ
					</textarea>
					
				</div>
			</div>

			<hr>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="closeModal();">
				<span class="pop_bt modalCloseBtn" style="font-size: 11pt;">
					닫기</span>
			</div>
		</div>
	</div>

	<c:import url="Footer.jsp"></c:import>

</body>
</html>