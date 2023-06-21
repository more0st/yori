<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.container {
	background: white;
	margin: 30px auto;
}

.table-light {
	text-align: center;
	vertical-align: middle;
}
</style>

<script type="text/javascript">
function sendOk() {
    const f = document.faqForm;
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
    if( (mode === "write") && (!f.selectFile.value) ) {
        alert("이미지 파일을 추가 하세요. ");
        f.selectFile.focus();
        return;
    }
    
    
    f.action = "${pageContext.request.contextPath}/faq/write";
    f.submit();
}

    
</script>


<div class="whole-container">
	<div class="container"
		style="max-width: 800px; padding: 20px 15px 20px 15px;">
		<div class="body-container">
			<div class="body-title">
				<h3>1:1 문의</h3>
			</div>
			<hr>

			<div class="body-main">

				<form  name="faqForm" method="post" enctype="multipart/form-data">
					<table class="table mt-5 write-form"
						style="border-top: 2px solid gray;">
						<tr>
							<td class="table-light col-sm-2" scope="row"
								style="text-align: center; vertical-align: middle;">구 분</td>
							<td><select name="category" class="form-select">
									<option value="결제문의"
										${dto.category=="결제문의"?"selected='selected'":"" }>결제문의</option>
									<option value="환불문의"
										${dto.category=="환불문의"?"selected='selected'":"" }>환불문의</option>
									<option value="업체신고"
										${dto.category=="업체신고"?"selected='selected'":"" }>업체신고</option>
									<option value="기타문의"
										${dto.category=="기타문의"?"selected='selected'":"" }>기타문의</option>
							</select></td>
						</tr>

						<tr>
							<td class="table-light col-sm-2" scope="row">제 목</td>
							<td><input type="text" name="subject"  class="form-control"	value="${dto.subject}"></td>
						</tr>

						<tr>
							<td class="table-light col-sm-2" scope="row">작성자명</td>
							<td>
								<p class="form-control-plaintext">${sessionScope.member.userName}</p>
							</td>
						</tr>

						<tr>
							<td class="table-light col-sm-2" scope="row">내 용</td>
							<td><textarea name="content" id="content"
									class="form-control" style="min-height: 200px;">${dto.content}</textarea>
							</td>
						</tr>
						<tr>
							<td class="table-light col-sm-2" scope="row">첨 부</td>
							<td><input type="file" name="selectFile" accept="image/*"
								multiple="multiple" class="form-control"></td>
						</tr>

					</table>

					<table class="table table-borderless">
						<tr>
							<td class="text-center">
								<button type="button" class="btn btn-danger" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i
										class="bi bi-check2"></i>
								</button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light"
									onclick="location.href='${pageContext.request.contextPath}/faq/home';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i
										class="bi bi-x"></i>
								</button> <c:if test="${mode=='update'}">
									<input type="hidden" name="num" value="${dto.num}">
									<input type="hidden" name="page" value="${page}">
								</c:if>
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>
</div>
