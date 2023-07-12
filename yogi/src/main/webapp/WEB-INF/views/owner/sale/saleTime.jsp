<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.list-table {
	width: 100%;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	margin-bottom: 20px;
}

.list-table th {
	padding: 10px;
	background: #fafafa;
	color: #333;
	border-top: 1.5px solid #d9d9d9;
	border-bottom: 1.5px solid #d9d9d9;
}

.list-table td {
	padding: 10px;
	background: white;
	border-bottom: 1px solid black;
	font-size: 13px;
}

.center {
	text-align: center;
}

.right {
	text-align: right;
}

.left {
	text-align: left;
}

.list-table-top {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.table-container {
	margin: 0 auto;
	width: 1100px;
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.list-title {
	font-weight: bold;
	font-size: 18px;
	display: flex;
	align-items: center;
	width: 180px;
	border-bottom: 3px solid #333;
	padding-left: 10px;
}

.btn-group {
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.list-table-bottom {
	display: flex;
	justify-content: right;
}

.list-table-bottom-left {
	text-align: center;
	width: 100px;
	border-radius: 10px 0 0 10px;
	border: 1px solid #d9d9d9;
	padding: 10px;
	background: #fafafa;
	color: #333;
	font-weight: bold;
}

.list-table-bottom-right {
	width: 330px;
	border-radius: 0 10px 10px 0;
	padding: 10px;
	border: 1px solid #d9d9d9;
	background: white;
	text-align: right;
}

.periodSet {
	display: flex;
}

.page-navigation{
	text-align: center;
	margin-bottom: 20px;
	font-weight: bold;
}

.dataCount{
	margin-bottom: 5px;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<c:url var="listUrl" value="/owner/sale/saleTime">
	<c:if test="${not empty date1 || not empty date1}">
		<c:param name="date1" value="${date1}"/>
		<c:param name="date2" value="${date2}"/>
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
	
	if(f.date1.value > f.date2.value) {
		alert('시작날짜가 종료날짜보다 늦을 수 없습니다.');
		f.date1.focus;
		return;
	}
	
	f.submit();
}
</script>

<main id="main" class="main">
	<div class="whole-container">

		<div class="table-container">
			<div class="list-table-top">
				<div class="list-title">기간별 매출 관리</div>

				<form action="${pageContext.request.contextPath}/owner/sale/saleTime" method="post" name="searchForm" class="periodSet">
					<div class="periodSet" style="margin-right: 8px;">
						<div>
							<input type="date" name="date1" id="date1" class="form-control"
								value="${date1}">
						</div>
						<span class="col-form-label">&nbsp; ~ &nbsp;</span>
						<div>
							<input type="date" name="date2" id="date2" class="form-control"
								value="${date2}">
						</div>
					</div>
					<button type="button" class="btn btn-primary"
						onclick="searchList();">검색</button>
				</form>

			</div>
			
			<div class="row board-list-header">
	            <div class="col-auto me-auto dataCount">
	            </div>
	            <div class="col-auto">&nbsp;</div>
	        </div>	
			

			<table class="list-table">
				<thead>
					<tr style="white-space: nowrap;">
						<th class="center">번호</th>
						<th class="center">주문번호</th>
						<th class="center">유저닉네임</th>
						<th class="center">메뉴</th>
						<th class="center">배달지</th>
						<th class="center">전화번호</th>
						<th class="center">주문가격</th>
					</tr>
				</thead>

				<tbody>
				
				<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td class="center">${dataCount - (page-1) * size - status.index}</td>
							<td>${dto.orderNum}</td>
							<td>${dto.userName}</td>
							<td>
							<c:forEach var="menuDto" items="${dto.ownerSaleMenu}" >
								<span> ${menuDto.menu} &nbsp; ${menuDto.orderCount} </span>
							</c:forEach>
							</td>
							<td>${dto.addr1}</td>
							<td>${dto.tel}</td>
							<td class="right">
								<fmt:formatNumber value="${dto.order_price}" type="currency"/>
							</td>
						</tr>
				</c:forEach>
				</tbody>

			</table>
			
			<div class="page-navigation"></div>

			<div class="list-table-bottom">
				<div class="list-table-bottom-left shadow-sm">총계</div>
				<div class="list-table-bottom-right shadow-sm">
				  <fmt:formatNumber value="${total_price}" type="currency"/>
				</div>
			</div>

		</div>

	</div>
</main>
