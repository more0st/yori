<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.column1 {
	width: 62px;
	height: 20px;
	padding: 20px;
	white-space: nowrap;
}

.column2 {
	width: 200px;
	white-space: nowrap;
}

.column3 {
	width: 150px;
	white-space: nowrap;
}

.column4 {
	width: 140px;
	color: red;
	white-space: nowrap;
}

.column5 {
	width: 50px;
	white-space: nowrap;
}

.rep-parent {
	padding:15px;
	background: #eee;
	border-radius: 5px;
}

.rep-1 {
	display: inline-block;
	width: 10%;
	font-weight: 700;
}

.rep-2 {
	display: inline-block;
	width: 20%;
	font-weight: 700;
}

.rep-3 {
	display: inline-block;
	width: 20%;
	font-weight: 700;
}

.rep-4 {
	display: inline-block;
	width: 30%;
	color: red;
	font-weight: 700;
}

.rep-5 {
	display: inline-block;
	width: 10%;
	font-weight: 700;
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

					<!-- ----------------------------------------------------------------------- -->
					<div class="container-fluid rep-parent">
						<div class="rep-1">
							<span>번호</span>
						</div>
						<div class="rep-2">
							<span>신고 업체</span>
						</div>
						<div class="rep-3">
							<span>신고된 회원</span>
						</div>
						<div class="rep-4">
							<span>신고 사유</span>
						</div>
						<div class="rep-5">
							<span>신고 일자</span>
						</div>
					</div>

<!-- 
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="1">
								<button class="accordion-button collapsed" type="button"
									aria-expanded="false" style="height: 70px;">
									<div class="ssibal-1">
										<span>번호</span>
									</div>
									<div class="ssibal-2">
										<span>신고 업체</span>
									</div>
									<div class="ssibal-3">
										<span>신고된 회원</span>
									</div>
									<div class="ssibal-4">
										<span>신고 사유</span>
									</div>
									<div class="ssibal-5">
										<span>신고 일자</span>
									</div>
								</button>
							</h2>
						</div>
					</div>
 -->
					<!-- ----------------------------------------------------------------------- -->

					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="1">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#content_1"
									aria-expanded="false" aria-controls="content_1"
									style="height: 70px;">
									<div class="rep-1">
										<span>1</span>
									</div>
									<div class="rep-2">
										<span>상훈이네 족발집</span>
									</div>
									<div class="rep-3">
										<span>박상훈</span>
									</div>
									<div class="rep-4">
										<span>부적절한 언어 사용</span>
									</div>
									<div class="rep-5">
										<span>2023-06-15</span>
									</div>
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
									aria-expanded="false" aria-controls="content_2"
									style="height: 70px;">
									<div class="rep-1">
										<span>2</span>
									</div>
									<div class="rep-2">
										<span>재혁이네 치킨집</span>
									</div>
									<div class="rep-3">
										<span>강재혁</span>
									</div>
									<div class="rep-4">
										<span>별점 테러</span>
									</div>
									<div class="rep-5">
										<span>2023-06-15</span>
									</div>
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