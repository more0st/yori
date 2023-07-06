<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>회원 목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">admin</a></li>
					<li class="breadcrumb-item active">MemberList</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		<!-- list 조회 -->
		<section class="section">
			<div class="card">
				<div class="card-body">

					<h3 class="card-title">총 회원 수 : ${dataCount} 명</h3>

					<table class="table table-hover admin-restaurantList-table datatable">
						<thead>
							<tr>
								<th scope="col">회원번호</th>
								<th scope="col">이름</th>
								<th scope="col">아이디</th>
								<th scope="col">닉네임</th>
								<th scope="col">등록 일자</th>
								<th scope="col">마지막 접속</th>
								<th scope="col">상태</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
							
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr class="hover"> 
								<th scope="row" style="text-align: center;">${dto.memberNum}</th>
								<td><a href="${pageContext.request.contextPath}/admin/memberManage/detail?userId=${dto.userId}" class="text-primary">${dto.userName}</a></td>
								<td>${dto.userId}</td>
								<td>${dto.nickName}</td>
								<td>${dto.reg_date}</td>
								<td>${dto.last_login}</td>
								<td>${dto.enabled==1?"사용 가능":"정지"}</td>
								<td>
									<div class="d-grid gap-2 d-md-block">
										<c:choose>
											<c:when test="${dto.enabled==1}">
												<button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#modal${status.index}">정지</button>
												<input id="suspendId" type="hidden" value="${dto.userId}">
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-outline-primary btn-sm" onclick="release('${dto.userId}',${status.index})">해제</button>
												<input id="suspendId" type="hidden" value="${dto.userId}">
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
								        <button type="button" class="btn btn-primary" onclick="sendSuspension('${dto.userId}',${status.index})">보내기</button>
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

function release(clickUserId, sIndex) {
	
	// 회원 상태를 변경하기 위한 AJAX 요청
	$.ajax({
		type: "POST", // 혹은 "PUT" 등 HTTP 요청 메소드 선택
		url: "${pageContext.request.contextPath}/admin/memberManage/releaseMemberState", // 실제 서버 요청 주소
		data: {
			userId: clickUserId,
			registerId : "admin"
			
		},
		success: function(data) {
			// 서버 요청이 성공했을 때 실행할 코드
			alert("정지가 해제되었습니다.");
			location.href = '${pageContext.request.contextPath}/admin/memberManage/list'
			
			// 페이지 새로고침 등 필요한 동작 수행
		},
		error: function(jqXHR) {
			// 서버 요청이 실패했을 때 실행할 코드
			alert("정지 해제 실패");
			console.log(jqXHR.responseText);
		}
	});
	
}

function sendSuspension(clickUserId, sIndex) {
	// 정지 사유 입력란에서 값을 가져옴
	var reason = document.getElementById("reason"+sIndex).value;
	
	// 회원 상태를 변경하기 위한 AJAX 요청
	$.ajax({
		type: "POST", // 혹은 "PUT" 등 HTTP 요청 메소드 선택
		url: "${pageContext.request.contextPath}/admin/memberManage/updateMemberEnabled", // 실제 서버 요청 주소
		data: {
			userId: clickUserId,
			registerId : "admin",
			reason: reason,
			
		},
		success: function(data) {
			// 서버 요청이 성공했을 때 실행할 코드
			alert("회원이 정지되었습니다.");
			location.href = '${pageContext.request.contextPath}/admin/memberManage/list'
			
			// 페이지 새로고침 등 필요한 동작 수행
		},
		error: function(jqXHR) {
			// 서버 요청이 실패했을 때 실행할 코드
			alert("회원 정지 실패");
			console.log(jqXHR.responseText);
		}
	});
}

</script>

</main>
	<!-- End #main -->
