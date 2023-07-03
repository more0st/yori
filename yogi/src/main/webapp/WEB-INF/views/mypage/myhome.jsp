<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.profile{
	width: 500px;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	margin: 30px auto;
}

.profile-detail{
	display: flex;
	justify-content: left;
	width: 80%;
	margin: 0 auto;
	gap: 70px;
}

.icon{
	font-size: 100px;
}

.profile-info{
	display: flex;
	justify-content: center;
	align-items: center;
}

.tablediv{
	width: 1000px;
	margin: 30px auto;
}

.tablediv tr th, tr td{
	text-align: center;
}

.tablediv tr td{
	vertical-align: middle;
}

.orderList{
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 15px;
}

</style>


<div class="whole-container">
	<!-- 메뉴 -->
	<jsp:include page="/WEB-INF/views/mypage/mymenu.jsp"/>
	
	<div class="profile">
		<div class="profile-detail">
			<div class="icon"><i class="bi bi-person-circle"></i></div>
			<div class="profile-info">
				<div><h3>${dto.userName}</h3>${dto.email}</div>
			</div>
		</div>
	</div>
	
	<br>
	
	<div class="tablediv">
	<div class="orderList"><i class="bi bi-list-ul"></i>&nbsp;주문내역</div>
		<table class="table">
			<tr class="table-secondary border">
				<th>주문번호</th>
				<th>업체이름</th>
				<th>금액</th>
				<th>주문상태</th>
			</tr>
			
			<!-- forEach -->
			<!-- forEach -->
			<c:forEach var="list" items="${list}" end="4" >
			<tr class="border" >
				<td>${list.orderNum}</td>
				<td>${list.restaurantName}</td>
				<td><fmt:formatNumber value="${list.total_price}" pattern="#,###원"/></td>
				
				<c:choose>
				  <c:when test="${list.statusName == 1}">
				    <td>결제완료</td>
				  </c:when>
				  <c:when test="${list.statusName == 2}">
				    <td>접수완료</td>
				  </c:when>
				  <c:when test="${list.statusName == 3}">
				    <td>배달중</td>
				  </c:when>
				  <c:when test="${list.statusName == 4}">
				    <td>배달완료</td>
				  </c:when>
				  <c:when test="${list.statusName == 5}">
				    <td>주문취소</td>
				  </c:when>
				</c:choose>
			</tr>
			</c:forEach>
			<!-- /forEach -->
			<!-- /forEach -->
			
		</table>
	</div>	
</div>
