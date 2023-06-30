<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.whole-container {
	min-height: 720px;
	margin-top: 70px;
}

.main {
	background: #fcf5f7;
}

.body-main {
	max-width: 700px;
	padding-top: 15px;
}

/* form-control */
.butn {
	color: #333;
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

.table2 {
display: flex;
justify-content: center;

}


.td-border td { border: 1px solid #eee; }

tr.hover:hover { cursor: pointer; background: #f5fffa; }

.text-left { text-align: left; }
.text-right { text-align: right; }

.clear { clear: both; }
.clear:after { content:''; display:block; clear: both; }

.mx-auto { margin-left: auto; margin-right: auto; }



/* body-container */
.body-container {
	min-height: 500px;
	width: 800px;
	background: white;
	border: 1px solid #d9d9d9;
}

.body-title {
    color: #424951;
    padding-top: 35px;
    padding-bottom: 7px;
    margin: 0 0 25px 20px;
    border-bottom: 1px solid #eee;
}

.body-title h2 {
    font-size: 24px;
    min-width: 300px;
    color: #fa0050;
    font-weight: 700;
    padding-bottom: 10px;
    display: inline-block;
    margin: 0 0 -7px 0;
}

.body-main {
	display: block;
	padding-bottom: 15px;
}

.inner-page{
	display: block;
	padding-top: 35px;
}

.dateinput{
	width:40%;
}

.table-form td { padding: 7px 0; }
.table-form p { line-height: 200%; }
.table-form tr:first-child { border-top:none;  }
.table-form tr > td:first-child {  font-weight : 900;  color : #fa0050; width: 110px; text-align: center; background: white; }
.table-form tr > td:nth-child(2) { padding-left: 10px; }

.table-form input[type=text], .table-form input[type=file], .table-form textarea {
	border: 1px solid #eee;
	width: 96%;
}
</style>

<main id="main" class="main">
	<div class="whole-container">
		<div class="container body-container" >
		    <div class="body-title">
				<h2> 이벤트 </h2>
		    </div>
		    
		    
		    <div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
			<form name="eventForm" method="post">
				<table class="table table-border border-top2 table-form">
					<tr> 
						<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td> 
							<input type="text" name="title" maxlength="100" class="form-control" value="${dto.title}">
						</td>
					</tr>
	
					<tr>
						<td>시작일자</td>
						<td> 
							<input type="date" name="sday" class="form-control" value="${dto.sday}">
							<input type="time" name="stime" class="form-control" value="${dto.stime}">
						</td>
					</tr>
	
					<tr>
						<td>종료일자</td>
						<td> 
							<input type="date" name="eday" class="form-control" value="${dto.eday}">
							<input type="time" name="etime" class="form-control" value="${dto.etime}">
						</td>
					</tr>
	
					<tr>
						<td>당첨인원</td>
						<td> 
							<p> <input type="text" name="winnerNumber" class="form-control" value="${dto.winnerNumber}"> </p>
							<p class="help-block">당첨 인원이 0이면 당첨자가 없습니다.</p>
						</td>
					</tr>
					<tr>
						<td>발표일자</td>
						<td>
							<p> 
								<input type="date" name="wday" class="form-control" value="${dto.wday}">
								<input type="time" name="wtime" class="form-control" value="${dto.wtime}">
							</p>
							<p class="help-block">당첨 인원이 0이면 발표일자는 저장되지 않습니다.</p>
						</td>
					</tr>
					
					<tr> 
						<td>출력여부</td>
						<td> 
							<input type="checkbox" name="showEvent" id="showEvent" class="form-check-input" value="1" ${mode=="write" || dto.showEvent==1 ? "checked='checked' ":"" }>
							<label for="showEvent" class="form-check-label">표시</label>
						</td>
					</tr>
				
					<tr> 
						<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td valign="top"> 
							<textarea name="content" id="ir1" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
				  
				</table>
					
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list';">${mode=='update'?'수정취소':'등록취소'}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		</div>		
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    <div class="body-main mx-auto">
				<form name="eventForm" method="post" enctype="multipart/form-data">
					<table class="table table-border table-form">
						<tr> 
							<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
							<td> 
								<input type="text" name="eventSubject" maxlength="100" class="form-control" value="">
							</td>
						</tr>
						
					
						
						<tr> 
							<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
							<td> 
								<textarea name="eventContent" class="form-control"></textarea>
							</td>
						</tr>
						
						<tr>
							<td>기&nbsp;&nbsp;&nbsp;&nbsp;간</td>
							<td> <div style="display:flex; justify-content: space-between;">
								<input type="date" name="start_date" class="form-control dateinput"> ~ 
								<input type="date" name="end_date" class="form-control dateinput">  
								<div><div>&nbsp;종료&nbsp;</div><input type="checkbox" name="enabled"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
							<td> 
							</td>
						</tr>
						
						<c:if test="${mode == 'update'}">
							<tr>
								<td>등록이미지</td>
								<td>
									<div class="img-box">
										<c:forEach var="vo" items="${listFile}">
											<img src="${pageContext.request.contextPath}/resources/picture/event-01.jpg">
										</c:forEach>
									</div>
								</td>
							</tr>
						</c:if>
					</table>
						
					<table class="table2">
						<tr> 
							<td align="center">
								<button type="button" class="btn btn-primary" onclick="sendOk();">${mode=="update"?"수정완료":"등록완료"}</button>
								<button type="reset" class="btn btn-primary">다시입력</button>
								<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/event/list';">${mode=="update"?"수정취소":"등록취소"}</button>
								<c:if test="${mode=='update' }">
									<input type="hidden" name="eventNum" value="${dto.noticeNum}">
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
