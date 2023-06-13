<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요기요</title>
<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.notice-list {
	padding-top: 15px;
	padding-left: 15px;
	margin: 0 auto;
	width: 700px;
	height: 70px;
	text-align: left;
	border: 1px solid #eee;
	font-weight: bold;
	font-size: 14px;
	background-color: white;
}

.n-date {
	font-weight: lighter;
	font-size: smaller;
	color: #999;
}

.n-body {
	border: 1px solid #eee;
	width: 700px;
	height: 670px;
	background-color: white;
	margin: 0 auto;
	padding: 0px 20px 20px;
}

.btn-list {
    display: inline-block;
    border: 1px solid #ccc;
    background: #fff url(../image/ico-lt.png?v=6f834f8…) no-repeat 10px 10px;
    background-size: 5px;
    padding: 7px 12px 4px 21px;
    margin: 10px 0 0 0;
    position: relative;
    overflow: hidden;
    text-decoration: none;
    font-size: 14px;
}

</style>
</head>
<body style="padding: 0;">
<div class="whole-container">
	<header>	
		<jsp:include page="/WEB-INF/views/fragment/header.jsp"/>
	</header>
	
	<div class="notice-wrap">
		<div style="padding-left: 120px; padding-top: 20px; padding-bottom: 10px;">
			공지사항
		
		
			<div class="notice-list">
			[공지] 개인정보처리방침 일부 변경 안내
				<div class="n-date">
				2023년 5월 30일 ~ 2025년 5월 30일
				</div>
			</div>
			
			
			<div class="n-body">
				<div class="n-content">
				<br>
				*** <br><br>
				안녕하세요. 요기요 입니다.<br><br>
				항상 요기요를 이용해주시는 고객 여러분께 감사 드립니다.<br><br>
				2023년 6월 6일부터 요기요 개인정보 처리방침이 일부 변경됩니다.
				</div>
			</div>
			
			<a class="btn-list" href="${pageContext.request.contextPath}/notice/home" onclick="$location.url('/notice/')">◁ 목록으로
			</a>
			
		</div>
	</div>	<!-- class="notice-wrap" -->
	
</div> <!-- class="whole-container" -->
<footer>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>		
</footer>
</body>
</html>








