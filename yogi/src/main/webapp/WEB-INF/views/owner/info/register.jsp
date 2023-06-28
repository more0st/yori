<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
   min-height: 800px;
   padding-bottom: 20px;
}

.memberForm {
   width: 930px;
   height: 1100px;
   border: 1px solid #eee;
   background: white;
   margin: 0 auto;
   border-radius: 4px;
   padding: 15px 30px;
}

.input-group {
   padding: 24px 0px;
}

.check-butn {
   position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    opacity: 0;
    height: 48px;
    border-radius: 10px;
    background-color: rgb(41, 53, 61);
}

.body-main {
   width: 900px;
   border: 1px solid #eee;
   margin: 130px auto;
   border-radius: 4px;
   padding: 25px;
   background: white;
}
</style>

<main id="main" class="main">
	<div class="whole-container">
		<div class="body-main">
				<form name="memberForm" method="post">
				 	<div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="businessNum">사업자등록번호</label>
				        <div class="col-sm-7">
				            <input type="text" name="businessNum" id="businessNum" pattern="\d{3}-\d{2}-\d{5}" required="required" class="form-control" value="${dto.businessNum}" 
				            		${mode=="update" ? "readonly='readonly' ":""}
				            		maxlength="10"
				            		placeholder="사업자등록번호">
				            <small class="form-control-plaintext">사업자등록번호는 숫자 10자리만 입력해주세요.</small>		
				        </div>
				    </div>
				 	
				    <div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="restaurantName">상호명</label>
				        <div class="col-sm-7">
				            <input type="text" name="restaurantName" id="restaurantName" class="form-control" value="${dto.restaurantName}" 
				            		${mode=="update" ? "readonly='readonly' ":""}
				            		placeholder="상호명">
				        </div>
				    </div>
				    
				    <div class="row mb-3" style="display: flex; align-items: center;">
				        <label class="col-sm-2 col-form-label" for="selectownerCategory" >업장 종류</label>
				        <div class="col-sm-8 row">
							<div class="col-3 pe-0">
								<select name="categoryNum" id="selectownerCategory" class="form-select" style="margin-top: 24px;">
									<option value="">선 택</option>
									<option value="1" ${dto.categoryNum=="1" ? "selected='selected'" : ""}>프랜차이즈</option>
									<option value="2" ${dto.categoryNum=="2" ? "selected='selected'" : ""}>치킨</option>
									<option value="3" ${dto.categoryNum=="3" ? "selected='selected'" : ""}>피자/양식</option>
									<option value="4" ${dto.categoryNum=="4" ? "selected='selected'" : ""}>중국집</option>
									<option value="5" ${dto.categoryNum=="5" ? "selected='selected'" : ""}>한식</option>
									<option value="6" ${dto.categoryNum=="6" ? "selected='selected'" : ""}>일식/돈까스</option>
									<option value="7" ${dto.categoryNum=="7" ? "selected='selected'" : ""}>족발/보쌈</option>
									<option value="8" ${dto.categoryNum=="8" ? "selected='selected'" : ""}>야식</option>
									<option value="9" ${dto.categoryNum=="9" ? "selected='selected'" : ""}>분식</option>
									<option value="10" ${dto.categoryNum=="10" ? "selected='selected'" : ""}>카페/디저트</option>
									<option value="11" ${dto.categoryNum=="11" ? "selected='selected'" : ""}>편의점/마트</option>
								</select>
							</div>
				        </div>
				    </div>
				    
				    <div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="restaurantTel1">사업장 전화번호</label>
				        <div class="col-sm-10 row">
							<div class="col-sm-3 pe-1">
								<input type="text" name="restaurantTel1" id="restaurantTel1" class="form-control" value="${dto.restaurantTel1}" maxlength="3">
							</div>
							<div class="col-sm-1 px-1" style="width: 2%;">
								<p class="form-control-plaintext text-center">-</p>
							</div>
							<div class="col-sm-3 px-1">
								<input type="text" name="restaurantTel2" id="restaurantTel2" class="form-control" value="${dto.restaurantTel2}" maxlength="4">
							</div>
							<div class="col-sm-1 px-1" style="width: 2%;">
								<p class="form-control-plaintext text-center">-</p>
							</div>
							<div class="col-sm-3 ps-1">
								<input type="text" name="restaurantTel3" id="restaurantTel3" class="form-control" value="${dto.restaurantTel3}" maxlength="4">
							</div>
				        </div>
				    </div>
				
				    <div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="zip" style="line-height: 70px; vertical-align: middle;">우편번호</label>
				        <div class="col-sm-5">
				       		<div class="input-group">
				           		<input type="text" name="zip" id="zip" class="form-control" placeholder="우편번호" value="${dto.zip}" readonly="readonly">
			           			<button class="btn btn-light" type="button" style="margin-left: 3px;" onclick="daumPostcode();">우편번호 검색</button>
				           	</div>
						</div>
				    </div>
			
				    <div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="restaurantAddr1">사업장 주소</label>
				        <div class="col-sm-10">
				       		<div>
				           		<input type="text" name="restaurantAddr1" id="restaurantAddr1" class="form-control" placeholder="기본 주소" value="" readonly="readonly">
				           	</div>
				       		<div style="margin-top: 5px;">
				       			<input type="text" name="restaurantAddr2" id="restaurantAddr2" class="form-control" placeholder="상세 주소" value="">
							</div>
						</div>
				    </div>
			
				    <div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="agree">약관 동의</label>
						<div class="col-sm-8" style="padding-top: 5px;">
							<input type="checkbox" id="agree" name="agree"
								class="form-check-input"
								checked="checked"
								style="margin-left: 0;"
								onchange="form.sendButton.disabled = !checked">
							<label class="form-check-label">
								[필수] 개인정보 수집 및 이용에 동의합니다.
							</label>
						</div>
				    </div>
				     
				    <div class="row mb-3">
				        <div class="text-center">
				            <c:if test="${mode == 'update'}">
					            <button type="button" name="sendButton" class="btn btn-danger" onclick="updateOk();"> 수정하기 <i class="bi bi-check2"></i></button>
				            </c:if>
				            <c:if test="${mode == 'member' }">
					            <button type="button" name="sendButton" class="btn btn-danger" onclick="memberOk();"> 등록하기 <i class="bi bi-check2"></i></button>
				            </c:if>
				            
							<input type="hidden" name="userIdValid" id="userIdValid" value="false">
				        </div>
				    </div>
				
				    <div class="row">
						<p class="form-control-plaintext text-center">${message}</p>
				    </div>
				</form>
	
			</div>
	
	</div>
