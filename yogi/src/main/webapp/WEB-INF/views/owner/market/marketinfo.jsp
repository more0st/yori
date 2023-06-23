<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">

.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.info-container {
	width: 1000px;
}

.info-container {
	margin: 0 auto;
	width: 1100px;
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.info-container-top {
	height: 200px;
	display: flex;
	justify-content: space-between;
}

.list-title {
	font-weight: bold;
	font-size: 18px;
	display: flex;
	align-items: center;
	width: 180px;
	border-bottom: 3px solid #333;
	padding-left: 10px;
}

.info-detail {
	width: 48%;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	padding: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.tipSet {
	min-height: 100px;
	margin-top: 20px;
	padding: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	border: 1px solid #d9d9d9;
	border-radius: 10px;
}

.foodInfo {
	min-height: 100px;
	margin-top: 20px;
	padding: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	border: 1px solid #d9d9d9;
	border-radius: 10px;
}

.info-button {
	text-align: center;
	width: 60px;
	border-radius: 10px;
	background: #f6f9ff;
	border: 1px solid #d9d9d9;
	color: #333;
	font-weight: bold;
	height: 30px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.flex-between {
	display: flex;
	justify-content: space-between;
}

.time-bottom-left {
	text-align: center;
	width: 80px;
	border-radius: 10px 0 0 10px;
	padding: 10px;
	background: #f6f9ff;
	border: 1px solid #d9d9d9;
	color: #333;
	font-weight: bold;
}

.time-bottom-right {
	width: 80px;
	border-radius: 0 10px 10px 0;
	padding: 10px;
	border: 1px solid #d9d9d9;
	background: white;
	text-align: center;
}

.price-bottom-left {
	text-align: center;
	width: 150px;
	border-radius: 10px 0 0 10px;
	padding: 10px;
	background: #f6f9ff;
	border: 1px solid #d9d9d9;
	color: #333;
	font-weight: bold;
}

.price-bottom-right {
	width: 100px;
	border-radius: 0 10px 10px 0;
	padding: 10px;
	border: 1px solid #d9d9d9;
	background: white;
	text-align: center;
}

.flex-center {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80%;
}

.flex-center2 {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 50px;
}

.time-bottom {
	display: flex;
}

.foodInfo-detail {
	padding: 10px;
	color: #333;
}

.flexgrid {
	width: 100%;
	padding: 10px;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 10px;
}

.tipdetail {
	border: 1px solid #d9d9d9;
	color: #333;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	padding: 10px;
	border-radius: 10px;
	min-height: 70px;
}

.tipDetail-info {
	display: flex;
	align-items: center;
	color: #333;
}

.tipDetail-title {
	width: 80px;
	font-weight: bold;
	white-space: nowrap;
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
	height: 200px;
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

.modal-input {
	outline: none;
	border: none;
	width: 100%;
}

.modal-input2 {
	outline: none;
	width: 100%;
	padding: 5px;
	border-radius: 5px;
	color: #333;
	border: 1px solid #d9d9d9;
}

.info-picture {
	margin-bottom: 20px;
}

.info-picture-img {
	width: 30%;
	border: 1px solid #d9d9d9;
	min-height: 200px;
	border-radius: 10px;
	padding: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}
.res-img {
	width: 170px;
	height: 170px;
	border: 1px solid #d9d9d9;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
}

.info-picture-btn {
	font-color: #333;
	border: 1px solid #d9d9d9;
	width: 100%;
	height: 170px;
	border-radius: 10px;
	background: #f6f9ff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	font-weight: bold;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
}

.fileModal {
	display: flex;
	align-items: center;
	height: 100%;
}

.fileInput {
	border: 1px solid #d9d9d9;
	width: 100%;
}

.info-picture-detail {
	padding-top: 10px;
	gap: 10px;
}

</style>
<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

function ajaxFileFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		processData: false, // file 전송시 필수, 서버로전송하는 데이터를 쿼리문자열로변환여부
		contentType: false, // file 전송시 필수, 서버에전송할 데이터의 Content-Type. 기본은 application/x-www-urlencoded
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	$('.btnInsertImgOk').click(function(){
		// 사진인서트
		const f=document.insertImgForm;
		let str;
		
		str=f.selectFile.value;
		
		if(! str){
			alert("이미지를 선택해주세요.");
			f.selectFile.focus();
			return;
		}
		
		let url="${pageContext.request.contextPath}/owner/market/insertimg";
		let query=new FormData(f);
		
		const fn=function(data){
			if(data.state=="false"){
				alert("로고를 등록하지 못했습니다.");
				return false;
			}
			
		};
		
		ajaxFileFun(url,"post",query,"json",fn);

	});
});





</script>

<main id="main" class="main">
<div class="whole-container">
	
	<div class="info-container">
		<div class="list-title" style="margin-bottom: 20px; width: 220px;">
			가게정보
		</div>
		<div class="info-picture">
			<div class="info-picture-img">
				<div class="list-title">
					가게 사진
				</div>
				<div class="flex-center info-picture-detail">
					<c:if test="${empty img}">
					<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/add_photo.png">
					</c:if>
					<c:if test="${not empty img}">
					</c:if>
					<div class="info-picture-btn" id="submenu-modal5">가게 로고<br>사진 추가</div>
					<!-- c:if로 추가/변경 바꿔주기 -->
				</div>
			</div>
		</div>
		<div class="info-container-top">
			<div class="info-detail">
				<div class="flex-between">
					<div class="list-title">
						영업 시간
					</div>
					<button class="info-button" id="submenu-modal1">수정</button>
				</div>
				
				<div class="flex-center">
					<div class="time-bottom">
						<div class="time-bottom-left shadow-sm">
							OPEN
						</div>
						<div class="time-bottom-right shadow-sm">
							${dto.openingHour}
						</div>
					</div>
					<div>&nbsp;&nbsp;~&nbsp;&nbsp;</div>
					<div class="time-bottom">
						<div class="time-bottom-left shadow-sm">
							CLOSE
						</div>
						<div class="time-bottom-right shadow-sm">
							${dto.closingHour}
						</div>
					</div>
				</div>
			</div>
			
			<div class="info-detail">
				<div class="flex-between">
					<div class="list-title">
						최소주문 금액
					</div>
					<button class="info-button" id="submenu-modal2">수정</button>
				</div>
				<div class="flex-center">
					<div class="time-bottom">
						<div class="price-bottom-left shadow-sm">
							최소주문 금액
						</div>
						<div class="price-bottom-right shadow-sm">
							${dto.basePrice}원
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="tipSet">
			<div class="flex-between">
				<div class="list-title">
					배달팁 설정
				</div>
				<button class="info-button" id="submenu-modal3">추가</button>
			</div>
			
			<div class="flexgrid">
				<c:if test="${empty tipList}">
					<div class="tipdetail flex-between">
						<div style="width: 80%;">
							등록된 배달팁 정보가 없습니다.
						</div>
					</div>
				</c:if>
				<c:if test="${not empty tipList}">
				<c:forEach var="tip" items="${tipList}" varStatus="status">
					<div class="tipdetail flex-between">
						<div style="width: 80%;">
							<div class="tipDetail-info"><div class="tipDetail-title">배달지역 : </div><div>${tip.addr}</div></div>
							<div class="tipDetail-info"><div class="tipDetail-title">배&nbsp;&nbsp;달&nbsp;&nbsp;팁 : </div><div>${tip.deliveryFee}원</div></div>
						</div>
						<button class="info-button">삭제</button>
					</div>
				</c:forEach>
				</c:if>
				
			</div>
		</div>
		
		<div class="foodInfo">
			<div class="flex-between">
				<div class="list-title">
					원산지 정보
				</div>
				<button class="info-button" id="submenu-modal4">수정</button>
			</div>
			<div class="foodInfo-detail">
			${dto.foodInfo}
			</div>
		</div>
		
	</div>

<!-- 영업시간 모달 -->
<div class="modal" id="menu-modal1" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
	   		<div class="modal-header">
	    		<h5 class="modal-title">영업 시간 설정</h5>
	    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	   		</div>
	    	<div class="modal-body">
    			<div class="flex-center">
					<div class="time-bottom">
						<div class="time-bottom-left shadow-sm">
							OPEN
						</div>
						<div class="time-bottom-right shadow-sm">
							<input class="modal-input" type="text" value="${dto.openingHour}">
						</div>
					</div>
					<div>&nbsp;&nbsp;~&nbsp;&nbsp;</div>
					<div class="time-bottom">
						<div class="time-bottom-left shadow-sm">
							CLOSE
						</div>
						<div class="time-bottom-right shadow-sm">
							<input class="modal-input" type="text" value="${dto.closingHour}">
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

<!-- 최소주문금액 모달 -->
<div class="modal" id="menu-modal2" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
	   		<div class="modal-header">
	    		<h5 class="modal-title">최소주문 금액 설정</h5>
	    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	   		</div>
	    	<div class="modal-body">
	    		<div class="flex-center">
	    			<div class="time-bottom">
						<div class="price-bottom-left shadow-sm">
							최소주문 금액
						</div>
						<div class="price-bottom-right shadow-sm">
							<input class="modal-input" type="text"  value="${dto.basePrice}">
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

<!-- 배달팁 설정 모달 -->
<div class="modal" id="menu-modal3" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
	   		<div class="modal-header">
	    		<h5 class="modal-title">배달팁 설정</h5>
	    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	   		</div>
	    	<div class="modal-body">
    				<div class="flex-center2">
    					<div class="tipDetail-title">배달지역 : &nbsp;&nbsp;</div><input class="modal-input2" type="text">
    				</div>
    				<div class="flex-center2">
    					<div class="tipDetail-title">배&nbsp;&nbsp;달&nbsp;&nbsp;팁 : &nbsp;&nbsp;</div><input class="modal-input2" type="text">
    				</div>
	    	</div>
	  		<div class="modal-footer">
	    		<button type="button" class="modal-button addCart" data-bs-dismiss="modal" aria-label="Close">취소하기</button>
	    		<button type="button" class="modal-button toOrder">등록하기</button>
	  		</div>
		</div>
	</div>
</div>

<!-- 원산지정보 모달 -->
<div class="modal" id="menu-modal4" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
	   		<div class="modal-header">
	    		<h5 class="modal-title">원산지 정보 작성</h5>
	    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	   		</div>
	    	<div class="modal-body">
    			<textarea class="modal-text">${dto.foodInfo}</textarea>
	    	</div>
	  		<div class="modal-footer">
	    		<button type="button" class="modal-button addCart" data-bs-dismiss="modal" aria-label="Close">취소하기</button>
	    		<button type="button" class="modal-button toOrder">등록하기</button>
	  		</div>
		</div>
	</div>
</div>

<!-- 사진 추가 모달 -->
<div class="modal" id="menu-modal5" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
	   		<div class="modal-header">
	    		<h5 class="modal-title">가게 사진</h5>
	    		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	   		</div>
	   		
	    	<form name="insertImgForm" method="post" enctype="multipart/form-data">
		    	<div class="modal-body">
		    		<div class="fileModal">
		    			<input type="file" name="selectFile" accept="image/*" class="fileInput form-control">
		    		</div>
		    	</div>
		  		<div class="modal-footer">
		    		<button type="button" class="modal-button addCart" data-bs-dismiss="modal" aria-label="Close">취소하기</button>
		    		<button type="button" class="modal-button toOrder btnInsertImgOk">등록하기</button>
		  		</div>
	    	</form>
		</div>
	</div>
</div>


</div>
</main>

<script type="text/javascript">

<%-- 모달 --%>
<%-- 영업시간 모달 --%>
document.getElementById("submenu-modal1").addEventListener("click", function() {
// 모달 창 띄우기
	$('#menu-modal1').modal('show');
});

<%-- 최소주문금액 모달 --%>
document.getElementById("submenu-modal2").addEventListener("click", function() {
// 모달 창 띄우기
	$('#menu-modal2').modal('show');
});

<%-- 배달팁 설정 모달 --%>
document.getElementById("submenu-modal3").addEventListener("click", function() {
// 모달 창 띄우기
	$('#menu-modal3').modal('show');
});
	
<%-- 원산지 정보 모달 --%>
document.getElementById("submenu-modal4").addEventListener("click", function() {
// 모달 창 띄우기
	$('#menu-modal4').modal('show');
});

<%-- 사진 모달 --%>
document.getElementById("submenu-modal5").addEventListener("click", function() {
// 모달 창 띄우기
	$('#menu-modal5').modal('show');
});

</script>