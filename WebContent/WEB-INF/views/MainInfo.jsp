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
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/signup.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
.password 
{
	width: 250px;
}

.check 
{
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.find 
{
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.form-control 
{
	width: 180px;
	height: 25px;
	font-size: 12px;
}

.time 
{
	width: 100px;
}

body 
{
	margin: 0;
	padding: 0;
}
</style>
<script type="text/javascript">
	// DatePicker
	$(document).ready(function()
	{
		// 수정하기 버튼 클릭 시
		$("#updateBtn").click(function()
		{
			
			alert("수정버튼 클릭!");
			
			var pwFlag = "";
			
			// 기존 비밀번호와 	일치하는지 확인
			$.ajax({
				type:'POST',
				data : {beforePwd : $("#beforePwd").val() },
				url: 'pwcheck.action',
				success : function(data)
				{
					pwFlag = $.trim(data);
					
					//alert(pwFlag);
					
					// 기존 비밀번호가 비밀번호와 일치하는지 확인
					if( pwFlag == "correct" )
					{	
						alert("변경비밀번호: " + $("#pwd").val());
						alert("비밀번호확인: " + $("#pwdRe").val());
						
						// 변경 비밀번호와 비밀번호 확인이 일치하는지 확인  $("#pwd").val() != "" && $("#pwdRe").val() != "" &&
						if( $.trim($("#pwd").val()) == $.trim($("#pwdRe").val()) )
						{
							// 최종 폼 제출	
							$("#mainMyInfoForm").submit();
						}
						else
						{
							alert("변경 비밀번호가 일치하지 않습니다")
						}
						
					}
					else
					{
						alert("기존 비밀번호와 일치하지 않습니다.");
						return;
					}
					
				}
				
			}); 
			
			
		});
		
		
		// 데이트 피커
		$('#datePicker').datepicker(
		{
			format : "yyyy-mm-dd", 				//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			startDate : '-10d', 				//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			endDate : '+10d', 					//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			autoclose : true, 					//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			calendarWeeks : false, 				//캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			clearBtn : false, 					//날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			datesDisabled : [ '2019-06-24', '2019-06-26' ],		//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
			daysOfWeekDisabled : [ 0, 6 ], 		//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			daysOfWeekHighlighted : [ 3 ], 		//강조 되어야 하는 요일 설정
			disableTouchKeyboard : false, 		//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			immediateUpdates : false, 			//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
			multidate : false, 					//여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
			multidateSeparator : ",", 			//여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			templates : 
			{
				leftArrow : '&laquo;',
				rightArrow : '&raquo;'
			}, 									//다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			showWeekDays : true,				// 위에 요일 보여주는 옵션 기본값 : true
			title : "테스트", 					//캘린더 상단에 보여주는 타이틀
			todayHighlight : true, 				//오늘 날짜에 하이라이팅 기능 기본값 :false 
			toggleActive : true, 				//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			weekStart : 0,						//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			language : "ko" 					//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		});	//datepicker end
		
		
		// 시도 변경 시 
		$("#addrSel1").change( function()
		{
			// alert("시 도 변경"); -- 테스트
			
			var addrSel1 = $("#addrSel1").val();
			
			//alert(addrSel1);  -- 테스트
			$.ajax(
			{
				type : 'GET',
				data :
				{
					addrSel1 : addrSel1
				},
				url : "getsgglist.action",
				success : function(data)
				{
					
					$("#addrSel2").html(data);
				}
			});// end ajax
			
		});	
		 
		// 시군구 변경시
		$("#addrSel2").change(function()
		{
			// alert("시 도 변경"); -- 테스트
			
			var addrSel2 = $("#addrSel2").val();
			
			//alert(addrSel2);  -- 테스트
			$.ajax(
			{
				type : 'GET',
				data :
				{
					addrSel2 : addrSel2
				},
				url : "getdemlist.action",
				success : function(data)
				{
					
					$("#addrSel3").html(data);
				}
			});// end ajax
			
		});	// end change
		
		
		// 사진 미리보기
		function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function(e) {
		            $('#preview').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		 
		$("#photo").change(function() {
		    readURL(this);
		});
		
		// 본인인증 
		// 본인인증했는지 체크하기 위한 변수 
		var certFlag = 0;
		
		// 전화번호 입력하고 본인인증 버튼 클릭하면 ajax로 전화번호 전송
		$("#certBtn").click(function()
		{
			if( $("#certTel").val()=="" )
			{
				alert("번호를 입력하세요.");
				
				return;
			}
			
			var certTel = $("#certTel").val();
			
			$.ajax({
				
				type:'POST',
				url : 'certTel.action',
				data :
				{
					certTel : certTel
				},
				success : function(data) // 인증번호 받아오기  
				{
					if(data == 0)
					{
						alert("이미 가입된 번호입니다.");
					}
					else
					{
						alert("인증번호가 발송되었습니다.");
					}
					
					$("#certNumBtn").click(function() // 인증번호 확인 버튼 클릭 시 
					{	
						//alert("인증번호 확인 버튼 클릭!");
						//alert(data);  
						
						if( $.trim($("#certNum").val())=="" )
						{
							alert("인증번호를 입력해주세요.");
							
							return;
						
						}
						else if( $.trim(data) == $.trim($("#certNum").val()) ) // 인증번호와 입력받은 번호가 같다면
						{
							alert("본인인증에 성공하였습니다.");
							certFlag = 1;
							
							$("#tel").val(certTel);
							
							return;
						}
						else
						{
							alert("본인인증에 실패하였습니다.");
							
							return;
						}
						
					});
				}
			}); 
			
		}); // end click
		
		
		// 탈퇴하기 버튼 클릭
		$("#exitBtn").click(function()
		{
			var exitConfirm = confirm("정말 탈퇴하시겠습니까?");
			
			if(exitConfirm)
			{
				$(location).attr("href","<%=cp%>/exit.action");
			}
			else
			{
				return;
			}
			
		});
		
	});	//ready end
</script>
</head>
<body>

<div id="header">
	<c:import url="HeaderLogin.jsp"></c:import>
</div>
<br><br>

<div id="innertitle">
<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">
<br><br><br><br><br><br><br><br><br><br>정보수정</span>
<hr>
<br><br>
</div>

<div id="MyInfo" class="container">
<br><br>

<form action="<%=cp %>/updatemainmyinfo.action" method="POST" id="mainMyInfoForm">
	<div class="container" style="text-align: left; line-height: 20px;">
		
		<!-- 사진 -->
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">사진</span>
			</div>
			
			<div class="txt col-sm-5" style="line-height: 30px;">
	            <span style="color: #828282; font-size: 12px; width: 800px;">
	               ※ 가로 150px 세로 150px 크기의 사진을 권장합니다. 5MB 까지 업로드 가능합니다.
	            </span>
                 <br>
               	<div style="width: 150px; height: 150px; overflow: hidden">
                  		<img id="preview" class="preview" src="${user.photo }" style="width: 150px; height: auto;"/>
                </div>
                <input type='file' id="photo" name="photo" class="photo"/>
         	</div>
		</div>
		
		<!-- 아이디 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">아이디</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="text" class="form-control" id="id" name="id" required="required" readonly="readonly"
					value="${user.id }">
			</div>
		</div>

		<!-- 기존 비밀번호 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">기존 비밀번호</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="password" class="form-control" id="beforePwd" name="beforePwd" placeholder="기존 비밀번호를 입력하세요" required="required">
			</div>
		</div>
		
		<!-- 변경할 비밀번호 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">변경 비밀번호</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="password" class="form-control" id="pwd" name="pwd" placeholder="변경 비밀번호를 입력하세요" required="required">
			</div>
		</div>
		
		<!-- 변경할 비밀번호 확인 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">변경 비밀번호 재입력</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="password" class="form-control" id="pwdRe" name="pwdRe" placeholder="변경 비밀번호를 재입력하세요" required="required">
			</div>
		</div>
		
		<!-- 이름 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">이름</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="text" class="form-control" id="name" name="name" required="required"
					value="${user.name }" readonly="readonly">
			</div>
		</div>
		
		<!-- 생년월일 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">생년월일</span>
			</div>
			<div class="col-sm-3" style="line-height: 30px;">
				<input type="text" id="datePicker" class="datePicker form-control"
				 value="${user.birthday }" required="required" readonly="readonly">
			</div>
		</div>
		
		<!-- 주소 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 40px;"></div>
			<div class="col-sm-2" style="line-height: 40px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">주소</span>
			</div>
			
			<!-- 시도 -->
			<div class="txt col-sm-1" style="line-height: 35px;">
				<select name="addrSel1" id="addrSel1" class="txt form-control" style="width: 110px; height: 35px;" >
					<option>시·도 선택</option>
					<c:forEach var="addr" items="${sdList }">
						<c:choose>
							<c:when test="${addr.addrCd1 eq user.addrCd1}">
								<option value="${addr.addrCd1 }" selected="selected">${addr.addr1 }</option>
							</c:when>
							<c:otherwise>
								<option value="${addr.addrCd1 }">${addr.addr1 }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			
			<!-- 시군구 -->
			<div class="txt col-sm-1" style="line-height: 35px;">
				<select name="addrSel2" id="addrSel2" class="txt form-control" style="width: 115px; height: 35px; margin-left: 20px;">
					<option>시·군·구 선택</option>
					<c:forEach var="addr" items="${sggList }">
					<c:choose>
							<c:when test="${addr.addrCd2 eq user.addrCd2}">
								<option value="${addr.addrCd2 }" selected="selected">${addr.addr2 }</option>
							</c:when>
							<c:otherwise>
								<option value="${addr.addrCd2 }">${addr.addr2 }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
 
			<!-- 동읍면 -->
			<div class="txt col-sm-1" style="line-height: 35px;">
				<select name="addrCd3" class="txt form-control" style="width: 115px; height: 35px; margin-left: 20px;">
					<option>동·읍·면 선택</option>
					<c:forEach var="addr" items="${demList }">
					<c:choose>
							<c:when test="${addr.addrCd3 eq user.addrCd3}">
								<option value="${addr.addrCd3 }" selected="selected">${addr.addr3 }</option>
							</c:when>
							<c:otherwise>
								<option value="${addr.addrCd3 }">${addr.addr3 }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
	</div>
 
 		<div class="row txt">
			<div class="con-sm-12" style="line-height: 5px;">
				<span>&nbsp;</span>
			</div>
		</div> 
		
		<!-- 상세주소 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">상세주소</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-8" style="line-height: 30px;">
				<input type="text" class="form-control" id="addrDetail" name="addrDetail" style="width: 400px;"
				 value="${user.addrDetail  }" required="required">
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
		</div>
		
		<!-- 휴대폰 번호 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">휴대폰번호</span>
			</div>
			<div class="col-sm-2" style="line-height: 30px;">
				<input type="tel" class="form-control" id="tel" name="tel"
					value="${user.tel }" required="required" readonly="readonly">
			</div>
		</div>
		
		<!-- 본인인증휴대폰 번호 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">변경 휴대폰번호</span>
			</div>
			<div class="col-sm-2" style="line-height: 30px;">
				<input type="tel" class="form-control" id="certTel" name="certTel"
					placeholder="ex)01012341234">
			</div>
			<div class="col-sm-1" style="line-height: 30px;">
				<input type="button" class="btn btn-xs" id="certBtn" name="certBtn"
				style="height: 28px;" value="본인인증">	
			</div>
		</div>
		
		<!-- 인증 번호 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">인증번호</span>
			</div>
			<div class="col-sm-2" style="line-height: 30px;">
				<input type="tel" class="form-control" id="certNum" name="certNum" placeholder="ex)123456"
					required="required">
			</div>
			<div class="col-sm-1" style="line-height: 30px;">
				<input type="button" class="btn btn-xs" id="certNumBtn" name="certNumBtn" 
				style="height: 28px;" value="확인">	
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">성별</span>
			</div>
			<div class="col-sm-8" style="line-height: 30px;">
				<!-- 여자 -->
				<c:choose>
					<c:when test="${user.gender eq '여자'}">
						<span style="color: #828282; font-size: 15px;">여자</span>
					</c:when>
					
					<c:when test="${user.gender eq '남자'}">
						<span style="color: #828282; font-size: 15px;">남자</span>
					</c:when>
				</c:choose>	
						
			</div>
		</div>
		<br><br>
		
		<!-- 계좌 정보 -->
			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">계좌 정보</span>
				</div>
				
				
				<div class="txt col-sm-1" style="line-height: 28px; padding:0; ">
					<select class="form-control" name="bankCd"
						style="font-size: small; width: 80px; height: 30px; padding:0; margin:0 0 0 15px;">
						<c:forEach var="bank" items="${bankList }">
							<c:choose>
								<c:when test="${bank.bankCd eq user.bankCd }">
									<option value="${bank.bankCd }" selected="selected">${bank.bank }</option>
								</c:when>
								<c:otherwise>
									<option value="${bank.bankCd }">${bank.bank }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<div class="txt col-sm-7" style="margin-right: 8%; padding: 0;">
					<input type="text" class="form-control pull-left" id="accNum" name="accNum"
						style="width: 200px; height: 30px;" value="${user.accNum }"
						required="required">
				</div>
			</div>

			<div class="row txt">
				<div class="col-sm-12" style="line-height: 30px;">
					<span class="pull-left" style="color: #828282; font-size: 12px; width: 600px; margin-left: 7.5%;">
						※ 반드시 예금주가 <span style="color: red;">본인 명의</span>인 계좌를 입력해주세요. 그렇지
						않을 경우 정산시 문제가 발생할 수 있습니다.
					</span>
				</div>
			</div>
		
		
		
		<div class="row">
			<div class="col-sm-12" style="line-height: 30px;" align="right">
				<button type="button" class="btn btn-xs" id="exitBtn">탈퇴하기</button>&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5" style="line-height: 0px;"></div>
			<div class="col-sm-1" style="line-height: 0px;">
				<input type="button" class="btn btn-xs" id="updateBtn" value="수정하기">
			</div>
			<div class="col-sm-3" style="line-height: 0px;"></div>
		</div>
		
		<br><br><br><br>
	</div>

</form>

</div>


<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>

</body>
</html>