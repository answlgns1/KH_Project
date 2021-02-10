<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Summer - ADMIN</title>
<style>
	.widget-content img{
		width : 70px;
	}
	
	#hhhh div{
		font-weight : bold;
		font-size : 16px;
	}
	
	.stat:hover {
		cursor : pointer;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
	
<div class="main">
  <div class="main-inner">
    <div class="container">
    	<div class="row">
			<div class="span12">
				<h1><i class="shortcut-icon icon-align-left"></i> 통계</h1>
			</div>
		</div>
		<br>
   		<div class="row">
   			<div class="span12">
   				<div class="widget widget-nopad">
   					<div class="widget-header"> <i class="icon-dollar"></i>
              			<h3>월간 수익</h3>
            		</div>
            		<div class="widget-content">
		              <div class="widget big-stats-container">
		                <div class="widget-content">
		                  <h6 class="bigstats">통계 : 연도별 월간 수익률</h6>
		                  <div id="big_stats" class="cf">
		                    <canvas id="revenue" height="80"></canvas>
		                  </div>
		                </div>
		              </div>
		            </div>
   				</div>
   			</div>
   		</div>
      <div class="row">
        <div class="span5">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-shopping-cart"></i>
              <h3>상품별 판매량</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <h6 class="bigstats">통계 : 상품의 분류(상의, 하의, 아우터)별 판매량</h6>
                  <div id="big_stats" class="cf">
                    <canvas id="sell_pd" height="200"></canvas>
                  </div>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
        </div>
        <!-- /span6 -->
        <div class="span7">
          <div class="widget">
            <div class="widget-header"> <i class="icon-user"></i>
              <h3>회원 통계</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="span3" style="margin:0px 0px 50px 0px;">
              	<h6 class="bigstats">통계 : 성별 통계</h6>
              	<canvas id="user_gender" height="280"></canvas>
              </div>
              <div class="span3" style="margin:0px 0px 50px 40px;">
              	<h6 class="bigstats">통계 : 연령대별 통계</h6>
              	<canvas id="user_age" height="280"></canvas>
              </div>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
        </div>
        <!-- /span6 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<!-- /main -->
<div class="extra">
  <div class="extra-inner">
    <div class="container">
      <div class="row">
                    <div class="span3">
                        <h4>
                            About Free Admin Template</h4>
                        <ul>
                            <li><a href="javascript:;">EGrappler.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="">Open Source jQuery Plugins</a></li>
                            <li><a href="">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="">Free Contact Form Plugin</a></li>
                            <li><a href="">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /extra-inner --> 
</div>
<!-- /extra -->
<div class="footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>
<!-- /footer --> 

<script>
	$(function() {
		var navBtn = $('#admin_stats');
		var otherBtn = $('#admin_main');
		$(otherBtn).removeClass("active");
		$(navBtn).addClass("active");
	});
</script>


<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!------------------------------ 월간 수익 시작 --------------------------->
<script>
	var ctx = document.getElementById("revenue").getContext('2d');
	var data = {
	    type: 'line',
	    data: {
	        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	        datasets: [{
	            label: "2019년",
	            type : 'line',
	            backgroundColor: 'rgb(255, 99, 132)',
	            fill:false, // line의 아래쪽을 색칠할 것인가? 
	            borderColor: 'rgb(255, 99, 132)',
	            lineTension:0.1, // 값을 높이면, line의 장력이 커짐.
	            data: [
					<c:forEach items="${revenue19}" var="rv19">
						${rv19.TOTAL},
					</c:forEach>
		            ]
	        }, {
	            label: "2020년",
	            type : 'line',
	            backgroundColor: 'rgb(220, 50, 132)',
	            fill:false, // line의 아래쪽을 색칠할 것인가? 
	            borderColor: 'rgb(220, 50, 132)',
	            lineTension:0.1, // 값을 높이면, line의 장력이 커짐.
	            data: [
					<c:forEach items="${revenue20}" var="rv20">
						${rv20.TOTAL},
					</c:forEach>
		            ]
	        }, {
	            label: "2021년",
	            type : 'line',
	            backgroundColor: 'rgb(120, 200, 85)',
	            fill:false, // line의 아래쪽을 색칠할 것인가? 
	            borderColor: 'rgb(120, 200, 85)',
	            lineTension:0.1, // 값을 높이면, line의 장력이 커짐.
	            data: [
					<c:forEach items="${revenue21}" var="rv21">
						${rv21.TOTAL},
					</c:forEach>
		            ]
	        }]
	    },
	    options: {}
	}
	var chart = new Chart(ctx, data);
</script>
<!------------------------------ 월간 수익 끝 --------------------------->

<!------------------------------ 상품별 판매량 시작 --------------------------->
<script>
	var ctx = document.getElementById("sell_pd").getContext('2d');
	var data = {
	    type: 'doughnut',
	    data: {
	        labels: ["상의", "하의", "아우터"],
	        datasets: [{
	            label: ["상의", "하의", "아우터"],
	            backgroundColor: ['rgb(168, 216, 234)', 'rgb(252, 186, 211)', 'rgb(255, 255, 210)'],
	            borderColor: ['rgb(168, 216, 234)', 'rgb(252, 186, 211)', 'rgb(255, 255, 210)'],
	            data: [${sell_pd.top}, ${sell_pd.pants}, ${sell_pd.outer}]
	        }]
	    },
	    options: {}
	}
	var chart = new Chart(ctx, data);
</script>
<!------------------------------ 상품별 판매량 끝 --------------------------->

<!------------------------------ 성별 통계 시작 --------------------------->
<script>
	var ctx = document.getElementById("user_gender").getContext('2d');
	var data = {
	    type: 'pie',
	    data: {
	        labels: ["남성", "여성"],
	        datasets: [{
	            label: ["남성", "여성"],
	            backgroundColor: ['rgb(10, 222, 250)', 'rgb(250, 35, 145)'],
	            borderColor: ['rgb(10, 222, 250)', 'rgb(250, 35, 145)'],
	            data: [${user_gender.M}, ${user_gender.F}]
	        }]
	    },
	    options: {}
	}
	var chart = new Chart(ctx, data);
</script>
<!------------------------------ 성별 통계 끝 --------------------------->

<!------------------------------ 연령대별 통계 시작 --------------------------->
<script>
	var ctx = document.getElementById("user_age").getContext('2d');
	var data = {
	    type: 'bar',
	    data: {
	        labels: ["10대", "20대", "30대", "40대"],
	        datasets: [{
	            label: ["연령대별"],
	            backgroundColor: ['rgb(154, 211, 188)', 'rgb(243, 234, 194)', 'rgb(245, 180, 97)', 'rgb(236, 82, 75)'],
	            borderColor: ['rgb(154, 211, 188)', 'rgb(243, 234, 194)', 'rgb(245, 180, 97)', 'rgb(236, 82, 75)'],
	            data: [
		            	<c:forEach items="${user_age}" var="age">
							${age.CNT},
						</c:forEach>
		              ]
	        }]
	    },
	    options: {}
	}
	var chart = new Chart(ctx, data);
</script>
<!------------------------------ 연령대별 통계 끝 --------------------------->

</body>
</html>