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
	
	.petImage
	{
		display: inline-block;
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
						<div class="tabbable col-md-12" id="tabs-460097">
							<ul class="nav nav-tabs" style="border-bottom: none;">
								<li class="nav-item col-md-4">
		                           <a class="nav-link" href="<%=cp %>/ownerfriendlist.action">소셜</a>
		                        </li>
								<li class="nav-item col-md-4">
									<a class="nav-link" href="<%=cp %>/ownerinfotab.action">마이 정보</a>
								</li>
		                        <li class="nav-item col-md-4">
		                           <a class="nav-link" href="<%=cp %>/ownerpetinfo.action">마이펫 정보</a>
		                        </li>
							</ul>
						</div>
						<div id="header" class="container-fluid col-md-12" style="margin: 0; top: 0; left: 0; right: 0; height: 70px;">
							<div class="row">
								<div class="col-md-3">
								<br>
									<span style="font-weight: bold; font-size: 35px; color: #00B1F7; position: relative;">마이펫 정보  
									<img src="images/FOOT.png" alt="icon" style="width: 32px; height: 30px;"></span>
								</div>
								<div class="col-md-9">
								</div>
							</div>
						</div>
						<div class="container-fluid col-md-1"></div>
						<div id="content" class="container-fluid col-md-10" style="/* border: 1px solid black;  */margin: 20px 0px 20px 0px; padding: 20px 0px 20px 0px;">
								
								<div class="row" style="margin: 20px 0px 20px 0px;">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="petImage col-md-4">
										<img src="" alt="사진없음 아이콘!" style="width:250px; height:250px;">
									</div>
									<div class="col-md-4">
										<input type="file" class="form-control" value="사진 올리기">
									</div>
									<div class="col-md-3" style="line-height: 30px;"></div>
								</div>
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">칭호</span>
									</div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<select class="form-control" name="medal" id="medal">
											<option value="1">서투른 골목대장</option>
											<option value="2">특출난 깔끔이</option>
										</select>
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>						
								</div>
								<br>
								
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">이름</span>
									</div>
									<div class="col-md-2" style="line-height: 30px;">
										<input type="text" class="form-control" id="petname" name="petname" placeholder="펫이름을 입력하세요" required="required">
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>
								</div>
								<br>
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">성별</span>
									</div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<label><input type="radio" name="petgender" value="1" checked="checked">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">
										<img src="images/female.png" alt="icon" style="width: 30px; height: 30px;"></span></label>
										&nbsp;&nbsp;
										<label><input type="radio" name="petgender" value="2">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">
										<img src="images/male.png" alt="icon" style="width: 30px; height: 30px;"></span></label>	
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>
								</div>
								<br>
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">생년월일</span>
									</div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<input type="text" id="petBirth" class="datePicker form-control" value="1990-01-01" required="required">
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>
								</div>	
								<br>
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">중성화사항</span>
									</div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<label><input type="radio" name="sprayOX" value="1" checked="checked">&nbsp;<span style="color: #34B7EB; font-size: 20px; font-weight: bold;">
										 Ο </span></label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="sprayOX" value="2">&nbsp;<span style="color: #EB6060; font-size: 25px; font-weight: bold;">
										 × </span></label>
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>
								</div>
								<br>
								
								<div id="spray" class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">중성화일자</span>
									</div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<input type="text" id="sprayDate" class="datePicker form-control" value="1990-01-01" required="required">	
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>
								</div>
								<br>
								
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">몸무게</span>
									</div>
									<div class="col-md-2" style="line-height: 30px;">
										<input type="text" class="form-control" id="kg" name="kg" placeholder="ex) 3.5" required="required">
									</div>
									<div class="col-md-1" style="line-height: 30px;" align="left">
										<span style="font-size: 13px; color: gray;">kg</span>
									</div>
									<div class="col-md-6" style="line-height: 30px;"></div>
								</div>
								<br>
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">장애</span>
									</div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<label><input type="radio" name="obstacle" value="1" checked="checked">
										<span style="font-size: 15px; color: #757575;">&nbsp;있음</span></label>
										&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;<label><input type="radio" name="obstacle" value="2">
										<span style="font-size: 15px; color: #757575;">&nbsp;없음</span></label>
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>
								</div>
								<br>
								
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<input type="text" class="form-control" id="obstacleDetail" name="obstacleDetail" 
										style="width: 450px;" placeholder="장애사항을 입력하세요" required="required">
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>
								</div>
								<br>
								
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">알러지</span>
									</div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<label><input type="radio" name="allergy" value="1" checked="checked">
										<span style="font-size: 15px; color: #757575;">&nbsp;있음</span></label>
										&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;<label><input type="radio" name="allergy" value="2">
										<span style="font-size: 15px; color: #757575;">&nbsp;없음</span></label>
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>
								</div>
								<br>
								
								
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<input type="text" class="form-control" id="allergyDetail" name="allergyDetail"
										style="width: 450px;" placeholder="알러지사항을 입력하세요" required="required">
									</div>
									<div class="col-md-7" style="line-height: 30px;"></div>
								</div>
								<br>
								
								<br>
								<div class="row">
									<div class="col-md-1" style="line-height: 30px;"></div>
									<div class="col-md-2" style="line-height: 30px; text-align: left;">
										<span style="color: #828282; font-size: 15px;">예방접종 추가</span>
									</div>
									<div class="col-md-9" style="line-height: 30px;">
										<select class="form-control" name="vaccin" style="font-size: small; width: 150px; height: 30px;">
											<option value="0">예방접종 추가</option>
											<option value="1">주사1</option>
											<option value="2">주사2</option>
											<option value="3">주사3</option>
										</select>
									</div>
								</div>
								<br>
								
								
								<div class="col-md-12" style="line-height: 30px; text-align: left; margin-left: 7%;">
										<span style="color: #828282; font-size: 15px;">예방접종 내역</span>
								</div>
								<br>
								<br>
								<div class="row">
									<table class="table table-hover table-condensed" style="width: 80%;">
										<tr>
											<th>번호</th>
											<th>예방접종명</th>
											<th>접종일자</th>
										</tr>
										<tr>
											<td>3</td>
											<td>광견병</td>
											<td>2020.07.22</td>
										</tr>
										<tr>
											<td>2</td>
											<td>심장사상충</td>
											<td>2020.06.21</td>
										</tr>
										<tr>
											<td>1</td>
											<td>알러지</td>
											<td>2020.06.20</td>
										</tr>
									</table>
									
								</div>
							
								
								
								<div class="row">
									<div class="col-md-12" style="line-height: 30px;">
										<br><br>
										<button type="submit" class="btn">수정하기</button>
										<button type="button" class="btn">삭제하기</button>
										<button type="button" class="btn">보내주기</button>
									</div>
								</div>
						</div>
						
							
							
					</div><!-- end main -->
						
				</div><!-- end content  -->
					
			<!-- 탭들 감싸는 nav-bar -->
			<div class="nav-bar col-md-1" style="margin-top: 15px; padding-left: 0px;">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownermiarymain.action">메 인</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerwalkmatching.action">매 칭</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownerrecordlisttab.action">기 록</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=cp %>/ownergrouptab.action">그 룹</a></li>
					<li class="nav-item"><a class="nav-link active" href="<%=cp %>/ownerstatisticstab.action">통 계</a></li>
					<li class="nav-item" style="background-color: #FFFFFF;"><a class="nav-link" href="<%=cp %>/ownerfriendlist.action">정 보</a></li>
				</ul>
			</div><!--  end nav_bar -->
			</div><!-- end content-wrap  -->

		</div><!-- end container -->
		
		
	<c:import url="Footer.jsp"></c:import>
		
</body>
</html>


