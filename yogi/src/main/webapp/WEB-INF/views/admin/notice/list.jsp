<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
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

.writebtn{
	padding-top: 15px;
	padding-left: 15px;
	padding-right: 15px;
	margin: 0 auto;
	width: 700px;
	height: 70px;
	text-align: right;
}

.card{
	width:700px;
	margin: 0 auto; 
}

.titlediv{
	width: 700px;
	text-align: left;
	margin: 30px auto;
}
</style>


<main id="main" class="main">
<div class="whole-container">
	<div class="pagetitle titlediv">
		<h1> 공지사항 </h1>
	</div>
	<!-- 
		<div align="right">
			   test="${memberInfo eq 'admin'}" 
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/write.do';">글올리기</button>
		</div>
	 -->
		
	<div class="card">
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
			
			<div class="writebtn">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/notice/write'">글쓰기</button>
			</div>
	</div>	
</div> 
</main>