<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>주문리스트</h1>
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
                  <h5 class="card-title">주문대기목록<span>| 승현이네 국밥집</span></h5>

                  <table class="table table-borderless datatable">
                    <thead>
                      <tr>
                        <th scope="col">주문번호</th>
                        <th scope="col">유저아이디</th>
                        <th scope="col">메뉴</th>
                        <th scope="col">배달지</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">요청사항</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"><a href="#">1</a></th>
                        <td>test123</td>
                        <td><a href="${pageContext.request.contextPath}/admin/store/storeDetail" class="text-primary">국밥 1개</a></td>
                        <td>서울시 마포구 서교동 쌍용</td>
                        <td>010-1234-2345</td>
                        <td>고기많이주세요</td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#">2</a></th>
                        <td>12345-1111</td>
                        <td><a href="#" class="text-primary">승현이네 국밥집</a></td>
                        <td>한승현</td>
                        <td><span>2023-06-14</span></td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#">3</a></th>
                        <td>12345-2222</td>
                        <td><a href="#" class="text-primary">재혁이네 치킨집</a></td>
                        <td>강재혁</td>
                        <td><span>2023-06-13</span></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div><!-- End Recent Sales -->
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
                  <h5 class="card-title">입점신청목록 <span>| Today</span></h5>

                  <table class="table table-borderless datatable">
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
                      <tr>
                        <th scope="row"><a href="#">2</a></th>
                        <td>12345-1111</td>
                        <td><a href="#" class="text-primary">승현이네 국밥집</a></td>
                        <td>한승현</td>
                        <td><span>2023-06-14</span></td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#">3</a></th>
                        <td>12345-2222</td>
                        <td><a href="#" class="text-primary">재혁이네 치킨집</a></td>
                        <td>강재혁</td>
                        <td><span>2023-06-13</span></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div><!-- End Recent Sales -->
          </div>
    </section>

  </main><!-- End #main -->