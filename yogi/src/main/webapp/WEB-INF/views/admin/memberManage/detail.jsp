<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style>
.button-container {
	display: flex;
  	justify-content: center;
  	align-items: center;
  	
  	font-size: 20px;
  	padding: 10px 20px;
  	margin: auto 10px;
}

.btn-sm {
    --bs-btn-padding-y: 0.5rem;
    --bs-btn-padding-x: 0.75rem;
    --bs-btn-font-size: 1rem;
}

</style>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>회원 목록</h1>
    </div><!-- End Page Title -->

    <section class="section dashboard">

        <!-- Left side columns -->
          <div class="row">

            <!-- Recent Sales -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">

                <div class="card-body">
                  <h5 class="card-title">회원상세내역 <span>${dto.userName}</span></h5>

                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th scope="col">회원번호</th>
                        <th scope="col">아이디</th>
                        <th scope="col">이름</th>
                        <th scope="col">닉네임</th>
                        <th scope="col">생일</th>
                        <th scope="col">이메일</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">주소</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td scope="row">1</td>
                        <td>${dto.userId}</td>
                        <td>${dto.userName}</td>
                        <td><span>${dto.nickName}</span></td>
                        <td>${dto.birth}</td>
                        <td>${dto.email}</td>
                        <td>${dto.tel}</td>
                        <td><span>(${dto.zip}) ${dto.addr1} ${dto.addr2}</span></td>
                        
                        
                      </tr>
                    </tbody>
                  </table>
                  <table class="table table-bordered">
                      <tr>
                        <th scope="col" style="width: 480px;">리뷰 수</th>
                        <td style="width: 402px;">${dto.reviewCount}개</td>
                      </tr>
                      <tr>
                        <th scope="col">주문횟수</th>
                        <td>${dto.buyCount}회</td>
                      </tr>
                      <tr>
                        <th scope="col">신고당한횟수</th>
                        <td>${dto.reviewReportCount}회</td>
                      </tr>
                      <tr>
                        <th scope="col">등록일자</th>
                       <td>${dto.reg_date}</td>
                      </tr>
                      <tr>
                        <th scope="col">마지막접속</th>
                       <td><span>${dto.last_login}</span></td>
                      </tr>
                  </table>
                  
                  <h5 class="card-title"> 정지내역</h5>
                  <c:choose>
							<c:when test="${empty list}">
								 <h6 class="card-title"> <span>정지내역이 없습니다.</span></h6>
							</c:when>
							
							<c:otherwise>
								 <table class="table table-bordered">
								 <tr>
			                        <th scope="col" style="width: 480px;">날짜</th>
			                        <th scope="col" style="width: 480px;">정지 상태</th>
			                        <th scope="col" style="width: 480px;">정지 사유</th>
			                     </tr>
			                     <c:forEach var="dtoState" items="${list}" varStatus="status">
			                     <tr>
			                     	<td>${dtoState.reg_date}</td>
			                     	<td>
				                     	<c:choose>
				                     	
					                     	<c:when test="${dtoState.stateCode==0}">
					                     		리뷰 정지
					                     	</c:when>
				                     	
					                     	<c:otherwise>
												비밀번호 정지
											</c:otherwise>
				                     	
				                     	</c:choose>
			                     	</td>
			                     	<td>${dtoState.memo}</td>
			                     </tr>
			                     </c:forEach>
								 </table>
							</c:otherwise>
							
				  </c:choose>
				  
	                  <div class="button-container">
		                  <c:choose>
								<c:when test="${dto.enabled==1}">
									<button type="button" class="btn btn-secondary btn-sm" style="text-align: center;" data-bs-toggle="modal" data-bs-target="#modal${status.index}">회원 정지</button>
									<input id="suspendId" type="hidden" value="${dto.userId}">
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-primary btn-sm" onclick="release('${dto.userId}',${status.index})" >정지 해제</button>
									<input id="suspendId" type="hidden" value="${dto.userId}">
								</c:otherwise>
							</c:choose>
					  </div>
					  
							<div class="modal" id="modal${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">정지 사유</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <form> 
								      <div class="modal-body">
										<div>
											<textarea id="reason" rows="5" cols="60" style="outline:none; resize:none; border:1px solid #d5d5d5;"></textarea>
										</div>
										<div>
											
										</div>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								        <button type="button" class="btn btn-primary" onclick="sendSuspension('${dto.userId}')">보내기</button>
								      </div>
							      </form>
							    </div>
							  </div>
							</div>
						
                  <div style="display: flex; justify-content: right; gap : 5px;">
		              <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/list'">목록</button>
                  </div>
                </div>
              </div>
            </div><!-- End Recent Sales -->
          </div>
    </section>
    
    <script type="text/javascript">

function release(clickUserId) {
	if(!confirm("정지를 해제하시겠습니까?")) {
		return false;
	}
	// 회원 상태를 변경하기 위한 AJAX 요청
	$.ajax({
		type: "POST", // 혹은 "PUT" 등 HTTP 요청 메소드 선택
		url: "${pageContext.request.contextPath}/admin/memberManage/releaseMemberState", // 실제 서버 요청 주소
		data: {
			userId: clickUserId,
			registerId : "admin"
			
		},
		success: function(data) {
			// 서버 요청이 성공했을 때 실행할 코드
			alert("정지가 해제되었습니다.");
			location.href = '${pageContext.request.contextPath}/admin/memberManage/list'
			
			// 페이지 새로고침 등 필요한 동작 수행
		},
		error: function(jqXHR) {
			// 서버 요청이 실패했을 때 실행할 코드
			alert("정지 해제 실패");
			console.log(jqXHR.responseText);
		}
	});
	
}

function sendSuspension(clickUserId) {
	// 정지 사유 입력란에서 값을 가져옴
	var reason = document.getElementById("reason").value;
	
	// 회원 상태를 변경하기 위한 AJAX 요청
	$.ajax({
		type: "POST", // 혹은 "PUT" 등 HTTP 요청 메소드 선택
		url: "${pageContext.request.contextPath}/admin/memberManage/updateMemberEnabled", // 실제 서버 요청 주소
		data: {
			userId: clickUserId,
			registerId : "admin",
			reason: reason,
			
		},
		success: function(data) {
			// 서버 요청이 성공했을 때 실행할 코드
			alert("회원이 정지되었습니다.");
			location.href = '${pageContext.request.contextPath}/admin/memberManage/list'
			
			// 페이지 새로고침 등 필요한 동작 수행
		},
		error: function(jqXHR) {
			// 서버 요청이 실패했을 때 실행할 코드
			alert("회원 정지 실패");
			console.log(jqXHR.responseText);
		}
	});
}

</script>
	
	
  </main><!-- End #main -->
