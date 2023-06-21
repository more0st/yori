<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


<style>
header .login-div {
	height: 20px;
	margin: 0 auto;
	font-size: 16px;
}

header .login-button > span {
	height: 20px;
	font-size: 12px;
}

header .login-button > span:hover {
	cursor: default;
}

header .login-div:hover {
	cursor: pointer;
}

header .login-button {
	border: none;
	color: #00000099;
	width: 200px;
	height: 40px;
	text-align: center;
	display: flex;
	align-items: center;
	margin-right: 30px;
}

</style>
<!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="${pageContext.request.contextPath}/owner/home" class="logo d-flex align-items-center">
        <img src="${pageContext.request.contextPath}/resources/logoImg/owner.png">
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
    <c:if test="${not empty sessionScope.member}">
      <ul class="d-flex align-items-center">

        
        
        <li class="nav-item dropdown pe-3">
            <span class="d-none d-md-block">${sessionScope.member.userName} 사장님(${sessionScope.member.restaurantName})</span>
      
        
        </li><!-- End Profile Nav -->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">4</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              모든 주문내역 보기
              <a href="${pageContext.request.contextPath}/owner/order/orderList"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-lightbulb text-primary"></i>
              <div>
                <h4>새로운 주문</h4>
                <p>서울특별시 마포구 월드컵북로 21 풍성빌딩 201호(주문 주소)</p>
                <p>14,000원</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            
             <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-lightbulb text-primary"></i>
              <div>
                <h4>새로운 주문</h4>
                <p>서울특별시 마포구 월드컵북로 21 풍성빌딩 202호(주문 주소)</p>
                <p>18,000원</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

      </ul>
	</c:if>
	<c:if test="${empty sessionScope.member}">
		<div class="login-button">
			<div class="login-div" onclick="location.href='${pageContext.request.contextPath}/owner/login'">로그인</div><span>&nbsp;|&nbsp;</span>
			<div class="login-div" onclick="location.href='${pageContext.request.contextPath}/member/choice'">회원가입</div>
		</div>
	</c:if>
    </nav><!-- End Icons Navigation -->
  </header><!-- End Header -->
  
  
  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar sidebar-hidden">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="${pageContext.request.contextPath}/owner/home">
          <i class="bi bi-grid"></i>
          <span>Home</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>주문</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/owner/order/orderList">
              <i class="bi bi-circle"></i><span>주문리스트</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>메뉴</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/owner/menu/menuCategory">
              <i class="bi bi-circle"></i><span>메뉴 카테고리 관리</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/owner/option/menuList">
              <i class="bi bi-circle"></i><span>옵션 관리</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-shop"></i><span>가게관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/owner/market/marketinfo">
              <i class="bi bi-circle"></i><span>가게 정보</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/owner/market/review">
              <i class="bi bi-circle"></i><span>리뷰 관리</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>매출관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/owner/sale/saleTime">
              <i class="bi bi-circle"></i><span>기간별 매출관리</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/owner/sale/saleMenu">
              <i class="bi bi-circle"></i><span>메뉴별 매출관리</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-heading">Open/Close</li>

      <li class="nav-item" style="cursor: pointer;">
        <a class="nav-link collapsed" onclick="">
          <i class="bi bi-toggle-on"></i>
          <span>Open/Close</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/owner/info/check"> <!-- 정보수정이니까 update로 -->
          <i class="bi bi-person"></i>
          <span>정보수정</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/owner/logout">
          <i class="bi bi-box-arrow-right"></i>
          <span>Log Out</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <!-- End Blank Page Nav -->
    </ul>

  </aside><!-- End Sidebar-->