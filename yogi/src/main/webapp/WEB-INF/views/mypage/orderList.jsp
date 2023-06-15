<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요기요</title>
<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.tablediv{
	width: 1000px;
	margin: 30px auto;
}

.tablediv tr th, tr td{
	text-align: center;
}

.tablediv tr td{
	vertical-align: middle;
}

.reviewbtn{
	width: 80px;
	height: 30px;
	border-radius: 20px;
	border: 1px solid #333;
	font-size: 5px;
	background: white;
}

.reviewbtn:hover{
	background: #eee;
}


.search{
	display: flex;
	justify-content: right;
	gap:10px;
}

.keyword{
	outline:none;
	border:1px solid #d9d9d9;
}


.rating {
  display: inline-block;
}

.rating input {
  display: none;
}

.rating label {
  float: right;
  cursor: pointer;
  color: #ddd;
  font-size:30px;
}

.rating label:before {
  content: "\2605";
  margin-right: 5px;
}

.rating input:checked ~ label {
  color: #ffca08;
}

.rating label:hover,
.rating label:hover ~ label {
  color: #ffca08;
}

.paging{
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body style="padding: 0;">
<div class="whole-container">
	<header>	
		<jsp:include page="/WEB-INF/views/fragment/header.jsp"/>
	</header>
	
	<!-- 메뉴 -->
	<jsp:include page="/WEB-INF/views/mypage/mymenu.jsp"/>
	
	<div class="tablediv">
		<div class="search">
			<input type="text" name="keyword" class="keyword">
			<button type="button" class="btn btn-secondary">검색</button>
		</div>
		<br>
		
		<table class="table">
			<tr class="table-secondary border">
				<th>주문번호</th>
				<th>업체이름</th>
				<th>금액</th>
				<th>주문상태</th>
				<th>리뷰작성</th>
				<th>주문상세정보</th>
			</tr>
			
			<!-- forEach -->
			<tr class="border" >
				<td>1111</td>
				<td>상훈이네 족발집</td>
				<td>36,000원</td>
				<td>주문완료</td>
				<td><button type="button" class="reviewbtn" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="reviewSubmit()">리뷰작성</button></td>
				<!-- 해당 주문번호 맞춰서 이동하도록. -->
				<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/orderDetail';"> <i class="fa-solid fa-arrow-right" style="color: #345998; font-size:20px;"></i> </button></td>
			</tr>
			<!-- /forEach -->
			
			<!-- 아래 tr은 지우기 -->
			<tr class="border" >
				<td>2222</td>
				<td>선영이네 피자집</td>
				<td>15,000원</td>
				<td>주문완료</td>
				<td>
				<button type="button" class="reviewbtn" data-bs-toggle="modal" data-bs-target="#exampleModal">리뷰작성</button>
				<!-- 해당 주문번호 맞춰서 이동하도록. -->
				<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/orderDetail';"> <i class="fa-solid fa-arrow-right" style="color: #345998; font-size:20px;"></i> </button></td>
			</tr>
			
			<tr class="border" >
				<td>3333</td>
				<td>승현이네 국밥집</td>
				<td>12,000원</td>
				<td>주문완료</td>
				<td><button type="button" class="reviewbtn" data-bs-toggle="modal" data-bs-target="#exampleModal">리뷰작성</button></td>
				<!-- 해당 주문번호 맞춰서 이동하도록. -->
				<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/orderDetail';"> <i class="fa-solid fa-arrow-right" style="color: #345998; font-size:20px;"></i> </button></td>
			</tr>
			
			
			<tr class="border" >
				<td>4444</td>
				<td>재혁이네 치킨집</td>
				<td>18,000원</td>
				<td>주문완료</td>
				<td><button type="button" class="reviewbtn" data-bs-toggle="modal" data-bs-target="#exampleModal">리뷰작성</button></td>
				<!-- 해당 주문번호 맞춰서 이동하도록. -->
				<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/orderDetail';"> <i class="fa-solid fa-arrow-right" style="color: #345998; font-size:20px;"></i> </button></td>
			</tr>
		</table>
		
		<div class="paging">
		1 2 3
		</div>
		
	</div>	
</div>

<!-- 모달 -->
<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form> 
	      <div class="modal-body">
	      	<i class="fa-solid fa-chart-simple" style="color: #a8c4f5;"></i>&nbsp;리뷰 별점 <br>
	        <div class="rating">
			  <input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label>
			  <input type="radio" id="star4" name="rating" value="4" /><label for="star4"></label>
			  <input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
			  <input type="radio" id="star2" name="rating" value="2" /><label for="star2"></label>
			  <input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
			</div>
			
			<div>
				<br><i class="fa-regular fa-comment-dots" style="color: #a8c4f5;"></i>&nbsp;리뷰 내용<br><br>
				<textarea rows="5" cols="60" style="outline:none; resize:none; border:1px solid #d5d5d5;"></textarea>
				
				<input type="file" name="selectFile" accept="image/*" class="form-control">
			</div>
			<div>
				
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<footer>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>		
</footer>


<script type="text/javascript">
var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));

// 리뷰 작성시 별점 확인 후. 리뷰 작성 못하도록.
function reviewSubmit(){
	
}
</script>

</body>
</html>