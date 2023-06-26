<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">

body {
	background: #fafafa;
}

.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.info-form {
	width: 1100px;
	margin: 20px auto;
	min-height: 300px;
	display: flex;
	justify-content: center;
	gap: 20px;
}

.res-info {
	width: 65%;
	min-height: 100px;
}

.cart-info {
	width: 30%;
	height: 100px;	
	position: sticky;
	top: 20px;
}

.res-title {
	border: 1px solid #d9d9d9;
	width: 100%;
	background: white;
}

.res-name {
	background: #d9d9d9;
	height: 44px;
	padding: 10px;
	color: #333;
	font-weight: bold;
	font-size: 15.4px;
	border-bottom: 1px solid #d9d9d9;
	display: flex;
	justify-content: space-between;
}

.res-name-left {
	width: 80%;
}

.res-name-right {
	width: 10%;
	color: #fa0050;
	text-align: right;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: right;
}

.res-main {
	display: flex;
	padding : 10px;
	gap: 10px;
}

.res-img {
	width: 80px;
	height: 80px;
	background-size: cover;
	border: 1px solid #d9d9d9;
}

.res-center {
	display: flex;
	align-items: center;
	font-size: 14px;
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

.choice-form {
	display: flex;
	margin-top: 20px;
}

.choice-detail {
	width: 33.3%;
	height: 60px;
	background: white;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 16px;
	border-collapse: collapse;
	border: 1px solid #d9d9d9;
	cursor: pointer;
}

.choice-menu.active {
	color: white;
	background: #fa0050;
	border: none;
}

.choice-review.active {
	color: white;
	background: #fa0050;
	border: none;
}

.choice-info.active {
	color: white;
	background: #fa0050;
	border: none;
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

.res-information {
	background: white;
	border: 1px solid #d9d9d9;
	min-height: 300px;
	padding: 20px;
}

.information-category {
	min-height: 100px;
	margin-bottom: 20px;
}

.information-category-head {
	padding: 10px;
	border-bottom: 1px solid #666;
	font-weight: bold;
}

.information-category-head > i {
	color: #666;
}

.information-category-body {
	padding: 10px;
}

.information-category-body > img {
	width: 100%;
	margin-bottom: 10px;
}

.information-table {
	border-collapse: collapse;
	width: 100%;
}

.information-table td:first-child {
	width: 150px;
	color: #999;
}

.information-table td {
	padding: 5px;
}

.cart-top {
	background: black;
	color: white;
	display: flex;
	justify-content: space-between;
	padding: 10px;
	font-size: 
}

.cart-top-icon {
	border: none;
	color: white;
	font-size: 16px;
	background: none;
}

.no-cart {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100px;
	border: 1px solid #d9d9d9;
	background: white;
}

.cart-tip {
	display: flex;
	justify-content: right;
	align-items: center;
	background: white;
	border: 1px solid #d9d9d9;
	border-top: none;
	width: 100%;
	height: 40px;
	padding: 10px;
}

.cart-bottom {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 40px;
}

.cart-button {
	width: 100%;
	border: none;
	background: #fa0050;
	height: 50px;
	border-radius: 5px;
	color: white;
	font-weight: bold;
}

.yes-cart {
	border: 1px solid #d9d9d9;
	border-top: none;
	background: white;
	padding: 10px;
	font-size: 14px;
}

.cart-price {
	background: none;
	border: none;
	outline: none;
}

.yes-cart-top {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.yes-cart-top > button {
	border: none;
	background: none;
	font-size: 16px;
}

.quantity-btn {
	border: 1px solid #fa0050;
	background: none;
	font-size: 16px;
	color: #fa0050;
	width: 22px;
	height: 22px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cart-quantity {
	text-align: center;
	border: none;
	width: 40px;
	font-size: 14px;
	outline: none;
}

.yes-cart-bottom {
	display: flex;
	justify-content: space-between;
}

.cart-total {
	height: 50px;
	background: #fff8eb;
	color: #fa0050;
	padding: 10px;
	border: 1px solid #d9d9d9;
	border-top: none;
	font-weight: bold;
	display: flex;
	justify-content: right;
	align-items: center;
}

.accordion {
	background: #d9d9d9;
}

.accordion .accordion-button {
    background-color: #d9d9d9;
    color: #333;
    border-radius: 0;
}

.accordion .accordion-button:not(.collapsed) {
    background-color: #d9d9d9;
    color: #333;
    border-radius: 0;
}

.accordion-collapse {
	cursor: pointer;
}

.accordion-body {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid #d9d9d9;
}

.menu-img {
	width: 60px;
	height: 60px;
	overfit: cover;
}

.modal-title {
	text-align: center;
	width: 80%;
}

.modal-body {
	overflow-y: auto;
	height: 400px;
}

.modal-img {
	height: 200px;
}

.modal-top {
	display: flex;
	justify-content: center;
}

.modal-menu {
	font-size: 20px;
	margin: 30px;
	text-align: center;
}

.modal-price {
	display: flex;
	justify-content: space-between;
	font-weight: bold;
	padding: 0 10px 5px;
}

.modal-option {
	display: flex;
	justify-content: space-between;
	padding: 5px 10px;
}

.modal-radio {
	width: 20px;
	height: 20px;	
}

.modal-total {
	width: 100%;
	background: #f0f0f0;
	color: #333;
	margin-top: 10px;
	padding: 10px;
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

.valueinput{
	background: none;
	border: none; 
	outline: none;
	color:#fa0050;
	width:70px;
	font-weight: bold;
	text-align: right;
}

.infoinput{
	background: none;
	border: none; 
	outline: none;
	text-align: right;
	width: 40px;
	color: #333;
}
</style>
<div class="whole-container">
	<div class="info-form">
		<div class="res-info">
			<div class="res-title">
				<div class="res-name">
					<div class="res-name-left">${restaurantInfo.restaurantName}</div>
					<div class="res-name-right">
						<button type="button" class="btn btnSendRecipeLike" title="좋아요" style="border: none; padding-left: 0; height: 30px; display: flex; align-items: center;">
                              <i class="fa-solid fa-heart" id="likeBtn"></i> 
                              <span id="recipeLikeCount">${dto.recipeLikeCount}</span>
                        </button>
                    </div>
				</div>
				<div class="res-main">
					<div>
						<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/burgerking.png">
					</div>
					<div class="res-center">
						<div>
							<span class="res-rank">★ ${restaurantInfo2.rating}</span><br>
							<span class="res-999">최소주문금액</span>&nbsp;&nbsp;<span class="res-333"><input type="text" value="${restaurantInfo.basePrice}" class="infoinput">원</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="res-detail">
				<div class="choice-form">
					<div class="choice-detail choice-menu">메뉴 ${restaurantInfo2.menuCount}</div>
					<div class="choice-detail choice-review">클린리뷰 ${restaurantInfo2.reviewCount}</div>
					<div class="choice-detail choice-info">정보</div>
				</div>
				
				<!-- 메뉴 -->
				<div class="res-show1">
					
					
					<div class="accordion" id="accordionExample">
					  <div class="accordion-item">
						<c:forEach var="category" items="${categoryList}" varStatus="status">
					    <h2 class="accordion-header" id="${status.count}">
					      <button class="accordion-button ${status.count==1?'':'collapsed'}" type="button" data-bs-toggle="collapse" data-bs-target="#${category.menuCategory}" 
					      aria-expanded="${status.count==1?true:false}" aria-controls="${category.menuCategory}">
					        ${category.menuCategory}
					      </button>
					    </h2>
					    <div id="${category.menuCategory}" class="accordion-collapse collapse ${status.count==1?'show':''}" aria-labelledby="${status.count}" data-bs-parent="#accordionExample">
					      <c:forEach var="menu" items="${category.menuList}">
						      <div class="accordion-body" id="submenu-modal">
						      	<div>
									<div style="font-weight: bold; margin-bottom: 5px;">${menu.menu}</div>
									<div>${menu.price}원</div>					      	
						      	</div>
						      	<c:if test="${not empty menu.imageFilename}">
							      	<div>
							      		<img class="menu-img" src="${pageContext.request.contextPath}/resources/picture/${menu.imageFilename}.png">
							      	</div>
						      	</c:if>
						      </div>
					   	  </c:forEach>
					    </div>
					  </c:forEach>
					  </div>
					</div> <!-- 아코디언 끝 -->
									   <!-- 모달 -->
						<div class="modal" id="menu-modal" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
							   		<div class="modal-header">
							    		<h5 class="modal-title">기네스 머쉬룸 와퍼</h5>
							    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							   		</div>
							    	<div class="modal-body">
							    		<div class="modal-top">
							    			<img class="modal-img" src="${pageContext.request.contextPath}/resources/picture/mushroom.png">
						    			</div>
						    			<div class="modal-menu">
						    				기네스 머쉬룸 와퍼
						    			</div>
						    			<hr>
						    			<div class="modal-price">
						    				<div>
												가격					    				
						    				</div>
						    				<div>
						    					7,000원
						    				</div>
						    			</div>
						    			<hr>
						    			<div class="modal-price">
						    				옵션추가
						    			</div>
						    			
						    			<!-- foreach 돌릴 부분 -->
						    			<div class="modal-option">
						    				<div style="display: flex; width: 150px; gap: 10px; align-items: center;">
						    					<input class="modal-radio" type="checkbox"><div>추가 없음</div>
						    				</div>
						    				<div>
						    					추가비용없음
						    				</div>
						    			</div>
						    			<div class="modal-option">
						    				<div style="display: flex; width: 150px; gap: 10px; align-items: center;">
						    					<input class="modal-radio" type="checkbox"><div>감자튀김 S</div>
						    				</div>
						    				<div>
						    					1,800원
						    				</div>
						    			</div>
						    			<div class="modal-option">
						    				<div style="display: flex; width: 150px; gap: 10px; align-items: center;">
						    					<input class="modal-radio" type="checkbox"><div>감자튀김 L</div>
						    				</div>
						    				<div>
						    					2,500원
						    				</div>
						    			</div>
						    			<!-- foreach 끝 -->
						    			
						    			<div class="modal-total">
						    				<div style="font-weight: bold;">
						    					총 주문금액
						    				</div>
						    				<div>
						    					<div style="font-size: 24px; color: #fa0050; text-align: right; font-weight: bold;">
							    					7,000원
						    					</div>
						    					<div style="font-size: 12px; text-align: right">
						    						(최소주문금액 6,000원)
						    					</div>
						    				</div>
						    			</div>
						    			
							    	</div>
							  		<div class="modal-footer">
							    		<button type="button" class="modal-button addCart">주문표에 추가</button>
							    		<button type="button" class="modal-button toOrder">주문하기</button>
							  		</div>
								</div>
							</div>
						</div>
				</div>

				<!-- 리뷰 -->
				<div class="res-show2" style="display: none;">
					<div class="review-rank">
						<div class="res-rank" style="font-size: 40px;">★</div>
						<div style="font-size: 48px;">${restaurantInfo2.rating}</div>
					</div>
					
					<!-- foreach로 돌리기 -->
					<c:if test="${empty reviewList}">
						<div class="review" style="color: #333; font-weight: bold; text-align: center;">등록된 리뷰가 없습니다.</div>
					</c:if>
					<c:if test="${not empty reviewList}">
						<c:forEach var="review" items="${reviewList}" varStatus="status">
						<div class="review">
							<div class="review-top">
								<div class="review-name">
									<!-- 닉네임 -->
									<div class="res-333" style="font-weight: bold;">${review.userName}님</div><div class="review-date">${review.regDate}</div>
								</div>
								<!-- 자신의 리뷰라면 삭제 / 신고 -->
								<!-- <div><button class="report-btn">신고</button></div>  -->
							</div>
							<div class="review-rating">
							<c:forEach var="i" begin="1" end="${review.star}">★</c:forEach>
							</div>
							<!-- image가 없는 리뷰라면 if로 생략하기 -->
							<c:if test="${not empty review.imgFileName}">
								<img class="review-img" src="${pageContext.request.contextPath}/resources/picture/${review.imgFileName}">
							</c:if>
							<div class="review-content">
								${review.content}
							</div>
							
							<!-- 사장님 답글 -->
							<c:if test="${not empty review.reply}">
								<div class="ownerReview">
									<div class="ownerReview-top">
										<i class="bi bi-arrow-return-right"></i>&nbsp;<div class="res-333" style="font-weight: bold;">사장님</div>&nbsp;<div class="review-date">${review.replyDate}</div>
									</div>
									<div class="ownerReview-content">
										${review.reply}
									</div>
								</div>
							</c:if>
							
						</div>
						</c:forEach>
					</c:if>
					
					<!--  
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
					</div>
					-->
					
				</div>
				
				<!-- 정보 -->
				<div class="res-show3" style="display: none;">
					<div class="res-information">
						<div  class="information-category">
							<div class="information-category-head">
								<i class="fa-solid fa-store"></i>&nbsp;업체정보
							</div>
							<div class="information-category-body">
								<table class="information-table">
									<tr>
										<td>영업시간</td>
										<td>${restaurantInfo.openingHour}&nbsp;~&nbsp;${restaurantInfo.closingHour}</td>
									<tr>
									<tr>
										<td>전화번호</td>
										<td>${restaurantInfo.restaurantTel}</td>
									<tr>
									<tr>
										<td>주소</td>
										<td>${restaurantInfo.restaurantAddr1}&nbsp;${restaurantInfo.restaurantAddr2}</td>
									<tr>
								</table>
							</div>
						</div>
						<div class="information-category">
							<div class="information-category-head">
								<i class="bi bi-newspaper"></i>&nbsp;사업자정보
							</div>
							<div class="information-category-body">
								<table class="information-table">
									<tr>
										<td>상호명</td>
										<td>${restaurantInfo.restaurantName}</td>
									<tr>
									<tr>
										<td>사업자등록번호</td>
										<td>${restaurantInfo.businessNum}</td>
									<tr>
								</table>
							</div>
						</div>
						<div class="information-category">
							<div class="information-category-head">
								<i class="fa-solid fa-sign-hanging"></i>&nbsp;원산지정보
							</div>
							<div class="information-category-body">
								${restaurantInfo.foodInfo}
							</div>						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="cart-info">
			<div class="cart-top">
				<div>
					주문표
				</div>
				<div>
					<button class="cart-top-icon" type="button" onclick=""><i class="fa-solid fa-trash-can"></i></button>
				</div>
			</div>
			
			<!-- 장바구니에 아무 항목도 없을 때 -->
			<div class="no-cart">
				주문표에 담긴 메뉴가 없습니다.
			</div>
			
			<!-- 장바구니에 주문이 들어갔을 때 -->
			<div class="yes-cart">
				<div class="yes-cart-top">
					<div style="font-weight: bold;">
						기네스 머쉬룸 와퍼 세트	
					</div>
					<button type="button" onclick=""><i class="fa-regular fa-circle-xmark"></i></button>
				</div>
				<div class="yes-cart-bottom">
					<div>
						<input class="cart-price" value="7,000원" readonly="readonly">
					</div>
					<div style="display: flex;">
						<button type='button' class='quantity-btn minus' data-product-id='" + productId + "'><i class='fa-solid fa-minus'></i></button>
						<input name='cart-quantity' class='cart-quantity' value='1' readonly='readonly'>
						<button type='button' class='quantity-btn plus' data-product-id='" + productId + "'><i class='fa-solid fa-plus'></i></button>
					</div>
				</div>
			</div>
			
			<div class="yes-cart">
				<div class="yes-cart-top">
					<div style="font-weight: bold;">
						너켓킹 8개
					</div>
					<button type="button" onclick=""><i class="fa-regular fa-circle-xmark"></i></button>
				</div>
				<div class="yes-cart-bottom">
					<div>
						<input class="cart-price" value="3,000원" readonly="readonly">
					</div>
					<div style="display: flex;">
						<button type='button' class='quantity-btn minus' data-product-id='" + productId + "'><i class='fa-solid fa-minus'></i></button>
						<input name='cart-quantity' class='cart-quantity' value='1' readonly='readonly'>
						<button type='button' class='quantity-btn plus' data-product-id='" + productId + "'><i class='fa-solid fa-plus'></i></button>
					</div>
				</div>
			</div>
			
			
			<div class="cart-tip">
				배달요금 ${restaurantInfo2.deliveryFee}원 별도
			</div>
			
			<!-- 장바구니에 메뉴가 담길 시 출력 -->
			<div class="cart-total">
				합계 : <input type="text" value="10000" class="valueinput" readonly="readonly">원			
			</div>
			
			<div class="cart-bottom">
				<button class="cart-button" type="button" onclick="location.href='${pageContext.request.contextPath}/order/order?restaurantNum=${restaurantNum}'">주문하기</button>
				<input type="hidden" value="${restaurantNum}">
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">

	// DOM 요소들 가져오기
	const choiceMenu = document.querySelector('.choice-menu');
	const choiceReview = document.querySelector('.choice-review');
	const choiceInfo = document.querySelector('.choice-info');
	
	const resShow1 = document.querySelector('.res-show1');
	const resShow2 = document.querySelector('.res-show2');
	const resShow3 = document.querySelector('.res-show3');
  
	// choice-menu 클릭 시 스타일 변경 및 res-show 숨김 처리
	choiceMenu.addEventListener('click', function() {
	    choiceMenu.classList.add('active');
	    choiceReview.classList.remove('active');
	    choiceInfo.classList.remove('active');
    
	    resShow1.style.display = 'block';
	    resShow2.style.display = 'none';
	    resShow3.style.display = 'none';
	});
  
	// choice-review 클릭 시 스타일 변경 및 res-show 숨김 처리
	choiceReview.addEventListener('click', function() {
	    choiceReview.classList.add('active');
	    choiceMenu.classList.remove('active');
	    choiceInfo.classList.remove('active');
	    
	    resShow1.style.display = 'none';
	    resShow2.style.display = 'block';
	    resShow3.style.display = 'none';
	});
  
	// choice-info 클릭 시 스타일 변경 및 res-show 숨김 처리
	choiceInfo.addEventListener('click', function() {
	    choiceInfo.classList.add('active');
	    choiceMenu.classList.remove('active');
	    choiceReview.classList.remove('active');
	    
	    resShow1.style.display = 'none';
	    resShow2.style.display = 'none';
	    resShow3.style.display = 'block';
	});
	
	choiceMenu.classList.add('active');
	
	
	<%-- 모달 --%>
	// div 클릭 이벤트 핸들러
	document.getElementById("submenu-modal").addEventListener("click", function() {
	// 모달 창 띄우기
		
	});
	
	function openModal(menuNum){
		$('#menuNum').modal('show');
	}
	
	
	
    function ajaxFun(url, method, query, dataType, fn) {
        $.ajax({
            type: method,
            url: url,
            data: query,
            dataType: dataType,
            success: function (data) {
                fn(data);
            }
        });
    }

    // 게시물 좋아요----------------------------------------------------------------------------

    let likeStatus = ${likeStatus};
    let likeBtn = document.getElementById('likeBtn');

    $(document).ready(function () {
        if (!likeStatus) $('#likeBtn').css("color", likeColor)
    });

    let likeColor = '#fa0050';
    let defaultColor = "#000000"

    function changeLikeStatus() {
    	console.log(likeStatus);
        if (likeStatus) {
            // 좋아요 
            // 1. 상태변경
            likeStatus = !likeStatus
            // 2. 색 변경
            $('#likeBtn').css("color", likeColor)
            console.log(likeStatus + " 좋아요 취소")

        } else {
            // 좋아요 취소
            // 1. 상태변경
            likeStatus = !likeStatus
            // 2. 색 변경
            $('#likeBtn').css("color", defaultColor)
            console.log(likeStatus + " 좋아요 요청")
        }
    }


    $(function () {
        $(".btnSendRecipeLike").click(function () {
            let msg = likeStatus ? "가게 찜 하시겠습니까 ?" : "찜을 취소하시겠습니까??";

            if (!confirm(msg)) {
                return false;
            }

            let url = "${pageContext.request.contextPath}/restaurant/like";
            let restaurantNum = "${restaurantNum}";
            let qs = "restaurantNum=" + restaurantNum;


            const fn = function (data) {
               let state = data.state;
               changeLikeStatus();
               
            };

            ajaxFun(url, "post", qs, "json", fn);
        });
    });

</script>