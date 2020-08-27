<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.photo }</td>
		<td>${dto.mdHead } ${dto.mdBody }</td>
		<td>
			<c:if test="${dto.goodDog > 0}">
				<span class="glyphicon glyphicon-heart" style="color: #F25C69; margin-right: 5px;"></span>
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-award" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  		<path fill-rule="evenodd" d="M9.669.864L8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193l-1.51-.229L8 1.126l-1.355.702-1.51.229-.684 1.365-1.086 1.072L3.614 6l-.25 1.506 1.087 1.072.684 1.365 1.51.229L8 10.874l1.356-.702 1.509-.229.684-1.365 1.086-1.072L12.387 6l.248-1.506-1.086-1.072-.684-1.365z"/>
			  		<path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
		  		</svg>
			</c:if>
			${dto.petName }
		</td>
		<td>${dto.petBirthday }</td>
		<td>${dto.petGender}</td>
		<td>${dto.neutralDate }</td>
		<td>${dto.dogType }</td>
		<td>${dto.weight }</td>
	</tr>
</c:forEach>