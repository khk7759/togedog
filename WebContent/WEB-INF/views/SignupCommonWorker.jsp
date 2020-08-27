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
<title>SignupCommonWorker.jsp</title>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">

<!-- 제이쿼리 적용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!--  푸쉬-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">




<link rel="stylesheet" type="text/css" href="css/signup.css">

<style type="text/css">

/* 데이트피커 */
label{margin-left: 20px;}
#datepicker{width:180px; margin: 0 20px 20px 20px;}
#datepicker > span:hover{cursor: pointer;}


/* body {overflow-x: hidden;} */

.txt
{
	margin-top: 5px;
}


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

textarea 
{
	resize: none;	
}

</style>



<script defer type="text/javascript">

	//id 중복확인 했는지 체크하기 위한 변수
	var idFlag = 0;
	
	// 본인인증했는지 체크하기 위한 변수 
	var certFlag = 0;

	$(document).ready(function()
	{
		$("#timeErr").css("display","none");
		
		// 가입하기 버튼 클릭 시 유효성 체크
		$("#joinBtn").click(
		function()
		{
			//alert("가입버튼");
			
			// 이용약관 동의 유효성 검사 
		    if($("#serviceCheck").prop('checked') == false || $("#personalInfoCheck").prop('checked') == false)
		    {
		       $("#err").html("회원가입약관에 동의해주세요.");
		       $("#err").css("display", "inline");
		    
		       return;
		    }
			   
			// 필수 입력값 검사  
    		if ( $("#id").val() == "" || $("#pwd").val() == ""
              	|| $("#pwdRe").val() == ""
               	|| $("#name").val() == ""
               	|| $("#email").val() == "" 
                || $("#birthday").val() == ""
                || $("#addrSel3").val() == ""
                || $("#addrDetail").val() ==""
                || $("#gender").val() == ""
                
	    		|| $("#question1").val() == ""
	    		|| $("#question2").val() == ""
                || $("#accNum").val() == ""
	      		|| workdays.length == 0
	      		
		   ){
		         $("#err").html("필수 입력 항목이 누락되었습니다.");
		         $("#err").css("display", "inline");
		  
		         return;
		    }
		  
    		// 아이디 유효성 검사(5~10 자리 이내로 입력해주세요)
    		if(id.length < 5 || id.length > 10)
    		{
    			$("#err").html("아이디는 5자리 ~ 10자리 이내로 입력해주세요.");
    			$("#err").css("display", "inline");
    			 
    			return;
    		}
    	      
    	    // 비밀번호 유효성 검사 
    	    //영문,숫자,특수문자 중 2가지 혼합 (영문,숫자 = 통과) (특문,숫자 = 통과) 비밀번호 10~20자리
    	    var pwd = $("#pwd").val();
    	    var num = pwd.search(/[0-9]/g);
    	    var eng = pwd.search(/[a-z]/ig);
    	    var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    	    if(pwd.length < 10 || pwd.length > 20)
    	    {
    	       //alert("10자리 ~ 20자리 이내로 입력해주세요.");
    	       $("#err").html("패스워드는 10자리 ~ 20자리 이내로 입력해주세요.");
    	       $("#err").css("display", "inline");
    	    
    	       return;
    	    }
    	    else if(pwd.search(/\s/) != -1)
    	    {
    	       //alert("비밀번호는 공백 없이 입력해주세요.");
    	       $("#err").html("패스워드는 공백 없이 입력해주세요.");
    	       $("#err").css("display", "inline");
    	       
    	       return;
    	    }
    	    else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) )
    	    {
    	       //alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
    	       $("#err").html("패스워드는 영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
    	       $("#err").css("display", "inline");

    	       return;
    	    }
    	      
    	    // 비밀번호와 비밀번호 확인이 동일한지 검사 
    	    if( $("#pwd").val() != $("#pwdRe").val() )
    	    {
    	    	$("#err").html("비밀번호가 일치하지 않습니다.");
    	    	$("#err").css("display","inline");
    	    	  
    	    	return;
    	    }
    	      
    	   // 아이디 중복확인 했는지 검사
    	   if(idFlag == 0 )
    	   {
    			$("#err").html("아이디 중복검사를 해주세요.");
    	    	$("#err").css("display","inline");
    	   		
    	    	return;
    	   }	
		    
		   // 본인인증 했는지 검사
		   if(certFlag == 0)
		   {
			   $("#err").html("본인인증을 해주세요.");
			   $("#err").css("display","inline");
		   }
		   
		   // 근무시간 맞게 입력했는지 검사 
		   if( $("favStart").val() >= $("#favEnd").val() )
		   { 
			   $("#err").html("근무시간을 확인해주세요.");
			   $("#err").css("display", "inline");
			   
			   return;
		   }
		   
		   // 최종 submit
		   $("#addWokForm").submit();
			
		   // 근무요일 및 시간 전송 테스트 
		   /*
		   var form = $("#addWokForm").serialize();
		   alert(form);
			
			// ajax 로 폼과 배열 전송
			$.ajax({
				type: 'POST',
				url : 'addWorker.action',
				tranditional : true,
				async : true,
				data : 
				{
					workdays : workdays, form: form
					
				},
				dataType: 'json'
				
			});
			*/
		
		}); // end Click

		
		
		// 근무시간 변경시 유효성 검사
		$("#favStart").change(function()
		{
			//alert("시작시간 변경!"+ $("#favStart").val() +"/"+ $("#favEnd").val());
			if($("#favStart").val() >= $("#favEnd").val())
			{
				$("#timeErr").html("시간을 확인해주세요.");
		    	$("#timeErr").css("display","inline");
			}
			else
			{
				$("#timeErr").css("display","none");
			}
		});
		
		$("#favEnd").change(function()
		{
			//alert("끝시간 변경!"+ $("#favStart").val() +"/"+ $("#favEnd").val());
			 
			if($("#favStart").val() >= $("#favEnd").val())
			{
				$("#timeErr").html("시간을 확인해주세요.");
		    	$("#timeErr").css("display","inline");			
			}
			else
			{
				$("#timeErr").css("display","none");
			}
		});

		// 아이디 중복체크 클릭 시 
		$("#idcheck").click(function()
		{
			if (!$("#id").val())
			{
				alert("아이디를 입력해주세요");

				return false;
			}

			$.ajax(
			{
				type : 'GET',
				data :
				{
					id : $("#id").val()
				},
				url : "idCheck.action",
				success : function(data)
				{
					if (data > 0)
					{
						alert("사용 불가능한 아이디입니다.");
						$("#id").val("");
						$("#id").focus();

					} else
					{
						alert("사용 가능한 아이디입니다.");
						$("#pwd").focus();
						
						idFlag = 1;
					}
				},
				/* 에러 확인용 */
				error : function(request, status, error)
				{
					alert("code:" + request.status + "\n"
							+ "message:" + request.responseText
							+ "\n" + "error:" + error);
				}
			})

		}); /* end 아이디 중복체크 */

		
		
		//닉네임 중복체크 클릭 시 
		$("#nickCheck").click(function()
		{
			if (!$("#nickName").val())
			{
				alert("닉네임을 입력해주세요");

				return false;
			}

			$.ajax(
			{
				type : "GET",
				data :
				{
					nickName : $("#nickName").val()
				},
				url : "nickCheck.action",
				success : function(data)
				{
					if (data > 0)
					{
						alert("사용 불가능한 닉네임입니다.");
						$("#nickName").val("");
						$("#nickName").focus();

					} else
					{
						alert("사용 가능한 닉네임입니다.");
						nickFlag = 1;
					}
				}

			});
		});/* end nickCheck */

	

		//데이트피커
		$(".datepicker").datepicker({

			dateFormat: 'yy-mm-dd' //Input Display Format 변경
		    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		    ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		    ,changeYear: true //콤보박스에서 년 선택 가능
		    ,changeMonth: true //콤보박스에서 월 선택 가능                
		    //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		    //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
		    //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		    //,buttonText: "생년월일" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		    ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		    ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		    ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		    ,maxDate: "+0D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)    
			, yearRange: 'c-100:c+0', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		});                    

		//초기값을 오늘 날짜로 설정
		$('.datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            


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
						
						if( $.trim(data) == $.trim($("#certNum").val()) ) // 인증번호와 입력받은 번호가 같다면
						{
							alert("본인인증에 성공하였습니다.");
							certFlag = 1;
							
							$("#tel").val(certTel);
							
							return;
						}
						else if( $.trim(data) != $.trim($("#certNum").val()) )
						{
							alert("본인인증에 실패하였습니다.");
							
							return;
						}
						
					});
				}
			}); 
			
		}); // end click
	
		// 약관 모두선택 or 해제 체크박스
		$("#allBox").click(function()
		{ //클릭되었으면

			if ($("#allBox").prop("checked"))
			{
				//input태그의 name이 box인 태그 checked옵션을 true로 정의
				$("input[name=box]").prop("checked", true);
			} else
			//클릭이 안되어있으면
			{
				//input태그의 name이 box인 태그 checked옵션을 false로 정의
				$("input[name=box]").prop("checked", false);
			}
		});
		
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
			
		});	
		
	}); /* end ready */
	
	// 근무요일 및 시간담는 객체 workday 를 저장할 배열 전역변수선언
	var workdays = [];
	
	// ajax 데이터 저장하고 있을 변수
	var selWorkday = "";
	
	// 근무요일 및 시간 추가하기 버튼 클릭 시 
	function addWorkdays()
	{
		//alert("추가하기 버튼 클릭!");
		
		// 객체 생성 
		var workday = 
		{  dayCd : $("#dayCd").val()
		 , favStart : $("#favStart").val()
		 , favEnd : $("#favEnd").val()
		};

		
		// 배열에 객체 추가  
		workdays.push(workday);
		//alert(workdays.length);
		
		//alert($("#dayCd").val());
		//alert($("#favStart").val());
		//alert($("#favEnd").val());
		
				
		// 선택한 요일 및 시간이 사용자에게 보이도록 ajax 처리
		$.ajax({
			type: 'POST',
			data :
			{	dayCd : $("#dayCd").val()
				, favStart : $("#favStart").val()
				, favEnd : $("#favEnd").val()
			},
			url: "addWorkdays.action",
			success : function(data)
			{
				selWorkday += data;
				
				//alert(selWorkday);
				
				$("#workdays").html(selWorkday);
				
				
			}
		});
		
	}
	
	
