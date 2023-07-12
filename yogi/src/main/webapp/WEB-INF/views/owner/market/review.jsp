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
   height: 200px;
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

.replyText {

   border: none;
   width: 100%;
   background: none;
   outline: none;
   resize: none;
   padding-top: 5px;
   min-height: 60px;
}

</style>

<main id="main" class="main">
<div class="whole-container">

   <div class="review-container">
      <!-- 리뷰 -->
      <div class="res-show2">
         <div class="review-rank">
            <div class="res-rank" style="font-size: 40px;">★</div>
            <div style="font-size: 48px;">${avgRating}</div>
         </div>
         
         <div class="review-cnt">
               클린리뷰 : ${reviewCount}개            
         </div>
         
         <!-- foreach로 돌리기 -->
         <!-- image가 없는 리뷰라면 if로 생략하기 -->
         <c:forEach var="rev" items="${reviewList}" varStatus="status">
         <c:if test="${rev.enabled==1}">
         <div class="review">
            <div class="review-top">
               <div class="review-name">
                  <div class="res-333" style="font-weight: bold;">${rev.nickName}님</div><div class="review-date">${rev.reg_date}</div>
               </div>
               <div>
               <c:if test="${rev.reportList==null}">
               <button class="report-btn btnReport" data-orderNum="${rev.orderNum}">신고</button>
               </c:if>
               <c:if test="${rev.reportList!=null}">
               <button class="report-btn btnReport" disabled="disabled" style="color: tomato;">신고된 게시물입니다.</button>
               </c:if>
               </div>
            </div>
            <div class="review-rating">
            <c:forEach var="i" begin="1" end="${rev.rating}">★</c:forEach>&nbsp;
            ${rev.rating}</div>
            <!-- ${rev.imgFileName} 사용 -->
            <c:if test="${rev.imgFileName != null}">
           	   <img class="review-img" src="${pageContext.request.contextPath}/uploads/review/${rev.imgFileName}">
            </c:if>
            <div class="review-content">
               ${rev.content}
            </div>
            <c:if test="${rev.reply!=null}">
            <!-- 사장님 답글 -->
            <form name="reviewForm2" id="reviewForm2-${rev.orderNum}" method="post">
               <div class="ownerReview">
                  <div style="display: flex; justify-content: space-between;">
                     <div class="ownerReview-top">
                        <i class="bi bi-arrow-return-right"></i>&nbsp;<div class="res-333" style="font-weight: bold;">사장님</div>&nbsp;<div class="review-date">${rev.reply_date}</div>
                     </div>
                     <div class="toggle-menu-${rev.orderNum}">
                        <div><button type="button" class="report-btn" id="updateBtn-${rev.orderNum}" onclick="replyUpdateOk(${rev.orderNum});">수정</button><span class="divider">|</span><button type="button" class="report-btn" onclick="location.href='${pageContext.request.contextPath}/owner/market/deleteReply?orderNum=${rev.orderNum}';">삭제</button></div>
                     </div>
                     <div class="toggle-menu2-${rev.orderNum}" style="display: none;">
                        <div>
                        	<button type="button" class="report-btn" id="updateBtn-${rev.orderNum}" onclick="sendOk2(${rev.orderNum});">수정완료</button><span class="divider">|</span><button type="button" class="report-btn btnUpdateCancel" data-orderNum="${rev.orderNum}">수정취소</button>
                        	<label style="display: none;">${rev.reply}</label>
                        </div>
                     </div>
                  </div>   
                  <div class="ownerReview-content">
                  	<textarea name="reply2" id="reply2-${rev.orderNum}" class="replyText" readOnly>${rev.reply}</textarea>
                  </div>
               </div>
            </form>
            </c:if>
            <c:if test="${rev.reply==null}"><!-- 답글이 있다면 숨기기 -->
            <div class="review-button-div">
               <button type="button" class="review-button btnAnswerModal" data-orderNum="${rev.orderNum}">답글 달기</button>
            </div>
            </c:if>
         </div>         
      </c:if>
      </c:forEach>
   </div>
   </div>


 
        <!-- 신고모달 -->
         <div class="modal" id="reportModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
                     <div class="modal-header">
                      <h5 class="modal-title">리뷰신고하기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <form name="reportInsertForm" method="post">
                   <div class="modal-body">
                      <textarea class="modal-text" name="content" placeholder="신고사유를 입력하세요."></textarea>
                   </div>
                    <div class="modal-footer">
                      <input type="hidden" name="orderNum">
                      <button type="button" class="modal-button addCart" data-bs-dismiss="modal" aria-label="Close">취소하기</button>
                      <button type="button" class="modal-button toOrder btnReportInsertOk">신고하기</button>
                    </div>
                    </form>
               </div>
            </div>
         </div>  
        <!-- 리뷰답글모달 -->
         <div class="modal" id="modal-answer" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
                     <div class="modal-header">
                      <h5 class="modal-title">리뷰 답글 달기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <form name="reviewForm" id="reviewForm" method="post">
                   <div class="modal-body">
                      <textarea class="modal-text" name="reply1" placeholder="답글을 입력하세요."></textarea>
                   </div>
                    <div class="modal-footer">
                      <input type="hidden" name="orderNum">
                      <button type="button" class="modal-button addCart " data-bs-dismiss="modal" aria-label="Close">취소하기</button>
                      <button type="button" class="modal-button toOrder btnSendAnswer" onclick="sendOk();">등록하기</button>
                    </div>
                    </form>
               </div>
            </div>
         </div>  
   
