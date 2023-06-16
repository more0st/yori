<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.star{
	text-align: center;
	margin: 20px;
}

.restaurant-list {
	margin: 10px auto;
	width: 1100px;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-auto-rows: 100px;
	gap: 10px;
	height: 90%;
	overflow:auto;
}

.restaurant-info {
	align-items: center;
	padding-left: 10px;
	border: 1px solid #d9d9d9;
	background: white;
	color: #333333;
	display: flex;
	gap: 15px;
	text-decoration: none;
}

.restaurant-info:hover {
	cursor: pointer;
	background: #eee;
	color: #333333;
}

.res-img {
	width: 70px;
	height: 70px;
	background-size: cover;
	border: 1px solid #d9d9d9;
}

.res-title {
	font-size: 16px;
}

.res-info {
	font-size: 13px;
}

.res-rank {
	color: #FFA800;
}

.res-80 {
	color: #808080;
}

.res-division {
	color: #d9d9d9;
	padding: 0 7px;
	font-size: 10px;
}
</style>

<div class="whole-container">
	<!-- 메뉴 -->
	<jsp:include page="/WEB-INF/views/mypage/mymenu.jsp"/>
	
	<div class="star">
		<i class="fa-solid fa-star fa-bounce" style="color: #47E6D8; font-size:20px;"></i>
		<i class="fa-solid fa-star fa-bounce" style="color: #47E6D8; font-size:20px;"></i>
		<i class="fa-solid fa-star fa-bounce" style="color: #47E6D8; font-size:20px;"></i>
		<i class="fa-solid fa-star fa-bounce" style="color: #47E6D8; font-size:20px;"></i>
		<i class="fa-solid fa-star fa-bounce" style="color: #47E6D8; font-size:20px;"></i>
	</div>
	
	<div class="restaurant-list">
	<!-- forEach -->
		<!-- for문 돌릴거라 하나만 남겨두고 아래 삭제. 링크 다시 걸어주기. -->
		<a class="restaurant-info" href="${pageContext.request.contextPath}/restaurant/info">
			<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/burgerking.png">
			<span>
				<span class="res-title">버거킹 홍대점</span><br>
				<span class="res-info res-rank">★ 4.7</span><span class="res-division">|</span><span class="res-info">리뷰 18</span><br>
				<span class="res-info res-80">6,000원 이상 배달</span><span class="res-division">|</span><span class="res-info res-80">48~53분</span>
			</span>
		</a>
		
		
		<a class="restaurant-info">
			<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/amazing.png">
			<span>
				<span class="res-title">어메이징 농카이</span><br>
				<span class="res-info res-rank">★ 4.8</span><span class="res-division">|</span><span class="res-info">리뷰 245</span><br>
				<span class="res-info res-80">8,000원 이상 배달</span><span class="res-division">|</span><span class="res-info res-80">20~35분</span>
			</span>
		</a>
		<a class="restaurant-info">
			<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/downtowner.png">
			<span>
				<span class="res-title">다운타우너 연남점</span><br>
				<span class="res-info res-rank">★ 5.0</span><span class="res-division">|</span><span class="res-info">리뷰 154</span><br>
				<span class="res-info res-80">10,000원 이상 배달</span><span class="res-division">|</span><span class="res-info res-80">35~55분</span>
			</span>
		</a>
		<!-- /forEach -->
	</div>	
</div>