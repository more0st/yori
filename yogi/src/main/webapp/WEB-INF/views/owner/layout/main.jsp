<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<style>
  .whole-container {
    min-height: 800px;
    padding-bottom: 20px;
    background: #fafafa;
  }

  .home-container {
    width: 1100px;
    background: white;
    border-radius: 10px;
    min-height: 300px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #d9d9d9;
  }

  .list-title {
    font-weight: bold;
    font-size: 18px;
    display: flex;
    align-items: center;
    width: 180px;
    border-bottom: 3px solid #333;
    padding-left: 10px;
  }

  .saleCnt {
    width: 30%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    height: 100px;
    padding: 20px;
    border: 1px solid #d9d9d9;
    color: #333;
    font-size: 20px;
    font-weight: bold;
  }

  .chart40 {
    width: 39%;
    align-items: center;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    min-height: 100px;
    padding: 20px;
    border: 1px solid #d9d9d9;
    color: #333;
  }
  
  .chart60 {
    width: 60%;
    align-items: center;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    min-height: 100px;
    padding: 20px;
    border: 1px solid #d9d9d9;
    color: #333;
  }

  .saleCount {
    color: #fa0050;
  }

  .flexdiv {
    display: flex;
    justify-content: space-between;
  }

  .linkpage {
    cursor: pointer;
  }

  .list-table {
    width: 100%;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    margin-bottom: 20px;
  }

  .list-table th {
    padding: 10px;
    background: #fafafa;
    color: #333;
    border-top: 1.5px solid #d9d9d9;
    border-bottom: 1.5px solid #d9d9d9;
  }

  .list-table td {
    padding: 10px;
    background: white;
    border-bottom: 1px solid black;
    font-size: 13px;
  }

</style>

<main id="main" class="main">
  <div class="whole-container">
    <div class="home-container shadow">
      <div class="list-title" style="margin-bottom: 20px; width: 220px;">
        HOME
      </div>
      <div class="flexdiv">
        <div class="saleCnt">
          <div>오늘의 주문건수</div>
          <div><span class="saleCount">${todayOrder}</span>&nbsp;회</div>
        </div>
        <div class="saleCnt">
          <div>오늘의 매출</div>
          <div style="color: #fa0050;"><fmt:formatNumber value="${todayOrderSum}" type="currency"/></div>
        </div>
        <div class="saleCnt">
          <div>
            리뷰 평점
          </div>
          <div class="saleCount">${reviewAvg}</div>
        </div>
      </div>
      <div class="flexdiv" style="margin-top: 20px;">
        <div class="chart40">
          <div class="list-title" style="margin-bottom: 20px; width: 180px;">
            최근 주문 내역&nbsp;&nbsp;<div class="linkpage" onclick="location.href='${pageContext.request.contextPath}/owner/order/orderList';"><i class="fa-solid fa-arrow-up-right-from-square"></i></div>
          </div>
          <div>
            <table class="list-table" style="width: 100%; text-align: center;">
              <tr style="font-weight: bold; background: #fafafa">
                <th>
                  번호
                </th>
                <th>
                  주문한 회원
                </th>
                <th>
                  주문 시간
                </th>
                <th>
                  가격
                </th>
              </tr>
              <c:forEach var="sale" items="${recentlist}" varStatus="status">
                <tr>
                  <td>
                    ${status.count}
                  </td>
                  <td>
                    ${sale.nickName}
                  </td>
                  <td>
                    ${sale.order_date}
                  </td>
                  <td>
                    <fmt:formatNumber value="${sale.total_price}" type="currency"/>
                  </td>
                </tr>
              </c:forEach>
            </table>
          </div>
        </div>
        <div class="chart60">
          <div class="list-title" style="margin-bottom: 20px; width: 180px;">
            월별 매출&nbsp;&nbsp;<div class="linkpage" onclick="location.href='${pageContext.request.contextPath}/owner/sale/saleTime';"><i class="fa-solid fa-arrow-up-right-from-square"></i></div>
          </div>
          <div class="col p-2">
            <div class="charts-dayOfWeek border rounded" id="charts" style="height: 500px;"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.2/echarts.min.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    var chartDom = document.querySelector('#charts');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'cross',
          crossStyle: {
            color: '#999'
          }
        }
      },
      toolbox: {
        feature: {
          dataView: { show: true, readOnly: false },
          magicType:{ show: true, type: ['line', 'bar'] },
          restore: { show: true },
          saveAsImage: { show: true }
        }
      },
      legend: {
        data: ['Evaporation', '월별 매출', '주문 건수']
      },
      xAxis: [
        {
          type: 'category',
          data: ['2월', '3월', '4월', '5월', '6월', '7월'],
          axisPointer: {
            type: 'shadow'
          }
        }
      ],
      yAxis: [
        {
          type: 'value',
          name: '월별 매출',
          min: 0,
          max: 12000000,
          interval: 1000000,
          axisLabel: {
            formatter: '{value} 원'
          }
        },
        {
          type: 'value',
          name: '월별 주문 건수',
          min: 0,
          max: 600,
          interval: 100,
          axisLabel: {
            formatter: '{value} 건'
          }
        }
      ],
      series: [
        {
          name: '월별 매출',
          type: 'bar',
          itemStyle: {  
            color: '#5F9EA0'
          },
          tooltip: {
            valueFormatter: function (value) {
              return value + ' 원';
            }
          },
          data: [9400000, 10200000, 8850000, 10530000, 10110000, 9880000]
        },
        {
          name: '주문 건수',
          type: 'line',
          yAxisIndex: 1,
          itemStyle: { 
            color: '#FA0050'
          },
          tooltip: {
            valueFormatter: function (value) {
              return value + ' 건';
            }
          },
          data: [500, 512, 492, 566, 544, 508]
        }
      ]
    };

    myChart.setOption(option);
  });
</script>
