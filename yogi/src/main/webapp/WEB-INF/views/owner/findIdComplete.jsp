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

.complete {
	margin-left : 70px;
	width: 80%;
	height: 100px;
	font-weight: 800;
	font-size: 25px;
	color: #fa0050;
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
<main id="main" class="main">
	<div class="whole-container">
		<form action="" method="post" name="loginForm">
			<div class="login-form">
				<div class="login-ment">
					<img src="${pageContext.request.contextPath}/resources/picture/logo.png">
				</div>
				<div class="complete">
					<span>아이디가 메일로 발송되었습니다.</span>
				
				</div>
				<button class="login-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/home/home'">확인</button>
			</div>
		</form>
	</div>
</main>	