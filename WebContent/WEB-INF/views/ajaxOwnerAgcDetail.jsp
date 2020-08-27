<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-sm-12">
	
	<div style="text-align: left; font-size: 17px; font-weight:bold;
	  margin: 0px 0px 10px 10px;">대행 신청 정보</div>
	
		<table class="table table-hover table-condensed">
			<tr>
				<th style="text-align: center; width: 30%;">대행일</th>
				<th style="text-align: center; width: 40%;">장소</th>
				<th style="text-align: center; width: 10%;">금액</th>
				<th style="text-align: center; width: 20%;">신청일</th>
			</tr>
			<tr>
				<td>${info.walkDate }(${info.startTime } ~ ${info.endTime })</td>
				<td>${info.addrDetail }</td>
				<td>29,800원</td>
				<td>${info.insDate }</td>
			</tr>
		</table>
		
		<div style="text-align: left; font-size: 17px; font-weight:bold;
		  margin: 0px 0px 10px 10px;">참여 강아지</div>
	
		<table class="table table-hover table-condensed">
			<tr>
				<th style="text-align: center; width: 10%;'"></th>
				<th style="text-align: center; width: 30%;">칭호</th>
				<th style="text-align: center; width: 30%;">이름</th>
				<th style="text-align: center; width: 30%;">몸무게</th>
			</tr>
			<c:forEach var="pet" items="${pet }">
				<tr>
					<td>${pet.dogType }</td>
					<td>${pet.mdHead }</td>
					<td>
						<c:if test="${pet.goodDog> 0}">
							<span class="glyphicon glyphicon-heart" style="color: #F25C69; margin-right: 5px;"></span>
						</c:if>
						${pet.petName }
					</td>
					<td>${pet.weight }</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
</div>