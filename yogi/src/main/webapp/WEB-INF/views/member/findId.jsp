<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.login-form {
	margin: 150px auto 0;
	width: 700px;
	min-height: 300px;
	text-align: center;
}

.login-ment {
	font-size: 20px;
	font-weight: 900;
	color: #fa0050;
	margin: 0 auto;
}

.login-ment > img {
	width: 140px;
	margin-bottom: 7px;
}

.login-input > .name {
  border-bottom: none;
}

.login-input > input {
	width: 80%;
	height: 55px;
	outline: none;
	border: 1px solid #d9d9d9;
	padding: 10px 10px 10px 15px;
}

.login-find {
	height: 50px;
	padding-right: 10px;
	display: flex;
	justify-content: right;
	align-items: center;
	font-size: 14px;
}

.login-find > a {
	text-decoration: none;
	color: #999999;
}

.login-find > a:hover {
	cursor: pointer;
}

.login-find > span {
	color: #999999;
	font-size: 12px;
}

.login-btn {
	border: none;
	width: 80%;
	height: 55px;
	color: white;
	font-size: 16px;
	background: #ccc;
	margin-top: 20px;
}

.login-btn:hover {
	cursor: pointer;
}

.member-img {
	width: 100%;
	margin: 20px auto;
}

</style>

<div class="whole-container">
	<form action="" method="post" name="loginForm">
		<div class="login-form">
			<div class="login-ment">
				<img src="${pageContext.request.contextPath}/resources/picture/logo.png">아이디찾기
			</div>
			<div class="login-input">
				<input class="login-input name" type="text" name="name" placeholder="이름 입력(필수)">
				<input class="login-input email" type="text" name="email" placeholder="이메일 주소 입력(필수)"><br>
			</div>
			<button class="login-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/member/complete'">확인</button>
		</div>
	</form>

</div>