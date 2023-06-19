<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	padding-bottom: 20px;
}

.event-list {
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
	color: black;
}

.n-date {
	font-weight: lighter;
	font-size: smaller;
	color: #999;
	display: block;
}

.n-article {
	text-decoration: none;
	color: black;
}

.event-list:hover {
    color: black;
}

.n-article:hover {
    color: black;
}

.writebtn{
	padding-top: 15px;
	padding-left: 15px;
	margin: 0 auto;
	width: 700px;
	height: 70px;
	text-align: right;
}
</style>


<main id="main" class="main">
<div class="whole-container">

	<div class="event-wrap">
		<div style="padding-left: 120px; padding-top: 20px; padding-bottom: 10px;">
		
		<!-- c:for each로 div 태그 돌리기.. -->
			<c:forEach var="subject" items="noticeList">
				<div class="event-list">
					<a class="n-article" href="${pageContext.request.contextPath}/admin/event/article">
					이벤트1
						<span class="n-date">
						2023년 5월 30일 ~ 2025년 5월 30일
						</span>
					</a>	
				</div>
			</c:forEach>
			
			<div class="event-list">
			이벤트2
				<div class="n-date">
				2023년 5월 30일 ~ 2023년 11월 26일
				</div>
			</div>
			<div class="event-list">
			이벤트3
				<div class="n-date">
				2023년 6월 7일 ~ 2025년 6월 8일
				</div>
			</div>
			<div class="event-list">
			이벤트4
				<div class="n-date">
				2023년 6월 7일 ~ 2025년 6월 8일
				</div>
			</div>
			<div class="event-list">
			이벤트5
				<div class="n-date">
				2023년 5월 30일 ~ 2025년 5월 30일
				</div>
			</div>
			
			<div class="writebtn">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/event/write'">글쓰기</button>
			</div>
		</div>
	</div>
</div>
</main>