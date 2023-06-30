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


<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">옵션 그룹 추가</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>


			<div class="modal-body">
				<form class="row g-3">

					<div class="col-md-12">
						<label class="col-form-label">옵션그룹명</label> <input type="text"
							class="form-control" placeholder="GroupName">
					</div>

					<div class="col-md-12">
						<label class="col-form-label">옵션 추가</label>
					</div>

					<div class="option-box">
						<div class="col-md-12">
							<p>
								<input type="text" class="form-control" placeholder="이름">
								<input type="text" class="form-control" placeholder="가격"
									style="margin-left: 5px;"> 
								<span class="optionRemoveBtn" style="display: inline-block; margin-left: 5px;"> 
								<i class="bi bi-x-square"></i></span>
							</p>
						</div>

						<div style="text-align: center; margin-top: 10px;">
							<button type="button" class="btn optionAddBtn">추가</button>
						</div>
					</div>


				</form>

			</div>

			<div class="text-center modal-footer">
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
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
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/admin">admin</a></li>
				<li class="breadcrumb-item active">RestaurantList</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->


	<!-- list 조회 -->
	<section class="section">
		<div class="card">
			<div class="card-body" style="padding: 10px;">
				<h2 class="card-title"
					style="display: inline-block; margin-left: 20px;">옵션그룹 설정</h2>
				<button type="button" class="btn btn-primary btn-sm"
					style="margin-left: 10px;" data-bs-toggle="modal"
					data-bs-target="#exampleModal">추가</button>

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
</script>

