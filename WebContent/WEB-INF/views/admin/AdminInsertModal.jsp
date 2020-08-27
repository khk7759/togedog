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
			if($("#name").val() == "")
			{
				$("#err").css("display", "block");
				$("#err").html("입력값이 누락되었습니다.");
				$("#name").focus();
				return;
			}
			if($("#tel").val() == "")
			{
				$("#err").css("display", "block");
				$("#err").html("입력값이 누락되었습니다.");
				$("#tel").focus();
				return;
			}
			
			$("#adminForm").submit();
			
		});
	});

</script>

<div class="modal fade" id="adminAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="<%=cp %>/admininsert.action" method="post" id="adminForm">
					<div class="row">
						<div class="col-sm-4">
							<label class="col-form-label ml-3">이름</label>
						</div>
						<div class="col-sm-7">
							<input type="text" id="name" name="name" class="form-control"/>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-sm-4">
							<label class="col-form-label ml-3">전화번호</label>
						</div>
						<div class="col-sm-7">
							<input type="tel" id="tel" name="tel" class="form-control"/>
						</div>
					</div>
					<div class="col-lg-12 ml-3 mt-3 text-danger">
						<span id="err"></span>
					</div>
					<div class="row mt-4">
						<div class="col-sm-12">
							<span class="ml-4">※ 초기 비밀번호는 핸드폰 번호 뒷자리로 설정됩니다.</span><br>
							<span class="ml-4">생성 후 비밀번호를 바꿀 수 있도록 안내 부탁드립니다.</span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" id="okBtn" type="button">등록</button>
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>