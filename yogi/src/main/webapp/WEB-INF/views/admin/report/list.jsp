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


					<!-- ----------------------------------------------------------------------- -->

					<c:forEach var="dto" items="${list}" varStatus="status">

					<div class="accordion" id="accordionExample${dto.reportNum}">
						<div class="accordion-item">
							<h2 class="accordion-header" id="${dto.reportNum}">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#content_${dto.reportNum}"
									aria-expanded="false" aria-controls="content_${dto.reportNum}"
									style="height: 70px;">
									<div class="rep-1">
										<span>${dto.reportNum}</span>
									</div>
									<div class="rep-2">
										<span>${dto.restaurantName}</span>
									</div>
									<div class="rep-3">
										<span>${dto.userId}</span>
									</div>
									<div class="rep-4">
										<span>${dto.content}</span>
									</div>
									<div class="rep-5">
										<span>${dto.reg_date}</span>
									</div>
								</button>
							</h2>
							<div id="content_${dto.reportNum}" class="accordion-collapse collapse"
								aria-labelledby="${dto.reportNum}" data-bs-parent="#accordionExample${dto.reportNum}" style="">
								<div class="accordion-body">
									<div class="review"
										style="background: white; border: 1px solid #d9d9d9; padding: 20px 15px;">
										<div class="review-top"
											style="display: flex; justify-content: space-between; margin-bottom: 10px;">
											<div class="review-name" style="display: flex; gap: 5px;">
												<div class="res-333" style="font-weight: bold"><a href="${pageContext.request.contextPath}/admin/memberManage/detail?userId=${dto.userId}">${dto.userName}</a></div>
												<div class="review-date">${dto.revReg_date}</div>
											</div>
											<div>
												<div class="dropdown">
													<button class="btn btn-secondary dropdown-toggle"
														type="button" data-bs-toggle="dropdown"
														aria-expanded="false">선택</button>
													<ul class="dropdown-menu">
														<li><button class="dropdown-item" type="button" onclick="deleteReview(${dto.orderNum});">리뷰 삭제</button>
														</li>
														
														<c:choose>
															<c:when test="${dto.enabled == 0}">
																<li><button class="dropdown-item" type="button" onclick="hideRelease(${dto.orderNum});">숨김 해제</button>
																</li>
															</c:when>
															<c:otherwise>
																<li><button class="dropdown-item" type="button" onclick="hideReview(${dto.orderNum});">리뷰 숨김</button>
																</li>
															</c:otherwise>
														</c:choose>
														
														<li><button class="dropdown-item" type="button" onclick="cancelReport(${dto.reportNum});">신고 취소</button></li>
													</ul>
												</div>
											</div>
										</div>
										<c:if test="${dto.imgFileName != null}">
										<img class="review-img"
											src="${pageContext.request.contextPath}/uploads/review/${dto.imgFileName}"
											style="width: 50%; border: 1px solid #d9d9d9;" />
										</c:if>	
										<div class="review-content"
											style="font-size: #14; color: #666666; margin: 20px 0 0 0;">${dto.revContent}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					</c:forEach>

					<!-- ----------------------------------------------------------------------- -->

				</div>

				<!-- End Recent Sales -->
			</div>
		</div>
	</section>
</main>

<script type="text/javascript">

function deleteReview(orderNum) {
	if(confirm("리뷰를 삭제하시겠습니까 ?")) {
		let url = "${pageContext.request.contextPath}/admin/report/delete?orderNum="+ orderNum;
		location.href = url;
	}
}

function hideReview(orderNum) {
	if(confirm("리뷰를 숨기시겠습니까 ?")) {
		let url = "${pageContext.request.contextPath}/admin/report/hide?orderNum="+ orderNum;
		location.href = url;
	}
}

function hideRelease(orderNum) {
	if(confirm("숨김을 해제 하시겠습니까 ?")) {
		let url = "${pageContext.request.contextPath}/admin/report/release?orderNum="+ orderNum;
		location.href = url;
	}
}

function cancelReport(reportNum) {
	if(confirm("신고를 취소 하시겠습니까 ?")) {
		let url = "${pageContext.request.contextPath}/admin/report/cancel?reportNum="+ reportNum;
// 		alert(url);
		location.href = url;
	}
}

</script>

<!-- End #main -->