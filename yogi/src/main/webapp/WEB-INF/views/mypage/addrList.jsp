<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">

.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.addr-container {
	margin: 30px auto;
	width: 1000px;
}

.addrTable {
	width: 100%;
	border: 1px solid #d9d9d9;
	background: white;
	border-collapse: collapse;
}

.addrTd {
	padding: 10px;
	border: 1px solid #d9d9d9;
}

table tr:first-child {
	background: #e2e3e5;
	font-weight: bold;
}

table tr:first-child td:nth-child(3),
table tr:first-child td:nth-child(4) {
	width: 40%;
}

.td1 {
	text-align: center;
}
.addrBtn {
	background: #6c757d;
	border-radius: 5px;
	color: white;
	padding: 5px;
	height: 40px;
	border: none;
}
.addrBtn-top {
	width: 170px;
}

.addrBtn-in {
	width: 40px;
}

.addrTop {
	text-align: right;
	padding: 10px;
}

.modal-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.modal-button {
	width: 48%;
	border:none;
	height: 50px;
	border-radius: 10px;
}

.addCart {
	background: #555;
	color: white;
}

.toOrder {
	background: #fa0050;
	color: white;
}

.modal-body {
	overflow-y: auto;
	height: 300px;
}

.modal-text {
	width: 100%;
	outline: none;
	height: 90%;
	resize: none;
	padding: 10px;
	color: #333;
	border-radius: 10px;
}

.flexali {
	display: flex;
	align-items: center;
}

</style>

<div class="whole-container">
	<jsp:include page="/WEB-INF/views/mypage/mymenu.jsp"/>
	<div class="addr-container">
		<div class="addrTop">
			<button class="addrBtn addrBtn-top" id="submenu-modal1">주소 추가하기</button>	
		</div>
		<div>
			<table class="addrTable">
				<tr>
					<td class="addrTd td1">번호</td>
					<td class="addrTd td1">우편번호</td>
					<td class="addrTd">주소 1</td>
					<td class="addrTd">주소 2</td>
					<td class="addrTd td1">삭제</td>
				</tr>
				<tr>
					<td class="addrTd td1">1</td>
					<td class="addrTd td1">11111</td>
					<td class="addrTd">경기도 고양시 일산동구 마두1동</td>
					<td class="addrTd">301동 105호</td>
					<td class="addrTd td1"><button class="addrBtn addrBtn-in"><i class="bi bi-x-lg"></i></button></td>
				</tr>
				<tr>
					<td class="addrTd td1">2</td>
					<td class="addrTd td1">11111</td>
					<td class="addrTd">경기도 고양시 일산동구 마두1동</td>
					<td class="addrTd">301동 104호</td>
					<td class="addrTd td1"><button class="addrBtn addrBtn-in"><i class="bi bi-x-lg"></i></button></td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 주소 추가 모달 -->
	<div class="modal" id="menu-modal1" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
		   		<div class="modal-header">
		    		<h5 class="modal-title">원산지 정보 작성</h5>
		    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		   		</div>
		    	<div class="modal-body">
		    		<div class="row mb-1">
			      	  <label class="col-sm-2 col-form-label" for="zip" style="line-height: 70px; vertical-align: middle; white-space: nowrap;">우편번호</label>
				        <div class="col flexali">
				       		<div class="input-group">
				           		<input type="text" name="zip" id="zip" class="form-control" placeholder="우편번호" readonly="readonly">
			           			<button class="btn btn-light" type="button" style="margin-left: 3px;" onclick="daumPostcode();">우편번호 검색</button>
				           	</div>
						</div>
				    </div>
	    			<div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="addr1">주소</label>
				        <div class="col-sm-10">
				       		<div>
				           		<input type="text" name="addr1" id="addr1" class="form-control" placeholder="기본 주소" readonly="readonly">
				           	</div>
				       		<div style="margin-top: 5px;">
				       			<input type="text" name="addr2" id="addr2" class="form-control" placeholder="상세 주소">
							</div>
						</div>
				    </div>
		    	</div>
		  		<div class="modal-footer">
		    		<button type="button" class="modal-button addCart" data-bs-dismiss="modal" aria-label="Close">취소하기</button>
		    		<button type="button" class="modal-button toOrder">등록하기</button>
		  		</div>
			</div>
		</div>
	</div>
	
</div>

<script>

document.getElementById("submenu-modal1").addEventListener("click", function() {
// 모달 창 띄우기
	$('#menu-modal1').modal('show');
});

</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>
