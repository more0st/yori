<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<style>
* {
	white-space: nowrap;
}

.overflow-ellipsis {
  white-space: pre-wrap;
  overflow-wrap: break-word;
}
th {
width: 10%;
}
	
</style>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>주문상세내역</h1>
    </div><!-- End Page Title -->

    <section class="section dashboard">

        <!-- Left side columns -->
          <div class="row">

            <!-- Recent Sales -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">
                <div class="card-body">
                                  <h5 class="card-title">주문상세정보</h5>
                  <table class="table table-bordered">
                  
                      <tr>
                        <th scope="col">주문업체명</th>
                        <td>${orderInfo.restaurantName}</td>
                      </tr>
                      <tr>
                        <th scope="col">주문번호</th>
                        <td>${orderInfo.orderNum}</td>
                      </tr>
                      <tr>
                      <!-- 닉네임으로 변경 -->
                        <th scope="col">유저닉네임</th>
                        <td>${orderInfo.nickName}</td>
                      </tr>
                      <tr>
                        <th scope="col">주문일자</th>
                        <td>${orderInfo.order_date}</td>
                      </tr>
                      <tr>
                        <th scope="col">주소</th>
                        <td>${orderInfo.addr1}&nbsp;${orderInfo.addr2}</td>
                      </tr>
                      <tr>
                        <th scope="col">전화번호</th>
                        <td>${orderInfo.tel}</td>
                      </tr>
                      <tr>
                        <th scope="col">요청사항</th>
                        <td class="overflow-ellipsis" >${orderInfo.memo}</td>
                      </tr>
                  </table>
                
                  <h5 class="card-title">메뉴정보 <span>총 수량 ${menuCount}개</span></h5>

                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th scope="col" class="col-1">번호</th>
                        <th scope="col" class="col-5">메뉴</th>
                        <th scope="col"  class="col-3">수량</th>
                        <th scope="col"  class="col-4">가격</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:set var="totalMenuPrice" value="0" />
                    <c:forEach var="dto" items="${orderMenu}" varStatus="status">
                      <tr>
                        <th scope="row">${status.count}</th>
                        <td>${dto.menu} | ${dto.optionName}</td>
                        <td>${dto.orderCount}개</td>
                        <td>${dto.menuPrice}원</td>
                      </tr>
                      <c:set var="totalMenuPrice" value="${totalMenuPrice + dto.menuPrice}" />
                      </c:forEach>
                      <tr>
                        <td colspan="3" style="text-align: right;"></td>
                        <td colspan="1" style="text-align: left;">배달팁 ${paymentInfo.price - totalMenuPrice}원</td>
                      </tr>
                    </tbody>
                  </table>
                  <div style="text-align: right;">
                      <span>총 금액 | </span><span  style=" font-weight: 800; font-size: 25px;">${paymentInfo.price}원</span>
                  </div>
                  
                  
                  <h5 class="card-title">결제정보</h5>
                  <table class="table table-bordered">
                      <tr>
                        <th scope="col">결제번호</th>
                        <td>${paymentInfo.payNum}</td>
                      </tr>
                      <tr>
                        <th scope="col">결제일자</th>
                        <td>${paymentInfo.pay_date}</td>
                      </tr>
                      <tr>
                        <th scope="col">결제방법</th>
                        <td>${paymentInfo.payMethod}</td>
                      </tr>
                      <tr>
                        <th scope="col">사용쿠폰</th>
                        <td>${paymentInfo.couponNum==0?'사용한 쿠폰이 없습니다.':paymentInfo.couponNum}</td>
                      </tr>
                      <tr>
                        <th scope="col">결제상태</th>
                        <td>${paymentInfo.state==1?'결제완료':paymentInfo.state==0?'환불':'결제정보가 없습니다.'}</td>
                      </tr>
                  </table>
                  <form name="updateStatusForm" method="post">
	                  <div style="display: flex; justify-content: center; gap : 5px;">
	                  <c:if test="${statusNum==1}">
		                  <button type="button" class="btn btn-primary btnOk1">접수</button>
		                  <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#cancelModal">취소</button>
	                  </c:if>
	                  <c:if test="${statusNum==2}">
		                  <button type="button" class="btn btn-success btnOk2">배달시작</button>
	                  </c:if>
	                  <c:if test="${statusNum==3}">
		                  <button type="button" class="btn btn-warning btnOk3">배달완료</button>
	                  </c:if>
			              <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/owner/order/orderList'">목록</button>
	                  </div>
	                  <input type="hidden" name="orderNum" value="${orderNum}">
                  </form>
                  <c:if test="${statusNum==4}">
                  <div style="text-align: center; margin-top: 10px; font-weight: 700;">
                  <h5>배달이 완료된 주문입니다.</h5>
                  </div>
                  </c:if>
                </div>
              </div>
            </div><!-- End Recent Sales -->
          </div>
    </section>
	
	<!-- 모달 -->
	<div class="modal" id="cancelModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">거절 사유</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form name="cancelForm" method="post"> 
		      <div class="modal-body">
				<div>
					<textarea name="memo" rows="5" cols="52" style="outline:none; resize:none; border:1px solid #d5d5d5;"></textarea>
				</div>
				<div>
					
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary btnCancelOk">보내기</button>
		        <input type="hidden" name="orderNum" value="${orderNum}">
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
  </main><!-- End #main -->
