<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.itemName }</td>
		<td>${dto.itemScore }</td>
	</tr>
</c:forEach>