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
}

.login-form {
	margin: 100px auto 0 auto;
	width: 600px;
	min-height: 200px;
	text-align: center;
}

.login-ment {
	font-size: 32px;
	font-weight: bold;
	color: #fa0050;
}

.login-ment > img {
	width: 270px;
	margin-right: 20px;
}

.login-ment:hover {
	cursor: default;
}

.login-box {
	border: 1px solid #afafaf;
	height: 270px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.login-table {
	width: 450px;
}

.login-input {
	color: #616161;
	font-size: 14px;
	font-weight: bold;
}

td {
	padding: 5px;
}

.right {
	text-align: right
}

.left {
	text-align: left;
}

.center {
	text-align: center;
}

.rink {
	text-decoration: none;
	color: #fa0050;
}

.rink:hover {
	cursor: pointer;
	text-decoration: underline;
}

.input {
	width: 100%;
	height: 39px;
	outline: none;
	border: 1px solid #afafaf;
	padding: 5px 15px;
	color: #616161
}

.login-button2 {
	width: 100%;
	height: 94px;
	border: none;
	background: #fa0050;
	color: white;
	font-size: 20px;
	font-weight: bold;
}

.login-button2:hover {
	cursor: pointer;
}

</style>
</head>
<body style="padding: 0;">
<div class="whole-container">
	<header>	
		<jsp:include page="/WEB-INF/views/fragment/ownerheader.jsp"/>
	</header>
	
	<form action="" name="loginForm" method="post">
		<div class="login-form">
			<div class="login-ment">
				<img src="${pageContext.request.contextPath}/resources/picture/logo.png"><span>사장님</span>
			</div>
			<div class="login-box">
				<table class="login-table">
					<tr>
						<td class="login-input left">아이디</td>
						<td style="width: 60%"><input class="login-table input" type="text" name="id"></td>
						<td rowspan="2" class="center"><button class="login-button2" type="button" onclick="">로그인</button></td>
					</tr>
					<tr>
						<td class="login-input left">비밀번호</td>
						<td style="width: 60%"><input class="login-table input" type="password" name="pwd"></td>
					</tr>
					<tr>
						<td colspan="3" class="center"><a class="login-table rink" href="#">아이디/비밀번호 찾기</a></td>
					</tr>
				</table>
			</div>
		</div>
	</form>

</div>
<footer>
	<jsp:include page="/WEB-INF/views/fragment/ownerfooter.jsp"/>
</footer>
</body>
</html>