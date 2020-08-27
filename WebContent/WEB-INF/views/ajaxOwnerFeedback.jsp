<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<div class="modal-header">
	<h3 class="modal-title" id="dogFeedBackHeader">(미미) 는 어떤 강아지인가요?</h3>
</div>

<div class="modal-body">
	
	<c:forEach var="a" items="${dogfdbList }" varStatus="status1">
		<div id="dogFeedBackContent${status.count }">
			<div>${a.dogFdbItem }</div>
			<%-- <div>${a.dogFdbItemCd }</div> --%>
			<div class="rating-group">
				<input disabled checked class="rating__input rating__input--none" name="rating${status1.count }" id="rating${status1.count }-none" value="0" type="radio">
				<label aria-label="1 star" class="rating__label" for="rating${status.count }-1">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status1.count }" id="rating${status1.count }-1" value="1" type="radio">
				<label aria-label="2 stars" class="rating__label" for="rating${status1.count }-2">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status1.count }" id="rating${status1.count }-2" value="2" type="radio">
				<label aria-label="3 stars" class="rating__label" for="rating${status1.count }-3">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status1.count }" id="rating${status1.count }-3" value="3" type="radio">
				<label aria-label="4 stars" class="rating__label" for="rating${status1.count }-4">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status1.count }" id="rating${status1.count }-4" value="4" type="radio">
				<label aria-label="5 stars" class="rating__label" for="rating${status1.count }-5">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status1.count }" id="rating${status1.count }-5" value="5" type="radio">
				<span id="result${status1.count }"></span>
			</div>
		</div>
	</c:forEach>		
</div>
<div class="modal-header">
	<h3 class="modal-title" id="ownerFeedBackHeader">함께 산책한 견주 님 피드백을 해주세요!</h3>
</div>
<div class="modal-body">


	<c:forEach var="b" items="${ownfdbList }" varStatus="status2">
		<div id="ownerFeedBackContent${status2.count + 100 }">
			<div>${b.ownFdbItem }</div>
			<div class="rating-group">
				<input disabled checked class="rating__input rating__input--none" name="rating${status2.count + 100 }" id="rating${status2.count + 100 }-none" value="0" type="radio">
				<label aria-label="1 star" class="rating__label" for="rating${status2.count + 100 }-1">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status2.count + 100 }" id="rating${status2.count + 100 }-1" value="1" type="radio">
				<label aria-label="2 stars" class="rating__label" for="rating${status2.count + 100 }-2">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status2.count + 100 }" id="rating${status2.count + 100 }-2" value="2" type="radio">
				<label aria-label="3 stars" class="rating__label" for="rating${status2.count + 100 }-3">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status2.count + 100 }" id="rating${status2.count + 100 }-3" value="3" type="radio">
				<label aria-label="4 stars" class="rating__label" for="rating${status2.count + 100 }-4">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status2.count + 100 }" id="rating${status2.count + 100 }-4" value="4" type="radio">
				<label aria-label="5 stars" class="rating__label" for="rating${status2.count + 100 }-5">
					<i class="rating__icon rating__icon--star fa fa-star"></i>
				</label>
				<input class="rating__input" name="rating${status2.count + 100 }" id="rating${status2.count + 100 }-5" value="5" type="radio">
				<span id="result${status2.count + 100 }"></span>
			</div>
		</div>
	</c:forEach>
</div>