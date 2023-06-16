<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

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
	background: #fa0050;
	color: white;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
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
	border-bottom: 3px solid #fa0050;
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
	padding: 10px;
	background: #fa0050;
	color: white;
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

</style>

<main id="main" class="main">
<div class="whole-container">
	
	<div class="table-container">
		<div class="list-table-top">
			<div class="list-title">
				기간별 매출 관리
			</div>
			<div class="btn-group" role="group" aria-label="Basic">
				<button type="button" class="btn btn-primary">1일</button>
				<button type="button" class="btn btn-primary">1주일</button>
				<button type="button" class="btn btn-primary">1달</button>
				<button type="button" class="btn btn-primary">1년</button>
				<button type="button" class="btn btn-dark">전체</button>
			</div>
		</div>
		<table class="list-table">
			<thead>
			<tr>
				<th class="center">번호</th>
				<th class="center">주문번호</th>
				<th class="center">유저아이디</th>
				<th class="center">메뉴</th>
				<th class="center">배달지</th>
				<th class="center">전화번호</th>
				<th class="center">가격</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td class="center">2</td>
				<td>2023061619150101</td>
				<td>wldbsqkqh</td>
				<td>기네스 머쉬룸 와퍼</td>
				<td>서울시 마포구 월드컵북로 21 풍성빌딩 201호</td>
				<td>010-1111-1111</td>
				<td class="right">7,000원</td>
			</tr>
			<tr>
				<td class="center">1</td>
				<td>2023061619120431</td>
				<td>Tkddyd</td>
				<td>와퍼 세트</td>
				<td>서울시 마포구 월드컵북로 21 풍성빌딩 202호</td>
				<td>010-1111-2222</td>
				<td class="right">6,000원</td>
			</tr>
			</tbody>
		</table>
		<div class="list-table-bottom">
			<div class="list-table-bottom-left shadow-sm">
				총계
			</div>
			<div class="list-table-bottom-right shadow-sm">
				13,000원
			</div>
		</div>
	</div>

</div>
</main>
