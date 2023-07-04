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
   background: #eee;
   height: 50px;
   border-radius: 5px;
   color: white;
   font-weight: bold;
}

.cart-button:enabled{
   background: #fa0050;
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

.totalOption{
   background: none;
   border: none; 
   outline: none;
   text-align: right;
   color:#fa0050;
   font-weight: bold;
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
                  <c:if test="${empty restaurantInfo.imageFilename}">
                     <img class="res-img" src="${pageContext.request.contextPath}/resources/picture/default.png">
                  </c:if>
                  <c:if test="${not empty restaurantInfo.imageFilename}">
                     <img class="res-img" src="${pageContext.request.contextPath}/uploads/owner/market/${restaurantInfo.imageFilename}">
                  </c:if>
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
                     <c:if test="${menu.stock==1}">
	                        <div class="accordion-body" onclick="openModal(${menu.menuNum})">
	                        <input type="hidden" id="menuNum" value="${menu.menuNum}"> 
	                        <input type="hidden" id="menuName" value="${menu.menu}"> 
	                           <div>
	                           <div style="font-weight: bold; margin-bottom: 5px;">${menu.menu}</div>
	                           <div>${menu.price}원</div>
	                           </div>
	                           <c:if test="${not empty menu.imageFilename}">
	                              <div>
	                                 <img class="menu-img" src="${pageContext.request.contextPath}/uploads/owner/menu/${menu.imageFilename}">
	                              </div>
	                           </c:if>
	                        </div>
                        </c:if>
                        
                        <!-- 품절상태 -->
                        <c:if test="${menu.stock==0}">
	                        <div class="accordion-body" style="background:#F8F7F7">
	                        <input type="hidden" id="menuNum" value="${menu.menuNum}"> 
	                        <input type="hidden" id="menuName" value="${menu.menu}"> 
	                           <div>
	                           <div style="font-weight: bold; margin-bottom: 5px;">${menu.menu} <span style="color:red"> (품절)</span></div>
	                           <div>${menu.price}원</div>
	                           </div>
	                           <c:if test="${not empty menu.imageFilename}">
	                              <div>
	                                 <img class="menu-img" src="${pageContext.request.contextPath}/uploads/owner/menu/${menu.imageFilename}">
	                              </div>
	                           </c:if>
	                        </div>
                        </c:if>
                        
                           <!-- 모달 -->
                        <div class="modal" id="modal-${menu.menuNum}" tabindex="-1" aria-labelledby="staticBackdropLabel">
                           <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content">
                                    <div class="modal-header">
                                     <h5 class="modal-title">${menu.menu}</h5>
                                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal(${menu.price},${menu.menuNum});"></button>
                                    </div>
                                  <div class="modal-body">
                                     <div class="modal-top">
                                        <img class="modal-img" src="${pageContext.request.contextPath}/uploads/owner/menu/${menu.imageFilename}">
                                     </div>
                                     <div class="modal-menu">
                                        ${menu.menu}
                                     </div>
                                     <hr>
                                     <div class="modal-price">
                                        <div>
                                          가격                               
                                        </div>
                                        <div>
                                           ${menu.price}원
                                           <input type="hidden" name="menuPrice" id="menuPrice" value="${menu.price}">
                                        </div>
                                     </div>
                                     <hr>
                                     
                                     <c:forEach var="option" items="${menu.optionList}" varStatus="status">
                                        <div class="modal-price">
                                           ${option.optionGroup}
                                        </div>
                                        <c:forEach var="optionDetail" items="${option.nameList}" varStatus="status">
                                           <div class="modal-option">
                                              <div style="display: flex; width: 150px; gap: 10px; align-items: center;">
                                                 <input class="modal-radio" type="checkbox" name="check${optionDetail.optionNum}" onchange="updateTotalOption(${menu.menuNum}, ${menu.price}, ${optionDetail.price}, this.checked, '${optionDetail.optionName}')"><div>${optionDetail.optionName}</div>
                                              </div>
                                              <div>
                                                 ${optionDetail.price} 원
                                                 <input type="hidden" id="optionPrice" name="optionPrice" value="${optionDetail.price}">
                                              </div>
                                           </div>
                                        </c:forEach>
                                     </c:forEach>
                                     
                                     <div class="modal-total">
                                        <div style="font-weight: bold;">
                                           총 주문금액
                                        </div>
                                        <div>
                                           <div style="font-size: 24px; color: #fa0050; text-align: right; font-weight: bold;">
                                              <input type="text" value="${menu.price}" name="totalOption-${menu.menuNum}" class="totalOption totalOption-${menu.menuNum}" readonly="readonly"> 원
                                           </div>
                                           <div style="font-size: 12px; text-align: right">
                                              (최소주문금액 ${restaurantInfo.basePrice}원)
                                           </div>
                                        </div>
                                     </div>
                                     
                                  </div>
                                   <div class="modal-footer">
                                     <button type="button" class="modal-button addCart" onclick="addToCart(${menu.menuNum},'${menu.menu}');closeModal(${menu.price},${menu.menuNum});">주문표에 추가</button>
                                     <button type="button" class="modal-button toOrder" onclick="addToOrder2(${menu.menuNum},'${menu.menu}',${restaurantNum},${restaurantInfo2.deliveryFee});">주문하기</button>
                                   </div>
                              </div>
                           </div>
                        </div>
                  
                       </c:forEach>
                   </div>
                 </c:forEach>
                 </div>
               </div> <!-- 아코디언 끝 -->
                  
                  
            </div>

            <!-- 리뷰 -->
            <div class="res-show2" style="display: none;">
               <div class="review-rank">
                  <div class="res-rank" style="font-size: 40px;">★</div>
                  <div style="font-size: 48px;">${restaurantInfo2.rating}</div>
               </div>
               
               <c:if test="${empty reviewList}">
                  <div class="review" style="color: #333; font-weight: bold; text-align: center;">등록된 리뷰가 없습니다.</div>
               </c:if>
               <c:if test="${not empty reviewList}">
                  <c:forEach var="review" items="${reviewList}" varStatus="status">
                  <div class="review">
                     <div class="review-top">
                        <div class="review-name">
                           <!-- 닉네임 -->
                           <div class="res-333" style="font-weight: bold;">${review.nickName}님</div><div class="review-date">${review.regDate}</div>
                        </div>
                     </div>
                     <div class="review-rating">
                     <c:forEach var="i" begin="1" end="${review.star}">★</c:forEach>
                     </div>
                     <c:if test="${not empty review.imgFileName}">
                        <img class="review-img" src="${pageContext.request.contextPath}/uploads/review/${review.imgFileName}">
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
               <button class="cart-top-icon" type="button" onclick="deleteAll();"><i class="fa-solid fa-trash-can"></i></button>
            </div>
         </div>
         
         <!-- 주문 내역 -->
         <div class="cart-order"></div>
         
         
         <div class="cart-tip">
            배달요금 ${restaurantInfo2.deliveryFee}원 별도
         </div>
         
         <!-- 장바구니에 메뉴가 담길 시 출력 -->
         <div class="cart-total">
            합계 : <input type="text" value="0" class="valueinput">원         
         </div>
         
         <div class="cart-bottom">
            <button class="cart-button" type="button" onclick="addToOrder(${restaurantNum},${restaurantInfo2.deliveryFee});" disabled="disabled">주문하기</button>
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
   
   
   // 모달 
   function openModal(menuNum){
      $('#modal-' + menuNum).modal('show');
   }
   
   $(document).ready(function(){
        $(".modal").modal({
          backdrop: "static",
          keyboard: false
      });
   });
   
   
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

        } else {
            // 좋아요 취소
            // 1. 상태변경
            likeStatus = !likeStatus
            // 2. 색 변경
            $('#likeBtn').css("color", defaultColor)
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
    
    
    //--------------------------------------------------------

    let menuarr = [];
    let optionarr = [];
    let optionOne = [];
    
    // 모달 내부 가격 ------------------------------------------
	function updateTotalOption(menuNum, firstPrice, price, checked, optionName) {
       const totalOptionField = document.querySelector('.totalOption-'+menuNum);
       const currentTotal = parseInt(totalOptionField.value);
       const updatedTotal = checked ? currentTotal + price : currentTotal - price;
       
       const optionIndex = optionarr.findIndex(option => option.optionName === optionName);
       
       if (checked == true) {
           if (optionIndex === -1) {
               optionarr.push({ optionName: optionName });
               optionOne.push({ optionName: optionName });
           }
       } else {
           if (optionIndex !== -1) {
               optionarr.splice(optionIndex, 1);
               optionOne.splice(optionIndex, 1);
           }
       }
       
       const optionarrString = JSON.stringify(optionarr);
       const optionarrString2 = JSON.stringify(optionOne);
       
       // console.log('원래가격 : ' + firstPrice + ', 옵션포함 가격 : ' + updatedTotal + ', 옵션 : ' + optionarrString);
       
       totalOptionField.value = updatedTotal;
    }
    
    // [ 모달 창이 닫힐 때 호출되는 함수 ]
	function closeModal(price, menuNum) {
		const totalOptionField = document.querySelector('.totalOption-'+menuNum);
		totalOptionField.value = price;
         
		// 배열 초기화
		optionarr = [];

		// 체크 박스 요소들을 찾아서 해제
		const checkboxes = document.querySelectorAll('input[type="checkbox"]');
		checkboxes.forEach((checkbox) => {
			checkbox.checked = false;
		});
	}
    
    
    // [ String으로 바꿔주기 ]
    var options;
 
    function makeString() {
       options = optionarr.map(function(option) {
           return option.optionName;
       }).join(',');

       console.log(options);
   }

    let cartCount = 1;
    var quantity = 1;
    
    // [주문표에 추가] ---------------------------------------------
    function addToCart(menuNum, menuName) {
       const totalOptionField = document.querySelector('.totalOption-'+menuNum);
       const price = parseInt(totalOptionField.value);
       
       const optionarrString = JSON.stringify(optionarr);
       
       makeString();
       
       var menuItem = {
          menuNum : menuNum,
          menuName: menuName,
          quantity: quantity,
          price : price,
          options: options,
          cartCount: cartCount
       }
       
		// 이미 있는지 검사하기
		var isAlreadyAdded = menuarr.some(function(menuItem){
		   return menuItem.menuNum == menuNum && menuItem.options == options;
		});
       
		const index = menuarr.findIndex(menuItem => menuItem.menuNum == menuNum && menuItem.options == options);
         
		if(isAlreadyAdded){
		   if (index !== -1) {
		      menuItem.quantity = parseInt(menuarr[index].quantity) + 1;
		      menuarr.splice(index, 1);
		      $('.cart-order .yes-cart').eq(index).remove();
		   }
		}
		
		menuarr.push(menuItem);
		
		let totalPrice = 0;
		menuarr.forEach((item) => {
		     totalPrice += item.quantity * item.price;
		 });
		
		const total = document.querySelector('.valueinput');
		total.value = parseInt(totalPrice);
		
		let out = "";
	   
		out += "<div class='yes-cart'><div class='yes-cart-top'><div style='font-weight: bold;'>"+ menuName +" : "+ options +"</div>";
		out +=   "<button type='button' class='delete-btn'><i class='fa-regular fa-circle-xmark'></i></button></div>"
		out +=   "<div class='yes-cart-bottom'><div><input class='cart-price cartPrice-"+ cartCount +"' value='"+ price +"' readonly='readonly'></div>"
		out +=   "<div style='display:flex;'><button type='button' class='quantity-btn minus' data-count='"+ cartCount +"' data-product-id='" + menuNum + "'><i class='fa-solid fa-minus'></i></button>"
		out +=   "<input name='cart-quantity' class='cart-quantity' value='"+ menuItem.quantity +"' readonly='readonly'>"
		out +=   "<button type='button' class='quantity-btn plus' data-count='"+ cartCount +"' data-product-id='" + menuNum + "'><i class='fa-solid fa-plus'></i></button>"
		out += "</div></div><input type='hidden' class='menuNum' value='"+ menuNum +"'><input type='hidden' class='cartCount' value='"+ cartCount +"'></div>";
	  
		$('.cart-order').append(out);
		cartCount++;
		$(".modal").modal("hide");
		
		checkCondition();
	}
    
    // 최소 주문금액 확인 -------------------------------------------
    let orderbtn = document.querySelector(".cart-button");	// 주문하기 버튼
    let condition = false;	// 조건 만족하는지
    
    function checkCondition(){
    	let minimum = document.querySelector('.infoinput').value;

        let totalPrice = 0;
         menuarr.forEach((item) => {
             totalPrice += item.quantity * item.price;
         });
         
         if(parseInt(totalPrice) >= parseInt(minimum)){
            condition = true;
         } else {
        	 condition = false;
         }
         
    	if(condition){
    		orderbtn.disabled=false;
    	} else{
    		orderbtn.disabled=true;
    	}
    }
    
    checkCondition();
   
    
    // [주문표 부분 삭제]-------------------------------------------------
    $(document).on("click", ".delete-btn", function() {
      $(this).closest(".yes-cart").remove();
      let cartCount = $(this).closest(".yes-cart").find('.minus').attr("data-count");
      console.log(cartCount);
      
      const menuNum = $(this).closest(".yes-cart").find(".menuNum").val();
      const index = menuarr.findIndex(menuItem => menuItem.cartCount == cartCount );
      
      if (index !== -1) {
         menuarr.splice(index, 1);
      }
      
      let totalPrice = 0;
        menuarr.forEach((item) => {
            totalPrice += item.quantity * item.price;
        });
        
      const total = document.querySelector('.valueinput');
      total.value = totalPrice;
       
      const menuarrString = JSON.stringify(menuarr);
      checkCondition();
   });
    
    // [주문표 전체 삭제]
   function deleteAll(){
     let msg = "삭제하시겠습니까?";
     if(!confirm(msg)){
    	 return;
     }
    	
      const cartItems = document.getElementsByClassName("yes-cart");

      Array.from(cartItems).forEach((cartItem) => {
         cartItem.remove();
      });
       
      const total = document.querySelector('.valueinput');
      total.value = 0;
      
      // 배열 초기화
      menuarr=[];
      
      checkCondition();
    }
    
    // [-] 버튼 클릭 시
    $(function() {
		$("body").on("click", ".minus", function() {
			let cartCount = $(this).attr("data-count");
			let div = $(this).closest("div");
			let quantityInput = div.find('.cart-quantity');
		    let value = parseInt(quantityInput.val());
		    
		    if (value > 1) {
	             value--;
	             quantityInput.val(value);

	             const menuNum = $(this).closest(".yes-cart").find(".menuNum").val();
	             updateProductQuantity(menuNum.toString(), value.toString(), cartCount);
	         }
		    
		    checkCondition(); 
		});
	});
    
	// [+] 버튼 클릭 시
    $(function() {
		$("body").on("click", ".plus", function() {
			let cartCount = $(this).attr("data-count");
			let div = $(this).closest("div");
			let quantityInput = div.find('.cart-quantity');
		    let value = parseInt(quantityInput.val());
		    
		    if (value < 50) {
	             value++;
	             quantityInput.val(value);

	             const menuNum = $(this).closest(".yes-cart").find(".menuNum").val();
	             updateProductQuantity(menuNum.toString(), value.toString(), cartCount);
	         }
		    checkCondition(); 
		});
	});
    
   
    function updateProductQuantity(menuNum, quantity, cartCount) {
        let menuItem = menuarr.find(menuItem => menuItem.cartCount == cartCount);
      
        if (menuItem) {
           menuItem.quantity = quantity;
        } else {
           menuarr.push({ cartCount, quantity, menuNum });
        }
        
        let totalPrice = 0;
        menuarr.forEach((item) => {
            totalPrice += item.quantity * item.price;
        });
        
      const total = document.querySelector('.valueinput');
      total.value = totalPrice;
      
      const cartPrice = document.querySelector('.cartPrice-'+cartCount);
      cartPrice.value = menuItem.price*menuItem.quantity;
      
    }
    
    
    // [string으로 바꿔주기2]
    var menuNums;
    var menuOptions;
    var menuQuantities;
    var menuPrices;
    
    function makeString2() {
       menuNums = menuarr.map(function(menuItem) {
           return menuItem.menuNum
       }).join(',');

       menuOptions = menuarr.map(function(menuItem) {
          if(menuItem.options == ''){
             return '옵션없음'
          }else{
             return menuItem.options
          }
       }).join('-');
       
       menuNames = menuarr.map(function(menuItem) {
           return menuItem.menuName
       }).join(',');
       
       menuQuantities = menuarr.map(function(menuItem) {
           return menuItem.quantity
       }).join(',');
       
       menuPrices = menuarr.map(function(menuItem) {
           return menuItem.price*menuItem.quantity
       }).join(',');
       
   }
    
    // [주문버튼] 주문시 필요한 정보를 담아 order로
    function addToOrder(restaurantNum, deliveryFee){
       
       let minimum = document.querySelector('.infoinput').value;

       let totalPrice = 0;
        menuarr.forEach((item) => {
            totalPrice += item.quantity * item.price;
        });
        
        if(parseInt(totalPrice) < parseInt(minimum)){
           alert('최소 주문 금액을 채워주세요.')
           return;
        }
        
        makeString2();
        
        // restaurantNum : 가게 번호
        // deliveryFee : 배달비
        // totalPrice : 전체 금액(배달비 미포함)
        // menuNums : 메뉴
        // menuNames : 메뉴 이름
        // menuOptions : 각 메뉴 옵션 
        // menuQuantities : 각 메뉴 개수
        // menuPrices : 각 메뉴 가격 (옵션 포함한 메뉴 가격 * 개수)
       location.href='${pageContext.request.contextPath}/order/order?restaurantNum='+restaurantNum
                +'&deliveryFee='+deliveryFee+"&totalPrice=" + totalPrice
                +"&menuNums="+menuNums+"&menuNames="+menuNames+"&menuOptions="+menuOptions+"&menuQuantities="+menuQuantities
                +"&menuPrices="+menuPrices;
    }
    
    menuNums = 0;
    menuOptions = 0;
    menuQuantities = 0;
    menuPrices = 0;
    
    // [주문버튼] 개별 주문
    //${menu.menuNum},'${menu.menu}',${restaurantNum},${restaurantInfo2.deliveryFee}
    function addToOrder2(menuNum, menuName, restaurantNum, deliveryFee){
        let minimum = document.querySelector('.infoinput').value;
        
        const totalOptionField = document.querySelector('.totalOption-'+menuNum);
        const price = parseInt(totalOptionField.value);
        const optionarrString = JSON.stringify(optionarr);
        
        makeString();
        
        var menuItem = {
           menuNum : menuNum,
           menuName: menuName,
           quantity: 1,
           price : price,
           options: options,
           cartCount: cartCount
        }
        
 		// 이미 있는지 검사하기
 		var isAlreadyAdded = menuarr.some(function(menuItem){
 		   return menuItem.menuNum == menuNum && menuItem.options == options;
 		});
        
 		const index = menuarr.findIndex(menuItem => menuItem.menuNum == menuNum && menuItem.options == options);
          
 		if(isAlreadyAdded){
 		   if (index !== -1) {
 		      menuItem.quantity = parseInt(menuarr[index].quantity) + 1;
 		      menuarr.splice(index, 1);
 		      $('.cart-order .yes-cart').eq(index).remove();
 		   }
 		}
 		
 		menuarr.push(menuItem);
 		
 		let totalPrice = 0;
		menuarr.forEach((item) => {
		     totalPrice += item.quantity * item.price;
		 });
		
		if(parseInt(totalPrice) < parseInt(minimum)){
           alert('최소 주문 금액을 채워주세요.')
           let out = "";
	   
			out += "<div class='yes-cart'><div class='yes-cart-top'><div style='font-weight: bold;'>"+ menuName +" : "+ options +"</div>";
			out +=   "<button type='button' class='delete-btn'><i class='fa-regular fa-circle-xmark'></i></button></div>"
			out +=   "<div class='yes-cart-bottom'><div><input class='cart-price cartPrice-"+ cartCount +"' value='"+ price +"' readonly='readonly'></div>"
			out +=   "<div style='display:flex;'><button type='button' class='quantity-btn minus' data-count='"+ cartCount +"' data-product-id='" + menuNum + "'><i class='fa-solid fa-minus'></i></button>"
			out +=   "<input name='cart-quantity' class='cart-quantity' value='"+ menuItem.quantity +"' readonly='readonly'>"
			out +=   "<button type='button' class='quantity-btn plus' data-count='"+ cartCount +"' data-product-id='" + menuNum + "'><i class='fa-solid fa-plus'></i></button>"
			out += "</div></div><input type='hidden' class='menuNum' value='"+ menuNum +"'><input type='hidden' class='cartCount' value='"+ cartCount +"'></div>";
	  
			$('.cart-order').append(out);
			cartCount++;
			$(".modal").modal("hide");
		
			checkCondition();
           return;
        }
        
        makeString2();
        
        // restaurantNum : 가게 번호
        // deliveryFee : 배달비
        // totalPrice : 전체 금액(배달비 미포함)
        // menuNums : 메뉴
        // menuNames : 메뉴 이름
        // menuOptions : 각 메뉴 옵션 
        // menuQuantities : 각 메뉴 개수
        // menuPrices : 각 메뉴 가격 (옵션 포함한 메뉴 가격 * 개수)
       location.href='${pageContext.request.contextPath}/order/order?restaurantNum='+restaurantNum
                +'&deliveryFee='+deliveryFee+"&totalPrice=" + totalPrice
                +"&menuNums="+menuNums+"&menuNames="+menuNames+"&menuOptions="+menuOptions+"&menuQuantities="+menuQuantities
                +"&menuPrices="+menuPrices;
       
        
    }
    
</script>