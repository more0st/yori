<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   
<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
.whole-container {
	min-height: 800px;
	background: #fafafa;
	padding-bottom: 20px;
}
	
header .navigation {
	width: 100%;
	height: 78px;
	background: white;
}
	
header .menubar {
	width: 1100px;
	height: 100%;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	}
	
header .logo {
	width: 200px;
	cursor: pointer;
	justify-content: space-between;
	align-items: center;
}
	
header .login-button {
	border: none;
	color: white;
	background: #fa0050;
	border-radius: 5px;
	width: 150px;
	height: 40px;
	text-align: center;
	display: flex;
	align-items: center;
}

.login-div {
	height: 20px;
	margin: 0 auto;
	font-size: 20x;
	font-weight: bold;
}

header .login-button:hover {
	cursor: pointer;
}
</style>
<header id="header" class="header">
<div class="navigation">
	<div class="menubar">
		<div class="logo" onclick="location.href='${pageContext.request.contextPath}/home/home'">
			<img style="height: 85px; margin: 0 auto; display: block" src="${pageContext.request.contextPath}/resources/picture/logo.png">
		</div>
		<button class="login-button" onclick="location.href='${pageContext.request.contextPath}/member/login'"><div class="login-div">로그인</div></button>
	</div>
</div>
</header>