<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style type="text/css">
.whole-container {
   min-height: 800px;
   background: #fafafa;
}

.tablediv{
   width: 700px;
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


<div class="whole-container">
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
	         <td>족발(대)</td>
	         <td class="right">50,000원</td>
         </tr>

         <tr class="border" >
            <!-- forEach -->
            <td>- 옵션1 : 고기추가 (+30,000원) <br></td>
            <!-- /forEach -->   
         </tr>
	</table>
	
    <table class="table">    
         <tr class="table-secondary border">
            <th colspan="2">결제정보</th>
         </tr>    
         
         <!-- /forEach -->
         <tr class="border">
            <td>전체금액</td>
            <td class="right">150,000원</td>
         </tr>

         <tr class="border">
            <th>결제방법</th>
            <td class="right">카카오페이</td>
         </tr>
      </table>
      
    <table class="table">    
         <tr class="table-secondary border">
            <th colspan="2">배달정보</th>
         </tr>    
         
         <!-- /forEach -->
         <tr class="border">
            <td>배달주소</td>
            <td class="right">서울 강남구 역삼동 11-2 1203호</td>
         </tr>

         <tr class="border">
            <td>전화번호</td>
            <td class="right">010-1111-1111</td>
         </tr>
         
          <tr class="border">
            <td>요청사항</td>
            <td class="right">단무지 빼주세요.</td>
         </tr>
         
      </table>      
   </div>   
   
</div>