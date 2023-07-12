<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.datatable-table th a {
	text-align: center;
}
</style>

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

					<table class="table table-hover admin-restaurantList-table datatable">
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
								<th scope="row" style="text-align: center;">${status.count}</th>
								<td>${dto.restaurantName}</td>
								<td>${dto.userName}</td>
								<td>${dto.restaurantTel}</td>
								<td>${dto.reg_date}</td>
								<td><a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/resManage/orderList?restaurantNum=${dto.restaurantNum}"
									role="button">주문내역</a></td>
								<td>${dto.enabled==1?"사용 가능":"정지"}</td> <%-- stateCode , enabled --%>
								<td>
									<div class="d-grid gap-2 d-md-block">
										<c:choose>
											<c:when test="${dto.enabled==1}">
												<button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#modal${status.index}">정지</button>
												<input id="suspendId" type="hidden" value="${dto.restaurantNum}">
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-outline-primary btn-sm" onclick="release('${dto.restaurantNum}',${status.index})">해제</button>
												<input id="suspendId" type="hidden" value="${dto.restaurantNum}">
											</c:otherwise>
										</c:choose>
									</div>
								</td>
							</tr>
							
							<div class="modal" id="modal${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
									        <button type="button" class="btn btn-primary" onclick="sendSuspension('${dto.restaurantNum}',${status.index})">보내기</button>
									      </div>
								      </form>
								    </div>
								  </div>
							</div>
							
							
						</c:forEach>	
						
						</tbody>
					</table>
				</div>
			</div>
		</section>



<script type="text/javascript">

function sendSuspension(clickRestaurantNum, sIndex) {
	// 정지 사유 입력란에서 값을 가져옴
	var reason = document.getElementById("reason"+sIndex).value;
	
	// 회원 상태를 변경하기 위한 AJAX 요청
	$.ajax({
		type: "POST", // 혹은 "PUT" 등 HTTP 요청 메소드 선택
		url: "${pageContext.request.contextPath}/admin/resManage/updateOwnerEnabled", // 실제 서버 요청 주소
		data: {
			restaurantNum: clickRestaurantNum,
			registerId : "admin",
			reason: reason,
			
		},
		success: function(data) {
			// 서버 요청이 성공했을 때 실행할 코드
			alert("업체가 정지되었습니다.");
			location.href = '${pageContext.request.contextPath}/admin/resManage/main'
			
			// 페이지 새로고침 등 필요한 동작 수행
		},
		error: function(jqXHR) {
			// 서버 요청이 실패했을 때 실행할 코드
			alert("업체 정지 실패");
			console.log(jqXHR.responseText);
		}
	});
}


function release(clickRestaurantNum, sIndex) {
	if(!confirm("정지를 해제하시겠습니까?")) {
		return false;
	}
	// 회원 상태를 변경하기 위한 AJAX 요청
	$.ajax({
		type: "POST", // 혹은 "PUT" 등 HTTP 요청 메소드 선택
		url: "${pageContext.request.contextPath}/admin/resManage/releaseOwnerEnabled", // 실제 서버 요청 주소
		data: {
			restaurantNum: clickRestaurantNum,
			registerId : "admin"
			
		},
		success: function(data) {
			// 서버 요청이 성공했을 때 실행할 코드
			alert("정지가 해제되었습니다.");
			location.href = '${pageContext.request.contextPath}/admin/resManage/main'
			
			// 페이지 새로고침 등 필요한 동작 수행
		},
		error: function(jqXHR) {
			// 서버 요청이 실패했을 때 실행할 코드
			alert("정지 해제 실패");
			console.log(jqXHR.responseText);
		}
	});
	
}

// $(function(){
// 	$(".btnStop").click(function(){
// 		let restaurantNum = $(this).attr("data-restaurantNum");
		
// 		$(".btnStopSend").attr("data-restaurantNum", restaurantNum);
		
// 		$("#myDialogModal").modal("show");
// 	});
	
// 	$(".btnStopSend").click(function(){
// 		let restaurantNum = $(this).attr("data-restaurantNum");
// 		let reason = $("#reason").val();
		
// 		alert("업체가 정지되었습니다.");
// 	});
	
// });

</script>

	</main>
	<!-- End #main -->
