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
    <c:if test="${not empty sessionScope.member && sessionScope.member.membership == 51}">
      <ul class="d-flex align-items-center">

        
        
        <li class="nav-item dropdown pe-3">
            <span class="d-none d-md-block">${sessionScope.member.userName} 사장님(
            <c:if test="${not empty sessionScope.member.restaurantName}">
	            ${sessionScope.member.restaurantName}
            </c:if>
            <c:if test="${empty sessionScope.member.restaurantName}">
            	입점 전
            </c:if>
            
            )</span>
      
        
        </li><!-- End Profile Nav -->


      </ul>
	</c:if>
	<c:if test="${empty sessionScope.member || sessionScope.member.membership == 1}">
		<div class="login-button">
			<div class="login-div" onclick="location.href='${pageContext.request.contextPath}/owner/login'">로그인</div><span>&nbsp;|&nbsp;</span>
			<div class="login-div" onclick="location.href='${pageContext.request.contextPath}/owner/member'">회원가입</div>
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
      
      <c:if test="${not empty sessionScope.member}"><!-- 로그인 전엔 member메뉴가 보이지 않도록 설정 -->
      
      <li class="nav-heading">Member</li>

		<c:if test="${openState!=null}"><!-- 입점신청 전엔 open/close 버튼이 보이지 않도록 설정-->
		      <li class="nav-item" style="cursor: pointer;">
		        <a class="nav-link collapsed openControl" onclick="">
		        	<c:choose>
		        		<c:when test="${openState eq 1}">
		        			<i class="bi bi-toggle-on" style="color: #e05c87"></i>
		        		</c:when>
		        		<c:otherwise>
		        		 	<i class="bi bi-toggle-off" style="color: #899bbd"></i>
		        		</c:otherwise>
		        	</c:choose>
		          <span>Open/Close</span>
		        </a>
		      </li><!-- End F.A.Q Page Nav -->
		</c:if>

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/owner/check"> <!-- 정보수정이니까 update로 -->
          <i class="bi bi-person"></i>
          <span>정보수정</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" onclick="logout();">
          <i class="bi bi-box-arrow-right"></i>
          <span>Log Out</span>
        </a>
      </li><!-- End Contact Page Nav -->
	</c:if>
      <!-- End Blank Page Nav -->
    </ul>

  </aside><!-- End Sidebar-->
  
  <script>
function logout() {
// 	if(${sessionScope.member.openState} == 1) {
// 		alert("마감 후 새로고침해주세요.");
// 		return;
// 	}
	
	location.href="${pageContext.request.contextPath}/owner/logout"
}
  
  </script>
  
