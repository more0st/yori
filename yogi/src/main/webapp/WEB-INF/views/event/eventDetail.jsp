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

.borderdiv {
    border-bottom: 1px solid #e5e5e5;
    margin-bottom: 20px;
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
	width : 100%;
    overflow-clip-margin: content-box;
    overflow: clip;
    border-radius: 30px;
    margin-bottom: 20px;
    margin: 0 auto;
}

.event-box {
	margin: 0 auto;
	width: 900px;
	padding: 20px;
	gap: 20px;
}

.event-info {
	background: white;
	width: 100%;
	position: relative;
	overflow: hidden;
	padding: 20px;
	margin-bottom: 20px;
}

.event-info p{
	font-weight: bold;
}

.event-list {
	background: white;
	width: 50%;
	position: relative;
	overflow: hidden;
	padding: 10px;
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

.eventbtn:active {
	background: #fa0050;
	color: white;
	width: 170px;
	height: 50px;
	border: 1px solid #eee;
	border-radius : 10px;
	font-size: 20px;
	font-weight: 700;
}

.flexbetween {
	width: 100%;
	display: flex;
	justify-content: space-between;
}

.listdiv {
	display: flex;
	justify-content: right;
}

.listbtn {
	background: #fa0050;
	color: white;
	border-radius: 10px;
	border: none;
	font-weight: 600;
	font-size: 15px;
	width: 100px;
	padding:12px;
}

.imgdiv{
	margin-bottom: 50px;
}

.eventMove{
	cursor: pointer;
	font-weight: bold;
	font-size: 25px;
    line-height: 1.3em;
    letter-spacing: -.06em;
}

.dateDiv{
	display: flex;
    align-items: flex-end;
    color: #bdbdbd;
}

.event-info h3{
	font-family : 'Jalnan';
}

</style>

<div class="contain title-container"><div class="eventMove" onclick="location.href='${pageContext.request.contextPath}/event/eventList'">이벤트</div></div>
	<div class="contain whole-container">
		<div class="event-box">
			<div class="event-info">
				<p>요리조리요 이벤트</p>
				<div class="flexbetween borderdiv">
				<h3>이번엔 요리조리요에서 100만원 받아가세요</h3>
				<div class="dateDiv">2023-06-01</div>
				</div>
				<div onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'" class="imgdiv">
					<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
				</div>
				
				<div>
				■ 이벤트 기간 : ~ 6월 30일(금)까지<br><br>​

​
				■ 참여 대상 <br>
				
				(참여자1) 입점을 추천하고 싶은 요기요 사장님 누구나!<br>
				
				(참여자2) 요기요 입점을 희망하는 옆집 사장님 누구나!<br>
				
				
				
				■ 선물 안내<br>
				
				신세계 상품권 5만원권<br><br>
				
				
				
				■ 선물 지급 대상<br>
				
				(1) 요기요 사장님<br>
				
				추천받은 사장님이 입점 완료하신 경우<br><br><br>
				
				
				
				(2) 옆집 사장님<br>
				
				7월 5일(수)까지 전화로 입점 상담을 하고,<br>
				
				7월 7일(금)까지 입점 완료한 경우<br>
				
				
				
				■ 선물 지급일<br><br>
				
				2023년 7월 21일(금)<br>
				
				</div>
			</div>
		<div class="listdiv">
			<button class="listbtn" onclick="location.href='${pageContext.request.contextPath}/event/eventList'">목록으로</button>
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
