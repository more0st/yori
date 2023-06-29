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

					<table class="table table-hover admin-restaurantList-table">
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
							<tr class="hover" onclick="profile('${dto.userId}');"> 
								<th scope="row" style="text-align: center;">${dto.memberNum}</th>
								<td><a href="${pageContext.request.contextPath}/admin/memberManage/detail?userId=${dto.userId}" class="text-primary">${dto.userName}</a></td>
								<td>${dto.userId}</td>
								<td>${dto.nickName}</td>
								<td>${dto.reg_date}</td>
								<td>${dto.last_login}</td>
								<td>${dto.enabled==1?"정상":"정지"}</td>
								<td>
									<div class="d-grid gap-2 d-md-block">
										<button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">정지</button>
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
					<textarea rows="5" cols="52" style="outline:none; resize:none; border:1px solid #d5d5d5;"></textarea>
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