</main>

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
                document.getElementById('restaurantAddr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('restaurantAddr2').focus();
            }
        }).open();
    }
</script>

<script type="text/javascript">
function memberOk() {
	const f = document.memberForm;
	let str;
	
    str = f.businessNum.value;
    if( !/^\d{10}$/.test(str) ) {
        alert("사업자등록번호를 다시 입력하세요. ");
        f.businessNum.focus();
        return;
    }
    
    str = f.restaurantName.value;
    if( !str ) {
        alert("상호명을 입력하세요. ");
        f.restaurantName.focus();
        return;
    }
    
    // 카테고리
    str = f.categoryNum.value;
    if( !str ) {
        alert("카테고리를 선택하세요. ");
        f.categoryNum.focus();
        return;
    }
    
    str = f.restaurantTel1.value;
    if( !str ) {
        alert("사업장 전화번호를 입력하세요. ");
        f.restaurantTel1.focus();
        return;
    }

    str = f.restaurantTel2.value;
    if( !/^\d{3,4}$/.test(str) ) {
        alert("숫자만 가능합니다. ");
        f.restaurantTel2.focus();
        return;
    }

    str = f.restaurantTel3.value;
    if( !/^\d{4}$/.test(str) ) {
    	alert("숫자만 가능합니다. ");
        f.restaurantTel3.focus();
        return;
    }
    
    str = f.restaurantAddr1.value;
    if( !str ) {
        alert("사업장 주소를 입력하세요. ");
        f.restaurantAddr1.focus();
        return;
    }
    
   	f.action = "${pageContext.request.contextPath}/owner/info/register";
    f.submit();
}

function updateOk() {
	const f = document.memberForm;
	let str;
	
    str = f.businessNum.value;
    if( !/^\d{10}$/.test(str) ) {
        alert("사업자등록번호를 다시 입력하세요. ");
        f.businessNum.focus();
        return;
    }
    
    str = f.restaurantName.value;
    if( !str ) {
        alert("상호명을 입력하세요. ");
        f.restaurantName.focus();
        return;
    }
    
    // 카테고리
    str = f.categoryNum.value;
    if( !str ) {
        alert("카테고리를 선택하세요. ");
        f.categoryNum.focus();
        return;
    }
    
    str = f.restaurantTel1.value;
    if( !str ) {
        alert("사업장 전화번호를 입력하세요. ");
        f.restaurantTel1.focus();
        return;
    }

    str = f.restaurantTel2.value;
    if( !/^\d{3,4}$/.test(str) ) {
        alert("숫자만 가능합니다. ");
        f.restaurantTel2.focus();
        return;
    }

    str = f.restaurantTel3.value;
    if( !/^\d{4}$/.test(str) ) {
    	alert("숫자만 가능합니다. ");
        f.restaurantTel3.focus();
        return;
    }
    
    str = f.restaurantAddr1.value;
    if( !str ) {
        alert("사업장 주소를 입력하세요. ");
        f.restaurantAddr1.focus();
        return;
    }
    
   	f.action = "${pageContext.request.contextPath}/owner/info/update";
    f.submit();
}

</script>