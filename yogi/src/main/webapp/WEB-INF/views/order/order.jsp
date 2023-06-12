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

.order{
	width: 1100px;
	margin: 30px auto;
	display:flex;
	justify-content: center;
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

.content{
	margin: 10px;
}

.requestText{
	resize: none;
	outline: none;
	width:100%;
	padding:10px;
	height: 100px;
}

.orderInfo{
	float: left;
	width: 700px;
	border: 1px solid #D8D8D8;
	white-space: nowrap;
	margin-right: 20px;
}

.orderList{
	float: right;
	width: 330px;
	border: 1px solid #D8D8D8;
}

.menu{
	background:#FBFBEF;
}

.listContent{
	border : 1px solid #eee;
}

.totalPrice{
	color:red;
}

.bold {
	font-weight: bold;
}

td{
	padding-left: 10px;
	padding-bottom: 10px;
}

input{
 	width : 300px;
 	height: 30px;
}

.lightgray{
	color : lightgray;
	font-size: 2px;
}

.btnPay{
	width: 100%;
	height: 46px;
	font-size: 18px;
	background: #fa0050;
	border:none;
	color:white;
	margin-top:5px;
	border-radius: 4px;
}



</style>
</head>
<body style="padding: 0;">
<div class="whole-container">
	<header>	
		<jsp:include page="/WEB-INF/views/fragment/header.jsp"/>
	</header>

	<div class="order">
		<form action="${pageContext.request.contextPath}/order/complete">
			<div class="orderInfo">
				<div>
					<p class="title1">결제하기</p>
				</div>
				
				<div>
					<p class="title">배달정보</p>
					<div class="content">
						<table>
						<tr>
							<td><p class="bold"> 주소 </p> </td> 
							<td><input type="text" value="배송지 주소 불러오기"></td>
						</tr>	
						<tr>
							<td></td>
							<td> <input type="text" value=""></td>
						</tr>
						
						<tr>
							<td><p class="bold"> 휴대전화번호 </p> </td>
							<td><input type="text" value=""> </td>
						</tr>
						</table>
					</div>
				</div>
				
				<div>
					<p class="title">주문시 요청사항</p>
					<div class="content">
						<textarea class="requestText"></textarea>
					</div>
				</div>
				
				<div>
					<p class="title">결제수단 선택(현장 결제는 지원하지 않습니다.)</p>
					<div class="content">
						<p class="bold">요기서 결제</p>
						<div>신용카드 / 네이버페이</div>
					</div>
				</div>
				
				<div>
					<p class="title">할인방법 선택</p>
					<div class="content bold"> 쿠폰 : <input type="text" placeholder="쿠폰 코드 입력"> <button type="button">적용</button></div>
				</div>
			</div>
			
			<div class="orderList">
				<p class="title">주문내역</p>
				<div class="listContent">
					<p> $가게 이름 </p>
					<hr style="border:1px solid #eee;">
					<div class="menu"> $메뉴 $가격 </div>
					<hr style="border:1px dotted #eee;">
					<div class="menu totalPrice">총 결제 금액$총결제금액</div>
				</div>
				
				<div class="lightgray">이용약관, 개인정보 수집 및 이용, 개인정보 제3자 제공 , 전자금융거래 이용약관, 만 14세 이상 이용자 내용 확인하였으며 결제에 동의합니다.</div>
				
				<button type="submit" class="btnPay">결제하기</button>
			</div>
		</form>	
		
	</div>
</div>
<footer>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>		
</footer>

</body>
</html>