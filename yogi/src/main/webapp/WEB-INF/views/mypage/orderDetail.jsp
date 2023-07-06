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
         <button type="button" class="btn btn-secondary left" onclick="location.href='${pageContext.request.contextPath}/mypage/orderList?${query}';">목록으로</button>
      </div>
      <br>
    
      <table class="table">
         <tr class="table-secondary border">
            <th>주문번호 : ${detailList2.orderNum} </th>
            <td class="right">${detailList2.order_date}</td>
         </tr>
         
         <tr class="border">
            <th>${detailList2.restaurantName}</th>
         </tr>
         <c:set var="totalMenuPrice" value="0" />
         <c:forEach var="vo" items="${detailList}">
         <tr class="border" >
	         <td>${vo.menu}, ${vo.optionName} </td>
	         <td class="right"><fmt:formatNumber value="${vo.option_price}" pattern="#,###원"/></td>
         </tr>
         <c:set var="totalMenuPrice" value="${totalMenuPrice + vo.option_price}" />
         </c:forEach>
      

        
	</table>
	
    <table class="table">    
         <tr class="table-secondary border">
            <th colspan="2">결제정보</th>
         </tr>    
         

         <tr class="border">
            <td>결제방법</td>
            <td class="right">${detailList2.payMethod}</td>
         </tr>
         <tr class="border">
            <td>총 가격</td>
            <td class="right"><fmt:formatNumber value="${totalMenuPrice}" pattern="#,###원"/></td>
         </tr>
         <tr class="border">
            <td>배달팁</td>
            <td class="right"><fmt:formatNumber value="${detailList2.pay_price - totalMenuPrice + couponInfo.discount}" pattern="#,###원"/></td>
         </tr>
         <c:if test="${couponInfo.discount != null}">
         <tr class="border">
            <td>쿠폰</td>
            <td class="right"><fmt:formatNumber value="-${couponInfo.discount}" pattern="#,###원"/></td>
         </tr>
         </c:if>
         <tr class="border">
            <td>결제할 금액</td>
             <td class="right"><fmt:formatNumber value="${detailList2.pay_price}" pattern="#,###원"/></td>
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