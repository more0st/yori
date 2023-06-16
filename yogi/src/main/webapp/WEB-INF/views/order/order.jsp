<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
 
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

.titlehead{
	background: #E6E6E6;
	height: 40px;
	padding : 10px 0;
	padding-left: 10px;
}

.content{
	margin: 10px;
	padding: 0 10px;
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
	background: white;
}

.orderList{
	float: right;
	width: 330px;
}

.fbfbef{
	background:#FBFBEF;
	height: 60px;
	border-top: 1px solid #eee;
}

.menu {
	height: 40px;
	padding: 10px;
	display: flex;
	justify-content: space-between;
}

.listContent{
	border : 1px solid #eee;
}

.totalPrice{
	color:red;
	border-top: 1px dotted #eee;
}

.bold {
	font-weight: bold;
}

td{
	padding: 10px;
}

.inputtext {
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

.btnPay:hover {
	cursor: pointer;
}

.access {
	border-right: none;
	border-left: none;
	padding: 10px 0;
}

.radioinput {
	width: 48%;
	height: 50px;
	border: 1px solid #aaa;
	display: flex;
	gap: 20px;
	justify-content: center;
	align-items: center;
	font-size: 16px;
	font-weight: bold;
	color: #333;
	cursor: pointer;
}

.radio {
	display: flex;	
	margin: 10px auto;
	justify-content: center;
}

input[type=text] {
	height: 30px;
	width: 100%;
	padding: 10px;
}

input[type=radio] {
	display: none;	
}

.white {
	background: white;
}

.selected {
    background: #fa0050;
    color: white;
    border: none;
}

.applybutton {
	width: 60px;
	height: 30px;
	background: white;
	color: #fa0050;
	border: 1px solid #fa0050;
	border-radius: 5px;
}

.applybutton:hover {
	cursor: pointer;
	background: #fa0050;
	color: white;
	height: 30px;
}

.content-coupon {
	display: flex;
	align-items: center;
	gap: 10px;
}

.contenttable {
	width: 100%;
}

.contenttable td:first-child {
  width: 150px;
}

.tdcenter {
	display: flex;
	align-items: center;
}
</style>

<div class="whole-container">
	<div class="order">
		<!-- onclick으로 유효성 검사와 action 버튼 submit 수정하기 input태그 name 속성 주기 -->
		<form name="orderForm" action="${pageContext.request.contextPath}/order/complete">
			<div class="orderInfo">
				<div>
					<div class="title1">결제하기</div>
				</div>
				
				<div>
					<p class="titlehead">배달정보</p>
					<div class="content">
						<table class="contenttable">
						<tr>
							<td class="tdcenter bold">주소</td>
							<td><input class="inputtext" type="text" value="배송지 주소 불러오기" readonly="readonly"></td>
						</tr>	
						<tr>
							<td></td>
							<td> <input class="inputtext" type="text" value=""></td>
						</tr>
						
						<tr>
							<td class="tdcenter bold">휴대전화번호</td>
							<td><input class="inputtext" type="text" value=""> </td>
						</tr>
						</table>
					</div>
				</div>
				
				<div>
					<p class="titlehead">주문시 요청사항</p>
					<div class="content">
						<textarea class="requestText"></textarea>
					</div>
				</div>
				
				<div>
					<p class="titlehead">결제수단 선택</p>
					<div class="content">
						<div class="radio">
							<div class="radioinput" onclick="selectPaymentMethod(this)">
								<input type="radio" name="payment" value="card"><div><i class="fa-solid fa-credit-card"></i>&nbsp;카드결제</div>
							</div>
							<div class="radioinput" onclick="selectPaymentMethod(this)">
								<input type="radio" name="payment" value="cash"><div><i class="fa-solid fa-coins"></i>&nbsp;현금결제</div>
							</div>
						</div>
					</div>
				</div>
				
				<div>
					<p class="titlehead">할인방법 선택</p>
					<div class="content">
						<div class="content-coupon bold"><div> 쿠폰 : </div><input class="inputtext" type="text" placeholder="쿠폰 코드 입력"> <button class="applybutton" type="button">적용</button></div>
					</div>
				</div>
			</div>
			
			<div class="orderList">
				<div class="titlehead">주문내역</div>
				<div class="listContent">
					<div class="menu white">$가게이름</div>
					<!-- foreach 돌리기 -->
					<div class="menu fbfbef"><p>$메뉴</p><p>$가격</p></div>
					<div class="menu fbfbef totalPrice"><p>총 결제 금액</p><p>$총결제금액</p></div>
				</div>
				
				<div class="access lightgray">이용약관, 개인정보 수집 및 이용, 개인정보 제3자 제공 , 전자금융거래 이용약관, 만 14세 이상 이용자 내용 확인하였으며 결제에 동의합니다.</div>
				
				<button type="submit" class="btnPay">결제하기</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">

let selectedElement = null;

function selectPaymentMethod(element) {
    const radioInput = element.querySelector('input[type="radio"]');
    radioInput.checked = true;
    
    // 이전에 선택된 요소의 스타일 제거
    if (selectedElement) {
        selectedElement.classList.remove('selected');
    }
    
    // 선택된 요소에 스타일 추가
    element.classList.add('selected');
    
    // 선택된 요소 저장
    selectedElement = element;
}
</script>
