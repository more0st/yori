<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
	min-height: 800px;
	background: #fafafa;
}

.container {
	background: white;
	margin: 30px auto;
}
</style>

<div class="whole-container">
	<div class="container" style="max-width: 800px; padding: 20px 15px 20px 15px;">
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
						<td colspan="2" style="border-bottom: none;">
							<div class="row row-cols-6 img-box">
								<c:forEach var="vo" items="${listFile}">
									<div class="col p-1">
										<img src="${pageContext.request.contextPath}/uploads/album/${vo.imageFilename}"
											class="img-thumbnail w-100 h-100" style="max-height: 130px;"
											onclick="imageViewer('${pageContext.request.contextPath}/uploads/album/${vo.imageFilename}');">
									</div>
								</c:forEach>
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
							<button type="button" class="btn btn-light" onclick="deleteInquiry('${dto.num}');">질문삭제</button>
						</td>
						<td class="text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/faq/home?${query}';">리스트</button>
						</td>
					</tr>
				</table>
	
			</div>
		</div>
	</div>

</div>