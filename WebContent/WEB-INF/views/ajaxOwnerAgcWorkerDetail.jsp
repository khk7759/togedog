<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-sm-12">
	
	<div style="text-align: left; font-size: 17px; font-weight:bold;
	  margin: 0px 0px 10px 10px;">워커 정보</div>
	
		<table class="table table-hover table-condensed">
			<tr>
				<th style="text-align: center;">사진</th>
				<th style="text-align: center;">이름</th>
				<th style="text-align: center;">나이</th>
				<th style="text-align: center;">성별</th>
				<th style="text-align: center;">평점</th>
				<th style="text-align: center;">최근대행일자</th>
			</tr>
			<tr>
				<td>${worker.photo }</td>
				<td>${worker.name }</td>
				<td>${worker.age }</td>
				<td>${worker.gender }</td>
				<td>${worker.fdbAvg }[${worker.fdbCount }]</td>
				<td>${worker.lastWalk }</td>
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
		
		<!-- 이전 매칭 정보 -->
		<div style="text-align: left; font-size: 17px; font-weight:bold;
		  margin: 0px 0px 10px 10px;">이전 매칭 피드백 정보
		  
		  	<span class="tooltip_event glyphicon glyphicon-question-sign" id="preFeedback"
				style="margin-left: 5px;" 
				data-toggle="tooltip" data-placement="right" title="최근에 상대에게 준 항목별 피드백 점수입니다.">
			</span>  
		</div>
		
	
		<table class="table table-hover table-condensed">
			<tr>
				<th style="text-align: center;">항목</th>
				<th style="text-align: center;">점수</th>
			</tr>
			<c:forEach var="fdb" items="${agcWokFdb }">
				<tr>
					<td>${fdb.itemName }</td>
					<c:choose>
						<c:when test="${fdb.itemScore eq 5 }">
					        <td>
					        	<span class="star">★★★★★</span>
					        </td>
					    </c:when>
					    <c:when test="${fdb.itemScore eq 4 }">
					        <td>
					        	<span class="star">★★★★☆</span>
					        </td>
					    </c:when>
					    <c:when test="${fdb.itemScore eq 3 }">
					        <td>
					        	<span class="star">★★★☆☆</span>
					        </td>
					    </c:when>
					    <c:when test="${fdb.itemScore eq 2 }">
					        <td>
					        	<span class="star">★★☆☆☆</span>
					        </td>
					    </c:when>
					    <c:when test="${fdb.itemScore eq 1 }">
					        <td>
					        	<span class="star">★☆☆☆☆</span>
					        </td>
					    </c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 대행 신청 메세지 -->
		<div style="text-align: left; font-size: 17px; font-weight:bold;
		  margin: 0px 0px 10px 10px;">대행 신청메세지</div>
		<textarea rows="4" cols="10" style="width: 100%; border: none;" readonly="readonly">
			${agcMsg }
		</textarea>
		
		
		<br><br>
		<button type="button" class="btn btn-default btn-xs">수락</button>
		<button type="button" class="btn btn-default btn-xs">거절</button>
		<button type="button" class="btn btn-default btn-xs">신고</button>
	</div>
</div>