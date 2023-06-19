<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
}

.container {
	background: white;
	margin: 30px auto;
}

.bold{
	font-weight: bold;
}

.bordergray{
	border: 1px solid #d9d9d9;
}
</style>


<main id="main" class="main">
	<div class="whole-container">
		<div class="container" style="max-width: 900px; padding: 20px 15px 20px 15px;">
			<div class="body-container">	
				<div class="body-title">
					<h3> 1:1 문의 </h3>
				</div>
				
				<div class="body-main">
		
					<table class="table mb-0">
						<tbody>
							<tr>
								<td colspan="2" align="center" class="px-0 pb-0">
									<div class="row gx-0">
										<div class="col-sm-1 bg-primary me-1">
											<p class="form-control-plaintext text-white">Q</p>
										</div>
										<div class="col bg-primary">
											<p class="form-control-plaintext text-white">${dto.subject}</p>
										</div>
									</div>
								</td>
							</tr>				
						
							<tr>
								<td width="50%">
									카테고리 : ${dto.category}
								</td>
								<td align="right">
									작성자 : ${dto.userName}
								</td>
							</tr>
		
							<tr>
								<td width="50%">
									문의일자 : ${dto.reg_date}
								</td>
								<td align="right">
									처리결과 : ${(empty dto.answer_date)?"답변대기":"답변완료"}
								</td>
							</tr>
							
							<tr>
								<td colspan="2" valign="top" height="200">
									${dto.content}
								</td>
							</tr>
						</tbody>
					</table>
					
					<!-- 답변 없을 때는	c:if test="${not empty dto.answer}" 로 가리기	-->
					
						<table class="table mb-0">
							<tbody>
								<tr>
									<td colspan="2" align="center" class="p-0">
										<div class="row gx-0">
											<div class="col-sm-1 bg-success me-1">
												<p class="form-control-plaintext text-white">A</p>
											</div>
											<div class="col bg-success">
												<p class="form-control-plaintext text-white">[답변] ${dto.subject}</p>
											</div>
										</div>
									</td>
								</tr>
							
								<tr>
									<td width="50%">
										담당자 : 관리자
									</td>
									<td align="right">
										답변일자 : ${dto.answer_date}
									</td>
								</tr>
								
								<tr>
									<td colspan="2" valign="top" height="150">
										${dto.answer}
									</td>
								</tr>
							</tbody>
						</table>
					<!-- /c:if> -->
					
					<table class="table table-borderless mb-2">
						<tr>
							<td width="50%">
								<button type="button" class="btn btn-light bordergray" onclick="deleteInquiry('${dto.num}');">질문삭제</button>
								<button type="button" class="btn btn-light bordergray" onclick="">답변삭제</button>
							</td>
							<td class="text-end">
								<button type="button" class="btn btn-light bordergray" onclick="location.href='${pageContext.request.contextPath}/admin/faq/list?${query}';">리스트</button>
							</td>
						</tr>
					</table>
					
				<c:if test="${empty dto.answer}">
					<div class="reply">
						<form name="answerForm" method="post">
							<div class='form-header'>
								<span class="bold">&nbsp;&nbsp;&nbsp;답변달기</span><span> - 문의에 대한 답변을 입력 하세요</span>
							</div>
							
							<div style="margin-top: 10px; margin-left: 10px; margin-bottom: 15px;">
								<textarea class='form-control' name='answer'></textarea>
							</div>	
							
							<div align='right'>
						        <button type='button' class='btn btn-outline-secondary' onclick="sendAnswerOk()">답변 등록</button>
						        <input type="hidden" name="num" value="${dto.num}">
						        <input type="hidden" name="page" value="${page}">
						        <input type="hidden" name="condition" value="${condition}">
						        <input type="hidden" name="keyword" value="${keyword}">
							</div>
						</form>
					</div>
				</c:if>
		
				</div>
			</div>
		</div>
	</div>
</main>