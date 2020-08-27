<!-- 피드백 모달 모음집.jsp -->
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
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style>

	.star
	{
		font-size: 28px;
        text-decoration: none;
        color: #BDBDBD;
    }
    .star.on
    {
        color: #FFCC4F;;
    }
 
</style>

<script type="text/javascript">	

  	$('document').ready(function()
	{
  		
		$('.starR span').click(function()
		{
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		}); 
	});  
 	
</script>

</head>
<body>


<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#dogFeedback">
  강아지피드백
</button>


<!-- 강아지 피드백 모달 시작 -->
<div class="modal fade" id="dogFeedback" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">미미는 어떤 강아지인가요?</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="starR">
			<span>통제에 잘 따르는 강아지 인가요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>입질이 없는 강아지인가요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>다른 강아지와 잘 어울리나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 강아지 피드백 모달 끝-->


<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#ownerFeedback">
  견주피드백
</button>


<!-- 견주 피드백 모달 시작 -->
<div class="modal fade" id="ownerFeedback" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">함께 산책한 견주 피드백을 해주세요!</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="starR">
			<span>배변처리를 잘 하셨나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>반려견을 잘 통제하셨나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>내 반려견을 존중했나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>매칭 정보와 실제 정보가 일치했나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>정해진 약속시간을 준수하였나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>이 견주와의 산책에 만족하셨나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 견주 피드백 모달 끝-->

<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#workerFeedback">
  워커 피드백
</button>


<!-- 워커 피드백 모달 시작 -->
<div class="modal fade" id="workerFeedback" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">미미와 함께한 워커의 피드백을 해주세요!</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="starR">
			<span>워커의 산책대행이 안전했나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>반려견이 산책에 만족했나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>이 워커의 산책대행에 만족하셨나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>

		<div class="starR">
			<span>친절하게 서비스를 제공했나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>워커가 필요한 준비물을 갖추었나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>워커가 약속시간을 준수했나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>워커가 인계증을 잘 확인했나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
		
		<div class="starR">
			<span>이 워커의 산책에 만족하셨나요?</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
			<span class="star on">★</span>
		</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 워커 피드백 모달 끝-->
</body>
</html>