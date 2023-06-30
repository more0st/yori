<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

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

.reviewUpdate{
	background: #d9d9d9;
}

</style>


<div class="whole-container">
	<!-- 메뉴 -->
	<jsp:include page="/WEB-INF/views/mypage/mymenu.jsp"/>
	
	<div class="tablediv">
	<form  name="searchForm" action="${pageContext.request.contextPath}/mypage/orderList" method="post">
		<div class="search">
			<span> ${dataCount}개(${page}/${total_page} 페이지)</span>
			<input type="text" name="keyword" class="keyword">
			<button type="submit" class="btn btn-secondary" onclick="serchList()">검색</button>
		</div>
	</form>
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
			<c:forEach var="dto" items="${list}">
			<tr class="border" >
				<td>${dto.orderNum}</td>
				
				<td>${dto.restaurantName}</td>
				<td><fmt:formatNumber value="${dto.total_price}" pattern="#,###원"/></td>
				
				<c:choose>
				  <c:when test="${dto.statusName == 1}">
				    <td>결제완료</td>
				  </c:when>
				  <c:when test="${dto.statusName == 2}">
				    <td>접수완료</td>
				  </c:when>
				  <c:when test="${dto.statusName == 3}">
				    <td>배달중</td>
				  </c:when>
				  <c:when test="${dto.statusName == 4}">
				    <td>배달완료</td>
				  </c:when>
				  <c:when test="${dto.statusName == 5}">
				    <td>주문취소</td>
				  </c:when>
				</c:choose>
				
			 	<c:choose>
	<c:when test="${dto.content == null}">
		<td>
			<button type="button" class="reviewbtn reviewModal" data-bs-toggle="modal" data-bs-target="#reviewModal" data-orderNum="${dto.orderNum}" data-restaurantNum="${dto.restaurantNum}">리뷰쓰기</button>
		</td>
	</c:when>
	<c:otherwise>
		<td>
			<button type="button" class="reviewbtn reviewUpdate" data-bs-toggle="modal" data-bs-target="#reviewUpdateModal" data-orderNum="${dto.orderNum}" data-restaurantNum="${dto.restaurantNum}">리뷰수정</button>
		</td>
	</c:otherwise>
</c:choose>
				<!-- 해당 주문번호 맞춰서 이동하도록. -->
				<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/orderDetail?num=${dto.orderNum}&page=${page}';"> <i class="fa-solid fa-arrow-right" style="color: #345998; font-size:20px;"></i> </button></td>
			</tr>
			</c:forEach>
			<!-- /forEach -->
		</table>
		
		<div class="paging">
		${paging}
		</div>
	</div>	
</div>

<!-- 모달 -->

<!-- 리뷰 작성 모달 -->
<div class="modal" id="reviewModal"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form name="reviewForm" method="post" enctype="multipart/form-data">
     
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
				<textarea name="content" id="content" rows="5" cols="60" style="outline:none; resize:none; border:1px solid #d5d5d5;"></textarea>
				
				<input type="file" name="selectFile" accept="image/*" class="form-control">
			</div>
			<div>
				
			</div>
	      </div>
	      <div class="modal-footer">
	        <input type="hidden" name="orderNum" value="">
	        <input type="hidden" name="restaurantNum" value="">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="reviewCheck();">저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<!-- 리뷰수정모달 -->
<div class="modal" id="reviewUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form name="reviewUpdateForm" method="post" enctype="multipart/form-data"> 
	      <div class="modal-body">
	      	<i class="fa-solid fa-chart-simple" style="color: #a8c4f5;"></i>&nbsp;리뷰 별점 <br>
	        <div class="rating">
			  <input type="radio" id="star15" name="rating2" value="5" /><label for="star15"></label>
			  <input type="radio" id="star14" name="rating2" value="4" /><label for="star14"></label>
			  <input type="radio" id="star13" name="rating2" value="3" /><label for="star13"></label>
			  <input type="radio" id="star12" name="rating2" value="2" /><label for="star12"></label>
			  <input type="radio" id="star11" name="rating2" value="1" /><label for="star11"></label>
			</div>
			
			<div>
				<br><i class="fa-regular fa-comment-dots" style="color: #a8c4f5;"></i>&nbsp;리뷰 내용<br><br>
				<textarea name="content2" id="content2" rows="5" cols="60" style="outline:none; resize:none; border:1px solid #d5d5d5;">${rev.content}</textarea>
				
				<input type="file" name="selectFile" accept="image/*" class="form-control">
			</div>
			<div>
				
			</div>
	      </div>
	      <div class="modal-footer">
	      	<input type="hidden" name="orderNum" value="">
	        <input type="hidden" name="restaurantNum" value="">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary"  onclick="reviewCheck2();">저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
var reviewModal = new bootstrap.Modal(document.getElementById('reviewModal'));
var reviewUpdateModal = new bootstrap.Modal(document.getElementById('reviewUpdateModal'));
var rating = 3;


// 리뷰 작성시 별점 확인 후. 리뷰 작성 못하도록.
function reviewSubmit(){
	
}
$(function() {
	$("body").on("click", ".reviewUpdate", function(){
		
		let orderNum = $(this).attr("data-orderNum");
		let restaurantNum = $(this).attr("data-restaurantNum");
		document.reviewUpdateForm.orderNum.value = orderNum;
		document.reviewUpdateForm.restaurantNum.value = restaurantNum;
		
		console.log(orderNum);
		console.log(document.reviewUpdateForm.orderNum.value);
		
	
		$('#reviewUpdateModal').show();

	});
});

$(function() {
	$("body").on("click", ".reviewModal", function(){
		
		let orderNum = $(this).attr("data-orderNum");
		let restaurantNum = $(this).attr("data-restaurantNum");
		document.reviewForm.orderNum.value = orderNum;
		document.reviewForm.restaurantNum.value = restaurantNum;
	
		console.log(orderNum);
		console.log(document.reviewForm.orderNum.value);
		
		
		$('#reviewModal').show();

	});
});



function reviewCheck(){
	    const f = document.reviewForm;
		let str;
		
	   
	    str = f.content.value.trim();
	    if(!str) {
	        alert("내용을 입력하세요. ");
	        f.content.focus();
	        return;
	    }
	    

	    f.action = "${pageContext.request.contextPath}/mypage/reviewSubmit";
	    f.submit();
	}
	
/*
  
function reviewCheck2(){
	    const f = document.reviewUpdateForm;
		let str;
		
	   
	    str = f.content.value.trim();
	    if(!str) {
	        alert("내용을 입력하세요. ");
	        f.content.focus();
	        return;
	    }
	    

	    f.action = "${pageContext.request.contextPath}/mypage/reviewSubmit";
	    f.submit();
	}
	
 */
	
	
	

</script>

