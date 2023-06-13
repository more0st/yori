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


.tablediv tr td:hover{
	cursor: pointer;
}

.reviewbtn{
	width: 80px;
	height: 30px;
	border-radius: 20px;
	border: 1px solid #333;
	font-size: 5px;
	background: white;
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
		<table class="table table-hover">
			<tr class="table-primary border">
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
				<td><button type="button" class="reviewbtn" onclick="location.href='${pageContext.request.contextPath}/mypage/myReview';">리뷰작성</button></td>
				<!-- 해당 주문번호 맞춰서 이동하도록. -->
				<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/orderDetail';"> <i class="fa-solid fa-arrow-right" style="color: #345998; font-size:20px;"></i> </button></td>
			</tr>
			<!-- /forEach -->
			
			<!-- 아래 tr은 지우기 -->
			<tr class="border" >
				<td>2222</td>
				<td>선영이네 보쌈집</td>
				<td>45,000원</td>
				<td>주문완료</td>
				<td><button type="button" class="reviewbtn" onclick="location.href='${pageContext.request.contextPath}/mypage/myReview';">리뷰작성</button></td>
				<!-- 해당 주문번호 맞춰서 이동하도록. -->
				<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/orderDetail';"> <i class="fa-solid fa-arrow-right" style="color: #345998; font-size:20px;"></i> </button></td>
			</tr>
			
			<tr class="border" >
				<td>3333</td>
				<td>승현이네 국밥집</td>
				<td>12,000원</td>
				<td>주문완료</td>
				<td><button type="button" class="reviewbtn" onclick="location.href='${pageContext.request.contextPath}/mypage/myReview';">리뷰작성</button></td>
				<!-- 해당 주문번호 맞춰서 이동하도록. -->
				<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/orderDetail';"> <i class="fa-solid fa-arrow-right" style="color: #345998; font-size:20px;"></i> </button></td>
			</tr>
		
		</table>
	</div>	
</div>

<footer>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>		
</footer>

</body>
</html>