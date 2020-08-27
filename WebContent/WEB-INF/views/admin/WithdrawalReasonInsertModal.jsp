<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#okBtn2").click(function()
		{
			$("#blkForm").submit();
		});
	});

</script>

<div class="modal fade" id="withdrawModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<form action="<%=cp %>/blacklistinsert.action" method="post" id="blkForm">
				<div class="modal-body">
					<div class="row m-auto">
						<h4>강제 탈퇴 사유 입력</h4>
						
						<span class="mt-3">※ 강제 탈퇴 된 회원은 서비스 재가입이 불가능 합니다.</span>
						
						<div class="col-lg-3 mt-3">
							<span>사유 선택</span>
						</div>
						
							<input type="hidden" id="code" name="code" value="${dto.code }"/>
							<select name="blkItem" id="blkItem" class="form-control mt-3">
								<c:forEach var="list" items="${blkItem }">
										<option value="${list.blkItemCd }">${list.blackItem }</option>
								</c:forEach>
							</select>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="submit">확인</button>
					<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>