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

.orderComplete{
	width: 1100px;
	margin: 30px auto;
}

.title1{
	background: #2E2E2E;
	color: white;
	height: 40px;
	padding : 10px 0;
	padding-left: 10px;
}

.title{
	background: #E6E6E6;
	height: 40px;
	padding : 10px 0;
	padding-left: 10px;
}

.content1{
	margin: 10px auto;
	text-align: center
}

.content{
	margin: 10px;
}


.orderDone{
	font-size: 25px;
	font-weight: bold;
	color: red;
	padding-bottom: 10px;
}

.keyword{
	float:left;
	width: 100px;
}

.detail{
	float:right;
}

</style>
</head>
<body style="padding: 0;">
<div class="whole-container">
	<header>	
		<jsp:include page="/WEB-INF/views/fragment/header.jsp"/>
	</header>
	
	<div>
		결제 완료 페이지
		결제가 완료 되었습니다.
		홈으로 가기 ${pageContext.request.contextPath}/home/home
	</div>


	<div class="orderComplete">
		<div>
			<p class="title1">주문완료</p>
			<div class="content1">
				<table class="content1">
				<tr>
					<td><p class="orderDone"> 주문 감사합니다🙏 </td> 
				</tr>	
				<tr>
					<td>주문 요청이 완료되었습니다.</td>
				</tr>
				</table>
			</div>
		</div>
		
		<div>
			<p class="title">배달정보</p>
			<div class="content">
				<table>
					<tr>
						<td class="keyword">주문 식당</td> 
						<td class="detail">상훈이네 족발</td> 
					</tr>	
					<tr>
						<td class="keyword">결제수단</td> 
						<td class="detail">현금 결제</td> 
					</tr>	
					<tr>
						<td class="keyword">주문 식당</td> 
						<td class="detail">서울 강남구 역삼동</td> 
					</tr>	
					<tr>
						<td class="keyword"></td> 
						<td class="detail">11-2 1203호</td> 
					</tr>
				</table>
			</div>
		</div>

		<div>
			<p class="title">주문내역</p>
			<div class="content">
				<table>
				<!-- forEach -->
					<tr>
						<td class="keyword">족발 大</td> 
						<td class="detail">36,000원</td> 
					</tr>	
					<tr>
						<td class="keyword">막국수</td> 
						<td class="detail">17,000원</td> 
					</tr>	
				<!-- /forEach -->
					
					<tr>
						<td class="keyword">총 결제 금액</td>					
						<td class="detail">53,000원</td>					
					</tr>
				</table>
			</div>
		</div>		
		
	</div>

</div>
<footer>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>		
</footer>
</body>
</html>