<script>
window.addEventListener('DOMContentLoaded', () => {
	  const elements = document.querySelectorAll('.overflow-ellipsis');

	  const maxLength = 20;

	  elements.forEach(element => {
	    let text = element.innerText;

	    if (text.length > maxLength) {
	      element.classList.add('overflow-ellipsis');
	    }
	  });
	});
</script>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/owner/home";
}
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}
//접수
$(function(){
	$('.btnOk1').click(function(){
		
		let url="${pageContext.request.contextPath}/owner/order/updateStatus2";
		let query = $('form[name=updateStatusForm]').serialize();
		
		const fn=function(data){
			if(data.state=="false"){
				alert("접수를 실패하였습니다.");
				return false;
			} else {
                window.location.href = "${pageContext.request.contextPath}/owner/order/orderList";
            }
			
		};
		
		ajaxFun(url,"post",query,"html",fn);
		
	});
});

//배달시작
$(function(){
	$('.btnOk2').click(function(){
		
		let url="${pageContext.request.contextPath}/owner/order/updateStatus3";
		let query = $('form[name=updateStatusForm]').serialize();
		
		const fn=function(data){
			if(data.state=="false"){
				alert("배달시작처리를 실패하였습니다.");
				return false;
			} else {
                window.location.href = "${pageContext.request.contextPath}/owner/order/orderList";
            }
			
		};
		
		ajaxFun(url,"post",query,"html",fn);
		
	});
});

//배달완료
$(function(){
	$('.btnOk3').click(function(){
		
		let url="${pageContext.request.contextPath}/owner/order/updateStatus4";
		let query = $('form[name=updateStatusForm]').serialize();
		
		const fn=function(data){
			if(data.state=="false"){
				alert("배달완료처리를 실패하였습니다.");
				return false;
			} else {
                window.location.href = "${pageContext.request.contextPath}/owner/order/orderList";
            }
			
		};
		
		ajaxFun(url,"post",query,"html",fn);
		
	});
});

//주문 취소
$(function(){
	$('.btnCancelOk').click(function(){
		
		const f=document.cancelForm;
		const m=f.memo.value;
		
		if(m.trim() === ""){
			alert("취소사유를 입력하세요.");
			f.memo.focus();
			return;
		}
		
		let url="${pageContext.request.contextPath}/owner/order/cancelOrder";
		let query = $('form[name=cancelForm]').serialize();
		
		const fn=function(data){
			if(data.state=="false"){
				alert("주문 취소처리를 실패하였습니다.");
				return false;
			} else {
                // 리다이렉트 처리 후 모달 종료
                window.location.href = "${pageContext.request.contextPath}/owner/order/orderList";
                $('#cancelModal').modal('hide');
            }
			
		};
		
		ajaxFun(url,"post",query,"html",fn);
		
	});
});

</script>