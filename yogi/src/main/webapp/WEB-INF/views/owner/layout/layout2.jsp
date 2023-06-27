<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 
  <title><tiles:insertAttribute name="title"/></title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/template/img/hamburger.png" rel="icon" type="image/x-icon">
  <link href="${pageContext.request.contextPath}/resources/template/img/hamburger.png" rel="hamburger">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/template/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
    
</head>

<style type="text/css">
body {
	background: #fafafa;
}

@font-face {
    font-family: 'Jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	
</style>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,	// 메소드(get, post, put, delete)
		url:url,		// 요청받을 서버주소 
		data:query,		// 서버에 전송할 파라미터 
		dataType:dataType,	// 서버에서 응답할 형식(json, xml, text)
		success:function(data){
			fn(data);
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);	// 사용자 정의 헤더
		},
		error:function(jqXHR){
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

$(function() {
	$(".openControl").click(function() {
		const $i = $(this).find('i');
		console.log($i.hasClass('bi-toggle-off'));
		console.log(window.location.pathname);
		
		let isClose = $i.hasClass('bi-toggle-off');
		let msg = isClose ? "오픈하시겠습니까 ?" : "마감하시겠습니까 ?"; 
		
		if(! confirm(msg)) {
			return false; 
		}
		
		let url = "${pageContext.request.contextPath}/owner/openControl";
		let query = "isClose=" + isClose;
		
		const fn = function(data) {
			let state = data.state;
			if(state === "open") {
				$i.removeClass("bi-toggle-off");
				$i.addClass("bi-toggle-on");
				$i.css("color", "#e05c87");
				
			} else if (state === "close") {
				$i.removeClass("bi-toggle-on");
				$i.addClass("bi-toggle-off");
				$i.css("color", "#899bbd");
			}
		};
		
		ajaxFun(url, "get", query, "json", fn);
		
	});
});

</script>

<body>

<tiles:insertAttribute name="header"/>
 
<tiles:insertAttribute name="body" />
<!-- ignore="ignore" -->

<tiles:insertAttribute name="footer"/>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/chart.umd.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/quill/quill.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/template/js/main.js"></script>

</body>

</html>