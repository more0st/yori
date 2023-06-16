<%@ page contentType="text/html; charset=UTF-8" %>

<style>
footer {
	font-size: 12px;
	background: white;
}

footer .inner {
	width: 100%;
	min-height: 100px;
	justify-content: center;
}

footer .rink {
	text-decoration: none;
	color: #818181;
	font-size: 12px;
}

footer .rink:hover {
	cursor: pointer;
}

footer .rink-group {
	border-top: 1px solid #818181;
	border-bottom: 1px solid #818181;
	padding: 10px;
	height: 45px;
	display: flex;
	justify-content: center;
	align-items: center;
}

footer .rink-div {
	margin: 0 auto;
	display: flex;
	gap:10px;
	width: 70%;
	white-space: nowrap;
}

footer .info {
	justify-content: center;
	width: 70%;
	color: #818181;
	margin: 20px auto;
}

footer .info-title {
	font-weight: bold;
	width: 100%;
	margin: 0 auto;
	font-size: 14px;
}

footer .info-info {
	width: 100%;
	margin: 10px auto;
	font-size: 12px;
}

</style>
<footer id="footer" class="footer">
<div class="inner">
	<div class="rink-group">
		<div class="rink-div">
			<a href="#" class="rink">이용약관</a><div>&nbsp;|&nbsp;</div>
			<a href="#" class="rink">개인정보처리방침</a><div>&nbsp;|&nbsp;</div>
			<a href="#" class="rink">포인트정책</a><div>&nbsp;|&nbsp;</div>
			<a href="#" class="rink">회사소개</a><div>&nbsp;|&nbsp;</div>
			<a href="${pageContext.request.contextPath}/owner/login" class="rink">요기요사장님</a><div>&nbsp;|&nbsp;</div>
			<a href="${pageContext.request.contextPath}/owner/register" class="rink">입점문의</a><div>&nbsp;|&nbsp;</div>
			<a href="${pageContext.request.contextPath}/notice/home" class="rink">공지사항</a><div>&nbsp;|&nbsp;</div>
			<a href="${pageContext.request.contextPath}/faq/home" class="rink">1:1 문의</a>
		</div>
	</div>
	
	
	<div class="info">
		<div class="info-title">주식회사 쌍요기요</div>
		<div class="info-info">서울 마포구 월드컵북로 21 풍성빌딩 2층 | 대표이사 : 김지윤 | 사업자등록번호:123-xx-45678 사업자정보확인통신판매업신고:제 2023-서울마포-0713호 | 개인정보담당자 : admin@naver.com | 제휴문의 : admin@naver.com | 고객만족센터 : admin@naver.com | 호스팅 제공자: 쌍요기요 주식회사</div>
	</div>

</div>
</footer>