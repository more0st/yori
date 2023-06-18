<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">

.title-container {
    border-top: 1px solid #e5e5e5;
    border-bottom: 1px solid #e5e5e5;
    
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 79px;
    
}

.contain {
	margin: 0 auto;
    padding-left: 40px;
    padding-right: 40px;
}

.title-container >p {
	font-size: 36px;
    font-weight: 700;
    line-height: 1.3em;
    letter-spacing: -.06em;
    margin-top: 15px;

}

.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.event-box img {
    overflow-clip-margin: content-box;
    overflow: clip;
    border-radius: 30px;
    margin-bottom: 20px;
}

.event-box img:hover {
    opacity:0.5;
}

.event-box {
	margin: 0 auto;
	width: 1100px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-auto-rows: 400px;
	padding: 20px;
	gap: 10px;
	height: 90%;
	overflow: auto;

}

.event-info {
	background: white;
	width: 100%;
	position: relative;
	overflow: hidden;
}

.btn-box {
	margin-top : 10px;
	margin-left : 10px;
	padding-bottom : 10px;
	border-bottom: 1px solid #e5e5e5;
}

.selectedbtn {
	background: #fa0050;
	color: white;
	width: 170px;
	height: 50px;
	border: 1px solid #eee;
	border-radius : 10px;
	font-size: 20px;
	font-weight: 700;
}

.eventbtn {
	background: white;
	color: black;
	width: 170px;
	height: 50px;
	border: 1px solid #eee;
	border-radius : 10px;
	font-size: 20px;
	font-weight: 700;
}

</style>

<div class="contain title-container"><p>이벤트</p></div>
	<div class="contain whole-container">
		<div class="btn-box">
			<button class="selectedbtn">전체보기</button>
			<button class="eventbtn">진행중</button>
			<button class="eventbtn">종료</button>
		</div>
		<div class="event-box">
			<div class="event-info">
				<a href="${pageContext.request.contextPath}/event/eventDetail">
					<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
					<!-- 이미지 가운데로 가줘 ㅠ -->
				</a>
				<p>요리조리요 이벤트</p>
				<h3>이번엔 요리조리요에서 100만원 받아가세요</h3>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info">
				<a href="${pageContext.request.contextPath}/event/eventDetail">
					<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
				</a>
				<p>요리조리요 이벤트</p>
				<h3>이번엔 요리조리요에서 100만원 받아가세요</h3>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info">
				<a href="${pageContext.request.contextPath}/event/eventDetail">
					<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
				</a>
				<p>요리조리요 이벤트</p>
				<h3>이번엔 요리조리요에서 100만원 받아가세요</h3>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info">
				<a href="${pageContext.request.contextPath}/event/eventDetail">
					<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
				</a>
				<p>요리조리요 이벤트</p>
				<h3>이번엔 요리조리요에서 100만원 받아가세요</h3>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info">
				<a href="${pageContext.request.contextPath}/event/eventDetail">
					<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
				</a>
				<p>요리조리요 이벤트</p>
				<h3>이번엔 요리조리요에서 100만원 받아가세요</h3>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info">
				<a href="${pageContext.request.contextPath}/event/eventDetail">
					<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
				</a>
				<p>요리조리요 이벤트</p>
				<h3>이번엔 요리조리요에서 100만원 받아가세요</h3>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info">
				<a href="${pageContext.request.contextPath}/event/eventDetail">
					<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
				</a>
				<p>요리조리요 이벤트</p>
				<h3>이번엔 요리조리요에서 100만원 받아가세요</h3>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>

			
		</div>
		
		<div>
		
		
		
		</div>
	
	</div>
