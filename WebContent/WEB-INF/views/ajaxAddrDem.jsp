<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<option value="0">동·읍·면을 선택해주세요</option>
	<c:forEach var="addr3" items="${result }">
		<option value="${addr3.addrCd3 }">${addr3.addr3 }</option>
	</c:forEach>