<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.whole-container {
	min-height: 720px;
}

.body-main {
	max-width: 700px;
	padding-top: 15px;
}

/* form-control */
.butn {
	color: #333;
	border: 1px solid #999;
	background-color: #eee;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor:pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.butn:active, .butn:focus, .butn:hover {
	background-color: #333;
	color:#fff;
}
.butn[disabled], fieldset[disabled] .butn {
	pointer-events: none;
	cursor: not-allowed;
	filter: alpha(opacity=65);
	-webkit-box-shadow: none;
	box-shadow: none;
	opacity: .65;
}


.form-control {
	border: 1px solid #999999; border-radius: 4px; background-color: #ffffff;
	padding: 5px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-control[readonly] { background-color:#f8f9fa; }

textarea.form-control { height: 170px; resize : none; }

.form-select {
	border: 1px solid #999999; border-radius: 4px; background-color: #ffffff;
	padding: 4px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-select[readonly] { background-color:#f8f9fa; }

textarea:focus, input:focus { outline: none; }
input[type=checkbox], input[type=radio] { vertical-align: middle; }

/* table */
.table { width: 100%; border-spacing: 0; border-collapse: collapse; }
.table th, .table td { padding-top: 10px; padding-bottom: 10px; }

.table-border thead > tr { border-top: 2px solid #666; border-bottom: 1px solid #666; }
.table-border tbody > tr { border-bottom: 1px solid #666; }

.td-border td { border: 1px solid #ced4da; }

tr.hover:hover { cursor: pointer; background: #f5fffa; }

.text-left { text-align: left; }
.text-right { text-align: right; }

.clear { clear: both; }
.clear:after { content:''; display:block; clear: both; }

.mx-auto { margin-left: auto; margin-right: auto; }



/* body-container */
.body-container {
	min-height: 500px;
}

.body-title {
    color: #424951;
    padding-top: 35px;
    padding-bottom: 7px;
    margin: 0 0 25px 0;
    border-bottom: 2px solid #eee;;
}

.body-title h2 {
    font-size: 24px;
    min-width: 300px;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    color: #fa0050;
    font-weight: 700;
    padding-bottom: 10px;
    display: inline-block;
    margin: 0 0 -7px 0;
    border-bottom: 3px solid #fa0050;
}

.body-main {
	display: block;
	padding-bottom: 15px;
}

.inner-page{
	display: block;
	padding-top: 35px;
}


.table-form td { padding: 7px 0; }
.table-form p { line-height: 200%; }
.table-form tr:first-child { border-top: 2px solid #666;  }
.table-form tr > td:first-child { width: 110px; text-align: center; background: #eee; }
.table-form tr > td:nth-child(2) { padding-left: 10px; }

.table-form input[type=text], .table-form input[type=file], .table-form textarea {
	border: 1px solid #999;
	width: 96%;
}
</style>

<main id="main" class="main">
	<div class="whole-container">
		<div class="container body-container">
		    <div class="body-title">
				<h2> 공지사항 </h2>
		    </div>
		    
		    <div class="body-main mx-auto">
				<form name="noticeForm" method="post" enctype="multipart/form-data">
					<table class="table table-border table-form">
						<tr> 
							<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
							<td> 
								<input type="text" name="noticeSubject" maxlength="100" class="form-control" value="${dto.noticeSubject}">
							</td>
						</tr>
						
					
						
						<tr> 
							<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
							<td> 
								<textarea name="noticeContent" class="form-control">${dto.noticeContent}</textarea>
							</td>
						</tr>
						
						<tr>
							<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
							<td> 
								<input type="file" name="selectFile" accept="image/*" multiple="multiple" class="form-control">
							</td>
						</tr>
						
						<c:if test="${mode == 'update' }">
							<tr>
								<td>등록이미지</td>
								<td>
									<div class="img-box">
										<c:forEach var="vo" items="${listFile}">
											<img src="${pageContext.request.contextPath}/uploads/notice/${vo.noticePhotoName}"
												onclick="deleteFile('${vo.noticePhotoNum}');">
										</c:forEach>
									</div>
								</td>
							</tr>
						</c:if>
					</table>
						
					<table class="table">
						<tr> 
							<td align="center">
								<button type="button" class="butn" onclick="sendOk();">${mode=="update"?"수정완료":"등록완료"}</button>
								<button type="reset" class="butn">다시입력</button>
								<button type="button" class="butn" onclick="location.href='${pageContext.request.contextPath}/admin/notice/list';">${mode=="update"?"수정취소":"등록취소"}</button>
								<c:if test="${mode=='update' }">
									<input type="hidden" name="noticeNum" value="${dto.noticeNum}">
									<input type="hidden" name="page" value="${page}">
								</c:if>							
							</td>
						</tr>
					</table>
			
				</form>
	
		    </div>
		</div>
	</div>	
</main>


<script type="text/javascript">
function sendOk() {
    const f = document.noticeForm;
	let str;
	
    str = f.noticeSubject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.noticeSubject.focus();
        return;
    }

    str = f.noticeContent.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.noticeContent.focus();
        return;
    }
    
    let mode = "${mode}";
    

    //f.action = "${pageContext.request.contextPath}/notice/${mode}_ok.do";
    f.action = "#";
    f.submit();
}

<c:if test="${mode == 'update'}">
function deleteFile(noticePhotoNum) {
	let cnt = $(".img-box").find("img").length;
	
	if(confirm('이미지를 삭제하시겠습니까 ?')){
		let query = "noticeNum=${dto.noticeNum}&noticePhotoNum=" + noticePhotoNum + "&page=${page}";
		let url = "${pageContext.request.contextPath}/notice/deleteFile.do";
		location.href = url + "?" + query;
	}
	
}
</c:if>
</script>
