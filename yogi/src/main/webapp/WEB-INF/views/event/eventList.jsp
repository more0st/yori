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

.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.event-box img {
	width : 90%;
    overflow-clip-margin: content-box;
    overflow: clip;
    border-radius: 30px;
    margin-bottom: 20px;
    margin: 0 auto;
}

.event-box {
	margin: 0 auto;
	width: 1300px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-auto-rows: 400px;
	padding: 20px;
	gap: 20px;
	height: 90%;
	overflow: auto;

}

.event-info {
	background: white;
	width: 100%;
	position: relative;
	overflow: hidden;
	padding: 10px;
	cursor: pointer;
}

.event-info:hover{
    opacity:0.5;
}

.event-info > div {
	width: 100%;
	display: flex;
	justify-content: center;
}

.event-info p {
	font-weight: bold;
	margin-top: 5px;
}

.event-info span {
	color: #BDBDBD;
}

.btn-box {
	margin-top : 10px;
	margin-left : 10px;
	padding-bottom : 10px;
	border-bottom: 1px solid #e5e5e5;
}

.eventbtn {
	background: white;
	color: black;
	width: 150px;
	height: 50px;
	border: 1px solid #eee;
	border-radius : 10px;
	font-size: 17px;
	font-weight: 700;
}

.eventbtn:active {
	background: #fa0050;
	color: white;
	border: 1px solid #eee;
	border-radius : 10px;
	font-weight: 700;
}

.eventMove{
	cursor: pointer;
	font-size: 25px;
    font-weight: bold;
    line-height: 1.3em;
    letter-spacing: -.06em;
}

</style>

<div class="contain title-container"><div  onclick="location.href='${pageContext.request.contextPath}/event/eventList'" class="eventMove">이벤트</div></div>
	<div class="contain whole-container">
		<div class="btn-box">
			<button id="eventbtn1" class="eventbtn">전체보기</button>
			<button id="eventbtn2" class="eventbtn">진행중</button>
			<button id="eventbtn3" class="eventbtn">종료</button>
		</div>
		<div class="event-box">
			<div class="event-info" onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
				</div>
				<p>요리조리요 이벤트</p>
				<h4>이번엔 요리조리요에서 100만원 받아가세요</h4>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info" onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img src="${pageContext.request.contextPath}/resources/picture/event-02.jpg">
				</div>
				<p>요리조리요 이벤트</p>
				<h4>이번엔 요리조리요에서 100만원 받아가세요</h4>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info" onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img src="${pageContext.request.contextPath}/resources/picture/event-03.jpg">
				</div>
				<p>요리조리요 이벤트</p>
				<h4>이번엔 요리조리요에서 100만원 받아가세요</h4>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info" onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img src="${pageContext.request.contextPath}/resources/picture/event-04.jpg">
				</div>
				<p>요리조리요 이벤트</p>
				<h4>이번엔 요리조리요에서 100만원 받아가세요</h4>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info" onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img src="${pageContext.request.contextPath}/resources/picture/event-05.jpg">
				</div>
				<p>요리조리요 이벤트</p>
				<h4>이번엔 요리조리요에서 100만원 받아가세요</h4>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info" onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img src="${pageContext.request.contextPath}/resources/picture/event-06.png">
				</div>
				<p>요리조리요 이벤트</p>
				<h4>이번엔 요리조리요에서 100만원 받아가세요</h4>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info" onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img src="${pageContext.request.contextPath}/resources/picture/event-09.jpg">
				</div>
				<p>요리조리요 이벤트</p>
				<h4>이번엔 요리조리요에서 100만원 받아가세요</h4>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info" onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img src="${pageContext.request.contextPath}/resources/picture/event-10.jpg">
				</div>
				<p>요리조리요 이벤트</p>
				<h4>이번엔 요리조리요에서 100만원 받아가세요</h4>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>
			<div class="event-info" onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img src="${pageContext.request.contextPath}/resources/picture/event-11.png">
				</div>
				<p>요리조리요 이벤트</p>
				<h4>이번엔 요리조리요에서 100만원 받아가세요</h4>
				<span>2023-06-01 ~ 2023-06-30</span>
			</div>

			
		</div>
		
		<div>
		
		</div>
	</div>

<script type="text/javascript">

var buttons = document.querySelectorAll(".eventbtn");
var activeButton = document.getElementById("eventbtn1");

buttons.forEach(function(button) {
  button.addEventListener("click", function() {
    // 이전 활성 버튼 스타일 초기화
    activeButton.style.backgroundColor = "white";
    activeButton.style.color = "#333";

    // 클릭된 버튼 스타일 변경
    button.style.backgroundColor = "#fa0050";
    button.style.color = "white";

    // 활성 버튼 업데이트
    activeButton = button;
  });
});

// 초기 화면 설정
activeButton.style.backgroundColor = "#fa0050";
activeButton.style.color = "white";

</script>
