<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.column1 {
	width: 10px;
	height: 20px;
	padding: 20px;
}

.column2 {
	width: 100px;
}

.column3 {
	width: 60px;
}

.column4 {
	width: 140px;
	color: red;
}

.column5 {
	width: 50px;
}
</style>

<main id="main" class="main">
	<div class="pagetitle">
		<h1>신고 리스트</h1>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">

		<!-- Left side columns -->

		<!-- Reports -->
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">
						신고 목록 <span>| Today</span>
					</h5>
					<table class="table table-borderless" style="width: 1620px;">
						<thead>
							<tr>
								<th scope="col" class="column1">번호</th>
								<th scope="col" class="column2">신고 업체</th>
								<th scope="col" class="column3">신고된 회원</th>
								<th scope="col" style="width: 143px;">신고 사유</th>
								<th scope="col" class="column5">신고 일자</th>
							</tr>
						</thead>
					</table>



					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="1">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#content_1"
									aria-expanded="false" aria-controls="content_1"
									style="height: 70px;">
									<table class="table table-borderless ">
										<tr
											style="text-align: left; vertical-align: middle; padding-top: 20px;">
											<th scope="col" class="column1">1</th>
											<th scope="col" class="column2">상훈이네 족발집</th>
											<th scope="col" class="column3">박상훈</th>
											<th scope="col" class="column4">부적절한 언어 사용</th>
											<th scope="col" class="column5">2023-06-15</th>
										</tr>
									</table>
								</button>
							</h2>
							<div id="content_1" class="accordion-collapse collapse"
								aria-labelledby="1" data-bs-parent="#accordionExample" style="">
								<div class="accordion-body">
									<div class="review"
										style="background: white; border: 1px solid #d9d9d9; padding: 20px 15px;">
										<div class="review-top"
											style="display: flex; justify-content: space-between; margin-bottom: 10px;">
											<div class="review-name" style="display: flex; gap: 5px;">
												<div class="res-333" style="font-weight: bold">박상훈님</div>
												<div class="review-date">2023-06-13</div>
											</div>
											<div>
												<div class="dropdown">
													<button class="btn btn-secondary dropdown-toggle"
														type="button" data-bs-toggle="dropdown"
														aria-expanded="false">선택</button>
													<ul class="dropdown-menu">
														<li><button class="dropdown-item" type="button">삭제</button>
														</li>
														<li><button class="dropdown-item" type="button">숨김</button>
														</li>
														<li><button class="dropdown-item" type="button">신고
																취소</button></li>
													</ul>
												</div>
											</div>
										</div>
										<img class="review-img"
											src="/yogi/resources/picture/burgerking.png"
											style="width: 50%; border: 1px solid #d9d9d9;" />
										<div class="review-content"
											style="font-size: #14; color: #666666; margin: 20px 0 0 0;">맛있는버거킹</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- ----------------------------------------------------------------------- -->

					<div class="accordion" id="accordionExample2">
						<div class="accordion-item">
							<h2 class="accordion-header" id="2">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#content_2"
									aria-expanded="false" aria-controls="content_2">
									<table class="table table-borderless">
										<tbody>
											<tr style="text-align: left;">
												<th scope="col" class="column1">2</th>
												<th scope="col" class="column2">재혁이네 치킨집</th>
												<th scope="col" class="column3">강재혁</th>
												<th scope="col" class="column4">별점 테러</th>
												<th scope="col" class="column5">2023-06-15</th>
											</tr>
										</tbody>
									</table>
								</button>
							</h2>
							<div id="content_2" class="accordion-collapse collapse"
								aria-labelledby="2" data-bs-parent="#accordionExample2" style="">
								<div class="accordion-body">
									<div class="review"
										style="background: white; border: 1px solid #d9d9d9; padding: 20px 15px;">
										<div class="review-top"
											style="display: flex; justify-content: space-between; margin-bottom: 10px;">
											<div class="review-name" style="display: flex; gap: 5px;">
												<div class="res-333" style="font-weight: bold">강재혁님</div>
												<div class="review-date">2023-06-12</div>
											</div>
											<div>
												<div class="dropdown">
													<button class="btn btn-secondary dropdown-toggle"
														type="button" data-bs-toggle="dropdown"
														aria-expanded="false">선택</button>
													<ul class="dropdown-menu">
														<li><button class="dropdown-item" type="button">삭제</button>
														</li>
														<li><button class="dropdown-item" type="button">숨김</button>
														</li>
														<li><button class="dropdown-item" type="button">신고
																취소</button></li>
													</ul>
												</div>
											</div>
										</div>
										<img class="review-img"
											src="/yogi/resources/picture/burgerking.png"
											style="width: 50%; border: 1px solid #d9d9d9;" />
										<div class="review-content"
											style="font-size: #14; color: #666666; margin: 20px 0 0 0;">맛있는치킨</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- End Recent Sales -->
			</div>
		</div>
	</section>
</main>
<!-- End #main -->