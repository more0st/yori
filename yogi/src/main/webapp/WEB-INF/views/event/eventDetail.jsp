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
    margin-bottom: 30px;
    padding-bottom: 15px;
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
	padding-bottom : 35px;
	margin-bottom: 20px;
}

.event-info p{
	font-size: 15px;
	font-weight : 700;
	color: #d9d9d9;
	margin-bottom: 0px;
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

.imgdiv img{
	border-radius: 30px;
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
	justify-content : right;
    align-items: flex-end;
    font-size: 17px;
}

.event-info h3{
	font-family : 'Jalnan';
	margin-bottom: 0px;
}

.res-img {
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.downloadBtn {
	border: none;
	background: none;
	width: 250px;
}

</style>

<script type="text/javascript">
function couponCheck() {
	let subject = "${dto.subject}";
	subject = encodeURIComponent(subject);
	
	let url = "${pageContext.request.contextPath}/event/couponCheck";
	let query = "eventNum=${dto.eventNum}" + "&subject=" + subject;
	
	
	$.ajax({
		type:"POST"
		,url:url
		,data: query
		,dataType:"json"
		,success:function(data) {
			let passed = data.passed;

			if(passed === "true") {
				alert("쿠폰은 한 아이디 당 하나씩만 발급받을 수 있습니다.")
			} else {
				alert( ${dto.discount} + " 원 쿠폰이 발급되었습니다.");
			}
		}
	});
}


</script>


<div class="contain title-container"><div class="eventMove" onclick="location.href='${pageContext.request.contextPath}/event/${category}/list'">이벤트</div></div>
	<div class="contain whole-container">
		<div class="event-box">
			<div class="event-info">
				<div class="flexbetween borderdiv">
				<div style="width: 100%;">
				<p>요리조리요 이벤트</p>
				<h3>${dto.subject}</h3>
				<div class="dateDiv">${dto.start_date} ~ ${dto.end_date}</div>
				</div>
				</div>
				<div class="imgdiv">
					<img src="${pageContext.request.contextPath}/uploads/admin/event/${dto.imgFileName}">
				</div>
				
				<div>
				
					<h4 class="fw-semibold">※ 이벤트 기간 : ${dto.start_date} ~ ${dto.end_date}</h4>
					
					<div style="margin-top: 20px;">${dto.content }</div>
				
					<c:set var="close" value="${isClose}"></c:set>
					<c:if test="${! close}">
					<div style="width: 100%; display: flex; justify-content: center; margin-top: 50px;">
						<button type="button" class="downloadBtn" onclick="couponCheck();">
							<img class="res-img" src="${pageContext.request.contextPath}/resources/picture/download_coupon.jpg">
						</button>
					</div>
					</c:if>
				
				
					
				</div>
				
				<table class="table" style="margin-top: 40px;">
	                <tbody>
	                  <tr>
	                    <td>이전글 : <c:if test="${not empty preReadDto}">
								<a
									href="${pageContext.request.contextPath}/event/${category}/article?${query}&num=${preReadDto.eventNum}">${preReadDto.subject}</a>
							</c:if>
	                    </td>
	                  </tr>
	                  <tr>
	                    <td>다음글 : <c:if test="${not empty nextReadDto}">
								<a
									href="${pageContext.request.contextPath}/event/${category}/article?${query}&num=${nextReadDto.eventNum}">${nextReadDto.subject}</a>
							</c:if>
	                    </td>
	                  </tr>
	                </tbody>
	            </table>
				
			</div>


		
		

		<div class="listdiv">
			<button class="listbtn" onclick="location.href='${pageContext.request.contextPath}/event/${category}/list'">목록으로</button>
		</div>
		</div>
		
		<div>
		
		</div>
	</div>

