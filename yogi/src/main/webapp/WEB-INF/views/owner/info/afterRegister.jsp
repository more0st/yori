<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.result-notification {
	width: 600px;
	height: 100px;
	border: 1px solid black;
	background-color: #fa0050;
	margin: 0 auto;
	margin-top: 200px;
	text-align: center;
	vertical-align: middle;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	padding-top: 20px;
	color: white;
	font-size: 30px;
}

.notify-paragraph {
	width: 600px;
	height: 300px;
	border: 1px solid black;
	border-top-color: white;
	background-color: white;
	margin: 0 auto;
	margin-bottom: 200px;
	text-align: center;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	vertical-align: middle;
	padding-top: 50px;
	font-size: 20px;
}


</style>

<div class="result-notification">
	입점 신청 승인 결과 
</div>
	
<div class="notify-paragraph">
	입점 신청 요청이 <br>
	승인 대기중입니다. / 승인 거절되었습니다.
	
	<!-- 승인 거절 시 사유 보임 -->
	<br><br><br>
	거절 사유 : 서류 미비 / 업종 불명확
</div>
	
	