</div>
</main>

<script type="text/javascript">

//답글모달show
$(function() {
	$("body").on("click", ".btnAnswerModal", function(){
		
		let orderNum = $(this).attr("data-orderNum");
		document.reviewForm.orderNum.value = orderNum;
		
		$('#modal-answer').show();

	});
});


//답글등록
function sendOk() {
   const str = document.reviewForm.reply1.value;
    if (!str) {
       alert("답글을 입력하세요.");
       return;
   }
    
    const f = document.reviewForm;
    f.action = "${pageContext.request.contextPath}/owner/market/insertReply";
    f.submit();
}

<%-- 모달 --%>
function openModal(orderNum) {
   $('#modal-' + orderNum).show();
}

$('.addCart').click(function() {
    $('.modal').hide();
});

$('.btn-close').click(function() {
    $('.modal').hide();
});



function sendOk2(orderNum) {
   const str = document.getElementById('reply2-' + orderNum).value;
    if (!str) {
       alert("답글을 입력하세요.");
       return;
    }
   
    const d = document.getElementById('reviewForm2-' + orderNum);
    d.action = "${pageContext.request.contextPath}/owner/market/insertReply?orderNum=" + orderNum;
    d.submit();
}


function replyUpdateOk(orderNum){
   const textReply = document.getElementById('reply2-' + orderNum);
   textReply.readOnly = false;
   textReply.style.border = '1px solid #d9d9d9';
   textReply.style.background = 'white';
   
   const togglemenu = document.querySelector('.toggle-menu-' + orderNum);
   const togglemenu2 = document.querySelector('.toggle-menu2-'+ orderNum);
   
   togglemenu.style.display = "none";
   togglemenu2.style.display = "block";
};

function updateCancle(orderNum, reply) {
   const textReply = document.getElementById('reply2-' + orderNum);
   textReply.readOnly = true;
   textReply.style.border = 'none';
   textReply.style.background = 'none';
   textReply.value = reply;
   
   const togglemenu = document.querySelector('.toggle-menu-'+ orderNum);
   const togglemenu2 = document.querySelector('.toggle-menu2-'+ orderNum);
   
   togglemenu.style.display = "block";
   togglemenu2.style.display = "none";
}

$(function(){
	$("body").on("click", ".btnUpdateCancel", function(){
		let orderNum = $(this).attr("data-orderNum");
		let reply = $(this).closest("div").find("label").text();
		
		   const textReply = document.getElementById('reply2-' + orderNum);
		   textReply.readOnly = true;
		   textReply.style.border = 'none';
		   textReply.style.background = 'none';
		   textReply.value = reply;
		   
		   const togglemenu = document.querySelector('.toggle-menu-'+ orderNum);
		   const togglemenu2 = document.querySelector('.toggle-menu2-'+ orderNum);
		   
		   togglemenu.style.display = "block";
		   togglemenu2.style.display = "none";		
	});
});


//신고모달show
$(function(){
	$('.btnReport').click(function(){
		
		let orderNum=$(this).attr("data-orderNum");
		
		document.reportInsertForm.orderNum.value=orderNum;
		
		$('#reportModal').modal('show');
		
	});
});

//신고하기
$(function(){
	$('.btnReportInsertOk').click(function(){
		const f=document.reportInsertForm;
		const content=f.content.value;
		const orderNum=f.orderNum.value;
		
		if(content.trim()===""){
			alert("신고사유를 입력하세요.");
			f.content.focus();
			return;
		}
		
		let url="${pageContext.request.contextPath}/owner/market/insertReport";
		let query = $('form[name=reportInsertForm]').serialize();
		
		const fn=function(data){
			if(data.state=="false"){
				alert("리뷰를 신고하지 못했습니다.");
				return false;
			} else {
                window.location.href = "${pageContext.request.contextPath}/owner/market/review";
                $('#reportModal').modal('hide');
            }
			
		};
		
		ajaxFun(url,"post",query,"html",fn);
		
	});
});


</script>