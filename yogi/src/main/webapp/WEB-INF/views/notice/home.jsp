<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
	padding-bottom: 20px;
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

.notice-list:hover {
    color: black;
}

.n-article:hover {
    color: black;
}
</style>

<div class="whole-container">
	<!-- 
		<div align="right">
			   test="${memberInfo eq 'admin'}" 
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/write.do';">글올리기</button>
		</div>
	 -->
		
	<div class="notice-wrap">
		<div style="padding-left: 120px; padding-top: 20px; padding-bottom: 10px;">
		
		<!-- c:for each로 div 태그 돌리기.. -->
			<c:forEach var="dto" items="${list}">
				<div class="notice-list">
					<a class="n-article" href="${articleUrl}num=${dto.noticeNum}">
					${dto.subject}
						<span class="n-date">
						${dto.reg_date}
						</span>
					</a>	
				</div>
			</c:forEach>
		
		<!-- c:for each로 div 태그 돌리기.. -->
			<c:forEach var="subject" items="noticeList">
				<div class="notice-list">
					<a class="n-article" href="${pageContext.request.contextPath}/notice/article">
					[공지] 개인정보처리방침 일부 변경 안내
						<span class="n-date">
						2023년 5월 30일
						</span>
					</a>	
				</div>
			</c:forEach>
			
			<div class="notice-list">
			5/24 하루 동안 2번 주문 시 쏟아지는 혜택 포인트 당첨자 안내
				<div class="n-date">
				2023년 5월 30일
				</div>
			</div>
			
			<div class="notice-list">
			[공지] 개인정보처리방침 일부 변경 안내
				<div class="n-date">
				2023년 5월 30일
				</div>
			</div>
			
		</div>
	</div>	<!-- class="notice-wrap" -->
	
</div> <!-- class="whole-container" -->
