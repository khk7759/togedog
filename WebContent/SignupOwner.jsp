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

<!-- 제이쿼리 적용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">

<!-- css 적용 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/signup.css">
<link rel="stylesheet" href="css/Modal.css">


<!-- 부트스트랩 적용  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 제이쿼리 적용 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- js -->
<script src="js/util.js"></script>


<style>
 	body 
	{
 		overflow-x: hidden;
 		margin: 0;
		padding: 0;
		font-family: Handon3gyeopsal600g;
 	}
 
 	#fullBackground 
   	{
     	position: absolute;
      	left: 0px;
      	top: 0px;
      	width: 100%;
      	height: 200%;
      	background-color: black;
      	filter: alpha(opacity = 55);
      	opacity: 0.5;
      	display: none;
      	z-index: 100;
   	}
 
	.pop_bt
	{
		border-radius: 4px;
	}
	
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
	

	/* 데이트피커 */
	label{margin-left: 20px;}
	#datepicker{width:180px; margin: 0 20px 20px 20px;}
	#datepicker > span:hover{cursor: pointer;}
</style>


<script defer type="text/javascript">

	// id, nickName 중복확인 했는지 체크하기 위한 변수
	var idFlag = 0;
	var nickFlag = 0;
	var certFlag = 0;

	$(document).ready(function()
	{
		// 가입하기 버튼 클릭 시 유효성 체크
		$("#joinBtn").click(
		function()
		{
			// 이용약관 동의 유효성 검사 
		    if($("#serviceCheck").prop('checked') == false || $("#personalInfoCheck").prop('checked') == false)
		    {
		       $("#err").html("회원가입약관에 동의해주세요.");
		       $("#err").css("display", "inline");
		    
		       return;
		    }
			   
			// 필수 입력값 검사  
		    if ($("#id").val() == "" || $("#pwd").val() == ""
		            || $("#pwdRe").val() == ""
		            || $("#name").val() == ""
		            || $("#email").val() == "" 
		            || $("#birthday").val() == ""
		            || $("#addrSel3").val() == ""
		            || $("#addrDetail").val() ==""
		            || $("#tel").val() == ""
		            || $("#gender").val() == ""
		      		|| $("#intr").val() == ""
		      		|| $("#question2").val() == ""
		      		|| $("#favStart").val() == ""
		      		|| $("#favEnd").val() == ""
		      		|| $("input[name=day]").val() == ""
		    ){
		         $("#err").html("필수 입력 항목이 누락되었습니다.");
		         $("#err").css("display", "inline");
		  
		         return;
		    }
		      
		    // 아이디 유효성 검사(5~10 자리 이내로 입력해주세요)
		    //-- 왜 안돼 
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
		      
		   // 닉네임 중복확인 했는지 검사
		   if( $("#nickName").val()!="" && nickFlag == 0 )
		   {
				$("#err").html("닉네임 중복검사를 해주세요.");
		    	$("#err").css("display","inline");
		    	
		    	return;
		   }
		   
		   // 본인인증 했는지 검사
		   if(certFlag == 0)
		   {
			   $("#err").html("본인인증을 해주세요.");
			   $("#err").css("display","inline");
		   }
		   
		   // 선호산책시간 맞게 입력했는지 검사 
		   if( $("favStart").val() >= $("#favEnd").val() )
		   { 
			   $("#err").html("선호 산책시간을 확인해주세요.");
			   $("#err").css("display", "inline");
			   
			   return;
		   }
		      
		   // 최종 submit
		   $("#addOwnForm").submit();

		}); // end Click

		
		
		// 선호산책시간 검사
		$("#favStart").change(function()
		{
			//alert("시작시간 변경!"+ $("#favStart").val() + $("#favEnd").val());
			
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
			
			//alert("본인인증 버튼 클릭!");
			
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
					
					$("#certNumBtn").click(function() // 인증번호 확인 버튼 클릭 시 
					{	
						//alert("인증번호 확인 버튼 클릭!");
						//alert(data);  
						
						if( $.trim($("#certNum").val())=="" )
						{
							alert("인증번호를 입력해주세요.");
						}
						else if( $.trim(data) == $.trim($("#certNum").val()) ) // 인증번호와 입력받은 번호가 같다면
						{
							alert("본인인증 성공");
							certFlag = 1;
						}
						else
						{
							alert("본인인증 실패");
						}
						
					});
				}
			}); 
			
		}); // end click
			
		
	
	}); /* end ready */
	
	
	


	
