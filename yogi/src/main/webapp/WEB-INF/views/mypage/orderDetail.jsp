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
            <th>주문번호 : ${detailList2.orderNum} </th>
            <td class="right">${detailList2.order_date}</td>
         </tr>
         
         <tr class="border">
            <th >${detailList2.restaurantName}</th>
         </tr>
         <c:forEach var="vo" items="${detailList}">
         <tr class="border" >
	         <td>${vo.menu}, ${vo.optionName} </td>
	         <td class="right">${vo.option_price}</td>
         </tr>
         </c:forEach>
      

        
	</table>
	
    <table class="table">    
         <tr class="table-secondary border">
            <th colspan="2">결제정보</th>
         </tr>    
         
         <!-- /forEach -->
         <tr class="border">
            <td>전체금액</td>
            <td class="right">${detailList2.pay_price}</td>
         </tr>

         <tr class="border">
            <th>결제방법</th>
            <td class="right">${detailList2.payMethod}</td>
         </tr>
      </table>
    <table class="table">    
         <tr class="table-secondary border">
            <th colspan="2">배달정보</th>
         </tr>    
         
         <!-- /forEach -->
         <tr class="border">
            <td>배달주소</td>
            <td class="right">${detailList2.addr1}, ${detailList2.addr2}</td>
         </tr>

         <tr class="border">
            <td>전화번호</td>
            <td class="right">${detailList2.tel}</td>
         </tr>
         
          <tr class="border">
            <td>요청사항</td>
            <td class="right">${detailList2.memo}</td>
         </tr>
         
      </table>
   </div>   
   
</div>