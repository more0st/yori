<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<main id="main" class="main">



	<section class="section dashboard">
		<div class="row">

			<!-- Left side columns -->
			<div class="col-lg-8">
				<div class="row">

					<!-- Sales Card -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card sales-card">

							<div class="card-body">
								<h5 class="card-title">
									가입회원 <span>| Total</span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
									</div>
									<div class="ps-3">
										<h6>${memberCount} 명</h6>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- End Sales Card -->



					<!-- Revenue Card -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card revenue-card">

							<div class="card-body">
								<h5 class="card-title">
									업체 <span>| Total</span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-shop"></i>
									</div>
									<div class="ps-3">
										<h6>${ownerCount} 입점</h6>
										<span class="text-success small pt-1 fw-bold"><fmt:formatNumber value="${totaySales}" type="currency"/></span> 

									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- End Revenue Card -->

					<!-- Customers Card -->
					<div class="col-xxl-4 col-xl-12">

						<div class="card info-card customers-card">

							<div class="card-body">
								<h5 class="card-title">입점 대기</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-person-plus-fill"></i>
									</div>
									<div class="ps-3">
										<h6>${ownerWaitCount} 대기</h6>
									</div>
								</div>

							</div>
						</div>

					</div>
					<!-- End Customers Card -->

					<!-- Reports -->
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">
									주간유입분석 <span>/week</span>
								</h5>

								<!-- Line Chart -->
								<div id="reportsChart"></div>

			<script type="text/javascript">
			
			//오늘날짜
			var today = new Date();
			// 오늘 기준 일주일전 날짜 계산
			var oneWeekAgo = new Date(today.getTime() - 7 * 24 * 60 * 60 * 1000);
			// 날짜 형식 변경
			function formatDate(date) {
			  var year = date.getFullYear();
			  var month = String(date.getMonth() + 1).padStart(2, '0');
			  var day = String(date.getDate()).padStart(2, '0');
			  return year + '-' + month + '-' + day;
			}
			//  날짜 배열 저장
			var dateArray = [];
			var currentDate = oneWeekAgo;
			while (currentDate <= today) {
			  dateArray.push(formatDate(currentDate));
			  currentDate.setDate(currentDate.getDate() + 1);
			}
			
            document.addEventListener("DOMContentLoaded", () => {
              new ApexCharts(document.querySelector("#reportsChart"), {
                series: [{
                  name: '회원',
                  data: [10,10,20,14,11,12,9],
                }, {
                  name: '업체',
                  data: [11,10,9,3,18,22,11]
                }],
                chart: {
                  height: 350,
                  type: 'area',
                  toolbar: {
                    show: false
                  },
                },
                markers: {
                  size: 4
                },
                colors: ['#4154f1', '#2eca6a'],
                fill: {
                  type: "gradient",
                  gradient: {
                    shadeIntensity: 1,
                    opacityFrom: 0.3,
                    opacityTo: 0.4,
                    stops: [0, 90, 100]
                  }
                },
                dataLabels: {
                  enabled: false
                },
                stroke: {
                  curve: 'smooth',
                  width: 2
                },
                xaxis: {
                  type: 'categories',
                  categories: dateArray
                },
                tooltip: {
                  x: {
                    format: 'dd/MM/yy HH:mm'
                  },
                }
              }).render();
            });
            </script>
								<!-- End Line Chart -->

							</div>

						</div>
					</div>
					<!-- End Reports -->

					<!-- Recent Sales -->
					<div class="col-12">
						<div class="card recent-sales overflow-auto">

							<div class="card-body">
								<h5 class="card-title">최근 주문</h5>

								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">업체</th>
											<th scope="col">주문 시간</th>
											<th scope="col">가격</th>
											<th scope="col">주문한 회원</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="sale" items="${recentSales}" varStatus="status">
										<tr>
											<th scope="row">${status.count}</th>
											<td>${sale.restaurantName}</td>
											<td>${sale.order_date}</td>
											<td><fmt:formatNumber value="${sale.total_price}" type="currency"/></td>
											<td style="padding: 0; display: flex; align-items: center; justify-content: center; height: 37px;"><div class="badge bg-success" style="height: 80%; width: 80%; font-size: 14px; display: flex; align-items: center; justify-content: center;">${sale.nickName}</div></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- End Recent Sales -->

					<!-- Top Selling -->
					<div class="col-12">
						<div class="card top-selling overflow-auto">

							<div class="card-body pb-0">
								<h5 class="card-title">
									주문순위 <span>| Month</span>
								</h5>

								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">업체</th>
											<th scope="col">매출</th>
											<th scope="col">사장님</th>
											<th scope="col">입점일</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="dto" items="${bestOwner}" varStatus="status">
										<tr>
											<th scope="row">${status.count}</th>
											<td scope="row">${dto.restaurantName}</td>
											<td scope="row"><fmt:formatNumber value="${dto.total_price}" type="currency"/></td>
											<td scope="row">${dto.userId}</td>
											<td scope="row">${dto.reg_date}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- End Top Selling -->

				</div>
			</div>
			<!-- End Left side columns -->

			<!-- Right side columns -->
			<div class="col-lg-4">

				<!-- Recent Activity -->
				<div class="card">


					<div class="card-body">
						<h5 class="card-title">관리자 체크리스트✔</h5>

						<div class="activity">

							<div class="activity-item d-flex">
								<div>1</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">입점업체 확인하기</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>2</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">신고된 회원 확인하기</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>3</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">업체 관리하기</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>4</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">민찬오빠 공지사항 띄어쓰기 야매로 할래요?</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>5</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">승현오빠 1:1문의 끝나면 왜 list로 넘어가죠?</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>6</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">ㅡㅅㅡ</span>
								</div>
							</div>
							<!-- End activity item-->

						</div>

					</div>
				</div>
				<!-- End Recent Activity -->

				



				<!-- 이벤트 관리 -->
				<div class="card">
					<div class="card-body pb-0">
						<h5 class="card-title">
							이벤트 <span>| Event</span>
						</h5>

						<div style="min-height: 400px;">
							<table class="table table-borderless">
							
								<tbody>
								<c:forEach var="event" items="${listEvent}">
									<tr style="white-space: nowrap;">
										<td style="width: 80px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<div class="overflow-ellipsis" style="font-weight: bold;">${event.subject}</div></td>
										<td>${event.end_date}</td>
										<td>
											<button type="button" class="btn btn-secondary btn-sm eventEndBtn" data-eventNum="${event.eventNum}" style="white-space: nowrap;">종료</button>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>

						</div>

					</div>
				</div>
				
				
				<!-- 이벤트 관리 종료 -->





			</div>
			<!-- End Right side columns -->

		</div>
	</section>

</main>
<!-- End #main -->

  <script type="text/javascript">
  window.addEventListener('DOMContentLoaded', () => {
	  const elements = document.querySelectorAll('.overflow-ellipsis');

	  const maxLength = 15;

	  elements.forEach(element => {
	    let text = element.innerText;

	    if (text.length > maxLength) {
	      text = text.substring(0, maxLength) + '...';
	    }

	    element.innerText = text;
	  });
	});
  
$(function() {
	$("body").on("click", ".eventEndBtn", function() {
		let eventNum = $(this).attr("data-eventNum");
		if(!confirm("이벤트를 종료하시겠습니까 ?")) {
			return;
		}
		
		location.href="${pageContext.request.contextPath}/endEventAdminOnly?eventNum=" + eventNum;
	});
});
  </script>
