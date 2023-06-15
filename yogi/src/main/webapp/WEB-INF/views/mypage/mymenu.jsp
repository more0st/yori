<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.category-box {
	width: 100%;
	border-top: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
	background: white;
}

.category-box2 {
	width: 70%;
	background: white;
	display: flex;
	justify-content: right;
	margin:0 auto;
}

.category-info {
	padding: 18px 15px;
	font-size: 15px;
	white-space: nowrap;
}

.category-info:hover {
	background: black;
	color: white;
	cursor: pointer;
}
</style>

<div class="category-box">
	<div class="category-box2">
		<div class="category-info" onclick="location.href='${pageContext.request.contextPath}/mypage/myhome';">홈</div>
		<div class="category-info" onclick="location.href='${pageContext.request.contextPath}/mypage/orderList';">주문내역</div>
		<div class="category-info" onclick="location.href='${pageContext.request.contextPath}/mypage/likeList';">찜목록</div>
		<div class="category-info" onclick="location.href='${pageContext.request.contextPath}/mypage/coupon';">쿠폰함</div>
		<div class="category-info" onclick="location.href='${pageContext.request.contextPath}/member/check';">정보수정</div>
	</div>
</div>