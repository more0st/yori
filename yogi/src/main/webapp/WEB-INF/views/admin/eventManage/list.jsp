<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.tab-content tbody td:nth-child(1n) {
	text-align: center;
}
.tab-content tbody td:nth-child(5n) {
	text-align: center;
}
.tab-content tbody td:nth-child(6n) {
	text-align: center;
}

</style>

<c:url var="listUrl" value="/yogi/admin/eventManage/${category}/list">
	<c:if test="${not empty keyword}">
		<c:param name="condition" value="${condition}"/>
		<c:param name="keyword" value="${keyword}"/>
	</c:if>
</c:url>

<script type="text/javascript">
window.addEventListener("load", function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = "${listUrl}"; 
	
	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);
	
	document.querySelector(".dataCount").innerHTML = dataCount+"개 ("
			+page+"/"+total_page+"페이지)";

	document.querySelector(".page-navigation").innerHTML = 
		dataCount === 0 ? "등록된 게시물이 없습니다." : paging;
});
</script>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	
	f.submit();
}

$(function(){
	$('#tab-all').removeClass('active');
	$('#tab-${category}').addClass('active');

	$('ul.nav-tabs li button').click(function() {
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

				<h4 class="card-title dataCount"></h4>
				
				<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab"
					role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="tab-all" data-bs-toggle="tab"
							data-category="all" type="button" role="tab"
							>전체 이벤트</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-upcoming" data-bs-toggle="tab"
							data-category="upcoming" type="button" role="tab"
							>진행예정인 이벤트</button>
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
								<th scope="col" style="width: 8%; text-align: center;">번호</th>
								<th scope="col" style="text-align: center;">제목</th>
								<th scope="col" style="width: 15%; text-align: center;">이벤트 시작일</th>
								<th scope="col" style="width: 15%; text-align: center;">이벤트 종료일</th>
								<th scope="col" style="width: 10%; text-align: center;">조회수</th>
								<th scope="col" style="width: 10%; text-align: center;">응모자수</th>
							</tr>
						</thead>
						
						
						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr>
									<td scope="row">${dataCount - (page-1) * size - status.index}</td>
									<td class="left">
										<a href="${articleUrl}&num=${dto.eventNum}&applyCount=${dto.applyCount}">${dto.subject}</a>
									</td>
									<td>${dto.start_date}</td>
									<td>${dto.end_date}</td>
									<td>${dto.hitCount }</td>
									<td>${dto.applyCount }</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
					
					<div class="page-navigation"></div>
					
					<form class="row g-3" name="searchForm" action="${pageContext.request.contextPath}/admin/eventManage/${category}/list" method="post" >
						<div class="col-md-2 text-center">
		                  <button type="button" class="btn btn-primary btn-sm" 
		                  	onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/all/list';">
		                  	<i class="bi bi-arrow-counterclockwise"></i>
		                  </button>
		                </div>
		                <div class="col-md-2 text-center">
		                  <select id="condition" name="condition" class="form-select">
		                    <option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
							<option value="start_date" ${condition=="start_date"?"selected='selected'":""}>시작일</option>
							<option value="end_date" ${condition=="end_date"?"selected='selected'":""}>종료일</option>
		                  </select>
		                </div>
		                <div class="col-md-4 text-center">
		                  <input type="text" name="keyword" value="${keyword}" class="form-control" >
		                </div>
		                <div class="col-md-1 text-center">
		                	<button type="button" class="btn btn-primary btn-sm" onclick="searchList()">검색</button>
		                </div>
		                <div class="col-md-3 text-center">
		                	<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/write';">이벤트등록</button>
		                </div>
					</form>
					
					
				</div>
				
			</div>
		</div>
	</section>

</main>


				




