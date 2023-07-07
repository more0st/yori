<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
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
    display: inline-block;
    border: 1px solid #ccc;
    background: #fff url(../image/ico-lt.png?v=6f834f8…) no-repeat 10px 10px;
    background-size: 5px;
    padding: 7px 12px 4px 10px;
    margin: 10px 0 0 0;
    position: relative;
    overflow: hidden;
    text-decoration: none;
    font-size: 14px;
    color: black;
}

.btn-list:hover {
    color: black;
}

.notice-list:hover {
    color: black;
}

.n-hitCount{
	float: right;
	font-size: 14px;
	padding-top: 10px;
}

.btnlist{
    border: 1px solid #ccc;
    font-size: 14px;
    color:black;
    margin-bottom: 10px;
}
</style>

<div class="whole-container">
	<div class="notice-wrap">
		<div style="padding-top: 20px; padding-bottom: 10px; margin: 0 auto;">
			<a class="btn btn-outline-secondary btnlist" href="${pageContext.request.contextPath}/notice/home"><i class="bi bi-caret-left-fill"></i> 목록으로</a>
			<div class="notice-list">
			${dto.subject}
				<div class="n-date">
				${dto.reg_date}
				</div>
			</div>
			
			
			<div class="n-body">
			
				<div class="n-hitCount">
				조회수 : ${dto.hitCount}
				</div>
			
				<div class="row row-cols-6 img-box" style="padding-top: 20px;">
					<c:forEach var="vo" items="${listFile}">
						<div class="col p-1">
							<img src="${pageContext.request.contextPath}/uploads/notice/${vo.imgFileName}"
								class="img-thumbnail w-100 h-100" style="max-height: 130px;"
								onclick="imageViewer('${pageContext.request.contextPath}/uploads/notice/${vo.imgFileName}');">
						</div>
					</c:forEach>
				</div>
			
				<div class="n-content">
				<br>
					${dto.content}
				</div>
			</div>
			
			
		</div>
	</div>	<!-- class="notice-wrap" -->
	
</div> <!-- class="whole-container" -->

<!-- Modal -->
<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">이미지 뷰어</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
        
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

function imageViewer(src) {
	const $model = $("#myDialogModal .modal-body");
	let s = "<img src='"+src+"' class='img-thumbnail w-100 h-100'>";
	$model.html(s);
	
	$("#myDialogModal").modal("show");
}
</script>