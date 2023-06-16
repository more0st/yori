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
				<div><h3>박상훈</h3>park123@naver.com</div>
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
			<tr class="border" >
				<td>1111</td>
				<td>상훈이네 족발집</td>
				<td>36,000원</td>
				<td>주문완료</td>
			</tr>
			<!-- /forEach -->
			
			<!-- 아래 tr은 지우기 -->
			<tr class="border" >
				<td>2222</td>
				<td>선영이네 피자집</td>
				<td>15,000원</td>
				<td>주문완료</td>
			</tr>
			
			<tr class="border" >
				<td>3333</td>
				<td>승현이네 국밥집</td>
				<td>12,000원</td>
				<td>주문완료</td>
			</tr>
			
			
			<tr class="border" >
				<td>4444</td>
				<td>재혁이네 치킨집</td>
				<td>18,000원</td>
				<td>주문완료</td>
			</tr>
		</table>
	</div>	
</div>
