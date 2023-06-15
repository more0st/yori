<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요기요</title>
<style type="text/css">
.whole-container {
   min-height: 800px;
   background: #fafafa;
}

.tablediv{
   width: 800px;
   margin: 30px auto;
}

.backPage{
   display: flex;
   justify-content: left;
   gap:10px;
}

.right{
   width: 500px;
   text-align: right;
}

</style>
</head>
<body style="padding: 0;">
<div class="whole-container">
   <header>   
      <jsp:include page="/WEB-INF/views/fragment/header.jsp"/>
   </header>
   
   <!-- 메뉴 -->
   <jsp:include page="/WEB-INF/views/mypage/mymenu.jsp"/>
   
      <div class="tablediv">
      <div class="backPage">
         <button type="button" class="btn btn-secondary left" onclick="location.href='${pageContext.request.contextPath}/mypage/orderList';">목록으로</button>
      </div>
      <br>
      
      <table class="table">
         <tr class="table-secondary border">
            <th>주문번호 : 12341234</th>
            <td class="right">2023년 06월 14일 (수) 16:00</td>
         </tr>
         
         <tr class="border">
            <th >상훈이네 족발집</th>
         </tr>
         
         <!-- forEach -->
         <tr class="border" >
         <th>족발(대)</th>
         <th class="right">50,000원</th>

         </tr>
         <tr class="border" >
            <!-- forEach -->
            <td>
               - 옵션1 : 고기추가 (+30,000원)<br>
            </td>
            <!-- /forEach -->   
         </tr>
         <!-- /forEach -->
         
         <tr class="border">
            <th>전체금액</th>
            <th class="right">150,000원</th>
         </tr>

         <tr class="border">
            <th>결제방법</th>
            <td class="right">카카오페이</td>
         </tr>
         


      </table>
   </div>   
   
</div>
<footer>
   <jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>      
</footer>
</body>
</html>