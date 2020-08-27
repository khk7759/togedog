<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<option value="0">시·군·구를 선택해주세요</option>
	<c:forEach var="addr2" items="${result }">
		<option value="${addr2.addrCd2 }">${addr2.addr2 }</option>
	</c:forEach>