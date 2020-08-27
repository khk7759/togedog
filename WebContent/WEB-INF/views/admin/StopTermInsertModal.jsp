<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#err").css("display", "none");
		
		$("#okBtn").click(function()
		{
			if($("#stopTerm").val() == "")
			{
				$("#err").css("display", "block");
				$("#err").html("입력값이 누락되었습니다.");
				$("#stopTerm").focus();
				return;
			}
			else
			{
				$("#stopForm").submit();
			}
		});
	});

</script>

<div class="modal fade" id="stopModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row m-auto">
					<div class="col-lg-12">
						<h4>활동 정지 기간 입력</h4>
					</div>
					
					<div class="col-lg-12 mt-3">
						<span>※ 아래에 입력한 기간 만큼 해당 회원의 활동이 정지 됩니다.</span>
					</div>
					
					
					<div class="col-sm-5 mt-3">
						<form action="<%=cp %>/stopterminsert.action" method="post" id="stopForm">
							<input type="hidden" id="code" name="code" value="${dto.code }"/>
							<input type="hidden" id="userTypeCd" name="userTypeCd" value="${dto.userTypeCd }"/>
							<input type="number" id="stopTerm" name="stopTerm" placeholder="정지 기간" class="form-control"/>
						</form>						
					</div>
					
					<div class="col-sm-2 mt-4">일</div>
					<div class="col-lg-12 ml-3 mt-3 text-danger">
						<span id="err"></span>
					</div>
					
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" id="okBtn" type="button">확인</button>
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>