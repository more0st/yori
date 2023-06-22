<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.whole-container {
	min-height: 800px;
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
    border: 1px solid #ccc;
    font-size: 14px;
    color:black;
    margin-bottom: 10px;
}

.notice-list:hover {
    color: black;
}

.writebtn{
	float:right;
}
</style>
<main id="main" class="main">
	<div class="whole-container">
		<div class="notice-wrap">
			<div style="padding-top: 20px; padding-bottom: 10px; margin: 0 auto;">
				
				<a class="btn btn-outline-secondary btn-list" href="${pageContext.request.contextPath}/admin/notice/list"><i class="bi bi-caret-left-fill"></i> 목록으로</a>
				<div class="notice-list">
				${dto.subject}
					<div class="n-date">
					${dto.reg_date}
					</div>
				</div>
				
				
				<div class="n-body">
					<div class="n-content">
					<br>
					${dto.content}
					</div>
				</div>
				<div class="writebtn"><button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/notice/write'">수정하기</button></div>
			</div>
		</div>	<!-- class="notice-wrap" -->
		
	</div> <!-- class="whole-container" -->
</main>
