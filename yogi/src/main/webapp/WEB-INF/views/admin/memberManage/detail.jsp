<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>스토어리스트</h1>
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
                  <h5 class="card-title">입점신청상세내역 <span>상훈이네 족발집</span></h5>

                  <table class="table table-bordered datatable">
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th scope="col">사업자번호</th>
                        <th scope="col">상호명</th>
                        <th scope="col">대표자명</th>
                        <th scope="col">입점신청일자</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"><a href="#">1</a></th>
                        <td>1245-0000</td>
                        <td><a href="${pageContext.request.contextPath}/admin/store/storeDetail" class="text-primary">상훈이네 족발집</a></td>
                        <td>박상훈</td>
                        <td><span>2023-06-15</span></td>
                      </tr>
                    </tbody>
                  </table>
                  <table class="table table-bordered">
                      <tr>
                        <th scope="col">사업자전화번호</th>
                        <td>010-1234-1234</td>
                      </tr>
                      <tr>
                        <th scope="col">대표 전화번호</th>
                        <td>02-1234-0000</td>
                      </tr>
                      <tr>
                        <th scope="col">대표이메일</th>
                        <td>restaurant@naver.com</td>
                      </tr>
                      <tr>
                        <th scope="col">카테고리</th>
                        <td>족발</td>
                      </tr>
                      <tr>
                        <th scope="col">첨부파일</th>
                        <td>사업자등록증.jpg</td>
                      </tr>
                  </table>
                  <div style="display: flex; justify-content: center; gap : 5px;">
	                  <button type="button" class="btn btn-primary">승인</button>
	                  <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">거절</button>
		              <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/admin/store/storeList'">목록</button>
	                  <!-- 거절사유 입력하는 모달 띄우기 -->
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
	        <h5 class="modal-title" id="exampleModalLabel">거절 사유</h5>
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
