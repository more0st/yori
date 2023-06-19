<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<style>
.whole-container {
  	min-height: 800px;
  	padding-bottom: 20px;
	background: #fafafa;
}

.home-container {
	width: 1100px;
	background: white;
	border-radius: 10px;
	min-height: 300px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #d9d9d9;
}

.list-title {
	font-weight: bold;
	font-size: 18px;
	display: flex;
	align-items: center;
	width: 180px;
	border-bottom: 3px solid #333;
	padding-left: 10px;
}

.saleCnt {
	width: 30%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	height: 100px;
	padding: 20px;
	border: 1px solid #d9d9d9;
	color: #333;
	font-size: 20px;
	font-weight: bold;
}

.saleCount {
	color: #fa0050;
}

.flexdiv {
	display: flex;
	justify-content: space-between;
}
  
</style>
<main id="main" class="main">
<div class="whole-container">
	<div class="home-container shadow">
		<div class="list-title" style="margin-bottom: 20px; width: 220px;">
			HOME
		</div>
		<div class="flexdiv">
			<div class="saleCnt">
				<div>오늘의 주문건수</div>
				<div><span class="saleCount">5</span>&nbsp;회</div>
			</div>
			<div class="saleCnt">
				<div>오늘의 매출</div>
				<div><span class="saleCount">50,000</span>&nbsp;원</div>
			</div>
			<div class="saleCnt">
				<div>
					리뷰 평점
				</div>
				<div class="saleCount">5.0</div>
			</div>
		</div>
	</div>
</div>
</main>