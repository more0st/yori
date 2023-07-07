<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.whole-container {
	min-height: 720px;
	margin-top: 70px;
}

.card{
	width:750px;
	margin:0 auto;
	border-radius: 10px;
	padding: 20px;
}

.body-title {
	color: #4154F1;
	font-size: 20px;
}

.title-info {
	width: 150px;
	border-bottom: 3px solid #4154F1;
}

.table1 {
	width: 100%;
	margin: 30px 0;
}

.contenttxt {
	width: 100%;
	border-radius: 10px;
	padding: 5px;
	outline: none;
	resize: none;
	height: 300px;
	border: 1px solid #d9d9d9;
}

.subjecttxt {
	width: 100%;
	border-radius: 10px;
	padding: 5px;
	border: 1px solid #d9d9d9;
	outline: none;
	height: 40px;
}

.table2 {
	margin: 0 auto;
}

.table1tr {
	height: 60px;
}

.table1 td:first-child {
	font-weight: bold;
	text-align: center;
}
</style>

<main id="main" class="main">
	<div class="whole-container">
	<div class="card">
		    <div class="body-title">
				<div class="title-info">&nbsp;&nbsp;공지사항</div>
		    </div>
		    
				<form name="noticeForm" method="post" enctype="multipart/form-data">
					<table class="table1">
						<tr class="table1tr"> 
							<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
							<td> 
								<input type="text" class="subjecttxt" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
							</td>
						</tr>
						
					
						
						<tr style="height: 320px;"> 
							<td valign="middle">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
							<td> 
								<textarea name="content" class="contenttxt">${dto.content}</textarea>
							</td>
						</tr>
						
						<tr class="table1tr">
							<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
							<td> 
								<input type="file" name="selectFile" accept="image/*" multiple="multiple" class="form-control">
							</td>
						</tr>
						
						<c:if test="${mode == 'update' }">
							<tr class="table1tr">
								<td>등록이미지</td>
								<td>
									<div class="img-box">
										<c:forEach var="vo" items="${listFile}">
											<img src="${pageContext.request.contextPath}/uploads/notice/${vo.imgFileName}"
												onclick="deleteFile('${vo.imgFileName}', '${dto.noticeNum}','${vo.imgNum}');">
										</c:forEach>
									</div>
								</td>
							</tr>
						</c:if>
					</table>
						
					<table class="table2">
						<tr> 
							<td align="center">
								<button type="button" class="btn btn-primary" onclick="sendOk(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
								<button type="reset" class="btn btn-primary">다시입력</button>
								<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/notice/list';">${mode=="update"?"수정취소":"등록취소"}</button>
								<c:if test="${mode=='update' }">
									<input type="hidden" name="noticeNum" value="${dto.noticeNum}">
								</c:if>							
							</td>
						</tr>
					</table>
			
				</form>
				</div>
		</div>
</main>


<script type="text/javascript">
function sendOk(elClickedObj) {
    const f = document.noticeForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
    
    let mode = "${mode}";
    

    f.action = "${pageContext.request.contextPath}/admin/notice/${mode}";
   
    elClickedObj.submit();
}

<c:if test="${mode == 'update'}">
function deleteFile(imgFileName, num, imgNum) {
	let cnt = $(".img-box").find("img").length;
	
	alert(num);
	alert(imgNum);
	
	if(confirm('이미지를 삭제하시겠습니까 ?')){
		let query = "num="+num+"&imgFileName=" + imgFileName + "&imgNum=" + imgNum;
		let url = "${pageContext.request.contextPath}/admin/notice/deleteFile";
		location.href = url + "?" + query;
	}
	
}
</c:if>
</script>
