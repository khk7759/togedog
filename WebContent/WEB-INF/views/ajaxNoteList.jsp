<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<c:forEach var="note" items="${noteList }">
<tr>
	<td><input type="checkbox" class="check" name="nCheck" value="${note.noteCd }"></td>
	<td>${note.nickName }</td>
	<td>
		<%-- 	
		<c:choose>
			<c:when test="${length(note.title) eq 50}">
				<a name="noteTitle" class="noteTitle">${note.title }...</a>
			</c:when>
			<c:otherwise>
				<a name="noteTitle" class="noteTitle">${note.title }</a>
			</c:otherwise>
		</c:choose> 
		 --%>
		<a name="noteTitle" class="noteTitle">${note.title }..</a>
		<input name="noteCd" type="hidden" value="${note.noteCd }">
	</td>
	<td>${note.insDate }</td>
	<td><a>차단</a></td>
	<td><a>신고</a></td>
</tr>
</c:forEach>


