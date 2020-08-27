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
								<thead style="background-color: #E8E8E8;">
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
											글쓴이
										</th>						
										<th style="text-align: center;">
											작성일
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${recList }">
										<tr>
											<td>${list.rowN }</td>
											<td>${list.item }</td>
											<td><a href="<%=cp %>/recarticle.action?recCd=${list.recCd}">${list.title }</a></td>
											<td>${list.name }</td>
											<td>${list.insDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<button class="btn btn-xs pull-left" onclick="location.href='RecordInsert.jsp'">글쓰기</button>
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
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownermiarymain.action">메 인</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
						<li class="nav-item" style="background-color: #FFFFFF;"><a class="nav-link active" href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
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