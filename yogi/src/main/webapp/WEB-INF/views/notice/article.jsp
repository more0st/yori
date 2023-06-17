<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.notice-wrap {
	width: 700px;
	margin: 0 auto;
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
	min-height: 520px;
	background-color: white;
	margin: 0 auto 20px auto;
	padding: 0px 20px 20px;
}

.btn-list {
    display: inline-block;
    border: 1px solid #ccc;
    background: #fff url(../image/ico-lt.png?v=6f834f8…) no-repeat 10px 10px;
    background-size: 5px;
    padding: 7px 12px 4px 10px;
    margin: 10px 0 0 0;
    position: relative;
    overflow: hidden;
    text-decoration: none;
    font-size: 14px;
    color: black;
}

.btn-list:hover {
    color: black;
}

.notice-list:hover {
    color: black;
}
</style>

<div class="whole-container">
	<div class="notice-wrap">
		<div style="padding-top: 20px; padding-bottom: 10px; margin: 0 auto;">
			
			<a class="btn-list" href="${pageContext.request.contextPath}/notice/home" ><i class="bi bi-caret-left-fill"></i> 목록으로
			</a>
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
			
			
		</div>
	</div>	<!-- class="notice-wrap" -->
	
</div> <!-- class="whole-container" -->

