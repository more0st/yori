<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

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

<div class="whole-container">
	<div>
		<div class="deletesoon" onclick="location.href='${pageContext.request.contextPath}/member/member'">일반 회원가입</div>
		<div class="deletesoon" onclick="location.href='${pageContext.request.contextPath}/owner/member'">사장님 회원가입</div>
	</div>

</div>