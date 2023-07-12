<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요리조리요</title>

<link href="${pageContext.request.contextPath}/resources/template/img/hamburger.png" rel="icon" type="image/x-icon">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.0/css/all.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

  <!-- 페이징처리 js -->
  <script src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>


<style type="text/css">
@font-face {
    font-family: 'Jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

</head>
<body>

<tiles:insertAttribute name="header"/>
 
<tiles:insertAttribute name="body" ignore="true"/>

<tiles:insertAttribute name="footer"/>

</body>
</html>