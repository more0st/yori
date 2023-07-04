<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.ticket {
	text-align: center;
	margin: 5px;
	color: #232323;
	font-size: 50px;
}

.tablediv {
	width: 1000px;
	margin: 30px auto;
}

.table tr th, .table tr td {
	text-align: center;
}
</style>


<div class="whole-container">
	<!-- 메뉴 -->
	<jsp:include page="/WEB-INF/views/mypage/mymenu.jsp" />

	<div class="ticket">
		<i class="bi bi-ticket-perforated"></i>
	</div>

	<div class="tablediv">
		<table class="table table-hover table-striped">
			<tr class="border">
				<th>쿠폰번호</th>
				<th>쿠폰내용</th>
				<th>할인금액</th>
				<th>최소주문금액</th>
				<th>생성일자 ~ 소멸일자</th>
			</tr>

			<!-- forEach >> tr 한개만 남겨두고 지우기-->
			<c:forEach var="couponlist" items="${couponlist}">
				<c:if test="${couponlist.status eq 1}">>
			<tr class="border">
						<td>${couponlist.couponNum}</td>
						<td>${couponlist.content}</td>

						<td><fmt:formatNumber value="${couponlist.discount}"
								pattern="#,###원" /></td>
						<td><fmt:formatNumber value="${couponlist.min_price}"
								pattern="#,###원" /></td>

						<td><fmt:parseDate var="createdDate"
								value="${couponlist.created_date}" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:parseDate var="expiredDate"
								value="${couponlist.expired_date}" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${createdDate}" pattern="yyyy-MM-dd" /> ~
							<fmt:formatDate value="${expiredDate}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<c:set var="hasCoupons" value="true" />
				</c:if>
			</c:forEach>

			<c:if test="${empty hasCoupons}">
				<tr class="border">
					<td colspan="5">사용 가능한 쿠폰이 없습니다.</td>
				</tr>
			</c:if>
		</table>
	</div>
</div>
