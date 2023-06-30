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

.imgsize{
	width: 200px;
}

.iconsize{
	font-size:25px;
}

.graybtn{
	border: 1px solid #d9d9d9;
}

.title{
	margin-bottom:7px;
}

.menuDetail{
    display: flex;
    align-items: center;
    justify-content: center;
}

</style>


<main id="main" class="main">
<div class="whole-container">
	<button type="button" class="btn iconsize" onclick="location.href='${pageContext.request.contextPath}/owner/menu/menuCategory'"><i class="bi bi-arrow-left-circle"></i></button>
	
	<div class="d-flex align-items-center justify-content-center">
		<div class="category shadow menu">
			<div><i class="bi bi-menu-button-wide" style="font-size:30px;"></i> &nbsp;메뉴&nbsp;(${menuCount}개)&nbsp;</div>
			<div>
				<button type="button" class="btn btn-primary btnInsertMenuOk">메뉴 추가</button>
			</div>	
		</div>
	</div>
	
	<br>	
	
	<div class="d-flex align-items-center justify-content-center">
	<hr>
		<div class="category shadow">
			<div>
				<h5 style="font-weight: 800; margin: 20px;">${categoryName}</h5>
				<hr>
			</div>
			
			<!-- forEach -->
			<c:forEach var="dto" items="${menuList}" varStatus="status">
				<div class="menu">	
					<div style="display:flex;">
						<div>
							<img class="res-img imgsize" src="${pageContext.request.contextPath}/resources/picture/cider.png">
						</div>
						<div class="menuDetail">
							<div><h5>${dto.menu}</h5>${dto.price}원</div>
						</div>
					</div>
					<div>	
						<div style="display:flex;">
							<button type="button" class="btn graybtn btnSoldeOutOk"  data-num="${categoryNum}" data-stock="${dto.stock}" data-menuNum="${dto.menuNum}">${dto.stock==0?"품절":dto.stock==1?"판매중":dto.stock==2?"숨김":""}</button>
							&nbsp;
							<div class="dropdown">
							  	<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							  	</button>
							  	<ul class="dropdown-menu">
							    	<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#menuUpdateModal">메뉴 수정</a></li>
							    	<li><a class="dropdown-item" href="#">메뉴 삭제</a></li>
							 	 </ul>
							</div>
						</div>
					</div>
				</div>	
				<hr>
			</c:forEach>
			<!-- /forEach -->		
		</div>
	</div>
</div>


</main>

<!-- 모달 -->
<!-- 메뉴추가 모달 -->
<div class="modal" id="menuInsertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">메뉴 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form> 
	      <div class="modal-body">
	      
	      <!-- 카테고리 선택 -->
	      <div>
	      	<div class="title">카테고리 선택</div>
	      	<select class="form-select">
	      	<c:forEach var="cate" items="${categoryList}">
			  <option value="${cate.num}" ${categoryNum==cate.num?"selected='selected'":""}>${cate.menuCategory}</option>
			  </c:forEach>
			</select>
	      </div>
	      
	      <!-- 메뉴이름 -->
	      <div>
	      	<div class="title"><br>메뉴 이름</div>
	      	<div><input type="text" class="form-control"></div>
	      </div>
	      
	      <!-- 가격 -->
	      <div>
	      	<div class="title"><br>가격</div>
	      	<div><input type="text" class="form-control"></div>
	      </div>
	      
	      <!-- 이미지파일 -->
	      <div>
	      	<div class="title"><br>메뉴 사진</div>
	      	<input type="file" name="selectFile" accept="image/*" class="form-control">
	      </div>
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<!-- 메뉴수정 모달 -->
<div class="modal" id="menuUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-eraser-fill"></i>&nbsp;메뉴 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form> 
	      <div class="modal-body">
	      
	      <!-- 카테고리 선택 -->
	      <div>
	      	<div class="title">카테고리 선택</div>
	      	<select class="form-select">
	      	<c:forEach var="cate" items="${categoryList}">
			  <option value="${cate.num}" ${categoryNum==cate.num?"selected='selected'":""}>${cate.menuCategory}</option>
			  </c:forEach>
			</select>
	      </div>
	      
	      <!-- 메뉴이름 -->
	      <div>
	      	<div class="title"><br>메뉴이름</div>
	      	<div><input type="text" class="form-control" value="사이다"></div>
	      </div>
	      
	      <!-- 가격 -->
	      <div>
	      	<div class="title"><br>가격</div>
	      	<div><input type="text" class="form-control" value="1,500원"></div>
	      </div>
	      
	      <!-- 이미지파일 -->
	      <div>
	      	<div class="title"><br>메뉴 사진</div>
	      	<input type="file" name="selectFile" accept="image/*" class="form-control">
	      </div>
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<!-- 품절모달 -->
<div class="modal" id="soldOutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-eraser-fill"></i>&nbsp;품절관리</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form name="soldOutForm" method="post"> 
	      <div class="modal-body">
	      
			   <div>
			      	<div class="title">상태 선택</div>
			      	
			      	<select name="selectStock" class="form-select">
					  <option value="0">품절</option>
					  <option value="1">판매중</option>
					  <option value="2">숨김</option>
					</select>
			   </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary btnStockUpdateOk">저장</button>
	        <input type="hidden" name="menuNum">
	        <input type="hidden" name="stock">
	        <input type="hidden" name="num">
	      </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">

//품절모달show
$(function(){
	$('.btnSoldeOutOk').click(function(){
		
		let menuNum = $(this).attr("data-menuNum");
		let stock = $(this).attr("data-stock");
		let num = $(this).attr("data-num");
		
		document.soldOutForm.menuNum.value = menuNum;
		document.soldOutForm.stock.value = stock;
		document.soldOutForm.num.value = num;
		document.soldOutForm.selectStock.value = stock;
		
		$('#soldOutModal').modal('show');
	});
});

//메뉴추가모달show
$(function(){
	$('.btnInsertMenuOk').click(function(){
		
		$('#menuInsertModal').modal('show');
	});
});


//stock 변경
$(function(){
	$('.btnStockUpdateOk').click(function(){
		
		const f=document.soldOutForm;
		const stock =f.selectStock.value;
		const menuNum =f.menuNum.value;
		const num =f.num.value;
		
		let url="${pageContext.request.contextPath}/owner/menu/updateStock";
		let query = "menuNum="+menuNum+"&stock="+stock;
		
		const fn=function(data){
			if(data.state=="false"){
				alert("메뉴상태를 수정하지 못했습니다.");
				return false;
			} else {
            }
		};
               location.href = "${pageContext.request.contextPath}/owner/menu/menuDetail?num="+num;
               $('#soldOutModal').modal('hide');
		
		ajaxFun(url,"post",query,"html",fn);
		
	});
});


</script>
