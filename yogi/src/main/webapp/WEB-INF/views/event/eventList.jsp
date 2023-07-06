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
	max-height : 280px;
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

.event-info h4{
	font-family : 'Jalnan';
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

<c:url var="listUrl" value="/yogi/event/${category}/list">
	<c:if test="${not empty keyword}">
		<c:param name="condition" value="${condition}"/>
		<c:param name="keyword" value="${keyword}"/>
	</c:if>
</c:url>

<script type="text/javascript">
window.addEventListener("load", function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = "${listUrl}"; 
	
	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);
	
	document.querySelector(".dataCount").innerHTML = dataCount+"개 ("
			+page+"/"+total_page+"페이지)";

	document.querySelector(".page-navigation").innerHTML = 
		dataCount === 0 ? "등록된 게시물이 없습니다." : paging;
});

$(function(){
	$('#tab-${category}').css("background", "#fa0050");
	$('#tab-${category}').css("color","white");

	$('div.btn-box button').click(function() {
		let category = $(this).attr('data-category');
		location.href = '${pageContext.request.contextPath}/event/'+category+'/list';
	});
});
</script>





<div class="contain title-container">
	<div
		onclick="location.href='${pageContext.request.contextPath}/event/all/list'"
		class="eventMove">이벤트</div>
</div>
<div class="contain whole-container">
	
	

	<div class="btn-box" name="btn-box">
		<button id="tab-all" class="eventbtn" data-category="all">전체보기</button>
		<button id="tab-progress" class="eventbtn" data-category="progress">진행중</button>
		<button id="tab-ended" class="eventbtn" data-category="ended">종료</button>
	</div>
	
	<div class="dataCount" style="margin-top: 10px;"></div>
	
	<div class="event-box">
		
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="event-info"
				onclick="location.href='${pageContext.request.contextPath}/event/eventDetail'">
				<div>
					<img
						src="${pageContext.request.contextPath}/uploads/admin/event/${dto.imgFileName}">
				</div>
				<h4 style="margin-top: 20px; text-align: center;">${dto.subject}</h4>
				<div style="text-align: center;">${dto.start_date}~
					${dto.end_date}</div>
			</div>
		</c:forEach>

	</div>

	<div class="page-navigation"></div>

	

</div>


