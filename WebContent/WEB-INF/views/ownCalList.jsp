<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
	<td>카테고리</td>
	<td>상세주소</td>
	<td>시작시간</td>
	<td>끝시간</td>
	<td>제목</td>
	<td>기록수정/삭제</td>
</tr>
<c:forEach var="dto" items="${calList}">
	<tr>
		<td>${dto.item }</td>
		<td>${dto.addrDetail }</td>
		<td>${dto.startTime }</td>
		<td>${dto.endTime }</td>
		<td>${dto.title }</td>
		<td>
			<form id="recForm">
				<input type="hidden" value="${dto.schCd }" />
			</form>
		
			<c:if test="${dto.code != null}">
				<button type="button" class="recUpdate">기록수정</button>
			</c:if>
			<c:if test="${dto.code == null}">
				<button type="button" class="recInsert">기록작성</button>
			</c:if>
			<button type="button" class="recDelete">일정삭제</button>
		</td>
	</tr>
</c:forEach>
<tr>
	<td colspan="6"><button type="button" id="addRec">일정추가</button></td>
</tr>