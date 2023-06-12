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
	width: 800px;
	margin: 30px auto;
	border: 1.3px solid #eee;
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

.fbfbef{
	background:#FBFBEF;
}

.orderDone{
	font-size: 25px;
	font-weight: bold;
	color: red;
	padding: 10px;
}

.keyword{
	width: 150px;
}


.bold {
	font-weight: bold;
}

.paddingTB{
	padding:10px;
}

.menu {
	height: 35px;
	padding: 10px;
	display: flex;
	justify-content: space-between;
}

.btnHome{
	width: 100%;
	height : 50px;
	border:none;
	border-radius: 4px;
	background: #fa0050;
	color:white;
}

.btnHome:hover{
	cursor: pointer;
	background:#FF607F;
}

.hstyle{
	margin:10px; 
	border: 1px dotted #eee;
}

</style>
</head>
<body style="padding: 0;">
<div class="whole-container">
	<header>	
		<jsp:include page="/WEB-INF/views/fragment/header.jsp"/>
	</header>

	<div class="orderComplete">
		<div>
			<p class="title1">주문완료</p>
			<div class="content1">
				<div class="content1">
					<div><p class="orderDone"> 주문 감사합니다🙏 </div>	
					<hr class="hstyle">
					<div><p class="paddingTB"> 고객님의 주문 요청이 완료되었습니다.</p> </div>	
				</div>
			</div>
		</div>
		
		<div>
			<p class="title">배달정보</p>
			<div class="content">
				<table style="border-spacing: 0 10px;">
					<tr style="">
						<td class="keyword bold">주문 식당</td> 
						<td>상훈이네 족발</td> 
					</tr>	
					<tr>
						<td class="keyword bold">결제수단</td> 
						<td>현금 결제</td> 
					</tr>	
					<tr>
						<td class="keyword bold">주문 식당</td> 
						<td>서울 강남구 역삼동</td> 
					</tr>	
					<tr>
						<td class="keyword"></td> 
						<td>11-2 1203호</td> 
					</tr>
				</table>
			</div>
		</div>


		<div class="fbfbef">
			<p class="title">주문내역</p>
			<div class="content">
				<div>
				<!-- forEach -->
					<div class="menu">
						<p class="keyword">족발 大</p><p class="detail">36,000원</p> 
					</div>	
					<div class="menu">
						<p class="keyword">막국수</p><p class="detail">17,000원</p> 
					</div>	
				<!-- /forEach -->
					<hr class="hstyle">
					<div class="menu">
						<p class="keyword bold">총 결제 금액</p><p class="detail">53,000원</p>					
					</div>
				</div>
			</div>
		</div>	
		
		<div>
			<button type="button" class="btnHome" onclick="goHome();">홈</button>
		</div>
	</div>
</div>
<footer>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>		
</footer>

<script type="text/javascript">
function goHome(){
	location.href = '${pageContext.request.contextPath}/home/home';
}
</script>
</body>
</html>