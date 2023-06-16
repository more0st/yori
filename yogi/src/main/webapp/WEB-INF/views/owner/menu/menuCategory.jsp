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

.graybtn{
	border: 1px solid #d9d9d9;
}


</style>

<main id="main" class="main">
<div class="whole-container">
	
	<div>
		메뉴 카테고리
		카테고리 선택하면 해당 카테고리 상세메뉴 수정 가능하게
		<a href="${pageContext.request.contextPath}/owner/menu/menuDetail">콜콜</a>
	</div>
	
	<div class="d-flex align-items-center justify-content-center">
		<div class="category shadow menu">
			<div><i class="bi bi-menu-button-wide" style="font-size:30px;"></i> &nbsp;메뉴&nbsp;(n개)&nbsp;</div>
			<div>
				<button type="button" class="btn btn-light graybtn">메뉴카테고리 수정</button>
				<button type="button" class="btn btn-primary">메뉴카테고리 추가</button>
			</div>	
		</div>
	</div>
	
	<br>	
	
	<div class="d-flex align-items-center justify-content-center">
	<hr>
		<div class="category shadow">
			<div>
				<h5>메인 메뉴</h5>
				전체(n개) | 판매중(n개) | 하루품절(n개) | 숨김(n개)
				<hr>
			</div>
			
			<!-- forEach -->
			<div class="menu">	
				<div style="display:flex;">
					<div>
						<img class="res-img imgsize" src="${pageContext.request.contextPath}/resources/picture/cider.png">
					</div>
					<div>
						<div>사이다</div>
						<div>2,500원</div>
					</div>
				</div>
				<div>	
					<div>
						<button type="button" class="btn graybtn">판매중</button>
					</div>
				</div>
			</div>	
			<hr>
			<!-- /forEach -->

			<div class="menu">	
				<div style="display:flex;">
					<div>
						<img class="res-img imgsize" src="${pageContext.request.contextPath}/resources/picture/cider.png">
					</div>
					<div>
						<div>사이다</div>
						<div>2,500원</div>
					</div>
				</div>
				<div>	
					<div>
						<button type="button" class="btn graybtn">판매중</button>
					</div>
				</div>
			</div>			
			
		</div>
	</div>
	

</div>
</main>
