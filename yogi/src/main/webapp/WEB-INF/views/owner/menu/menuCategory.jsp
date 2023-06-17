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
			<div><i class="bi bi-menu-button-wide" style="font-size:30px;"></i> &nbsp;메뉴 카테고리&nbsp;(n개)&nbsp;</div>
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
					<div class="col"><button type="button" class="btn btn-light graybtn" onclick="location.href='${pageContext.request.contextPath}/owner/menu/menuDetail'">메뉴카테고리1</button></div>
					<div class="col"><button type="button" class="btn btn-light graybtn" onclick="location.href='${pageContext.request.contextPath}/owner/menu/menuDetail'">메뉴카테고리2</button></div>
					<div class="col"><button type="button" class="btn btn-light graybtn" onclick="location.href='${pageContext.request.contextPath}/owner/menu/menuDetail'">메뉴카테고리3</button></div>
					<div class="col"><button type="button" class="btn btn-light graybtn" onclick="location.href='${pageContext.request.contextPath}/owner/menu/menuDetail'">메뉴카테고리4</button></div>
					<div class="col"><button type="button" class="btn btn-light graybtn" onclick="location.href='${pageContext.request.contextPath}/owner/menu/menuDetail'">메뉴카테고리5</button></div>
					<div class="col"><button type="button" class="btn btn-light graybtn" onclick="location.href='${pageContext.request.contextPath}/owner/menu/menuDetail'">메뉴카테고리6</button></div>
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
      <form> 
	      <div class="modal-body">
	      <div>
	      	<div>카테고리 이름</div>
	      	<input type="text" class="form-control">
	      </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">저장</button>
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
        <h5 class="modal-title" id="exampleModalLabel">메뉴 카테고리 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form> 
	      <div class="modal-body">
	      <table class="table">
	      		<tr>
	      			<th>카테고리명</th>
	      			<th>상태</th>
	      			<th>삭제설정</th>
	      		</tr>
	      		
	      		<!-- forEach -->
	      		<tr>
	      			<td class="align-middle">카테고리1</td>
	      			<td class="align-middle">사용중</td>
	      			<td class="align-middle"><button type="button" class="btn btn-outline-secondary">삭제</button></td>
	      		</tr>
	      		<!-- /forEach -->
	      		
	      		<tr>
	      			<td class="align-middle">카테고리2</td>
	      			<td class="align-middle">사용중</td>
	      			<td class="align-middle"><button type="button" class="btn btn-outline-secondary">삭제</button></td>
	      		</tr>
	      		<tr>
	      			<td class="align-middle">카테고리3</td>
	      			<td class="align-middle">사용중</td>
	      			<td class="align-middle"><button type="button" class="btn btn-outline-secondary">삭제</button></td>
	      		</tr>
	      </table>
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
var categoryInsertModal = new bootstrap.Modal(document.getElementById('categoryInsertModal'));
var categoryUpdateModal = new bootstrap.Modal(document.getElementById('categoryUpdateModal'));

</script>
