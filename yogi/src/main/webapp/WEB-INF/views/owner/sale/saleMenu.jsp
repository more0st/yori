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
	background: #fafafa;
	color: #333;
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
	border-bottom: 3px solid #333;
	padding-left: 10px;
}

.list-table-bottom {
	display: flex;
	justify-content: space-between;
	justify-content: right;
}

.list-table-bottom-left {
	text-align: center;
	width: 100px;
	border-radius: 10px 0 0 10px;
	padding: 10px;
	background: #fafafa;
	border: 1px solid #d9d9d9;
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

.search-input {
	height: 100%;
}

.menuSearch {
	outline: none;
	padding: 10px;
	border-radius: 10px 0 0 10px;
	border: 1px solid #d9d9d9;
	font-size: 14px;
	color: #333;
}

.search-box {
	display: flex;
	justify-content: right;
	margin-bottom: 10px;
	margin-right: 500px;
}

.search-button {
	background: #fafafa;
	color: #333;
	border: 1px solid #d9d9d9;;
	border-radius: 0 10px 10px 0;
	width: 40px;
}

.btn-group {
	display: flex;
	justify-content: right;
	margin-bottom: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

</style>

<main id="main" class="main">
<div class="whole-container">
	
	<div class="table-container">
		<div class="list-table-top">
			<div class="list-title">
				메뉴별 매출 관리
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
				<th class="center">메뉴</th>
				<th class="center">가격</th>
				<th class="center">판매수량</th>
				<th class="center">총합</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td class="center">2</td>
				<td class="center">기네스 머쉬룸 와퍼</td>
				<td class="center">7,000원</td>
				<td class="center">2</td>
				<td class="center">14,000원</td>
			</tr>
			<tr>
				<td class="center">1</td>
				<td class="center">와퍼 세트</td>
				<td class="center">6,000원</td>
				<td class="center">3</td>
				<td class="center">18,000원</td>
			</tr>
			</tbody>
		</table>
		<div class="list-table-bottom">
			<div class="search-box">
				<div class="search-input">
					<input type="text" class="menuSearch shadow-sm">
				</div>
				<button type="button" class="search-button shadow-sm"><i class="bi bi-search"></i></button>
			</div>
		
			<div class="list-table-bottom-left shadow-sm">
				총계
			</div>
			<div class="list-table-bottom-right shadow-sm">
				32,000원
			</div>
		</div>
	</div>

</div>
</main>
