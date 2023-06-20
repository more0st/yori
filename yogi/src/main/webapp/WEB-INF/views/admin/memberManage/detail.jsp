<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

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

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">멤버상세내역 <span>김상훈</span></h5>

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
                        <td>sangh***</td>
                        <td>박상훈</td>
                        <td><span>땅후니</span></td>
                        <td>999999</td>
                        <td>sang**@naver.com</td>
                        <td>010-****-****</td>
                        <td><span>경기도 일산동구 좋은 아파트 좋은동 좋은호</span></td>
                        
                        
                      </tr>
                    </tbody>
                  </table>
                  <table class="table table-bordered">
                      <tr>
                        <th scope="col" style="width: 480px;">리뷰 수</th>
                        <td style="width: 402px;">3개</td>
                      </tr>
                      <tr>
                        <th scope="col">주문횟수</th>
                        <td>11회</td>
                      </tr>
                      <tr>
                        <th scope="col">신고당한횟수</th>
                        <td>1회</td>
                      </tr>
                      <tr>
                        <th scope="col">등록일자</th>
                       <td>2023-06-16</td>
                      </tr>
                      <tr>
                        <th scope="col">마지막접속</th>
                       <td><span>2023-06-15</span></td>
                      </tr>
                  </table>
                  <div style="display: flex; justify-content: center; gap : 5px;">
	                  <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">정지</button>
	                  <button type="button" class="btn btn-danger" onclick="" >탈퇴</button>
		              <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/list'">목록</button>
	                  <!-- 정지사유 입력하는 모달 띄우기 -->
                  </div>
                </div>
              </div>
            </div><!-- End Recent Sales -->
          </div>
    </section>
	
	<!-- 모달 -->
	<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">정지 사유</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form> 
		      <div class="modal-body">
				<div>
					<textarea rows="5" cols="52" style="outline:none; resize:none; border:1px solid #d5d5d5;"></textarea>
				</div>
				<div>
					
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">보내기</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
  </main><!-- End #main -->
