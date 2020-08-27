<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
					<div class="col-sm-12">
					
					<div style="text-align: left; font-size: 17px; font-weight:bold;
					  margin: 0px 0px 10px 10px;">견주 정보</div>
					
						<table id="own" class="table table-hover table-condensed">
							<tr>
								<th style="text-align: center;">사진</th>
								<th style="text-align: center;">닉네임</th>
								<th style="text-align: center;">나이</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">관심사</th>
								<th style="text-align: center;">상세 관심사</th>
								<th style="text-align: center;">산책날짜</th>
								<th style="text-align: center;">산책시간</th>
								<th style="text-align: center;">산책 강아지 수</th>
							</tr>
							<tr>
								<c:forEach var="own" items="${ownList }">
									<td>${own.photo }</td>
									<td>${own.nickName }</td>
									<td>${own.age }</td>
									<td>${own.gender }</td>
									<td>${own.intr }</td>
									<td>${own.intrDetail }</td>
									<td>${own.walkDate }</td>
									<td>${own.startTime } ~ ${own.endTime }</td>
									<td>${own.petCount }</td>
								</c:forEach>
							<tr>
						</table>
						
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">강아지 정보</div>
					
						<table id="pet" class="table table-hover table-condensed">
							<tr>
								<th style="text-align: center;">사진</th>
								<th style="text-align: center;">칭호</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">생년월일</th>
								<th style="text-align: center;">성별/중성화여부</th>
								<th style="text-align: center;">견종</th>
								<th style="text-align: center;">사이즈</th>
							</tr>
							<c:forEach var="pet" items="${petList }">
								<tr>
									<td>${pet.photo }</td>
									<td>${pet.mdHead } ${pet.mdBody }</td>
									<td>
										<c:if test="${pet.goodDog> 0}">
											<span class="glyphicon glyphicon-heart" style="color: #F25C69; margin-right: 5px;"></span>
										</c:if>
										${pet.petName }
									</td>
									<td>${pet.petBirthday }</td>
									<td>${pet.petGender} / ${pet.neutralDate }</td>
									<td>${pet.dogItem }</td>
									<td>${pet.petSize }</td>
								</tr>
							</c:forEach>
						</table>
						
						
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">장애·알러지 정보</div>
					
						<table id="petsub" class="table table-hover table-condensed">
							<tr>
								<th style="text-align: center;">구분</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">내용</th>
							</tr>
							<c:forEach var="alle" items="${alleList }">
							<tr>
								<td>알러지</td>
								<td>${alle.petName }</td>
								<td>${alle.allergeName }</td>
							</tr>
							</c:forEach>
							<c:forEach var="disa" items="${disaList }">
							<tr>
								<td>장애</td>
								<td>${disa.petName }</td>
								<td>${disa.allergeName }</td>
							</tr>
							</c:forEach>
							
						</table>
						
						<!-- 이전 매칭 정보 --><!-- 단계 높아야 제공 -->
						<div style="text-align: left; font-size: 17px; font-weight:bold;
						  margin: 0px 0px 10px 10px;">이전 매칭 피드백 정보
							<span class="tooltip_event glyphicon glyphicon-question-sign" id="preFeedback"
							style="margin-left: 5px;" 
							data-toggle="tooltip" data-placement="right" title="최근에 상대에게 준 항목별 피드백 점수입니다."
							>
							</span>
						
						</div>
						<table id="ownfdb" class="table table-hover table-condensed">
							<tr>
								<th style="text-align: center;">항목</th>
								<th style="text-align: center;">점수</th>
							</tr>
							<c:forEach var="fdb" items="${fdbList }">
							<tr>
								<td>${fdb.ownFdbItem }</td>
								<c:choose>
								    <c:when test="${fdb.ownFdbScore eq 5 }">
								        <td>
								        	<span class="star">★★★★★</span>
								        </td>
								    </c:when>
								    <c:when test="${fdb.ownFdbScore eq 4 }">
								        <td>
								        	<span class="star">★★★★☆</span>
								        </td>
								    </c:when>
								    <c:when test="${fdb.ownFdbScore eq 3 }">
								        <td>
								        	<span class="star">★★★☆☆</span>
								        </td>
								    </c:when>
								    <c:when test="${fdb.ownFdbScore eq 2 }">
								        <td>
								        	<span class="star">★★☆☆☆</span>
								        </td>
								    </c:when>
								    <c:when test="${fdb.ownFdbScore eq 1 }">
								        <td>
								        	<span class="star">★☆☆☆☆</span>
								        </td>
								    </c:when>
								</c:choose>
							</tr>
							</c:forEach>

						</table>
						
						<br>
						<button type="button" class="btn btn-default btn-xs">피드백</button>
						<button type="button" class="btn btn-default btn-xs">산책기록</button>
						<button type="button" class="btn btn-default btn-xs">신고</button>
					</div>
				</div>


