<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">

.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.review-container {
	width: 715px;
	margin: 0 auto;
}

.ownerReview {
	background: #f0f0f0;
	margin: 10px;
	padding: 10px;
}

.ownerReview-top {
	display: flex;
	color: #333;
}

.owerReview-content {
	padding: 10px;
	color: #666;
}

.review-rating {
	color: #ffa800;
	margin-bottom: 10px;
}

.review-rank {
	display: flex;
	justify-content: center;
	align-items: center;
	background: white;
	border: 1px solid #d9d9d9;
	margin-bottom: 20px;
	padding: 10px 0 20px 0;
}

.review {
	background: white;
	border:1px solid #d9d9d9;
	padding: 20px 15px;
}

.review-top {
	display: flex;
	justify-content: space-between;
}

.review-name {
	display: flex;
	gap: 5px;
}

.report-btn {
	border:none;
	background: none;
	color: #999999;
	font-size: 14px;
}

.review-date {
	font-size: 12px; 
	color: #999999;
	padding-top: 5px;
}

.review-img {
	width: 100%;
	border: 1px solid #d9d9d9;
}

.review-content {
	font-size: #14;
	color: #6666666;
	margin: 20px 0 0 0;
}

.res-rank {
	color: #FFA800;
}

.res-999 {
	color: #999;
}

.res-333 {
	color: #333;
}

.divider {
	font-size: 12px;
	color: #999999;
}

.review-button-div {
	display: flex;
	justify-content: right;
}

.review-button {
	border: 1px solid #666;
	background: #f0f0f0;
	margin-top: 10px;
	width: 100px;
	height: 40px;
	border-radius: 10px;
	color: #666;
	font-weight: bold;
}

.review-cnt {
	font-size: 16px;
	font-weight: bold;
	color: #333;
	border: 1px solid #d9d9d9;
	border-bottom: none;
	background: white;
	width: 200px;
	padding: 10px;
	text-align: center;
}

.modal-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.modal-button {
	width: 48%;
	border:none;
	height: 50px;
	border-radius: 10px;
}

.addCart {
	background: #555;
	color: white;
}

.toOrder {
	background: #fa0050;
	color: white;
}

.modal-body {
	overflow-y: auto;
	height: 300px;
}

.modal-text {
	width: 100%;
	outline: none;
	height: 90%;
	resize: none;
	padding: 10px;
	color: #333;
	border-radius: 10px;
}

</style>

<main id="main" class="main">
<div class="whole-container">

	<div class="review-container">
		<!-- 리뷰 -->
		<div class="res-show2">
			<div class="review-rank">
				<div class="res-rank" style="font-size: 40px;">★</div>
				<div style="font-size: 48px;">5.0</div>
			</div>
			
			<div class="review-cnt">
					클린리뷰 : 2개				
			</div>
			
			<!-- foreach로 돌리기 -->
			<!-- image가 없는 리뷰라면 if로 생략하기 -->
			<div class="review">
				<div class="review-top">
					<div class="review-name">
						<div class="res-333" style="font-weight: bold;">박상훈님</div><div class="review-date">2023-06-13</div>
					</div>
					<div><button class="report-btn">신고</button></div>
				</div>
				<div class="review-rating">★★★★★</div>
				<img class="review-img" src="${pageContext.request.contextPath}/resources/picture/burgerking.png">
				<div class="review-content">
					맛있는 버거킹
				</div>
				
				<!-- 사장님 답글 -->
				<div class="ownerReview">
					<div style="display: flex; justify-content: space-between;">
						<div class="ownerReview-top">
							<i class="bi bi-arrow-return-right"></i>&nbsp;<div class="res-333" style="font-weight: bold;">사장님</div>&nbsp;<div class="review-date">2023-06-17</div>
						</div>
						<div>
							<div><button class="report-btn">수정</button><span class="divider">|</span><button class="report-btn">삭제</button></div>
						</div>
					</div>	
					<div class="ownerReview-content">
						맛잇게 먹어서 감사해요
					</div>
				</div>
				
			</div>
			
			<div class="review">
				<div class="review-top">
					<div class="review-name">
						<div class="res-333" style="font-weight: bold;">박상훈님</div><div class="review-date">2023-06-13</div>
					</div>
					<div><button type="button" class="report-btn">신고</button></div>
				</div>
				<div class="review-rating">★★★★★</div>
				<img class="review-img" src="${pageContext.request.contextPath}/resources/picture/amazing.png">
				<div class="review-content">
					맛있는 버거킹
				</div>
				
				<!-- 답글이 있다면 숨기기 -->
				<div class="review-button-div">
					<button class="review-button" id="submenu-modal">답글 달기</button>
				</div>
			</div>
			
		</div>
	</div>



	<!-- 모달 -->
	<div class="modal" id="menu-modal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
		   		<div class="modal-header">
		    		<h5 class="modal-title">리뷰 답글 달기</h5>
		    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		   		</div>
		    	<div class="modal-body">
	    			<textarea class="modal-text"></textarea>
		    	</div>
		  		<div class="modal-footer">
		    		<button type="button" class="modal-button addCart">취소하기</button>
		    		<button type="button" class="modal-button toOrder">등록하기</button>
		  		</div>
			</div>
		</div>
	</div>
	
</div>
</main>

<script type="text/javascript">

<%-- 모달 --%>
// div 클릭 이벤트 핸들러
document.getElementById("submenu-modal").addEventListener("click", function() {
// 모달 창 띄우기
	$('#menu-modal').modal('show');
});

</script>