</script>
</head>
<body>
<div id="header">
	<c:import url="HeaderLogin.jsp"></c:import>
</div>


	<!-- 회원가입 -->
	<div id="row">
		<span style="line-height: 50px;">&nbsp;</span>
	</div>
	<span
		style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">회원가입</span>
	<hr>
	<br>
	<br>


<div id="signupStepsWalker" class="container">
<br><br>

<!-- 워커신청요건 확인 -->
<img src="images/dogfoot.png" style="height: 30px; width: 30px;" alt="dogfoot">
<span style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">신청 요건 확인</span>
<br><br>
<span style="text-align: center; font-size: 13px; color: #828282;">투게도그는 서비스 신뢰도 확보를 위하여 전문 펫워커 신청자들에 한해 다음과 같은 <span style="color: #75C3F8; font-size: 16px; font-weight: bold;">필수 자격</span>을 확인받고 있습니다.</span>
<br><br>
	<div class="container" style="width: 450px; height: 160px; text-align: left; background-color: #F0F0F0;">
		<span style="color: red; font-weight: bold; font-size: 13px;">
			<br>
			* 강아지를 사랑하시는 분<br>
			* 최소 6개월 이상 근무 가능하신 분<br>
			* 반려동물 양육 경험이 3년 이상이신 분<br>
			* 비흡연자<br>
			* 만 20세 이상이신 분<br>
			* 강력범죄, 절도, 재물손괴, 성범죄 등의 전과 사실이 없는 분<br>
		</span>
	</div>
	<br>
	<input type="checkbox" id="box1"><label for="box1">
	&nbsp;<span style="color: #828282; text-decoration: underline; font-size: 13px;">신청자 본인은 펫워커 <span style="color: #75C3F8; font-size: 16px; font-weight: bold;">필수</span> 신청 요건에 모두 해당함을 확인하였습니다.</span></label>
	<br>
	<div class="container" style="width: 470px; height: 25px; line-height: 12px; text-align: left;">
		<span style="color: #828282; font-size: 11px;">
			※ 추후 허위나 거짓 요건임이 밝혀질 시 서비스 이용에 강력한 불이익이 있을 수 있습니다.<br>
			※ 사실과 다른 확인임이 밝혀질 시 책임은 신청자 본인에게 있습니다.
		</span>
	</div>
	<br><br>
	<div class="container" style="width: 500px; height: 150px; line-height: 15px; text-align: left;">
		<span style="color: #828282; font-size: 13px; font-weight: bold;">※ 우대 자격</span><br><br>
		<span style="color: #828282; font-size: 12px;">
			- 다양한 강아지 핸들링 유경험자 <br>
			   : 대형견 혹은 문제견 케어 가능, 5개월 미만 강아지 혹은 15세 이상 노령견 케어 경험<br>
			- 장애견 간호 가능자<br>
			- 자차 보유자 (차량 이동 가능)<br>
			- 반려동물 관련 자격증 보유자<br>
			- 동물병원 혹은 애견호텔 등 관련업종 근무 경험<br>
			- 펫시터 등 동종업계 활동 경험<br>
		</span>
