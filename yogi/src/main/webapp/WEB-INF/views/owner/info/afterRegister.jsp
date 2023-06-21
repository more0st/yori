<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.result-notification {
	width: 600px;
	height: 100px;
	border: 1px solid black;
	background-color: #fa0050;
	margin: 0 auto;
	margin-top: 100px;
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
	margin-bottom: 30px;
	text-align: center;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	vertical-align: middle;
	padding-top: 50px;
	font-size: 20px;
}

.messagediv{
	display: flex;
  	justify-content: center;
  	align-items: center;
  	margin-top: 3px;
}

.message{
	color: blue;
}


</style>

<main id="main" class="main">
<div class="whole-container">
<div class="result-notification">
	입점 신청 승인 결과 
</div>
	
<c:if test="${status == 0}">	
<div class="notify-paragraph">
	입점 신청 요청이 <br>
	<div class="messagediv"><div class="message">${message}</div> &nbsp;상태 입니다.</div>
	
	<!-- 승인 거절 시 사유 보임 -->
	<br><br>
	
		거절 사유 : ${reason}
	
</div>

	<div style="display: flex; justify-content: center;">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/owner/info/register';"
				style="margin: 0 auto; width: 140px; height: 60px; font-size: 20px; text-align: center; vertical-align: center;">
				입점 재신청</button>
	</div>
</c:if>		
<c:if test="${status == 1}">	
<div class="notify-paragraph">
	입점 신청 요청이 <br>
	<div class="messagediv"><div class="message">${message}</div> &nbsp;상태 입니다.</div>
	
	<!-- 승인 거절 시 사유 보임 -->
	<br><br>
	
</div>

	<div style="display: flex; justify-content: center;">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/owner/info/register';"
				style="margin: 0 auto; width: 140px; height: 60px; font-size: 20px; text-align: center; vertical-align: center;">
				입점 신청</button>
	</div>
</c:if>	
<c:if test="${status == 2}">	
<div class="notify-paragraph">
	입점 신청 요청이 <br>
	<div class="messagediv"><div class="message">${message}</div> &nbsp;상태 입니다.</div>
	
	<!-- 승인 거절 시 사유 보임 -->
	<br><br>
	
</div>
</c:if>	

</div>
</main>
