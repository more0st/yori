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

            <!-- Reports -->
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">입점신청 대기 수</h5>
					<h3>${count}건</h3>
                </div>

              </div>
            </div><!-- End Reports -->

            <!-- Recent Sales -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">

                <div class="card-body">
                  <h5 class="card-title">입점신청목록</h5>

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
                    	<c:if test="${empty list}">
                    		<tr>
                    			<td colspan="5" style="text-align: center;"> 입점 대기 신청이 없습니다. </td>
                    		<tr>
                    	</c:if>
                    	<c:forEach var="dto" items="${list}" varStatus="status">
	                    	<tr>
		                        <th scope="row">${status.count}</th>
		                        <td>${dto.businessNum}</td>
		                        <td><a href="${pageContext.request.contextPath}/admin/store/storeDetail?restaurantNum=${dto.restaurantNum}" class="text-primary">${dto.restaurantName}</a></td>
		                        <td>${dto.userName}</td>
		                        <td><span>${dto.reg_date}</span></td>
	                     	</tr>
                    	</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div><!-- End Recent Sales -->
          </div>
    </section>

  </main><!-- End #main -->