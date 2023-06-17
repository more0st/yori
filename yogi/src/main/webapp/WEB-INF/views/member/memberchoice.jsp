<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
	display: flex;
	align-items: center;
}

.button-container {
	min-height: 300px;
	width: 800px;
	margin: 0 auto;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	background: white;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 40px;
	gap: 20px;
}

.choice-ment {
	font-size: 30px;
	font-weight: bold;
	color: #333;
}

.twobutton {
	display: flex;
	gap: 30px;
}

.choice-button {
	padding: 10px;
	width: 200px;
	height: 200px;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	cursor: pointer;
	background: #f8bb29;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 20px;
	font-size: 20px;
	font-weight: bold;
	color: #333;
}

.choice-button:hover {
	background: #f8aa18;
}

.choice-button > i {
	font-size: 40px;
}

</style>

<div class="whole-container">
	<div class="button-container">
		<div class="choice-ment">
			가입하실 <span style="color: #fa0050;">회원</span> 유형을 선택해주세요.
		</div>
		<div class="twobutton">
			<div class="choice-button" onclick="location.href='${pageContext.request.contextPath}/member/member'"><i class="fa-solid fa-user"></i><div><span style="color: #fa0050;">일반</span> 회원가입</div></div>
			<div class="choice-button" onclick="location.href='${pageContext.request.contextPath}/owner/member'"><i class="fa-solid fa-utensils"></i><div><span style="color: #fa0050;">사장님</span> 회원가입</div></div>
		</div>
	</div>

</div>