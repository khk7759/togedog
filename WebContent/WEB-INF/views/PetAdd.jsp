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
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/signup.css">

<!-- 부트스트랩 적용  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<!-- 제이쿼리 적용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- js -->
<script type="text/javascript" src="js/util.js"></script>

<style type="text/css">
/* 데이트피커 */
label{margin-left: 20px;}
#datepicker{width:180px; margin: 0 20px 20px 20px;}
#datepicker > span:hover{cursor: pointer;}

.password {
	width: 250px;
}

.check {
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.find {
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.form-control {
	width: 150px;
	height: 30px;
	font-size: 12px;
}

.time {
	width: 100px;
}

body {
	margin: 0;
	padding: 0;
	overflow-x: hidden;
 
}

.container {
	width: 100%;
	height: 100%
}
</style>
<script defer type="text/javascript">
	
	
	function addPet()
	{
		// 필수 입력 항목 유효성 검사
		if ($("#petName").val() == "" 
			 || $("#petGenderCd").val() == ""
	         || $("#petBirthday").val() == ""
	         || $("#neutralDate").val() == ""
	         || $("#weight").val() ==""
		   )
	      {
	         $("#err").html("필수 입력 항목이 누락되었습니다.");
	         $("#err").css("display", "inline");
	         return;
	      }
		
		
		// 폼 제출
		$("#addPetForm").submit();
	}
	
	//사진 미리보기
	function readURL(input)
	{
		if (input.files && input.files[0])
		{
			var reader = new FileReader();
			reader.onload = function(e)
			{
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
	
		}
	}
	
	$(document).ready(function()
	{
		// 중성화 x 선택했을 때만 중성화 일자 선택 비활성화되도록
		if($("input[name=sprayOX]") == 0)
		{
			$("#neutralDate").prop('disabled', false);
		}
			
		
		// 장애 ㅇ 선택했을 때만 장애 입력창 활성화
		
		
		// 알러지 ㅇ 선택했을 때만 알러지 입력창 활성화
		
		
		
		
		
		
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

  });/* end ready */
	
</script>

</head>
<body>
	<div id="header">
		<c:import url="HeaderLogin.jsp"></c:import>
	</div>

	<div id="header" class="container-fluid"
		style="margin: 0; top: 0; left: 0; right: 0; background-color: #DAF5FD; height: 70px;">
		<div class="row">
			<div class="col-md-12">
				<br> <span
					style="font-weight: bold; font-size: 35px; color: #00B1F7; position: relative;">마이펫
					추가 <img src="images/FOOT.png" alt="icon"
					style="width: 32px; height: 30px;">
				</span>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>

<form id="addPetForm" action="addPet.action" method="POST"><!-- ?ownCd='${ownCd } -->
	<input type="hidden" name="ownCd" value="${ownCd }">
	<div id="content" class="container-fluid col-md-10" style="margin-left: 25%; margin-top: 30px;">
	
		<!-- 사진 -->
		<div class="row txt">
			<div class="col-sm-1" style="line-height: 30px;"></div>

			<div class="col-sm-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">사진</span>
			</div>
			<div class="txt col-sm-5" style="line-height: 30px;">
	            <span style="color: #828282; font-size: 12px; width: 800px;" >
	               ※ 가로 150px 세로 150px 크기의 사진을 권장합니다. 5MB 까지 업로드 가능합니다.
	            </span>
                 <br>
               	<div style="width: 150px; height: 150px; overflow: hidden">
                  		<img id="preview" class="preview" src="#" style="width: 150px; height: auto;"/>
                </div>
                <input type='file' id="photo" name="photo" class="photo" 
                onchange="readURL(this)"/>
         	</div>
		</div>


		<!-- 견종 -->
		<div class="txt row">
			<div class="col-md-1" style="line-height: 30px;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">견종</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="txt col-md-2"
				style="line-height: 30px; text-align: left; margin-top: 10px;">
				<select class="txt form-control" name="dogItemCd" id="dogItemCd">
					<c:forEach var="dogItem" items="${dogItemList }">
						<option value="${dogItem.dogItemCd }">${dogItem.dogItem }</option>
					</c:forEach>

					<!-- 
					<option value="1">서투른 골목대장</option>
					<option value="2">특출난 깔끔이</option>
						-->

				</select>
			</div>
			<div class="col-md-7" style="line-height: 30px;"></div>
		</div>
		<br>


		<div class="row">
			<div class="col-md-1" style="line-height: 30px;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">이름</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-md-2" style="line-height: 30px;">
				<input type="text" class="form-control" id="petName" name="petName"
					placeholder="펫이름을 입력하세요" required="required">
			</div>
			<div class="col-md-7" style="line-height: 30px;"></div>
		</div>
		<br>

		<div class="row">
			<div class="col-md-1" style="line-height: 30px;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">성별</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<label><input type="radio" name="petGenderCd" value="GT1"
					checked="checked">&nbsp;<span
					style="color: #828282; font-size: 15px; font-weight: bold;">
						<img src="images/female.png" alt="icon"
						style="width: 30px; height: 30px;">
				</span></label> &nbsp;&nbsp; <label><input type="radio" name="petGenderCd"
					value="GT2">&nbsp;<span
					style="color: #828282; font-size: 15px; font-weight: bold;">
						<img src="images/male.png" alt="icon"
						style="width: 30px; height: 30px;">
				</span></label>
			</div>
			<div class="col-md-7" style="line-height: 30px;"></div>
		</div>
		<br>

		<div class="row">
			<div class="col-md-1" style="line-height: 30px;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">생년월일</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<input type="text" name="petBirthday" class="datepicker form-control"
					value="YYYY-MM-DD" required="required" readonly="readonly">
			</div>
			<div class="col-md-7" style="line-height: 30px;"></div>
		</div>
		<br>

		<div class="row">
			<div class="col-md-1" style="line-height: 30px;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">중성화사항</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<label><input type="radio" name="sprayOX" value="1"
					checked="checked">&nbsp;<span
					style="color: #34B7EB; font-size: 20px; font-weight: bold;">
						Ο </span></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><input
					type="radio" name="sprayOX" value="2">&nbsp;<span
					style="color: #EB6060; font-size: 25px; font-weight: bold;">
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
				<input type="text" id="neutralDate" name="neutralDate"
					class="datepicker form-control" value="YYYY-MM-DD"
					readonly="readonly">
			</div>
			<div class="col-md-7" style="line-height: 30px;"></div>
		</div>
		<br>


		<div class="row">
			<div class="col-md-1" style="line-height: 30px;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">몸무게</span>
				<span style="color: #75C3F8; font-size: 13px; font-weight: bold;">(필수)</span>
			</div>
			<div class="col-md-2" style="line-height: 30px;">
				<input type="text" class="form-control" id="weight" name="weight"
					placeholder="ex) 3.5" required="required">
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
				<label><input type="radio" name="disa" value="1"
					checked="checked"> <span
					style="font-size: 15px; color: #757575;">&nbsp;있음</span></label>
				&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<label><input type="radio"
					name="disa" value="0"> <span
					style="font-size: 15px; color: #757575;">&nbsp;없음</span></label>
			</div>
			<div class="col-md-7" style="line-height: 30px;"></div>
		</div>
		<br>


		<div class="row">
			<div class="col-md-1" style="line-height: 30px;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<input type="text" class="form-control" id="disaName"
					name="disaName" style="width: 450px;" placeholder="장애사항을 입력하세요"
					required="required">
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
				<label><input type="radio" name="allerge" value="1"
					checked="checked"> <span
					style="font-size: 15px; color: #757575;">&nbsp;있음</span></label>
				&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<label><input type="radio"
					name="allerge" value="0"> <span
					style="font-size: 15px; color: #757575;">&nbsp;없음</span></label>
			</div>
			<div class="col-md-7" style="line-height: 30px;"></div>
		</div>
		<br>


		<div class="row">
			<div class="col-md-1" style="line-height: 30px;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<input type="text" class="form-control" id="allergeName"
					name="allergeName" style="width: 450px;" placeholder="알러지사항을 입력하세요"
					required="required">
			</div>
			<div class="col-md-7" style="line-height: 30px;"></div>
		</div>
		<br> <br>
		<div class="row">
			<div class="col-md-1" style="line-height: 30px;"></div>
			<div class="col-md-2" style="line-height: 30px; text-align: left;">
				<span style="color: #828282; font-size: 15px;">예방접종 추가</span>
			</div>
			<div class="col-md-9" style="line-height: 120px;">
				<select multiple="multiple" class="form-control" name="vacList"
					style="font-size: small; width: 150px; height: 120px;">
					<c:forEach var="vac" items="${vacList }">
						<option value="${vac.vacCd }">${vac.vacItem }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="row" align="center">
			<div id="err" style="color: #F25C69;"></div><br>
			<button onclick="addPet()" type="button" class="btn btn-s">등록하기</button>
		</div>
		
		<br> <br> <br>
	</div>
</form>
	<div id="footer">
		<c:import url="FooterWeb.jsp"></c:import>
	</div>


</body>
</html>