</script>
</head>
<body>
	<div id=""></div>

	<div id="header">
		<c:import url="HeaderLogin.jsp"></c:import>
	</div>

	<div id="signupStepsFirst">
		<div id="row">
			<span style="line-height: 50px;">&nbsp;</span>
		</div>
		<span
			style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">회원가입</span>
		<hr>
		<br> <br>

		<!-- ① 휴대폰 본인인증 -->
		<img src="images/Step2.png" alt="step2"> <span
			style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">휴대폰
			본인인증</span> <br> <br> <span
			style="text-align: center; font-size: 13px; color: #828282;">본인
			확인 및 중복가입 방지를 위해 휴대폰 본인인증을 진행합니다.</span> <br> <br> <br>

		<!-- 휴대폰번호 입력폼 -->
		<div class="container"
			style="width: 200px; height: 80px; background-color: #F0F0F0; border: 1px solid gray; border-radius: 5px;">
			<div class="row">
				<div class="col-12" style="text-align: center;">
					<div class="col-sm-4 col-12"></div>
					<div class="col-sm-12">
						<span style="color: #828282; font-size: 14px; font-weight: bold;">휴대폰번호</span><br>
						<br>
					</div>
				</div>
			</div>

			<input type="tel" id="certTel" name="certTel" class="form-control" placeholder="ex) 01012341234"
				required="required" style="width: 170px;"><br> <br>
		</div>
	</div>
	<button type="button" class="btn" id="certBtn" 
	name="certBtn" style="width: 205px; height: 37px; font-size: 13px; margin-top: 20px;">
		본인인증하기</button>
	
	<!-- 인증번호 입력하기 -->	
	<div class="container"
			style="width: 200px; height: 80px; margin-top:20px; background-color: #F0F0F0; border: 1px solid gray; border-radius: 5px;">
			<div class="row">
				<div class="col-12" style="text-align: center;">
					<div class="col-sm-4 col-12"></div>
					<div class="col-sm-12">
						<span style="color: #828282; font-size: 14px; font-weight: bold;">인증번호</span><br>
						<br>
					</div>
				</div>
			</div>

			<input type="tel" id="certNum" name="certNum" class="form-control" placeholder="ex) 123456"
				required="required" style="width: 170px;"><br> <br>
		</div>

	<button type="button" class="btn" id="certNumBtn" 
	name="certNumBtn" style="width: 205px; height: 37px; margin-top: 20px; font-size: 13px;">
		확인</button>	
	<br>
	<br>
	<br>
	<hr>
	<br>
	<br>

	<!-- ② 이용약관 안내 -->
	<img src="images/Step3.png" alt="step3">
	<span
		style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">이용약관
		안내</span>
	<br>
	<br>
	
	<label for="box1">
	<input type="checkbox" id="allBox" required="required">
	<span
		style="color: #828282; text-decoration: underline; font-size: 13px;">서비스
			이용약관(필수), 개인정보 취급 방침(필수)에 모두 동의합니다.</span></label>
	<br>
	<br>

	<div class="col-md-6" style="margin-right: 70%;">
		 <label for="box2">
		 <input type="checkbox" id="serviceCheck" name="box" required="required">
		 <span
			style="color: #828282; font-size: 14px;">투게도그 서비스 이용약관 동의</span>
			&nbsp;<span
			style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span></label>
	</div>
	<br>

	<div class="col-sm-12" id="scrollbox" align="center">
		<div
			style="overflow-y: scroll; width: 1000px; height: 150px; padding: 4px; border: 1px solid #ADADAD;">
			<!-- 약관내용 -->
			<c:import url="agree1.jsp"></c:import>
		</div>
		<br>
	</div>


	<br>

	<div class="col-md-4" style="margin-left: 7%; padding: 0px;">
	 <label for="box3">
	 <input type="checkbox" id="personalInfoCheck" name="box" required="required">
	 <span
			style="color: #828282; font-size: 14px;">개인정보 취급 방침 동의</span> &nbsp;<span
			style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span></label>
	</div>
	<div class="col-sm-12" id="scrollbox" align="center" style="margin-bottom: 60px;">
		<div style="overflow-y: scroll; width: 1000px; height: 150px; padding: 4px; border: 1px solid #ADADAD;">
			<!-- 약관내용 -->
			<c:import url="agree2.jsp"></c:import>
		</div>
		<br>
	</div>
	<br>
	<br>
	<hr>
	<br>
	<br>
	
	
	<div style="margin-top: 20px;">
		<img src="images/Step4.png" alt="step4">
		<span style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">견주
			가입정보 입력</span>
	</div>
	<form action="<%=cp%>/ownsignup.action" method="POST" id="addOwnForm">		
		
		<div id="signupStepsCommon" class="container">
