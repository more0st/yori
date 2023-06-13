<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요기요</title>
<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.deletesoon {
	border: 1px solid black;
	margin: 10px;
	padding: 10px;
	cursor: pointer;
}

</style>
</head>
<body style="padding: 0;">
<div class="whole-container">
	<header>	
		<jsp:include page="/WEB-INF/views/fragment/header.jsp"/>
	</header>
	
	<div>
		<div class="deletesoon" onclick="location.href='${pageContext.request.contextPath}/member/member'">일반 회원가입</div>
		<div class="deletesoon" onclick="location.href='${pageContext.request.contextPath}/owner/member'">사장님 회원가입</div>
	</div>

</div>
<footer>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>		
</footer>
</body>
</html>