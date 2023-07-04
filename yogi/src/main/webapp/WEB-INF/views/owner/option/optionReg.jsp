<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.option-box input[type=text] {
	width: 40%;
	display: inline-block;
}

.iconsize{
	font-size:25px; 
	margin-bottom:15px;
}

.iconPointer{
	cursor: pointer;
}
</style>

<div class="modal fade" id="optionInsertModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">옵션 그룹 추가</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="row g-3" name="optionInsertForm" method="post">
					<div class="col-md-12">
						<label class="col-form-label">옵션그룹명</label> <input name="option_group" type="text"
							class="form-control" placeholder="ex)사이즈">
					</div>
					<div class="col-md-12">
						<label class="col-form-label">옵션 추가</label>
					</div>
					<div class="option-box">
						<div class="col-md-12">
							<p>
								<input type="text" name="option_names" class="form-control" placeholder="이름">
								<input type="text" name="option_prices" class="form-control" placeholder="가격"
									style="margin-left: 5px;"> 
								<span class="optionRemoveBtn" style="display: inline-block; margin-left: 5px;"> 
								<i class="bi bi-x-square"></i></span>
							</p>
						</div>
						<div style="text-align: center; margin-top: 10px;">
							<button type="button" class="btn optionAddBtn">추가</button>
							<input type="hidden" name="menuNum" value="${menuNum}">
						</div>
					</div>
				</form>
			</div>
			<div class="text-center modal-footer">
				<button type="submit" class="btn btn-primary optionInsertOk">옵션등록하기</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소하기</button>
			</div>
		</div>
	</div>
</div>

<main id="main" class="main">
	<div onclick="location.href='${pageContext.request.contextPath}/owner/option/menuList'" class="iconsize"><i class="bi bi-arrow-left-circle iconPointer"></i></div>
	<div class="pagetitle">
		<h1>옵션 메뉴 </h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">치킨</li>
				<li class="breadcrumb-item active">양념치킨</li>
			</ol>
		</nav>
	</div>

	<!-- list 조회 -->
	<section class="section">
		<div class="card">
			<div class="card-body" style="padding: 10px;">
				<h2 class="card-title"
					style="display: inline-block; margin-left: 20px;">옵션그룹 설정</h2>
				<button type="button" class="btn btn-primary btn-sm" id="optionInsert">추가</button>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<!-- foreach 돌려야 하는 div 태그 -->
				<div class="accordion" id="accordionPanelsStayOpenExample">
				<c:forEach var="option" items="${optionList}" varStatus="status">
					<div class="accordion-item">
						<h2 class="accordion-header" id="panelsStayOpen-headingOne">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseOne"
								aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
								${option.option_group}</button>
						</h2>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse ${status.count==1?'show':''}"
							aria-labelledby="panelsStayOpen-headingOne">
							<div class="accordion-body" style="display: inline-block;">
							<c:forEach var="dto" items="${option.optionList}">
								<span>${dto.option_name} - ${dto.price}원</span><br>
							</c:forEach>
							</div>
							<div style="display: inline-block; float: right; padding: 20px;">
							<button type="button" class="btn btn-secondary btn-sm" >삭제</button>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

</main>
<!-- End #main -->



<script type="text/javascript">

function login() {
	location.href="${pageContext.request.contextPath}/owner/home";
}
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

$(function(){
    $(".optionRemoveBtn").hide();
    
    $(".optionAddBtn").click(function(){
        $(".optionRemoveBtn").show();
        
        // const p = $(this).parent().parent().find("div:first-child  :first").html();
        // const p = $(this).parent().parent().find("div:first-child").children("p").html();
        // $(this).parent().parent().find("div:first").append("<p>"+p+"</p>");
        
        // 자신의 html : 첫번째 p태그를 복제하여 div로 감싼후 div안의 html요소가져 오기
        // const p = $(this).parent().parent().find("div:first-child  :first").clone().wrapAll("<div>").parent().html();
        // $(this).parent().parent().find("div:first").append(p);

        const p = $(this).parent().parent().find("div:first-child  :first").clone();
        $(p).find("input").each(function(){
        	$(this).val("");
        });
        $(this).parent().parent().find("div:first").append(p);
    });
    
    $("body").on("click", ".optionRemoveBtn", function(){
        if($(this).closest("div").find("p").length<=1) { // closest("태그") : 가장가까운 부모태그
            return;
        }
        
        $(this).parent().remove();
        
        if($(".optionRemoveBtn").closest("div").find("p").length<=1) {
            $(".optionRemoveBtn").hide();
        }
    });
});

$(function(){
	$('.optionInsertOk').click(function(){
		const f=document.optionInsertForm;
		const option_group=f.option_group.value;
		const menuNum=f.menuNum.value;
		let b;
		
		if(! option_group.trim()){
			alert("옵션그룹명을 입력하세요.");
			f.option_group.focus();
			return false;
		}
		
		b=true;
		$("input[name=option_names]").each(function(){
			if(! $(this).val().trim()) {
				b= false;
				return false;
			}
		});
		
		if(! b){
			alert("옵션명을 입력하세요.");
			return false;
		}

		b=true;
		$("input[name=option_prices]").each(function(){
			if(! $(this).val().trim()) {
				b= false;
				return false;
			}
		});
		
		if(! b){
			alert("옵션추가금액을 입력하세요.");
			return false;
		}
		
		let url="${pageContext.request.contextPath}/owner/option/insertOption";
		let query = $('form[name=optionInsertForm]').serialize();
		
		const fn=function(data){
			if(data.state=="false"){
				alert("옵션을 등록하지 못했습니다.");
				return false;
			} else {
                window.location.href = "${pageContext.request.contextPath}/owner/option/optionReg?menuNum="+menuNum;
				$('#optionInsertModal').modal('hide');	
			}
		};
		
		ajaxFun(url,"post",query,"json",fn);
		
	});
});



$(function(){
	$('.btnPriceOk').click(function(){
		
		const f=document.basePriceForm;
		const bp=f.basePrice.value;
		
		if(bp.trim() === ""){
			alert("최소주문금액을 입력하세요.");
			f.basePrice.focus();
			return;
		}
		let url="${pageContext.request.contextPath}/owner/market/updatePrice";
		let query = $('form[name=basePriceForm]').serialize();
		
		const fn=function(data){
			if(data.state=="false"){
				alert("최소주문금액을 수정하지 못했습니다.");
				return false;
			} else {
                // 리다이렉트 처리 후 모달 종료
                window.location.href = "${pageContext.request.contextPath}/owner/market/marketinfo";
                $('#menu-modal2').modal('hide');
            }
			
		};
		
		ajaxFun(url,"post",query,"html",fn);
		
	});
});














</script>
<script type="text/javascript">

document.getElementById("optionInsert").addEventListener("click", function() {
	// 모달 창 띄우기
		$('#optionInsertModal').modal('show');
	});

</script>

