<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<style>
* {
	white-space: nowrap;
}

.overflow-ellipsis {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

</style>
  <script>
  window.addEventListener('DOMContentLoaded', () => {
	  const elements = document.querySelectorAll('.overflow-ellipsis');

	  const maxLength = 20;

	  elements.forEach(element => {
	    let text = element.innerText;

	    if (text.length > maxLength) {
	      text = text.substring(0, maxLength) + '...';
	    }

	    element.innerText = text;
	  });
	});
  </script>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>주문리스트</h1>
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
                  <h5 class="card-title">접수대기<span> | ${res.restaurantName}</span></h5>
                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th scope="col">주문번호</th>
                        <th scope="col">유저아이디</th>
                        <th scope="col">배달지</th>
                        <th scope="col">메뉴</th>
                        <th scope="col">금액</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">요청사항</th>
                        <th scope="col">주문상태</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orderList}" varStatus="status">
                   		 <c:if test="${order.statusName==1}"><!-- 접수대기인 목록 -->
	                   		 <tr><!-- forEach -->
		                        <th scope="row"><a href="#">${order.orderNum}</a></th>
		                        <td>${order.userId}</td>
		                        <td>${order.addr1} ${order.addr2}</td>
		                        <td>국밥 1개 외 3건 ...</td>
		                        <td>${order.total_price}원</td>
		                        <td>${order.tel}</td>
		                        <td class="overflow-ellipsis">${order.memo}</td>
		                        <td>
									<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/owner/order/orderDetail'">접수대기</button>
		                        </td>
		                      </tr><!-- forEach -->
	                      </c:if>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div><!-- End Recent Sales -->
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
                  <h5 class="card-title">완료<span> | ${res.restaurantName}</span></h5>

                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th scope="col">주문번호</th>
                        <th scope="col">유저아이디</th>
                        <th scope="col">배달지</th>
                        <th scope="col">메뉴</th>
                        <th scope="col">금액</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">요청사항</th>
                        <th scope="col">주문상태</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orderList}" varStatus="status">
                   		 <c:if test="${order.statusName!=1}"><!-- 접수완료인 목록(수정하기) -->
	                      <tr><!-- forEach -->
	                        <th scope="row"><a href="#">${order.orderNum}</a></th>
	                        <td>${order.userId}</td>
	                        <td>${order.addr1} ${order.addr2}</td>
	                        <td>국밥 1개 외 3건 ...</td>
	                        <td>${order.total_price}원</td>
	                        <td>${order.tel}</td>
	                        <td class="overflow-ellipsis">${order.memo}</td>
	                        <td>
	                        	<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/owner/order/orderDetail'">접수완료</button>
	                        </td>
	                      </tr><!-- forEach -->
	                      </c:if>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div><!-- End Recent Sales -->
          </div>
    </section>

  </main><!-- End #main -->