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
					<li class="breadcrumb-item active">RestaurantList</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		<!-- list 조회 -->
		<section class="section">
			<div class="card">
				<div class="card-body">

					<h3 class="card-title">1000 건</h3>

					<table class="table table-hover admin-restaurantList-table">
						<thead>
							<tr>
								<th scope="col">#</th>
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
							<tr>
								<th scope="row">1</th>
								<td><a href="${pageContext.request.contextPath}/admin/memberManage/detail" class="text-primary">김상훈</a></td>
								<td>sang*****</td>
								<td>땅후니</td>
								<td>2016-05-25</td>
								<td>1일전</td>
								<td>정상</td>
								<td>
									<div class="d-grid gap-2 d-md-block">
										<button type="button" class="btn btn-outline-secondary btn-sm">정지</button>
										<button type="button" class="btn btn-outline-danger btn-sm">탈퇴</button>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Bridie Kessler</td>
								<td>Developer</td>
								<td>35</td>
								<td>2014-12-05</td>
								<td>28</td>
								<td>정지</td>
								<td>2016-05-25</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Ashleigh Langosh</td>
								<td>Finance</td>
								<td>45</td>
								<td>2011-08-12</td>
								<td>28</td>
								<td>탈퇴</td>
								<td>2016-05-25</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>Angus Grady</td>
								<td>HR</td>
								<td>34</td>
								<td>2012-06-11</td>
								<td>28</td>
								<td>28</td>
								<td>2016-05-25</td>
							</tr>
							<tr>
								<th scope="row">5</th>
								<td>Raheem Lehner</td>
								<td>Dynamic Division Officer</td>
								<td>47</td>
								<td>2011-04-19</td>
								<td>28</td>
								<td>28</td>
								<td>2016-05-25</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>





	</main>
	<!-- End #main -->
