// 공통 회원가입 js

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
   
}); // end click


//시도 변경 시 
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
					
					return;
				
				}
				else if( $.trim(data) == $.trim($("#certNum").val()) ) // 인증번호와 입력받은 번호가 같다면
				{
					alert("본인인증 성공");
					certFlag = 1;
					
					return;
				}
				else
				{
					alert("본인인증 실패");
					
					return;
				}
				
			});
		}
	}); 
	
}); // end click


		}); /* end ready */