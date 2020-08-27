<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			$("#workerNoForm").submit();
			
		});
	});

</script>

<div class="modal fade" id="workerNoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-lg-12">
					<h4>거절사유를 선택해주세요</h4>
				</div>
				<form action="<%=cp %>/workerno.action" method="post" id="workerNoForm">
					<input type="hidden" id="wokApplyCd" name="wokApplyCd" value="${dto.wokCd }"/>
					<div class="col-lg-12">
						<select name="noItem" id="noItem" class="form-control">
							<c:forEach var="list" items="${workerNoItemList }">
								<option value="${list.itemCd }">${list.item }</option>
							</c:forEach>
						</select>
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