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
	margin: 0 auto;
	width: 800px;
	min-height: 300px;
	text-align: center;
}

.login-ment {
	font-size: 50px;
	font-weight: bold;
	color: #fa0050;
	margin: 0 auto;
}

.login-ment > img {
	width: 250px;
}

.login-input > .id {
  border-bottom: none;
}

.login-input > input {
	width: 100%;
	height: 45px;
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
	width: 100%;
	height: 45px;
	color: white;
	font-size: 16px;
	background: #ccc;
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
				<img src="${pageContext.request.contextPath}/resources/picture/logo.png">
			</div>
			<div class="login-input">
				<!-- 로그인 email로 하면 name 바꾸기 -->
				<input class="login-input id" type="text" name="id" placeholder="이메일 주소 입력(필수)"><br>
				<input class="login-input pwd" type="password" name="pwd" placeholder="비밀번호 입력(필수)">
			</div>
			<div class="login-find">
				<a href="${pageContext.request.contextPath}/member/findId">아이디 찾기</a>
				<span>&nbsp;|&nbsp;</span>
				<a href="${pageContext.request.contextPath}/member/findPwd">비밀번호 찾기</a>
			</div>
			<button class="login-btn" type="button">로그인</button>
			<a href="${pageContext.request.contextPath}/member/choice">
				<img class="member-img" src="${pageContext.request.contextPath}/resources/picture/signin_banner.png">
			</a>
		</div>
	</form>

</div>