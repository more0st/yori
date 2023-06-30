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
                  <div style="display: flex; justify-content: center; gap : 5px;">
	                  
		              <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/list'">목록</button>
                  </div>
                </div>
              </div>
            </div><!-- End Recent Sales -->
          </div>
    </section>
	
	
  </main><!-- End #main -->
