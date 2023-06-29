<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    



<main id="main" class="main">

		<div class="pagetitle">
			<h1>이벤트</h1>
		</div>
		<!-- End Page Title -->


		<!-- list 조회 -->
		<section class="section">
			<div class="card">
				<div class="card-body">
					
					<h4 class="card-title">5개 (1/2 페이지)</h4>
					
					<div>
						<ul class="tabs">
							<li id="tab-all" data-category="all">전체 이벤트</li>
							<li id="tab-progress" data-category="progress">진행중인 이벤트</li>
							<li id="tab-ended" data-category="ended">종료된 이벤트</li>
						</ul>
					</div>
					
					<table class="table table-hover event-table">
						<thead>
							<tr>
								<th scope="col" style="width: 8%">번호</th>
								<th scope="col" style="text-align: center;">제목</th>
								<th scope="col" style="width: 15%">이벤트 시작일</th>
								<th scope="col" style="width: 15%">이벤트 종료일</th>
								<th scope="col" style="width: 13%">응모자수</th>
							</tr>
						</thead>
						
						<tbody>
						
							<tr>
								<td scope="row">1</td>
								<td>선착순 이벤트 3000명</td>
								<td>2023-06-01</td>
								<td>2023-06-10</td>
								<td>2,000</td>
							</tr>
							
						</tbody>
						
					</table>
					
				</div>
			</div>
		</section>

</main>






