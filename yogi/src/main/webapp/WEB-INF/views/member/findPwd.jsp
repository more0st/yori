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

.login-input > .id {
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

<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;

	let str = f.userId.value.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	
	str = f.email.value.trim();
	if(!str) {
		alert("이메일 입력하세요. ");
		f.email.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/findPwd";
	f.submit();
}
</script>


<div class="whole-container">
	<form method="post" name="pwdForm">
		<div class="login-form">
			<div class="login-ment">
				<img src="${pageContext.request.contextPath}/resources/picture/logo.png">비밀번호찾기
			</div>
			<div class="login-input">
				<input class="login-input id" type="text" name="userId" placeholder="아이디 입력(필수)">
				<input class="login-input email" type="text" name="email" placeholder="이메일 주소 입력(필수)"><br>
			</div>
			<button class="login-btn" type="button" onclick="sendOk();">확인</button>
			
			<div class="d-grid">
					<p class="form-control-plaintext text-center py-3">${message}</p>
            </div>
                
                
		</div>
	</form>
</div>