<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.orderComplete{
	width: 800px;
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

.fbfbef{
	background:#FBFBEF;
	border: 1.3px solid #eee;
	margin-bottom: 10px;
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
	border: 1px dotted #333;
}

.bordereee {
	border: 1.3px solid #eee;
	background: white;
}
</style>


<div class="whole-container">
	<div class="orderComplete">
		<div class="bordereee">
			<p class="title1">주문완료</p>
			<div class="content1">
				<div class="content1">
					<div><p class="orderDone"> 주문 감사합니다🙏 </div>	
					<hr class="hstyle">
					<div><p class="paddingTB"> 고객님의 주문 요청이 완료되었습니다.</p> </div>	
				</div>
			</div>
		</div>
		
		<!-- 배달정보 값 받아서 넣어주기 -->
		<div class="bordereee">
			<p class="title">배달정보</p>
			<div class="content">
				<table style="border-spacing: 0 10px;">
					<tr>
						<td class="keyword bold">주문번호</td> 
						<td>202306150101</td> 
					</tr>
					<tr>
						<td class="keyword bold">주문식당</td> 
						<td>상훈이네 족발</td> 
					</tr>	
					<tr>
						<td class="keyword bold">결제수단</td> 
						<td>현금 결제</td> 
					</tr>	
					<tr>
						<td class="keyword bold">배달주소</td> 
						<td><span>서울 강남구 역삼동</span>&nbsp;<span>11-2 1203호</span></td> 
					</tr>	
				</table>
			</div>
		</div>


		<div class="fbfbef">
			<p class="title">주문내역</p>
			<div class="content">
				<div>
				<!-- forEach 문 사용해서 메뉴/가격 -->
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

<script type="text/javascript">
function goHome(){
	location.href = '${pageContext.request.contextPath}/home/home';
}
</script>