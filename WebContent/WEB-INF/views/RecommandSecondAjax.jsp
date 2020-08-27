<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<c:forEach var="dto" items="${secondList }">
	<tr>
		<td>${dto.nickName }</td>
		<td>${dto.age }</td>
		<td>${dto.addr1 } ${dto.addr2 } ${dto.addr3 } ${dto.addrDetail }</td>
		<td>${dto.walkDate }</td>
		<td>${dto.startTime } ~ ${dto.endTime }</td>
		<td>${dto.petName }</td>
		<td>${dto.petCount }</td>
		<td>${dto.lastWalk }</td>
		<td><button class="sendBtn" type="button" value="${dto.walkCd }">신청하기</button></td>
	</tr>
</c:forEach>