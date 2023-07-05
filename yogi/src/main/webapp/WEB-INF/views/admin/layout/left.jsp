<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between" >
      <a href="${pageContext.request.contextPath}/admin" class="logo d-flex align-items-center">
        <img src="${pageContext.request.contextPath}/resources/logoImg/admin.png" class="img-fluid" alt="" >
      </a>
    </div><!-- End Logo -->
    

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <span class="d-none d-md-block dropdown-toggle ps-2"><i class="fa-brands fa-monero"></i>&nbsp;요리조리요 관리자</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>관리자</h6>
              <span>요리조리요</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/home/home">
                <i class="bi bi-person"></i>
                <span>요리조리요 메인</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/member/logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그아웃</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->









  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin">
          <i class="bi bi-grid"></i>
          <span>Home</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" href="${pageContext.request.contextPath}/admin/resManage/main">
          <i class="bi bi-menu-button-wide"></i><span>업체 관리</span>
        </a>
        
        <!-- 
		<i class="bi bi-chevron-down ms-auto"></i>

        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/admin/resManage/main">
              <i class="bi bi-circle"></i><span>업체 리스트</span>
            </a>
          </li>
        </ul>
         -->
         
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" href="${pageContext.request.contextPath}/admin/store/storeList">
          <i class="bi bi-journal-text"></i><span>입점 관리</span>
        </a>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" href="${pageContext.request.contextPath}/admin/memberManage/list">
          <i class="bi bi-layout-text-window-reverse"></i><span>회원관리</span>
        </a>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" href="${pageContext.request.contextPath}/admin/report/list">
          <i class="bi bi-bar-chart"></i><span>신고관리</span>
        </a>
      </li><!-- End Charts Nav -->


      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/notice/list">
          <i class="bi bi-person"></i>
          <span>공지사항</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/faq/list">
          <i class="bi bi-question-circle"></i>
          <span>1:1문의</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->
      
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/eventManage/all/list">
          <i class="ri-cake-2-fill"></i>
          <span>이벤트</span>
        </a>
      </li><!-- End Event Page Nav -->
    </ul>

  </aside><!-- End Sidebar-->

