<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="dto" items="${list }">
	<tr>
		<td>장애</td>
		<td>${dto.petName }</td>
		<td>${dto.disaName }</td>
	</tr>
</c:forEach>