</div>
<br><br>
</div><!-- 워커신청요건 끝 -->
<hr>


	

	<!-- 가입공통 -->
	<c:import url="SignupCommon.jsp"></c:import>

	<!-- 워커신청 정보 등록 -->	
	<div class="container" style="text-align: left; line-height: 20px; margin-left:21%; padding:0;">
		<!-- 직업 등록 -->
		<div class="txt row">
			<div class="col-sm-1" style="line-height: 35px;"></div>
			<div class="col-sm-2" style="line-height: 35px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">직업</span>
			</div>
			<div class="col-sm-8" style="line-height: 35px; padding: 0px; margin-left: 7px;">
				<select class="form-control" id="jobCd" name="jobCd" style="font-size: small; width: 200px; height: 35px;">
					<c:forEach var="dto" items="${jobList }">
						<option value="${dto.jobCd }">${dto.jobItem }</option>
					</c:forEach>
				</select>
			</div>
		</div>
	
		<!-- 자격증 등록 -->
		<div class="txt row">
			<div class="col-sm-1" style="line-height: 35px;"></div>
			<div class="col-sm-2" style="line-height: 35px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">반려동물 관련 자격증</span>
			</div>
			<div class="txt col-sm-8" style="line-height: 35px; padding:0px; margin-left: 7px; ">
				<select class="form-control" id="crtList" name="crtList" multiple="multiple" style="font-size: small; width: 200px; height: 120px;">
					<c:forEach var="dto" items="${crtList }">
						<option value="${dto.crtCd }">${dto.crtItem }</option>
					</c:forEach>
				</select>
			</div>
		</div>
	
	
	<!-- 선호 근무시간, 요일 -->
	<div class="row txt">
		<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">근무요일 및 시간</span> 
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			
			<div class="row">
			
			
			<div class="txt col-sm-8" style="padding: 0;">
					<!-- 요일 -->
					<select class="form-control" id="dayCd" name="dayCd"
						style="font-size: small; width: 80px; height: 30px; display: inline-block">
						<c:forEach var="day" items="${dayList }">
							<option value="${day.dayCd }">${day.day }</option>
						</c:forEach>
					</select>
					
					<!-- 시작시간 -->
					<select class="form-control" id="favStart" name="favStart" class="favStart"
						style="font-size: small; width: 120px; height: 30px; display: inline-block">
						<c:forEach var="i" begin="6" end="23">
							<option value="${i }">${i }:00</option>
						</c:forEach>
					</select>
					 
					<!-- 끝시간 -->
					<select class="txt form-control" id="favEnd" name="favEnd" class="favEnd"
						style="font-size: small; width: 120px; height: 30px; display: inline-block;">
						<c:forEach var="i" begin="6" end="23">
							<option value="${i }">${i }:00</option>
						</c:forEach>
					</select>
					
					<input type="button" id="workdayBtn" onclick="addWorkdays()" class="btn btn-xs" value="추가하기">
					
					<!-- 에러메세지 -->
					<div class="row" id="timeErr" style="color: #F25C69; width: 200px; margin-left: 50%;"></div><br>	
					
					<!-- 추가되는 공간 -->
					<div class="row" style="margin-top: 5px; margin-left: 5px;">
						<table id="workdays" style="text-align: center; font-weight: normal;"></table>
					</div>
					
			</div>
			
		
