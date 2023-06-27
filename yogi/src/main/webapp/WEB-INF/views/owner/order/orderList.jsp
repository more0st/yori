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
	                   		 <tr>
		                        <th scope="row"><a href="${pageContext.request.contextPath}/owner/order/orderDetail?orderNum=${order.orderNum}&statusName=${order.statusName}">${order.orderNum}</a></th>
		                        <td>${order.userId}</td>
		                        <td>${order.addr1} ${order.addr2}</td>
		                        <td>
		                        <c:forEach var="dto" items="${order.menuList}" varStatus="status">
		                        ${dto.menu} &nbsp;
		                        </c:forEach>
		                        </td>
		                        <td>${order.total_price}원</td>
		                        <td>${order.tel}</td>
		                        <td class="overflow-ellipsis">${order.memo}</td>
		                        <td>
									<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/owner/order/orderDetail?orderNum=${order.orderNum}&statusName=${order.statusName}'">접수대기</button>
		                        </td>
		                      </tr>
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
                   		 <c:if test="${order.statusName!=1 && order.statusName!=5}"><!-- 접수완료인 목록(수정하기) -->
	                      <tr><!-- forEach -->
	                        <th scope="row"><a href="${pageContext.request.contextPath}/owner/order/orderDetail?orderNum=${order.orderNum}&statusName=${order.statusName}">${order.orderNum}</a></th>
	                        <td>${order.userId}</td>
	                        <td>${order.addr1}&nbsp;${order.addr2}</td>
	                        <td>
	                       		<c:forEach var="dto" items="${order.menuList}" varStatus="status">
		                        	${dto.menu} &nbsp;
		                        </c:forEach>
	                        </td>
	                        <td>${order.total_price}원</td>
	                        <td>${order.tel}</td>
	                        <td class="overflow-ellipsis">${order.memo}</td>
	                        <td>
	                        <c:if test="${order.statusName==2}">
	                        	<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/owner/order/orderDetail?orderNum=${order.orderNum}&statusName=${order.statusName}'">접수완료</button>
	                        </c:if>
	                        <c:if test="${order.statusName==3}">
	                        	<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/owner/order/orderDetail?orderNum=${order.orderNum}&statusName=${order.statusName}'"> 배달중 </button>
	                        </c:if>
	                        <c:if test="${order.statusName==4}">
	                        	<button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/owner/order/orderDetail?orderNum=${order.orderNum}&statusName=${order.statusName}'">배달완료</button>
	                        </c:if>
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