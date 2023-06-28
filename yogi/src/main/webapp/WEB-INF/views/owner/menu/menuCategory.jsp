<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">

.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.category{
	width:80%;
	border: 1px solid #d9d9d9;
	border-radius:10px;
	padding:15px;
	background: white;
}

.menu{
	display: flex;
	align-items: center;
	justify-content: space-between;
}


.graybtn{
	border: 1px solid #d9d9d9;
	width: 100%;
}

.bigbtn{
	padding: 15px;
}
</style>

<main id="main" class="main">
<div class="whole-container">
	
	<!--  
		[메뉴 카테고리]
		카테고리 선택하면 해당 카테고리 상세메뉴 수정 가능하게
		<a href="${pageContext.request.contextPath}/owner/menu/menuDetail">콜콜</a>
	 -->
	
	<div class="d-flex align-items-center justify-content-center">
		<div class="category shadow menu">
			<div><i class="bi bi-menu-button-wide" style="font-size:30px;"></i> &nbsp;메뉴 카테고리&nbsp;(${categoryCount}개)&nbsp;</div>
			<div>
				<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#categoryUpdateModal">카테고리 수정</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#categoryInsertModal">카테고리 추가</button>
			</div>	
		</div>
	</div>
	
	<br>	
	
	<div class="d-flex align-items-center justify-content-center">
		<div class="category shadow">
			
			<div class="container text-center">
				<div class="row row-cols-3 g-2">
				<c:forEach var="cat" items="${categoryList}" varStatus="status">
					<div class="col"><button type="button" class="btn btn-light graybtn bigbtn" onclick="location.href='${pageContext.request.contextPath}/owner/menu/menuDetail?num=${cat.num}'">${cat.menuCategory}</button></div>
				</c:forEach>
				</div>
			</div>
				
		</div>
	</div>
	
	<br>

</div>
</main>

<!-- 모달 -->
<!-- 메뉴카테고리 추가 모달 -->
<div class="modal" id="categoryInsertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">메뉴 카테고리 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form name="categoryInsertForm" method="post"> 
	      <div class="modal-body">
	      <div>
	      	<div>카테고리 이름</div>
	      	<input name="menuCategory" type="text" class="form-control">
	      	<input type="hidden" name="restaurantNum" value="${restaurantNum}">
	      </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary btnCategoryOk">저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<!-- 메뉴카테고리 수정 모달 -->
<div class="modal" id="categoryUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-eraser-fill"></i>&nbsp;메뉴 카테고리 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form name="categoryUpdateForm" method="post"> 
	      <div class="modal-body">
	      <table class="table">
	      		<tr>
	      			<th>&nbsp;&nbsp;카테고리명</th>
	      			<th class="text-center">수정</th>
	      			<th class="text-center">삭제</th>
	      		</tr>
	      		
	      		<c:forEach var="cat" items="${categoryList}" varStatus="status">
	      		<tr>
	      			<td class="align-middle"><input type="text" value="${cat.menuCategory}" class="form-control border-0" readonly="readonly"></td>
	      			<td class="align-middle"><button type="button" class="btn btn-outline-secondary">수정</button></td>
	      			<td class="align-middle">
	      			<button type="button" class="btn btn-outline-secondary">삭제</button>
	      			</td>
	      		</tr>
	      		</c:forEach>
	      </table>
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
//var categoryInsertModal = new bootstrap.Modal(document.getElementById('categoryInsertModal'));
//var categoryUpdateModal = new bootstrap.Modal(document.getElementById('categoryUpdateModal'));

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
	$('.btnCategoryOk').click(function(){
		const f=document.categoryInsertForm;
		const cat=f.menuCategory.value;
		
		if(cat.trim() === ""){
			alert("카테고리를 입력하세요.");
			f.menuCategory.focus();
			return;
		}
		let url="${pageContext.request.contextPath}/owner/menu/insertCategory";
		let query = $('form[name=categoryInsertForm]').serialize();
		
		const fn=function(data){
			if(data.state=="false"){
				alert("카테고리를 등록하지 못했습니다.");
				return false;
			} else {
                window.location.href = "${pageContext.request.contextPath}/owner/menu/menuCategory";
                $('#categoryInsertModal').modal('hide');
            }
			
		};
		
		ajaxFun(url,"post",query,"html",fn);
		
	});
});

</script>