</div>

		<!-- 계좌 정보 -->
			<div class="row txt" style="margin-left: -5px;">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px;">
					<span style="color: #828282; font-size: 15px;">정산 계좌 정보</span>
					<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span><br>
				</div>
				
				
				<div class="txt col-sm-1" style="line-height: 28px; padding:0; ">
					<select class="form-control" name="bankCd"
						style="font-size: small; width: 80px; height: 30px; text-align: center; padding:0; margin:0 0 0 8px;">
						<c:forEach var="bank" items="${bankList }">
							<option value="${bank.bankCd }">${bank.bank }</option>
						</c:forEach>
					</select>

					<!-- <select class="form-control" name="bank"
						style="font-size: small; width: 120px; height: 30px;">
						<option value="1">입금은행</option>
						<option value="2">국민은행</option>
						<option value="3">기업은행</option>
						<option value="4">우리은행</option>
					</select> -->
				</div>
				<div class="txt col-sm-7" style="margin-right: 8%; padding: 0;">
					<input type="text" class="form-control pull-left" id="accNum" name="accNum"
						style="width: 200px; height: 30px;" placeholder="-없이 계좌번호 입력">
				</div>
			</div>

			<div class="row txt">
				<div class="col-sm-12" style="line-height: 30px;">
					<span class="pull-left" style="color: #828282; font-size: 12px; width: 600px; margin-left: 8%;">
						※ 반드시 예금주가 <span style="color: red;">본인 명의</span>인 계좌를 입력해주세요. 그렇지
						않을 경우 정산 시 문제가 발생할 수 있습니다.
					</span>
				</div>
			</div>


		<!-- 주관식 문답 -->
		<div class="txt row" style="margin-top: 15px;">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">주관식 문답</span>
				
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-11" style="line-height: 30px;">
				
				<!-- 경력사항 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">1) 경력사항을 작성해주세요.</span>
				<textarea class="form-control" name="careerName" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)" ></textarea>
				<br>
				<!-- 양육경험 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">2) 양육경험을 작성해주세요.</span>
				<textarea class="form-control" name="nurtureExp" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)" ></textarea>
				<br>
				<!-- 질문1 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">3) 펫워커 활동 중 강아지가 경계하거나 이빨을 보이며 공격하려 하는 경우 어떻게 대처하시겠습니까?</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span><br>
				<textarea class="form-control" name="question1" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)" ></textarea>
				<br>
				<!-- 질문2 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">4) 강아지와 산책할 때 가장 중요하게 생각하는 부분에 대해 작성해주세요.</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span><br>
				<textarea class="form-control" name="question2" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)"></textarea>
				<br>
				<!-- 신청메세지 -->
				<span  style="color: #828282; font-size: 14px; font-weight: bold;">5) 자유롭게 워커 신청 메세지를 작성해주세요.</span>
				<textarea class="form-control" name="msg" rows="10" cols="50" style="width: 800px; height: 100px;" placeholder="내용을 입력하세요(1000자 이내)"></textarea>
				
			</div>
		</div>
	</div>


</div>	
	
	<div style="margin: 3% 0 7% 5%" >
		<div id="err" style="color: #F25C69;"></div><br>
		<button type="button" id="joinBtn" class="btn btn-s" style=" font-size: 14px; margin-top: 30px;"
		>신청하기</button>
	</div>
 </div>
</form>
<br>
<div id="footer">
	<c:import url="FooterWeb.jsp"></c:import>
</div>
</body>
</html>