<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">

.whole-container {
	min-height: 800px;
	background: #fafafa;
}

</style>

<div class="whole-container">
	
	<div>
		메뉴 카테고리
		
		카테고리 선택하면 해당 카테고리 상세메뉴 수정 가능하게
		<a href="${pageContext.request.contextPath}/owner/menu/menuDetail">콜콜</a>
	</div>

</div>
