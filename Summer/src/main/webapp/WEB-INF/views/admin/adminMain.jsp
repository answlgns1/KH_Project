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
        <div class="span6">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Stats</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <h6 class="bigstats">통계 : 유저수, 좋아요수, 상품수, 댓글수</h6>
                  <div id="big_stats" class="cf">
                    <div class="stat" id="stat_user"> <i class="icon-user"></i> <span class="value">${ userCount }</span> </div>
                    <!-- .stat -->
                    
                    <div class="stat" id="stat_like"> <i class="icon-thumbs-up-alt"></i> <span class="value">${ likeCount }</span> </div>
                    <!-- .stat -->
                    
                    <div class="stat" id="stat_product"> <i class="icon-shopping-cart"></i> <span class="value">${ productCount }</span> </div>
                    <!-- .stat -->
                    
                    <div class="stat" id="stat_comment"> <i class="icon-comment"></i> <span class="value">${ commentCount }</span> </div>
                    <!-- .stat --> 
                  </div>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
          <!-- /widget -->
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-calendar"></i>
              <h3> Recent News</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div id='calendar'>
              </div>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
        </div>
        <!-- /span6 -->
        <div class="span6">
          <div class="widget">
            <div class="widget-header"> <i class="icon-bookmark"></i>
              <h3>주요 기능</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="shortcuts">
              <a href="${pageContext.request.contextPath}/admin/selectProductList.do" class="shortcut"><i class="shortcut-icon icon-shopping-cart"></i>
              	<span class="shortcut-label">Product</span> </a>
              <a href="${pageContext.request.contextPath}/admin/selectMemberList.do" class="shortcut"><i class="shortcut-icon icon-user"></i>
              	<span class="shortcut-label">User</span> </a>
              <a href="${pageContext.request.contextPath}/admin/selectOrderList.do" class="shortcut"> <i class="shortcut-icon icon-credit-card"></i>
              	<span class="shortcut-label">Pay/Point</span> </a>
              <a href="${pageContext.request.contextPath}/admin/customerService/customerService.do" class="shortcut"><i class="shortcut-icon icon-question-sign"></i>
              	<span class="shortcut-label">CS</span> </a>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          <br>
          <div class="widget">
            <div class="widget-header"> <i class="icon-signal"></i>
              <h3> 최근 등록된 상품 5개</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
            	<div class="row" id="hhhh">
	            	<div class="span1" style="margin-top:25px; text-align:center;">
	            		사진
	            	</div>
	            	<div class="span1" style="margin-top:25px; text-align:center;">
	            		상품코드
	            	</div>
	            	<div class="span1" style="margin-top:25px; text-align:center;">
	            		상품이름
	            	</div>
	            	<div class="span1" style="margin-top:25px; text-align:center;">
	            		상품가격
	            	</div>
	            	<div class="span1" style="margin-top:25px; text-align:center;">
	            		상품수량
	            	</div>
            	</div>
            	<hr />
            	<c:forEach items="${ products }" var="p">
            		<div class="row">
            			<div class="span1">
            				<img src="${pageContext.request.contextPath}${p.FILEPATH}${p.NEWFILENAME}"/>
            			</div>
            			<div class="span1" style="margin-top:25px; text-align:center;">
            				${ p.PCODE }
            			</div>
            			<div class="span1" style="margin-top:25px; text-align:center;">
            				${ p.PNAME }
            			</div>
            			<div class="span1" style="margin-top:25px; text-align:center;">
            				${ p.PPRICE }
            			</div>
            			<div class="span1" style="margin-top:25px; text-align:center;">
            				${ p.PSTOCK }
            			</div>
            		</div>
            		<hr />
            	</c:forEach> 
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
	$('#stat_user').on('click', function() {
		location.href='${pageContext.request.contextPath}/admin/selectMemberList.do';
	});

	$('#stat_like').on('click', function() {
		location.href='${pageContext.request.contextPath}/admin/selectMemberList.do';
	});

	$('#stat_product').on('click', function() {
		location.href='${pageContext.request.contextPath}/admin/selectProductList.do';
	});

	$('#stat_comment').on('click', function() {
		location.href='${pageContext.request.contextPath}/admin/community/adminNoticeList.do';
	});
	
</script>

</body>
</html>