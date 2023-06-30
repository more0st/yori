<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}

$(function(){
	$('#tab-${category}').addClass('active');

	$('ul.nav-tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/admin/eventManage/'+category+'/list';
	});
});
</script>


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
				
				<!-- 강사님꺼
				<div>
					<ul class="tabs">
						<li id="tab-all" data-category="all">전체 이벤트</li>
						<li id="tab-progress" data-category="progress">진행중인 이벤트</li>
						<li id="tab-ended" data-category="ended">종료된 이벤트</li>
					</ul>
				</div>
				 -->
				 
				<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab"
					role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="tab-all" data-bs-toggle="tab"
							data-category="all" type="button" role="tab"
							>전체 이벤트</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-progress" data-bs-toggle="tab"
							data-category="progress" type="button" role="tab"
							>진행중인 이벤트</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-ended" data-bs-toggle="tab"
							data-category="ended" type="button" role="tab"
							>종료된 이벤트</button>
					</li>
				</ul>
				
				<div class="tab-content pt-2" id="borderedTabContent">
					<table class="table table-hover event-table">
						<thead>
							<tr>
								<th scope="col" style="width: 8%">번호</th>
								<th scope="col" style="text-align: center;">제목</th>
								<th scope="col" style="width: 15%">이벤트 시작일</th>
								<th scope="col" style="width: 15%">이벤트 종료일</th>
								<th scope="col" style="width: 13%">조회수</th>
								<th scope="col" style="width: 13%">응모자수</th>
							</tr>
						</thead>
	
						<tbody>
							<tr>
								<td scope="row">1</td>
								<td>선착순 이벤트 3000명</td>
								<td>2023-06-01</td>
								<td>2023-06-10</td>
								<td>4,500</td>
								<td>2,000</td>
							</tr>
						</tbody>
					</table>
					
					<div class="page-navigation">
						${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
					</div>
					
					<form class="row g-3" name="searchForm" method="post" >
						<div class="col-md-2 text-center">
		                  <button type="button" class="btn btn-primary btn-sm">
		                  	<i class="bi bi-arrow-counterclockwise"></i>
		                  </button>
		                </div>
		                <div class="col-md-2 text-center">
		                  <select id="condition" class="form-select">
		                    <option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
							<option value="startDate" ${condition=="startDate"?"selected='selected'":""}>시작일</option>
							<option value="endDate" ${condition=="endDate"?"selected='selected'":""}>종료일</option>
		                  </select>
		                </div>
		                <div class="col-md-4 text-center">
		                  <input type="text" name="keyword" value="${keyword}" class="form-control" id="inputZip">
		                </div>
		                <div class="col-md-1 text-center">
		                	<button type="button" class="btn btn-primary btn-sm" onclick="searchList()">검색</button>
		                </div>
		                <div class="col-md-3 text-center">
		                	<button type="button" class="btn btn-primary btn-sm">이벤트등록</button>
		                </div>
					</form>
					
					<!-- 
					<table class="table">
						<tr>
							<td align="left" width="10%" >
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list';" title="새로고침">
								<i class="bi bi-arrow-counterclockwise"></i></button>
							</td>
							<td align="center">
								<form name="searchForm" action="${pageContext.request.contextPath}/admin/eventManage/${category}/list" method="post">
									<select name="condition" class="form-select">
										<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
										<option value="startDate" ${condition=="startDate"?"selected='selected'":""}>시작일</option>
										<option value="endDate" ${condition=="endDate"?"selected='selected'":""}>종료일</option>
										<option value="winningDate" ${condition=="winningDate"?"selected='selected'":""}>발표일</option>
									</select>
									<input type="text" name="keyword" value="${keyword}" class="form-control">
									<button type="button" class="btn" onclick="searchList()">검색</button>
								</form>
							</td>
							<td align="right" width="100">
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/write';">이벤트등록</button>
							</td>
						</tr>
					</table>
					-->
				</div>
				
			</div>
		</div>
	</section>

</main>


				<!-- 템플릿꺼
				<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
	                <li class="nav-item" role="presentation">
	                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true">Home</button>
	                </li>
	                <li class="nav-item" role="presentation">
	                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button>
	                </li>
	                <li class="nav-item" role="presentation">
	                  <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Contact</button>
	                </li>
                </ul>
				<div class="tab-content pt-2" id="borderedTabContent">
					<div class="tab-pane fade show active" id="bordered-home"
						role="tabpanel" aria-labelledby="home-tab">Sunt est soluta
						temporibus accusantium neque nam maiores cumque temporibus.
						Tempora libero non est unde veniam est qui dolor. Ut sunt iure
						rerum quae quisquam autem eveniet perspiciatis odit. Fuga sequi
						sed ea saepe at unde.</div>
					<div class="tab-pane fade" id="bordered-profile" role="tabpanel"
						aria-labelledby="profile-tab">Nesciunt totam et.
						Consequuntur magnam aliquid eos nulla dolor iure eos quia.
						Accusantium distinctio omnis et atque fugiat. Itaque doloremque
						aliquid sint quasi quia distinctio similique. Voluptate nihil
						recusandae mollitia dolores. Ut laboriosam voluptatum dicta.</div>
					<div class="tab-pane fade" id="bordered-contact" role="tabpanel"
						aria-labelledby="contact-tab">Saepe animi et soluta ad odit
						soluta sunt. Nihil quos omnis animi debitis cumque. Accusantium
						quibusdam perspiciatis qui qui omnis magnam. Officiis accusamus
						impedit molestias nostrum veniam. Qui amet ipsum iure. Dignissimos
						fuga tempore dolor.</div>
				</div>
				 -->





