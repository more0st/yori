<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.ticket{
	text-align: center;
	margin: 5px;
	color: #232323;
	font-size: 50px;
}

.tablediv{
	width: 1000px;
	margin: 30px auto;
}

.table tr th, .table tr td{
	text-align: center;
}
</style>


<div class="whole-container">
	<!-- 메뉴 -->
	<jsp:include page="/WEB-INF/views/mypage/mymenu.jsp"/>
	
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
			<tr class="border">
				<td>1111</td>
				<td>5,000원 할인쿠폰</td>
				<td>5,000원</td>
				<td>15,000원</td>
				<td>2023.06.01 ~ 2023.06.30</td>
			<tr>
			
			
			
			<tr class="border">
				<td>1111</td>
				<td>5,000원 할인쿠폰</td>
				<td>5,000원</td>
				<td>15,000원</td>
				<td>2023.06.01 ~ 2023.06.30</td>
			<tr>
			<tr class="border">
				<td>1111</td>
				<td>5,000원 할인쿠폰</td>
				<td>5,000원</td>
				<td>15,000원</td>
				<td>2023.06.01 ~ 2023.06.30</td>
			<tr>
			<!-- /forEach -->
			
		</table>
	</div>
</div>
