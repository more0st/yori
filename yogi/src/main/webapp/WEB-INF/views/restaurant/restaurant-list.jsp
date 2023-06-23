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
			<input type="text" name="keyword" id="searchInput" placeholder="음식점이나 메뉴를 검색하세요."> 
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
	
	<div class="restaurant-list" id="restaurantList">
		<c:forEach var="restaurant" items="${list}">
			<a class="restaurant-info" href="${pageContext.request.contextPath}/restaurant/info">
				<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/burgerking.png">
				<span>
					<span class="res-title">${restaurant.restaurantName}</span><br>
					<span class="res-info res-rank">★ ${restaurant.rating} </span><span class="res-division">|</span><span class="res-info">리뷰 18</span><br>
					<span class="res-info res-80">${restaurant.basePrice}원 이상 배달</span><span class="res-division"></span>
				</span>
			</a>
		</c:forEach>
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



$(document).ready(function() {
    $("#searchInput").on("input", function() {
        getList();
    });
});


//카테고리(프랜차이즈.치킨), 키워드(검색어), 정렬순, 배달주소
function getList() {
	 let categoryNum = ${categoryNum};
	 let addr = "${sessionScope.member.addr1}"; // addr은 사용자의 주소로 초기화합니다.
    let keyword = $('#searchInput').val();
    let condition = document.getElementById('conditionval').value;
    
    $.ajax({
        url: "${pageContext.request.contextPath}/restaurant/search",
        type: "GET",
        dataType: "json",
        data: { keyword: keyword, categoryNum: categoryNum, addr1:addr, condition: condition },      
            // 조회된 회원 정보 출력
        success: function(data) {
            console.log(data.list);

            let restaurantList = $('#restaurantList');
            restaurantList.empty();

            $.each(data, function(i, list) {
              let resultTemplate = `<a class="restaurant-info" href="${pageContext.request.contextPath}/restaurant/info?restaurantNum=`+ list.restaurantNum +`">`
				
	          	// 사진 있을 경우 , 없을 경우
	            if (list.picture == null) {
				    resultTemplate += `<img class="product-img" src="${pageContext.request.contextPath}/resources/images/default.png"/>`
				} else {
				    resultTemplate += `<img class="res-img" src="${pageContext.request.contextPath}/resources/images/`+ list.imageFilename +`"/>`
				}
				
	            resultTemplate += `<span>
					<span class="res-title">`+ list.restaurantName + `</span><br>
					<span class="res-info res-rank">★` + list.rating +`</span><span class="res-division">|</span><span class="res-info">리뷰 ` + list.reviewCount  +`</span><br>
					<span class="res-info res-80">`+ list.basePrice +`원 이상 배달</span><span class="res-division"></span>
				</span>
				</a>`;
           
				restaurantList.append(resultTemplate);
				
		});
	},
	error: function(xhr, status, error) {
		console.error(error);alert('요청 실패. 관리자에게 문의바랍니다.');
	}
});
    
}
</script>