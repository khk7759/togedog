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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Togedog</title>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" type="text/css" href="css/Modal.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- 모달 css -->
<link rel="stylesheet" type="text/css" href="css/Modal.css">

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
	font-size: 13px;
	width: 45px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
}

.innerBtn:hover
{
	color: #2B4071;
	background-color: #F0F2E7;
	font-weight: bold;
}

.table
{
	font-size: 12px;
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
		
		// 쪽지 리스트 가져오기
		$.ajax({
			type: 'GET',
			url : 'notelist.action',
			async : true,
			success : function(data)
			{
				$("#noteListTbl").html(data);
			}
		});
		
		// 페이지 바꿀 때 쪽지리스트 가져오기??
		
		
		// 워커 탭 / 견주 탭		
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
			
		});// end click
		
		
		// ajax로 동적생성한 태그에 이벤트 걸기 
		// 예) $(document).on("click","#btn",function(){

		//$(".noteTitle").click(function()
		$(document).on("click", ".noteTitle", function()
		{
			//alert("쪽지 제목 클릭~!!");
			
			// 해당 쪽지의 쪽지코드
			var noteCd = $(this).next().val(); 
			//var noteCd = $(".noteTitle").next().val(); // 맨위의 쪽지만 가능
			
			//alert(noteCd);
		
			$.ajax({
				type: 'GET',
				url : 'getNote.action',
				data : {noteCd : noteCd},
				success : function(data)
				{
					//alert("ajax~!!");
					//alert(data);
					
					// 데이터 넣고
					$("#modal").html( $.trim(data) );
					
					// 모달창 보이기
					$("#modal").show();
					
					
					// resend 버튼 클릭하면
					$("#resendBtn").click(function()
					{
						alert("답장하기");
						
						// 기존 모달창 숨기기 
						$("#modal").hide();
						
						// 쪽지 작성 모달 보이기
						$("#receiver").val($("#sender").val());
						$("#modal2").show();
					
					}); 
					
				}
				
			});// end ajax
			
		});// end title click
		
		
		// 작성 버튼 클릭하면
		$("#noteFormBtn").click(function()
		{
			//$("#receiver").val("");
			$("#nContent").val("");
			
			//alert("작성 버튼 클릭!");
			
			// 모달창 보이기
			$("#modal2").show();
			
		});
		
		
		
		// 쪽지작성 폼에서 보내기버튼 클릭하면 receiver
		//$("#sendBtn").click(function()
		$(document).on("click", "#sendBtn", function()
		{
			// 내용 초기화
			//$("#nContent").val("");
			
			alert($("#receiver").val() + "/" + $("#nContent").val())			
			
			// 닉네임 입력했는지 확인
			if($("#receiver").val() == "" || $("#nContent").val() == "" )
			{
				alert("필수항목을 입력해주세요.");
				return;
				
			}
			else
			{
				var nickName = $("#receiver").val();
				
				// 존재하는 닉네임인지 확인
				$.ajax({
					
					type: 'POST',
					url : "nickCheck.action",
					data : {nickName : nickName},
					success : function(data)
					{
						if(data == 0)
						{
							alert("존재하지 않는 닉네임입니다.");
							
							$("#receiver").val("");
							$("#receiver").focus();
							
							return;
						}
						else if(data > 0)
						{
							alert("전송!");
							// 쪽지폼 전송
							$("#noteForm").submit();
						}
					}
				
				});//end ajax
				
			}
			
			
		});// end click
		
		
		
		// 모두선택 or 해제 체크박스
		$("#nCheckAll").click(function()
		{ //클릭되었으면

			if ($("#nCheckAll").prop("checked"))
			{
				//input태그의 name이 box인 태그 checked옵션을 true로 정의
				$("input[name=nCheck]").prop("checked", true);
			} else
			//클릭이 안되어있으면
			{
				//input태그의 name이 box인 태그 checked옵션을 false로 정의
				$("input[name=nCheck]").prop("checked", false);
			}
		});
		
		// 삭제 버튼 클릭하면
		$("#deleteBtn").click(function()
		{	
			// 배열 선언 
			var array = new Array();
			
			// 선택된 값들 배열에 저장
		    $("input[name=nCheck]:checked").each(function() {
		    	array.push( $(this).val());
	        })
			
			//alert(array);
			
			// 선택된 노트코드 전송
			$.ajax({
				type : 'GET',
				url : 'noteDelete.action',
				traditional : true,
				data : {noteCdList : array},
				success : function(data)
				{
					$("#noteListTbl").html(data);
				}
				
			});
			
		});

		
	});// end ready


	// 모달 닫기
	function closeModal()
	{
		$("#receiver").val("");
		$("#sender").val("");
		$(".nContent").val("");
		
		
		$('.searchModal').hide();
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
				<ul class="nav nav-tabs" style="border-bottom: none;">
					<li class="nav-item" style="margin-left: 0px;"><a
						class="nav-link" id="ownertab" data-toggle="tab">견주</a></li>
					<li class="nav-item" style="background-color: #E8E8E8;"><a
						class="nav-link" id="workertab" data-toggle="tab">워커</a></li>
				</ul>


			</div>

			<!-- main 감싸는 content -->
			<div class="content col-md-11">

				<!-- 메인 영역 -->
				<div class="main col-md-12">

					<div id="innerHeader" class="container-fluid"
						style="margin: 0; top: 0; left: 0; right: 0; height: 70px;">
						<div class="row">
							<div class="col-md-2" style="margin-top: 20px; margin-left: 0;">
								<span
									style="font-weight: bold; font-size: 25px; color: #3f6abf;; position: relative;">
									<img src="images/FOOT.png" alt="icon"
									style="width: 32px; height: 30px;"> 쪽지리스트
								</span>
							</div>
							<div class="col-md-9"></div>
						</div>
					</div>


					<!-- 쪽지페이지 버튼들 -->
					<div class="row">
						<div class="col-md-2" style="margin-left: 5px;">
							<input type="button" class="innerBtn" id="deleteBtn" name="deleteBtn" value="삭제" style="width: 60px;"> 
							<!-- <input type="button" class="innerBtn" id="saveBtn" name="saveBtn" value="보관"> -->
							<!-- <input type="button" class="innerBtn" id="reportBtn" name="reportBtn" value="신고"> -->
							<!-- <input type="button" class="innerBtn" id="reply" name="reply" value="답장">&nbsp; -->
							<!-- 이건 쪽지 상세에서 -->
							<input type="button" class="innerBtn" id="noteFormBtn"
								name="noteFormBtn" value="작성" style="width: 70px;">
						</div>
						<div class="col-md-7"></div>
						<div class="col-md-2">
							<div class="input-group">
						      <input type="text" id="searchValue" name="searchValue" class="form-control" style="height: 35.5px;">
						      <span class="input-group-btn">
							<button class="btn btn-xs" type="button" style="border-radius: 0 4px 4px 0;">검색</button>
						      </span>
						    </div><!-- /input-group -->
						</div>
					</div>



					<!-- 쪽지 리스트 -->
					<div class="row">
						<div class="col-md-12">
							<br>
							<form action="noteList.action" method="GET" id="noteListForm">
								<table class="table table-condensed"
									style="width: 95%; font-size: 14px;" align="center">
									<thead>
										<tr style="background-color: #E0E0E0;">
											<th style="text-align: center;"><input type="checkbox"
												class="check" id="nCheckAll" value="checkAll"></th>
											<th style="text-align: center;">보낸 사람</th>
											<th style="text-align: center;">내용</th>
											<th style="text-align: center;">날짜</th>
											<th style="text-align: center;" colspan="2">버튼</th>
										</tr>
									</thead>
									<tbody id="noteListTbl">
										<c:forEach var="note" items="${noteList }">
											<tr>
												<td><input type="checkbox" class="check" name="nCheck" value="${note.noteCd }"></td>
												<td>${note.nickName }</td>
												<td>
													<a name="noteTitle" class="noteTitle">${note.title }...</a>
													<input name="noteCd" type="hidden" value="${note.noteCd }">
												</td>
												<td>${note.insDate }</td>
												<td><a>차단</a></td>
												<td><a>신고</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>

					<!--
					<div class="row" align="center">
						<div class="col-md-12">
							<nav class="pagination-sm">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#">Previous</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">1</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">2</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">3</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">4</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">5</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">Next</a>
									</li>
								</ul>
							</nav>
						</div>
					</div> 
					-->
					
				<!-- 페이징처리 시작 -->
				<div class="row" align="center" style="margin-top: 40px;">
					<nav class="pagination-sm">
						<ul class="pagination">
							<c:if test="${dataCount != 0 }">
								${pageIndexList }
							</c:if>
							<c:if test="${dataCount == 0 }">
							
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- 페이징처리 끝 -->
					<br>

				</div>
				<!-- end main -->

			</div>
			<!-- end content  -->

			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1"
				style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link"
						href="<%=cp %>/ownermiarymain.action">메 인</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=cp %>/ownergrouptab.action">그 룹</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=cp %>/ownerstatisticstab.action">통 계</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=cp %>/ownerfriendlist.action">정 보</a></li>
				</ul>
			</div>
			<!--  end nav_bar -->
		</div>
		<!-- end content-wrap  -->

	</div>
	<!-- end container -->


	<!-- footer -->
	<c:import url="Footer.jsp"></c:import>


	<!-- 쪽지 작성 모달창 -->
	<div id="modal2" class="searchModal"> 
	<div class="search-modal-content" style="width: 475px;">

		<div id="header" class="container-fluid"
			style="margin: 0; top: 0; left: 0; right: 0; background-color: #DAF5FD; height: 70px;">
			<div class="row">
				<div class="col-md-12">
					<br> <span
						style="font-weight: bold; font-size: 30px; color: #00B1F7; position: relative;">
						<img src="images/FOOT.png" alt="icon"
						style="width: 32px; height: 30px;"> 쪽지
					</span>
				</div>
			</div>
		</div>

		<div id="content" class="container-fluid"
			style="width: 350px; margin: 0 0 0 0;">
<form action="sendNote.action" id="noteForm" method="POST">
			<div class="row" style="margin-top: 15px;">
				<div class="col-md-3 pull-left"
					style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px; font-weight: bold;">닉네임</span>
				</div>
				<div class="col-md-3" style="line-height: 30px;" align="left">
					<input type="text" class="form-control" id="receiver"
						name="receiver"  style="width: 200px;" placeholder="닉네임을 입력해주세요.">
				</div>
			</div>

			<div class="row col-md-12" style="margin-top: 15px;">
				<textarea class="form-control" rows="40" cols="60" name="nContent"
					id="nContent" style="width: 400px; height: 300px;" placeholder="내용을 입력해주세요."></textarea>
			</div>
</form>
			<div class="row">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-md-10" style="line-height: 30px; margin-left: 30px;"
					align="right">
					<br>
					<button type="button" class="btn btn-s"  id="sendBtn">보내기</button>
					<button type="button" style="background-color: #DDDDDD;"
						class="btn btn-s" onClick="closeModal();">닫기</button>
				</div>

				<!-- test -->
			</div>
		</div>
		<hr>
	</div>
	</div>
	<!-- end modal -->



	<!-- 쪽지 보기 모달창 -->
	<div id="modal" class="searchModal">
	
	</div> 
	<!-- end modal -->
	
	
	
</body>
</html>