<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.category-box {
	width: 100%;
	border-top: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
	background: white;
	display: flex;
	justify-content: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.category-info {
	padding: 20px 15px;
	font-size: 14px;
	white-space: nowrap;
}

.category-info:hover {
	background: black;
	color: white;
	cursor: pointer;
}

.search-box {
	display: flex;
	justify-content: center;
	gap: 10px;
	height: 55px;
	border-bottom: 1px solid #d9d9d9;
}

.search-box2 {
	width: 800px;
	display: flex;
	justify-content: space-between;
}

.search-info {
	width: 50%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.search-info > input {
	width: 250px;
	height: 40px;
	padding: 0 15px;
	outline: none;
}

.search-info > select {
	width: 250px;
	height: 40px;
	padding: 0 15px;
}

.location {
	width: 1100px;
	margin: 10px auto;
	color: #333;
	padding-left: 10px;
}

.location > i {
	color: #FA0050;
}

.location > span {
	font-weight: bold;
	color: black;
}

.restaurant-list {
	margin: 10px auto;
	width: 1100px;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-auto-rows: 100px;
	gap: 10px;
	height: 90%;
	overflow:auto;
}

.restaurant-info {
	align-items: center;
	padding-left: 10px;
	border: 1px solid #d9d9d9;
	background: white;
	color: #333333;
	display: flex;
	gap: 15px;
	text-decoration: none;
}

.restaurant-info:hover {
	cursor: pointer;
	background: #eee;
	color: #333333;
}

.res-img {
	width: 70px;
	height: 70px;
	background-size: cover;
	border: 1px solid #d9d9d9;
}

.res-title {
	font-size: 16px;
}

.res-info {
	font-size: 13px;
}

.res-rank {
	color: #FFA800;
}

.res-80 {
	color: #808080;
}

.res-division {
	color: #d9d9d9;
	padding: 0 7px;
	font-size: 10px;
}

</style>
<div class="whole-container">
	
	<div class="category-box">
		<div class="category-info" onclick="checkAddress(0)">전체보기</div>
		<div class="category-info" onclick="checkAddress(1)">프랜차이즈</div>
		<div class="category-info" onclick="checkAddress(2)">치킨</div>
		<div class="category-info" onclick="checkAddress(3)">피자/양식</div>
		<div class="category-info" onclick="checkAddress(4)">중국집</div>
		<div class="category-info" onclick="checkAddress(5)">한식</div>
		<div class="category-info" onclick="checkAddress(6)">일식/돈까스</div>
		<div class="category-info" onclick="checkAddress(7)">족발/보쌈</div>
		<div class="category-info" onclick="checkAddress(8)">야식</div>
		<div class="category-info" onclick="checkAddress(9)">분식</div>
		<div class="category-info" onclick="checkAddress(10)">카페/디저트</div>
		<div class="category-info" onclick="checkAddress(11)">편의점/마트</div>
	</div>
	
	<form name="searchForm">
	<div class="search-box">
	<div class="search-box2">
		<div class="search-info">
			<input type="text" name="keyword" id="keywordval" placeholder="음식점이나 메뉴를 검색하세요."> 
		</div>
		<div class="search-info">
			<select name="condition" id="conditionval">
				<option value="all" 			${condition=="all"?"selected='selected'":"" }>기본 정렬순</option>
				<option value="rank"  			${condition=="rank"?"selected='selected'":"" }>별점순</option>
				<option value="review"  		${condition=="review"?"selected='selected'":"" }>리뷰 많은순</option>
				<option value="minPrice"  		${condition=="minPrice"?"selected='selected'":"" }>최소 주문 금액순</option>
			</select>
		</div>
	</div>			
	</div>
	</form>
	
	<div class="location"><i class="fa-solid fa-store"></i>&nbsp;<span>${sessionScope.member.userName}</span>님 근처의 음식점</div>
	<div class="restaurant-list">
		<a class="restaurant-info" href="${pageContext.request.contextPath}/restaurant/info">
			<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/burgerking.png">
			<span>
				<span class="res-title">버거킹 홍대점</span><br>
				<span class="res-info res-rank">★ 4.7</span><span class="res-division">|</span><span class="res-info">리뷰 18</span><br>
				<span class="res-info res-80">6,000원 이상 배달</span><span class="res-division"></span>
			</span>
		</a>
		<a class="restaurant-info">
			<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/amazing.png">
			<span>
				<span class="res-title">어메이징 농카이</span><br>
				<span class="res-info res-rank">★ 4.8</span><span class="res-division">|</span><span class="res-info">리뷰 245</span><br>
				<span class="res-info res-80">8,000원 이상 배달</span><span class="res-division"></span>
			</span>
		</a>
		<a class="restaurant-info">
			<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/downtowner.png">
			<span>
				<span class="res-title">다운타우너 연남점</span><br>
				<span class="res-info res-rank">★ 5.0</span><span class="res-division">|</span><span class="res-info">리뷰 154</span><br>
				<span class="res-info res-80">10,000원 이상 배달</span><span class="res-division"></span>
			</span>
		</a>
	</div>

</div>


<script type="text/javascript">
function checkAddress(param) {
    var address = "${sessionScope.member.addr1}";

    if (!address || address.trim() === "") {
      alert("주소를 설정해 주세요.");
    } else {
      // 주소가 비어있지 않을 경우의 처리 (예: 링크 이동)
      window.location.href = "${pageContext.request.contextPath}/restaurant/list?categoryNum="+param;
    }
  }
  
</script>