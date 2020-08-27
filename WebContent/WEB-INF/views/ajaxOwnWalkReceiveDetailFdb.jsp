<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.itemName }</td>
		<c:choose>
		    <c:when test="${dto.itemScore eq 5 }">
		        <td>
		        	<span class="star">★★★★★</span>
		        </td>
		    </c:when>
		    <c:when test="${dto.itemScore eq 4 }">
		        <td>
		        	<span class="star">★★★★☆</span>
		        </td>
		    </c:when>
		    <c:when test="${dto.itemScore eq 3 }">
		        <td>
		        	<span class="star">★★★☆☆</span>
		        </td>
		    </c:when>
		    <c:when test="${dto.itemScore eq 2 }">
		        <td>
		        	<span class="star">★★☆☆☆</span>
		        </td>
		    </c:when>
		    <c:when test="${dto.itemScore eq 1 }">
		        <td>
		        	<span class="star">★☆☆☆☆</span>
		        </td>
		    </c:when>
		</c:choose>
	</tr>
</c:forEach>