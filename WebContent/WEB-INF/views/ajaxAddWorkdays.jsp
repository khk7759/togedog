<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<tr>
	<td><input type="hidden" value="${dayCd }" name="selDayCd">${day } </td>
	<td><input type="hidden" value="${favStart }" name="selFavStart">${favStart }:00</td>
	<td> ~ </td>
	<td><input type="hidden" value="${favEnd }" name="selFavEnd">${favEnd}:00 </td>	
</tr>
<%-- 
<tr>
	<td><input type="hidden" name="days2" value="${dayCd }"></td>
	<td><input type="hidden" name="favStart2" value="${favStart }"></td>
	<td><input type="hidden" name="favEnd2" value="${favEnd }"></td>
</tr> 
--%>