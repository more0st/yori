<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>주문내역</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">admin</a></li>
					<li class="breadcrumb-item ">RestaurantList</li>
					<li class="breadcrumb-item active">주문내역</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		<!-- list 조회 -->
		<section class="section">
			<div class="card">
				<div class="card-body">

					<h3 class="card-title">1523 건</h3>

					<table class="table table-hover admin-orderList-table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">메뉴</th>
								<th scope="col">주문자</th>
								<th scope="col">전화번호</th>
								<th scope="col">배달주소</th>
								<th scope="col">요청사항</th>
								<th scope="col">주문일자</th>
								<th scope="col">금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>후라이드 3마리, 양념 5마리, 콜라 1.5리터 5개, 피자 두마리</td>
								<td>김선영</td>
								<td>010-2222-3333</td>
								<td>서울특별시 서대문구 홍홍홍 ㄴㅇ러ㅏㅇㄴ라 ㅇ나ㅣ러ㅣㄴㅇㄹㅇ</td>
								<td>빨리 갖다주세요sdfsdfsdfsdfsdfdsf</td>
								<td>202306150531</td>
								<td>156,000</td>
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
