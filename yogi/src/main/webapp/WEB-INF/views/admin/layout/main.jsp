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
									이용자 <span>| Total</span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
									</div>
									<div class="ps-3">
										<h6>145</h6>
										<span class="text-success small pt-1 fw-bold">12%</span> <span
											class="text-muted small pt-2 ps-1">increase</span>

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
										<h6>$3,264</h6>
										<span class="text-success small pt-1 fw-bold">8%</span> <span
											class="text-muted small pt-2 ps-1">increase</span>

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
										<h6>1244</h6>
										<span class="text-danger small pt-1 fw-bold">12%</span> <span
											class="text-muted small pt-2 ps-1">decrease</span>

									</div>
								</div>

							</div>
						</div>

					</div>
					<!-- End Customers Card -->

					<!-- Reports -->
					<div class="col-12">
						<div class="card">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
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
								<h5 class="card-title">
									Reports <span>/Today</span>
								</h5>

								<!-- Line Chart -->
								<div id="reportsChart"></div>

								<script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: 'Sales',
                          data: [31, 40, 28, 51, 42, 82, 56],
                        }, {
                          name: 'Revenue',
                          data: [11, 32, 45, 32, 34, 52, 41]
                        }, {
                          name: 'Customers',
                          data: [15, 11, 32, 18, 9, 24, 11]
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
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
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
                          type: 'datetime',
                          categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
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
											<th scope="col">메뉴</th>
											<th scope="col">가격</th>
											<th scope="col">주문한 회원</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row"><a href="#">#2457</a></th>
											<td>Brandon Jacob</td>
											<td><a href="#" class="text-primary">At praesentium
													minu</a></td>
											<td>$64</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2147</a></th>
											<td>Bridie Kessler</td>
											<td><a href="#" class="text-primary">Blanditiis
													dolor omnis similique</a></td>
											<td>$47</td>
											<td><span class="badge bg-warning">Pending</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2049</a></th>
											<td>Ashleigh Langosh</td>
											<td><a href="#" class="text-primary">At recusandae
													consectetur</a></td>
											<td>$147</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2644</a></th>
											<td>Angus Grady</td>
											<td><a href="#" class="text-primar">Ut voluptatem id
													earum et</a></td>
											<td>$67</td>
											<td><span class="badge bg-danger">Rejected</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2644</a></th>
											<td>Raheem Lehner</td>
											<td><a href="#" class="text-primary">Sunt similique
													distinctio</a></td>
											<td>$165</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
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
											<th scope="col">주문수</th>
											<th scope="col">사장님</th>
											<th scope="col">입점일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">2233</th>
											<td><a href="#" class="text-primary fw-bold">Ut
													inventore ipsa voluptas nulla</a></td>
											<td>$64</td>
											<td class="fw-bold">124</td>
											<td>$5,828</td>
										</tr>
										<tr>
											<th scope="row">2233</th>
											<td><a href="#" class="text-primary fw-bold">Exercitationem
													similique doloremque</a></td>
											<td>$46</td>
											<td class="fw-bold">98</td>
											<td>$4,508</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-3.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Doloribus
													nisi exercitationem</a></td>
											<td>$59</td>
											<td class="fw-bold">74</td>
											<td>$4,366</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-4.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Officiis
													quaerat sint rerum error</a></td>
											<td>$32</td>
											<td class="fw-bold">63</td>
											<td>$2,016</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-5.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Sit
													unde debitis delectus repellendus</a></td>
											<td>$79</td>
											<td class="fw-bold">41</td>
											<td>$3,239</td>
										</tr>
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
						<h5 class="card-title">관리자 주의사항</h5>

						<div class="activity">

							<div class="activity-item d-flex">
								<div>1</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">진상 응대 피하기</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>2</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">김선영 피하기</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>3</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">김지윤 피하기</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>4</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">민찬이형은 정상이 아니야</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>5</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">내가 퍼스트가 되겠어</span>
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div>6</div>
								<div class="activity-content">
									<span class="fw-bold text-dark">민찬어록</span>
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
							이벤트 <span>| current</span>
						</h5>

						<div style="min-height: 400px;">
							<table class="table table-borderless">

								<tbody>
									<tr>
										<td style="width: 80px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="#" class="text-primary">이벤트이름 길게길게가가가가가가</a></td>
										<td>2023.08.15</td>
										<td>
											<button type="button" class="btn btn-secondary btn-sm">종료</button>
										</td>
									</tr>

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
