<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<style type="text/css">
body {
	background: #fafafa;
}

.whole-container {
	min-height: 800px;
	background: #fafafa;
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
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	background: white;
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
	color: #fa0050;
}

.input {
	width: 100%;
	height: 39px;
	outline: none;
	border: 1px solid #afafaf;
	padding: 5px 15px;
	color: #616161;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.login-button2 {
	width: 100%;
	height: 94px;
	border: none;
	background: #fa0050;
	color: white;
	font-size: 20px;
	font-weight: bold;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.login-button2:hover {
	cursor: pointer;
}

.msgdiv{
	margin-top: 20px;
	
}

</style>

<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;
	let str;
	
	str = f.userId.value.trim();
    if(!str) {
        f.userId.focus();
        return;
    }

    str = f.userPwd.value.trim();
    if(!str) {
        f.userPwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/owner/login";
    f.submit();
}
</script>

<main id="main" class="main">
	<div class="whole-container">
		
		<form action="post" name="loginForm" method="post">
			<div class="login-form">
				<div class="login-ment">
					<img src="${pageContext.request.contextPath}/resources/logoImg/owner.png" style="margin-bottom: 30px;">
				</div>
				<div class="login-box">
					<table class="login-table">
						<tr>
							<td class="login-input left">아이디</td>
							<td style="width: 60%"><input class="login-table input" type="text" name="userId"></td>
							<td rowspan="2" class="center"><button class="login-button2" type="button" onclick="sendLogin();">로그인</button></td>
						</tr>
						<tr>
							<td class="login-input left">비밀번호</td>
							<td style="width: 60%"><input class="login-table input" type="password" name="userPwd"></td>
						</tr>
						
						
						<tr>
							<td colspan="3" class="center"><a class="login-table rink" href="${pageContext.request.contextPath}/owner/member">회원가입</a>&nbsp;<span class="rink">|</span>&nbsp;
							<a class="login-table rink" href="${pageContext.request.contextPath}/owner/findId">아이디</a> <span style="color: #fa0050;">/</span>
							<a class="login-table rink" href="${pageContext.request.contextPath}/owner/findPwd"> 비밀번호 찾기</a></td>
						</tr>
					</table>
					
						
				</div>
				<div class="msgdiv">${message}</div>
			</div>
		</form>
	</div>
</main>