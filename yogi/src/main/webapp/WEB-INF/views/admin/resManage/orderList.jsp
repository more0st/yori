<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>주문내역</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">admin</a></li>
					<li class="breadcrumb-item ">RestaurantList</li>
					<li class="breadcrumb-item active">주문내역</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		<!-- list 조회 -->
		<section class="section">
			<div class="card">
				<div class="card-body">

					<h3 class="card-title">${orderListCount} 건</h3>

					<table class="table table-hover admin-orderList-table">
						<thead>
							<tr style="white-space: nowrap;">
								<th scope="col">주문번호</th>
		                        <th scope="col">유저아이디</th>
		                        <th scope="col">배달지</th>
		                        <th scope="col">메뉴</th>
		                        <th scope="col">금액</th>
		                        <th scope="col">전화번호</th>
		                        <th scope="col">요청사항</th>
							</tr>
						</thead>
						<tbody>
						
						<c:if test="${empty orderList}">
						<tr>
							<td colspan="7" style="text-align: center; font-weight: bold;">주문내역이 없습니다.</td>
						</tr>
						</c:if>	
						 <c:forEach var="order" items="${orderList}" varStatus="status">
	                   		 <tr>
		                        <td style="font-weight: bold;">${order.orderNum}</td>
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
		                      </tr>
                      </c:forEach>
							
						</tbody>
					</table>
					<div style="display: flex; justify-content: center; gap : 5px;">
	                  
		              <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/resManage/main'">목록</button>
                  	</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
	
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