<br><br>

	<div class="container" style="text-align: left; line-height: 20px; margin-left: 6%;">
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
                  		<img id="preview" class="preview" src="#" style="width: 150px; height: auto;"/>
                </div>
                <input type='file' id="photo" name="photo" class="photo"/>
         	</div>
			
			
		</div>
		
		
		<!-- 아이디 -->
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">아이디</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-3" style="line-height: 30px;">
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required="required">
			</div>
			<div class="col-sm-2">
				<button type="button" class="btn check" id="idcheck" name="idcheck">중복확인</button>
			</div>
			<div class="errMsg" id="idMsg"></div>
			
		</div>

		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">비밀번호</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-3" style="line-height: 30px;">
				<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" required="required">
			</div>
		</div>
		
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">비밀번호 재입력</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-3" style="line-height: 30px;">
				<input type="password" class="form-control" id="pwdRe" name="pwdRe" placeholder="비밀번호를 재입력하세요" required="required">
			</div>
		</div>
		
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">이름</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-3" style="line-height: 30px;">
				<input type="text" class="form-control" id="name" name="name" placeholder="이름" required="required">
			</div>
		</div>
		
		<!-- 생년월일 -->
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">생년월일</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			
			<input type="text" id="birthday" name="birthday" class="datepicker form-control col-sm-3" value="YYYY-MM-DD"
			 style="line-height: 30px; margin-top: 5px; margin-left: 15px; required="required" readonly="readonly">
		</div>
		
		<!-- 이메일 -->
		<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">이메일</span>
					<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
				</div>
				<div>
					<div class="txt col-sm-1" style="padding: 0;">
						<input type="text" class="form-control" id="" name="email1"
							style="width: 100px; height: 30px; margin-left:15px; display: inline-block;" placeholder="이메일"
							required="required" > 
						
					</div>
					<div class="txt col-sm-4" style="line-height: 28px; padding:0; ">
						<select class="form-control pull-left " name="email2"
							style="font-size: small; width: 120px; height: 30px; padding:0; margin:0 0 0 25px;
							display: inline-block;">
							<option value="@naver.com">naver.com</option>
							<option value="@gmail.com">gmail.com</option>
							<option value="@hanmail.net">hanmail.com</option>
						</select>
					</div>
				</div>
			</div>
		
		<!-- 주소 -->
		<div class="row">
			<div class="col-sm-1" style="line-height: 40px;"></div>
			<div class="col-sm-2" style="line-height: 40px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">주소</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-1" style="line-height: 35px;">
				<select name="addrSel1" id="addrSel1" class="txt form-control" style="width: 110px; height: 35px;" required="required">
					<option>시·도 선택</option>
					<c:forEach var="addr1" items="${sdList }">
						<option value="${addr1.addrCd1 }">${addr1.addr1 }</option>
					</c:forEach>
				</select>
			</div>
			<div class="txt col-sm-1" style="line-height: 35px;">
				<select name="addrSel2" id="addrSel2" class="txt form-control" style="width: 115px; height: 35px; margin-left: 20px;">
					<option>시·군·구 선택</option>
					<!-- AJAX 처리 -->
				</select>
			</div>
			<div class="txt col-sm-2" style="line-height: 35px;">
				<select name="addrSel3" id="addrSel3" class="txt form-control" style="width: 115px; height: 35px; margin-left: 45px;">
					<option>동·읍·면 선택</option>
					<!-- AJAX 처리 -->
				</select>
			</div>
		</div>

		<div class="row txt">
			<div class="con-sm-12" style="line-height: 5px;">
				<span>&nbsp;</span>
			</div>
		</div> 
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">상세주소</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-sm-8" style="line-height: 30px; margin-top: 2px;">
				<input type="text" class="form-control" id="addrDetail" name="addrDetail" style="width: 400px;" required="required">
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
		</div>

		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">휴대폰번호</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-8" style="line-height: 30px;">
				<input type="tel" class="form-control" id="tel" name="tel" placeholder="ex) 010-1234-1234" data-validation="number" data-validation-allowing="negative,number" input name="color"
					data-validation="number" datavalidation-ignore="$" required="required">
			</div>
			<div class="col-sm-1" style="line-height: 30px;"></div>
		</div>
		
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">성별</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-sm-8" style="line-height: 30px;">
				<label><input type="radio" id="gender1" name="gender" value="GT1" checked="checked">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">여성</span></label>
				&nbsp;&nbsp;
				<label><input type="radio" id="gender2" name="gender" value="GT2">&nbsp;<span style="color: #828282; font-size: 15px; font-weight: bold;">남성</span></label>
			</div>
		</div>
		
		
		
		
	</div>
	
	
