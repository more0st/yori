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
 	outline: none;
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
		<form name="orderForm" method="post" action="${pageContext.request.contextPath}/order/complete">
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
							<td><input class="inputtext" type="text" value="${sessionScope.member.addr1}d" readonly="readonly" name="addr1"></td>
						</tr>	
						<tr>
							<td></td>
							<td> <input class="inputtext" type="text" value="" name="addr2"></td>
						</tr>
						
						<tr>
							<td class="tdcenter bold">휴대전화번호</td>
							<td><input class="inputtext" type="text" value="${tel}" name="tel"> </td>
						</tr>
						</table>
					</div>
				</div>
				
				<div>
					<p class="titlehead">주문시 요청사항</p>
					<div class="content">
						<textarea class="requestText" name="memo"></textarea>
					</div>
				</div>
				
				<div>
					<p class="titlehead">결제수단 선택</p>
					<div class="content">
						<div class="radio">
							<div class="radioinput" onclick="selectPaymentMethod(this)">
								<input type="radio" name="payment" value="card"><div><i class="fa-solid fa-credit-card"></i>&nbsp;카드 결제</div>
							</div>
							<div class="radioinput" onclick="selectPaymentMethod(this)">
								<input type="radio" name="payment" value="cash"><div><i class="fa-solid fa-coins"></i>&nbsp;만나서 결제</div>
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
				
				<button type="button" class="btnPay" id="btnPay">결제하기</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

$(function () {

    $("#btnPay").click(function () {
        const f = document.orderForm;

        // 배송지 체크
        str = f.addr1.value;
        if (!str) {
            alert("배송지를 입력하세요.");
            f.addr1.focus();
            return;
        }

        // 전화번호 체크
        str = f.addr2.value;
        if (!str) {
            alert("상세주소를 입력하세요. ");
            f.addr2.focus();
            return;
        }

        str = f.tel.value;
        if (!/^\d{3}-\d{4}-\d{4}$/.test(str)) {
			alert("전화번호는 000-0000-0000 형식으로 입력해주세요.");
			f.tel.focus();
			return;
       	}

        if (confirm("결제 하시겠습니까 ?")) {
            const f = document.orderForm;
            var IMP = window.IMP; // 생략가능
            IMP.init('imp00258645'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
            var msg;

            IMP.request_pay({
                pg: 'kakaopay',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '요리조리요 결제',
                amount: '${totalPrice}',
                buyer_name: '${sessionScope.member.userName}',
                buyer_tel: '${tel}',
            }, function (rsp) {
                if (rsp.success) {
                    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                    jQuery.ajax({
                        url: "/order/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            imp_uid: rsp.imp_uid
                            //기타 필요한 데이터가 있으면 추가 전달
                        }
                    }).done(function (data) {
                        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                        if (everythings_fine) {
                            msg = '결제가 완료되었습니다.';
                            msg += '\n고유ID : ' + rsp.imp_uid;
                            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                            msg += '\n결제 금액 : ' + rsp.paid_amount;
                            msg += '카드 승인번호 : ' + rsp.apply_num;

                            alert(msg);
                        } else {
                            //[3] 아직 제대로 결제가 되지 않았습니다.
                            //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                        }
                    });
                    //성공시 이동할 페이지
                    f.action = "${pageContext.request.contextPath}/order/complete";
                    f.submit();
                } else {
                    msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                    //실패시 이동할 페이지
                    location.href = "${pageContext.request.contextPath}/order/order";
                    alert(msg);
                }
            });
        }
    });


});
</script>
