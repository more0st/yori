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

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                                  <h5 class="card-title">주문상세정보</h5>
                  <table class="table table-bordered">
                  
                      <tr>
                        <th scope="col">주문업체명</th>
                        <td>승현이네 국밥집</td>
                      </tr>
                      <tr>
                        <th scope="col">주문번호</th>
                        <td>78900-12345</td>
                      </tr>
                      <tr>
                        <th scope="col">유저닉네임</th>
                        <td>한승현</td>
                      </tr>
                      <tr>
                        <th scope="col">주문일자</th>
                        <td>2023-06-20</td>
                      </tr>
                      <tr>
                        <th scope="col">주소</th>
                        <td>서울시 마포구 서교동 쌍용 2층</td>
                      </tr>
                      <tr>
                        <th scope="col">전화번호</th>
                        <td>010-1234-1234</td>
                      </tr>
                      <tr>
                        <th scope="col">요청사항</th>
                        <td class="overflow-ellipsis" >고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요고기많이주세요</td>
                      </tr>
                  </table>
                
                  <h5 class="card-title">메뉴정보 <span>총 수량 2개</span></h5>

                  <table class="table table-bordered datatable">
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th scope="col">메뉴</th>
                        <th scope="col">수량</th>
                        <th scope="col">가격</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>돼지국밥</td>
                        <td>1개</td>
                        <td>12,000원</td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>순대국밥</td>
                        <td>1개</td>
                        <td>12,000원</td>

                      </tr>
                    </tbody>
                  </table>
                  <div style="text-align: right;">
                      <span>총 금액 | </span><span  style=" font-weight: 800; font-size: 25px;">24,000원</span>
                  </div>
                  
                  
                  <h5 class="card-title">결제정보</h5>
                  <table class="table table-bordered">
                  
                      <tr>
                        <th scope="col">결제번호</th>
                        <td>12345-12345</td>
                      </tr>
                      <tr>
                        <th scope="col">결제일자</th>
                        <td>2023-06-20</td>
                      </tr>
                      <tr>
                        <th scope="col">결제방법</th>
                        <td>카카오페이</td>
                      </tr>
                      <tr>
                        <th scope="col">사용쿠폰</th>
                        <td>1,000원 쿠폰</td>
                      </tr>
                      <tr>
                        <th scope="col">결제상태</th>
                        <td>결제완료</td>
                      </tr>
                  </table>
                  <div style="display: flex; justify-content: center; gap : 5px;">
	                  <button type="button" class="btn btn-primary">접수</button>
	                  <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">취소</button>
		              <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/owner/order/orderList'">목록</button>
	                  <!-- 거절사유 입력하는 모달 띄우기 -->
	                  <!-- 접수 시 : 완료목록으로 넘어가고, (접수/취소) 버튼 대신 배달완료처리하는 버튼 띄우기 -->
                  </div>
                </div>
              </div>
            </div><!-- End Recent Sales -->
          </div>
    </section>
	
	<!-- 모달 -->
	<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">거절 사유</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form> 
		      <div class="modal-body">
				<div>
					<textarea rows="5" cols="52" style="outline:none; resize:none; border:1px solid #d5d5d5;"></textarea>
				</div>
				<div>
					
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">보내기</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
  </main><!-- End #main -->
