<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.0/css/all.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">

<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
header .navigation {
	width: 100%;
	height: 60px;
	background: white;
	border-bottom: 1px solid #d9d9d9;
}
	
header .menubar {
	width: 90%;
	height: 100%;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	}
	
header .logo {
	width: 180px;
	cursor: pointer;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

header .logo > span {
	font-size: 16px;
	font-weight: bold;
}
	
header .login-button {
	border: none;
	color: #00000099;
	width: 100px;
	height: 40px;
	text-align: center;
	display: flex;
	align-items: center;
}

header .login-div {
	height: 20px;
	margin: 0 auto;
	font-size: 12px;
}

header .login-button > span {
	height: 20px;
	font-size: 12px;
}

header .login-button > span:hover {
	cursor: default;
}

header .login-div:hover {
	cursor: pointer;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

<div class="navigation">
	<div class="menubar">
		<div class="logo" onclick="location.href='${pageContext.request.contextPath}/owner/home'">
			<img style="height: 60px; margin: 0 auto; display: block" src="${pageContext.request.contextPath}/resources/picture/logo.png"><span>사장님</span>
		</div>
		<div class="login-button"><div class="login-div" onclick="location.href='${pageContext.request.contextPath}/owner/login'">로그인</div><span>&nbsp;|&nbsp;</span><div class="login-div" onclick="location.href='${pageContext.request.contextPath}/owner/member'">회원가입</div></div>
	</div>
</div>
