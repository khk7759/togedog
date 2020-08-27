<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.photo }</td>
		<td>${dto.mdHead } ${dto.mdBody }</td>
		<td>
			<c:if test="${dto.goodDog> 0}">
				<span class="glyphicon glyphicon-heart" style="color: #F25C69; margin-right: 5px;"></span>
			</c:if>
			${dto.petName }
		</td>
		<td>${dto.petBirthday }</td>
		<td>${dto.petGender} / ${dto.neutralDate }</td>
		<td>${dto.dogItem }</td>
		<td>${dto.petSize }</td>
	</tr>
</c:forEach>