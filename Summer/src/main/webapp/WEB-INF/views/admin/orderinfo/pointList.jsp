<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제/포인트관리</title>
	<style>
		#oList, #pList {
			width : 200px;
			height : 40px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 18px;
		}
		
		#pList {
			background : #88c8bc;
			color : white;
		}
		
		#oList:hover , #pList:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
		}
		
		#oListBox {
			border:1px solid black;
			border-radius : 0px 0px 30px 30px;
			background:white;
			box-shadow : 10px 10px 20px 5px grey;
		}
		
	</style>
</head>
<body>

<c:import url="../common/header.jsp"/>
<div class="main">
	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span12">
					<h1><i class="shortcut-icon icon-credit-card"></i> 결제/포인트관리</h1>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="span8 offset2" style="text-align:center;">
					<button type="button" id="oList">결제내역</button>
					<button type="button" id="pList">포인트내역</button>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="span12" id="oListBox">
					<div class="row">
						<div class="span12" style="background:#e2e2e2; padding:10px 0 10px 0; border-bottom:1px solid black;">
							<div class="span2" style="text-align:center;">
								포인트번호
							</div>
							<div class="span2" style="text-align:center;">
								아이디
							</div>
							<div class="span3" style="text-align:center;">
								내용
							</div>
							<div class="span1" style="text-align:center;">
								적립
							</div>
							<div class="span1" style="text-align:center;">
								사용
							</div>
							<div class="span2" style="text-align:center;">
								적립날짜
							</div>
						</div>
					</div>
					<c:if test="${ !empty points }">
						<div class="accordion" id="accordion2">
						<c:forEach items="${ points }" var="p">
							<div class="row accordian-group">
								<div class="span12" style="padding:10px 0 10px 0; border-bottom : 1px solid grey;">
									<div class="span2" style="text-align:center;">
										<span>${ p.POINTNO }</span>
									</div>
									<div class="span2" style="text-align:center;">
										${ p.USERID }
									</div>
									<div class="span3" style="text-align:center;">
										${ p.CONTENTS }
									</div>
									<div class="span1" style="text-align:center; color:green;">
										+ ${ p.EARN }
									</div>
									<div class="span1" style="text-align:center; color:red;">
										- ${ p.USE }
									</div>
									<div class="span2" style="text-align:center;">
										<c:set var="pDate" value="${ p.PDATE }"/>
										<span>${ fn:substring(pDate, 0, 10) }</span>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					<br>
					<!-- 페이징 처리 시작-->
					<div class="row" style="margin: 10px 0 20px 0;">
						<div class="span12">
							<div class="block-27" style="text-align:center;">
								<c:out value="${pageBar}" escapeXml="false"/>
					        </div>
						</div>
					</div>
					<!-- 페이징 처리 끝-->
					</c:if>
					<c:if test="${ empty points }">
						<div class="row">
							<div class="span12" style="text-align:center; margin:30px">
								<h2>포인트내역이 존재하지 않습니다.</h2>
							</div>
						</div>
					</c:if>
					
					
					<!-- 검색 시작 -->
					<div class="row">
						<div class="span12" style="text-align:center;">
							<form action="${pageContext.request.contextPath}/admin/selectPointSearch.do" id="Search">
								<select name="searchCt" class="btn" style="border-radius:10px; width:100px; height:35px;">
									<option value="all" style="background: white; color : black;">전체</option>
									<option value="id" style="background: white; color : black;">아이디</option>
									<option value="content" style="background: white; color : black;">내용</option>
								</select>
								<input type="search" id="search" name="search" placeholder="Search" style="border-radius: 30px; width:20%; height:26px; margin-top:8px;">
								<button class="btn" type="submit" style="border-radius:30px; height:35px; background:#88c8bc; color:white;"><i class="icon-search"></i></button>
							</form>
						</div>
					</div>
					<!-- 검색 끝 -->
				</div>
			</div>
			<!-- /row --> 
		</div>
		<!-- /container -->
		<br><br>
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
			var navBtn = $('#admin_pay');
			var otherBtn = $('#admin_main');
			$(otherBtn).removeClass("active");
			$(navBtn).addClass("active");
	    });

		$('#oList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/selectOrderList.do";
		});

		$('#pList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/selectPointList.do";
		});

		$('#search').keydown(function(e) {
			if(e.keyCode == 13) {
				$('#Search').submit();
			}
		});
	</script>
</body>
</html>