</div>
		
		
 		
		<div id="signupStepsOwner" class="container" style="margin-left: 17%;">
			
			<div class="row txt">
				<div class="col-sm-1" style="line-height: 35px;"></div>
				<div class="col-sm-2" style="line-height: 35px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">관심사</span> <span
						style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
				</div>
				<div class="col-sm-2" style="line-height: 35px;">
					<select class="form-control" id="intr" name="intr"
						style="font-size: small; width: 150px; height: 35px;"
						required="required">
						<c:forEach var="intr" items="${intrList }">
							<option value="${intr.intrCd }">${intr.intr }</option>
						</c:forEach>
					</select>

					<!-- <select class="form-control" id="intr" name="intr"
						style="font-size: small; width: 150px; height: 28px;"
						required="required">
						<option value="1">관심사 선택</option>
						<option value="2">음악</option>
						<option value="3">영화</option>
						<option value="4">관광</option>
						<option value="5">언어</option>
						<option value="6">쇼핑</option>
					</select> -->
				</div>
				<br>

			</div>

			<!-- 상세 관심사 -->
			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">상세 관심사</span>
				</div>
				<div class="txt col-sm-3" style="line-height: 30px;">
					<input type="text" class="form-control" id="intrDetail"
						name="intrDetail" placeholder="상세관심사를 입력하세요"
						onkeyup="onlyHangul()">
				</div>
			</div>

			<!-- 닉네임 -->
			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">닉네임</span>
				</div>
				<div class="txt col-sm-3" style="line-height: 30px;">
					<input type="text" class="form-control" id="nickName"
						name="nickName" placeholder="닉네임을 입력하세요">
				</div>
				<div class="col-sm-1">
					<button type="button" class="btn check" id="nickCheck"
						name="nickCheck">중복확인</button>
				</div>
			</div>

			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">선호 산책요일</span>
					<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
				</div>
				
				<div class="txt col-sm-6" style="line-height: 30px; margin-left: 1%; padding: 0;" align="left">
				
				<!-- 요일 -->
					<label><input type="radio" value="DI1" name="day"
						value="1">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">월</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI2" name="day"
						 value="2">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">화</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI3" name="day"
						 value="3">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">수</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI4" name="day"
						 value="4">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">목</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI5" name="day"
						 value="5">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">금</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI6" name="day"
						 value="6">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">토</span></label>
					&nbsp;&nbsp; <label><input type="radio" value="DI7" name="day"
						 value="0">&nbsp;<span
						style="color: #828282; font-size: 15px; font-weight: bold;">일</span></label>
					&nbsp;&nbsp; <br>
				</div>
			</div>
			
			<!-- 선호시간 -->
			<div class="row">
				<div class="col-sm-1" style="line-height: 35px;"></div>
				<div class="col-sm-2" style="line-height: 35px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">선호 산책시간</span>
					<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
				</div>
				
				<div class="txt col-sm-5" style="line-height: 28px;">
					<select class="form-control" id="favStart" name="favStart"
						style="font-size: small; width: 150px; height: 35px;"> 
							<c:forEach var="i" begin="6" end="23">
								<option value="${i }">${i }:00</option>
							</c:forEach>
					</select>
					
					<select class="txt form-control" id="favEnd" name="favEnd"
						style="font-size: small; width: 150px; height: 35px;"> 
							<c:forEach var="i" begin="6" end="23">
								<option value="${i }">${i }:00</option>
							</c:forEach>
					</select>
					
				<!-- 	<input type="text" id="favStart" name="favStart" class="timepicker form-control col-sm-3"
					 style="line-height: 30px; margin-top: 5px; required="required">
			 		
					<input type="text" id="favEnd" name="favEnd" class="timepicker form-control col-sm-3"
			 		 style="line-height: 30px; margin-top: 5px; margin-left: 5px; required="required"> -->
					<div class="col-sm-4" id="timeErr" style="color: #F25C69; width: 200px;"></div><br>
				</div>
				
			</div>


			<!-- 계좌 정보 -->
			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">환불 계좌 정보</span>
				</div>
				
				
				<div class="txt col-sm-1" style="line-height: 28px; padding:0; ">
					<select class="form-control" name="bankCd"
						style="font-size: small; width: 80px; height: 30px; padding:0; margin:0 0 0 15px;">
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
						style="width: 200px; height: 30px;" placeholder="-없이 계좌번호 입력"
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

			<div class="row txt">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-2" style="line-height: 30px; text-align: left;">
					<span style="color: #828282; font-size: 15px;">추천인</span>
				</div>
				<div class="col-sm-3" style="line-height: 30px;">
					<input type="text" class="form-control" id="recId" name="recId"
						placeholder="추천인 아이디를 입력하세요">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn check" id="recIdcheck"
						name="recIdcheck">회원확인</button>
				</div>
			</div>
			
		<div class="col-md-9" style="margin-right:50%; margin-top:20px;" >
			<div id="err" style="color: #F25C69;"></div><br>
			<button type="button" id="joinBtn" class="btn btn-md" style=" font-size: 14px; margin-top: 30px;"
			>가입하기</button>
		</div>
	
	</div>
		<!-- end container -->
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div id="footer">
		<c:import url="FooterWeb.jsp"></c:import>
	</div>
	
	
</body>
</html>