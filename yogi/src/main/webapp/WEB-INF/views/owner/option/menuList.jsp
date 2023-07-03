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
	width: 170px;
	margin: 15px;
}

.iconsize{
	font-size:30px;
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

	<c:forEach var="category" items="${categoryList}">
	<c:if test="${category.enabled==1}">
	<div class="d-flex align-items-center justify-content-center">
	<hr>
		<div class="category shadow">
			<div>
				<h6><i class="bi bi-pin-angle-fill"></i>&nbsp;${category.menuCategory}</h6>
				<hr>
			</div>
			
			<c:forEach var="menu" items="${category.menuList}">
			<div class="menu">	
				<div style="display:flex;">
					<div>
						<img class="res-img imgsize" src="${pageContext.request.contextPath}/uploads/owner/menu/${menu.imageFilename}">
					</div>
					<div class="menuDetail">
						<div><h5>${menu.menu}</h5>${menu.price}원</div>
					</div>
				</div>
				<div>	
					<div style="display:flex;">
						<button type="button" class="btn graybtn" onclick="location.href='${pageContext.request.contextPath}/owner/option/optionReg?menuNum=${menu.menuNum}'">옵션관리</button>
					</div>
				</div>
			</div>	
			<hr>
			</c:forEach>
		</div>
	</div>
	<br>
	</c:if>
	</c:forEach>
	
</div>
</main>

