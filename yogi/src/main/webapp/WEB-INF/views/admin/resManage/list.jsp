<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>업체 목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">admin</a></li>
					<li class="breadcrumb-item active">RestaurantList</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		<!-- list 조회 -->
		<section class="section">
			<div class="card">
				<div class="card-body">

					<h3 class="card-title">총 ${dataCount} 건</h3>

					<table class="table table-hover admin-restaurantList-table">
						<thead>
							<tr>
								<th scope="col">업체번호</th>
								<th scope="col">상호명</th>
								<th scope="col">대표</th>
								<th scope="col">전화번호</th>
								<th scope="col">입점일자</th>
								<th scope="col">주문내역</th>
								<th scope="col">상태</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<th scope="row" style="text-align: center;">${dto.restaurantNum}</th>
								<td>${dto.restaurantName}</td>
								<td>${dto.userName}</td>
								<td>${dto.restaurantTel}</td>
								<td>${dto.reg_date}</td>
								<td><a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/resManage/orderList?restaurantNum=${dto.restaurantNum}"
									role="button">주문내역</a></td>
								<td>${dto.enabled==1?"사용 가능":"정지"}</td>
								<td>
									<div class="d-grid gap-2 d-md-block">
										<c:choose>
											<c:when test="${dto.enabled==1}">
												<button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#modal${status.index}">정지</button>
												<input id="suspendId" type="hidden" value="${dto.restaurantNum}">
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-outline-primary btn-sm" onclick="release" data-bs-target="${status.index}">해제</button>
												<input id="suspendId" type="hidden" value="${dto.restaurantNum}">
											</c:otherwise>
										</c:choose>
										<button type="button" class="btn btn-outline-danger btn-sm">탈퇴</button>
									</div>
								</td>
							</tr>
						</c:forEach>	
						
						</tbody>
					</table>
				</div>
			</div>
		</section>

<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">정지 사유</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form> 
		      <div class="modal-body">
				<div>
					<textarea id="reason${status.index}" rows="5" cols="52" style="outline:none; resize:none; border:1px solid #d5d5d5;"></textarea>
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



	</main>
	<!-- End #main -->
