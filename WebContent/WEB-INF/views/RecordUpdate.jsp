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

<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 부트스트랩 적용  -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<!-- 제이쿼리 적용 -->

<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>


<!-- 데이트피커 -->
<link rel="stylesheet" href="css/jquery.datetimepicker.css">
<script type="text/javascript" src="js/jquery.datetimepicker.full.js"></script>

<style type="text/css">
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
</style>
<script type="text/javascript">
	$(document).ready(function()
	{
		$(".walk").css("display", "none");
		$(".but").css("display", "none");
		$(".health").css("display", "none");
		$(".edu").css("display", "none");
		$(".supply").css("display", "none");
		
		category();
	});
	
	function category()
	{
		if($(schItem).val() == 'SCHI1')
		{
			$(".walk").css("display", "");
			$(".but").css("display", "none");
			$(".health").css("display", "none");
			$(".edu").css("display", "none");
			$(".supply").css("display", "none");
		}
		
		if($(schItem).val() == 'SCHI4')
		{
			$(".walk").css("display", "none");
			$(".but").css("display", "none");
			$(".health").css("display", "none");
			$(".edu").css("display", "");
			$(".supply").css("display", "none");
		}
		
		if($(schItem).val() == 'SCHI5')
		{
			$(".walk").css("display", "none");
			$(".but").css("display", "");
			$(".health").css("display", "none");
			$(".edu").css("display", "none");
			$(".supply").css("display", "none");
		}
		
		if($(schItem).val() == 'SCHI6')
		{
			$(".walk").css("display", "none");
			$(".but").css("display", "none");
			$(".health").css("display", "");
			$(".edu").css("display", "none");
			$(".supply").css("display", "none");
		}
		
		if($(schItem).val() == 'SCHI7')
		{
			$(".walk").css("display", "none");
			$(".but").css("display", "none");
			$(".health").css("display", "none");
			$(".edu").css("display", "none");
			$(".supply").css("display", "");
		}
		
		if($(schItem).val() == 'SCHI8')
		{
			$(".walk").css("display", "none");
			$(".but").css("display", "none");
			$(".health").css("display", "none");
			$(".edu").css("display", "none");
			$(".supply").css("display", "none");
		}
	}
	
	function addAcc()
	{
		$("#acc > tbody").append(
		"<tr>"
		+ "<td style='width: 25%'>"
		+	"<select class='form-control'>"
		+		"<option>지출</option>"
		+		"<option>수입</option>"
		+	"</select>"
		+ "</td>"
		+ "<td style='width: 50%'>"
		+		"<input type='text' class='form-control' name='moneyContent' />"
		+ "</td>"
		+ "<td style='width: 25%'>"
		+		"<input type='text' class='form-control' name='price' placeholder='금액'>"
		+ "</td>"
		+ "</tr>");
	};
	
	function resetAcc()
	{
		$("#acc > tbody").empty();
	};
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
				<ul class="nav nav-tabs col-md-3" style="border-bottom: none;">
					<li class="nav-item"><a class="nav-link" href="#tab1"
						data-toggle="tab">견주</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab2"
						data-toggle="tab">워커</a></li>
				</ul>


			</div>

			<!-- main 감싸는 content -->
			<div class="content col-md-11">
				<!-- 0708 수정 -->

				<!-- 메인 영역 -->
				<div class="main col-md-12">
					<!-- 0708 수정 -->

					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<h2 class="text-center" style="font-weight: bold;">
								<span class="glyphicon glyphicon-pencil" style="color: #2E9AFE;"></span>기록 쓰기
							</h2>
							<form action="" method="post">
								<table class="table">
									<tr> 
										<td>
											<div class="col-md-12">카테고리</div>
										</td>
										<td>
											<div class="col-md-12">
												<select id="schItem" name="schItem" class="form-control" onchange="category()">
													<c:forEach var="list" items="${schList }">
														<option value="${list.schCd }">${list.title } 기록</option>
													</c:forEach>
												</select>
											</div>
										</td>
										<td>
											<div class="col-md-12">날씨</div>
										</td>
										<td>
											<div class="col-md-12">
												<select id="weatherItem" name="weatherItem" class="form-control">
													<c:forEach var="list2" items="${weatherList }">
														<option value="${list2.weatherCd }">${list2.weather }</option>
													</c:forEach>
												</select>
											</div>
										</td>
									</tr>
									
									<tr class="com">
										<td colspan="1">
											<div class="col-md-12">제목</div>
										</td>
										<td colspan="3">
											<div class="col-md-12">
												<input type="text" class="form-control" name="subject">
											</div>
										</td>
									</tr>

									<!-- 기록마다의 조건을 넣기,,,!!!!! -->
									<!-- 날짜, 요일(선택하지 않을 시, 오늘 날짜)  -->
									<!-- 
									<tr>
										<td>
											<div class="col-md-12">날짜·시간</div>
										</td>
										<td>
											<div class="col-md-12">
												<input id="fromDate" name="fromDate" type="text"
													class="form-control" placeholder="시작 날짜·시간">
											</div>
										</td>
										<td>
											<div class="col-md-12 text-center">~</div>
										</td>
										<td>
											<div class="col-md-12">
												<input id="toDate" type="text" class="form-control"
													placeholder="종료 날짜·시간">
											</div>
										</td>
									</tr>
									-->
									<!-- 날씨 -->
									<!-- 반려견 -->
									<tr>
										<td>
											<div class="col-md-12">펫</div>
										</td>
										<td colspan="3">
											<div class="col-md-12">
												<c:forEach var="pet" items="${pet_list }">
													<input type="checkbox" id="${pet.petCd }" value="${pet.petCd }" name="petSel">
													<label for="${pet.petCd }" style="margin-right: 3%;">${pet.petName }</label>
												</c:forEach>
											</div>
										</td>
									</tr>

									<!-- 산책 시간 -->
									<!-- 산책 거리 -->
									<tr class="walk">
										<td>
											<div class="col-md-12">산책 장소</div>
										</td>
										<td>
											<div class="col-md-12">
												<input type="text" class="form-control" data-toggle="modal"
													data-target="#place">
											</div>
										</td>
										<td>
											<div class="col-md-12">산책 거리</div>
										</td>
										<td>
											<div class="col-md-12">
												<input type="text" class="form-control" readonly>
											</div>
										</td>
									</tr>
									<tr class="but">
										<td>
											<div class="col-md-12">미용 장소</div>
										</td>
										<td>
											<div class="col-md-12">
												<input type="text" class="form-control" data-toggle="modal"
													data-target="#place">
											</div>
										</td>
										<td>
											<div class="col-md-12">미용종류</div>
										</td>
										<td>
											<div class="col-md-12">
												<select class="form-control">
													<option>미용</option>
													<option>목욕</option>
													<option>발톱깎기</option>
												</select>
											</div>
										</td>
									</tr>
									<tr class="health">
										<td>
											<div class="col-md-12">건강 장소</div>
										</td>
										<td>
											<div class="col-md-12">
												<input type="text" class="form-control" data-toggle="modal"
													data-target="#place">
											</div>
										</td>
										<td>
											<div class="col-md-12">예방접종 종류</div>
										</td>
										<td>
											<div class="col-md-12">
												<select class="form-control">
													<option>종합백신</option>
													<option>코로나백신</option>
													<option>켄넬노프</option>
													<option>광견병</option>
												</select>
											</div>
										</td>
									</tr>
									<tr class="health">
										<td>
											<div class="col-md-12">몸무게</div>
										</td>
										<td><input type="text" class="form-control"
											data-toggle="modal" data-target="#place"></td>
										<td></td>
										<td></td>
									</tr>
									<tr class="edu">
										<td>
											<div class="col-md-12">교육 장소</div>
										</td>
										<td>
											<div class="col-md-12">
												<input type="text" class="form-control" data-toggle="modal"
													data-target="#place">
											</div>
										</td>
										<td>
											<div class="col-md-12">교육 종류</div>
										</td>
										<td>
											<div class="col-md-12">
												<select class="form-control">
													<option>기초훈련</option>
													<option>배변훈련</option>
													<option>손훈련</option>
													<option>개인기훈련</option>
												</select>
											</div>
										</td>
									</tr>
									<tr class="supply">
										<td>
											<div class="col-md-12">용품 장소</div>
										</td>
										<td>
											<div class="col-md-12">
												<input type="text" class="form-control" data-toggle="modal"
													data-target="#place">
											</div>
										</td>
										<td>
											<div class="col-md-12">용품 종류</div>
										</td>
										<td>
											<div class="col-md-12">
												<select class="form-control">
													<option>사료</option>
													<option>가구</option>
													<option>장난감</option>
													<option>기타</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="1">
											<div class="col-md-12">첨부 파일</div>
										</td>
										<td colspan="3">
											<div class="col-md-12">
												<input type="file" class="form-control" name="file">
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="1">
											<div class="col-md-12">글 내용</div>
										</td>
										<td colspan="3">
											<div class="col-md-12">
												<textarea rows="10" cols="50" name="content"
													class="form-control" style="resize: none;"></textarea>
											</div>
										</td>
									</tr>
								</table>
								<table class="table" id="acc">
									<thead>
										<tr>
											<th style="width: 25%; text-align: center;" ><span
												class="glyphicon glyphicon-piggy-bank"
												style="color: #FFBF00; font-size: 18pt;"></span>&nbsp;&nbsp;항목</th>
											<th style="width: 50%; text-align: center;"><span
												class="glyphicon glyphicon-piggy-bank"
												style="color: #FFBF00; font-size: 18pt;"></span>&nbsp;&nbsp;내용</th>
											<th style="width: 25%; text-align: center;"><span
												class="glyphicon glyphicon-piggy-bank"
												style="color: #FFBF00; font-size: 18pt;"></span>&nbsp;&nbsp;금액</th>
										</tr>
									</thead>
									
									<tbody></tbody>
								</table>
								<button type="button" class="btn-warning btn-xs pull-right" onclick="addAcc()">
									<span class="glyphicon glyphicon-piggy-bank"></span> 가계부추가
								</button>
								<button type="button" class="btn-warning btn-xs pull-right" onclick="resetAcc()">
									<span class="glyphicon glyphicon-piggy-bank"></span> 가계부초기화
								</button>
								<table class="table">
									<tr>
										<td colspan="4" class="text-center">
											<input type="submit" value="수정" class="btn btn-success">
											<input type="reset" value="다시작성" class="btn btn-warning">
											<button type="button" class="btn btn-primary"
											onclick="location.href='<%=cp %>/ownerrecordlisttab.action'">전체게시글보기</button>
										</td>
									</tr>

								</table>
							</form>
						</div>
						<div class="col-md-1"></div>
					</div>


				</div>
				<!-- end main -->

			</div>
			<!-- end content  -->

			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1"
				style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link active" href="#">메
							인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">매 칭</a></li>
					<li class="nav-item"><a class="nav-link" href="#">기 록</a></li>
					<li class="nav-item"><a class="nav-link" href="#">그 룹</a></li>
					<li class="nav-item"><a class="nav-link" href="#">통 계</a></li>
					<li class="nav-item"><a class="nav-link" href="#">정 보</a></li>
				</ul>
			</div>
			<!--  end nav_bar -->
		</div>
		<!-- end content-wrap  -->

	</div>
	<!-- end container -->


	<c:import url="Footer.jsp"></c:import>


	<!-- 장소 모달 시작 -->
	<div class="modal fade" id="place" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">장소</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">장소 고르기</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 장소 모달 끝 -->




	<!-- 반려견 모달 시작 -->
	<div class="modal fade" id="myDog" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">함께한 반려견</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">반려견 선택</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 반려견 모달 끝 -->
</body>
</html>