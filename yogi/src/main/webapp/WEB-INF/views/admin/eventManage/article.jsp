<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.writebtn{
float:right;
margin-right: 50px;
margin-bottom: 30px;
}

.title-container{
width: 85%;
}

.content {
width: 100%;
}

.img-box{
justify-content: center;
}
</style>

<script type="text/javascript">
function deleteOk() {
	let query = 'num=${dto.eventNum}&${query}';
	let url = '${pageContext.request.contextPath}/admin/eventManage/${category}/delete?' + query;

	if(confirm('위 자료를 삭제 하시 겠습니까 ? ')) {
		location.href = url;
	}
}

$(function(){
	$('#tab-all').removeClass('active');
	$('#tab-${category}').addClass('active');

	$('ul.nav-tabs li button').click(function() {
		let category = $(this).attr('data-category');
		location.href = '${pageContext.request.contextPath}/admin/eventManage/'+category+'/list';
	});
	
	
});
	
</script>

<main id="main" class="main">

	<section class="section">
		<div class="card" style="margin-top: 20px;">
			<div class="card-body">
				
				
				
				<div class="title-container">
					
					
					<a class="btn btn-outline-secondary btn-list" style="float: left; margin-top: 13px; margin-bottom: 8px;" href="${pageContext.request.contextPath}/admin/eventManage/${category}/list">
							<i class="bi bi-caret-left-fill"></i> 목록으로 </a>
					
					<h5 class="title" style="clear:both; margin-top: 10px; text-align: center;">${dto.subject}</h5>
					<hr style="clear:both;">
					
					<div>
						<span class="fw-semibold" style="float: left;">이벤트 기간 &nbsp;:&nbsp; ${dto.start_date} ~ ${dto.end_date}</span>
						<hr style="clear:both;">
						<span class="fw-semibold" style="float: left;">응모자 수 &nbsp;:&nbsp; ${applyCount} </span>
						<hr style="clear:both;">
						<span class="fw-semibold" style="float: left;">할인금액 &nbsp;:&nbsp; 
						<fmt:formatNumber type="currency" value="${dto.discount}"/> </span>
						<hr style="clear:both;">
						<span class="fw-semibold" style="float: left;">최소주문금액 &nbsp;:&nbsp; 
						<fmt:formatNumber type="currency" value="${dto.min_price}"/> </span>
						<hr style="clear:both;">
						<span class="fw-semibold" style="float: left;">유효기간 &nbsp;:&nbsp; ${dto.expired_date} 00:00 </span>
						<hr style="clear:both;">
						<span class="fw-semibold" style="float: left;">표시여부 &nbsp;:&nbsp; ${dto.enabled}  </span>
						<hr style="clear:both;">
					</div>
					
					
				</div>
				
				<div class="content">
					<div class="img-box">
						<img class="rounded mx-auto d-block" style="width: 70%; display:flex; justify-content: center;"
							src="${pageContext.request.contextPath}/uploads/admin/event/${dto.imgFileName}">
						<br>
					
					</div>
					<div class=" justify-content-center" style="margin-top: 20px;">
						${dto.content}
					</div>
						
						<br> <br> 
				</div>
				
				<div class="writebtn">
					<button type="button" class="btn btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/update?num=${dto.eventNum}&page=${page}'">수정하기</button>
					<button type="button" class="btn btn-danger"
						onclick="deleteOk();">삭제하기</button>
				</div>
				
				
			</div>
		</div>
	</section>
</main>
