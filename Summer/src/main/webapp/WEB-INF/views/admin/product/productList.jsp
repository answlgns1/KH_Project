<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품관리</title>
	<style>
		#pList, #addProduct, #ioList {
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
		
		#pList:hover , #addProduct:hover, #ioList:hover {
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
		
		.pd1:hover {
			background : #b0daea;
			border : 1px solid black;
			cursor : pointer;
		}
		
		.pd1 img {
			width : 80px;
		}
		
		#pHead {
			background:#e2e2e2;
			padding:10px 0 10px 0;
			border-top : 1px solid black;
			border-bottom:1px solid black;
		}
		
		#pHead>div {
			font-size : 15px;
			font-weight : bold;
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
					<h1><i class="shortcut-icon icon-shopping-cart"></i> 상품관리</h1>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="span8 offset2" style="text-align:center;">
					<button type="button" id="pList">상품목록</button>
					<button type="button" id="addProduct">상품등록</button>
					<button type="button" id="ioList">입출고관리</button>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="span12" id="oListBox">
					<div class="row" style="padding:10px 0 10px 0;">
						<div class="span12" style="padding-left:5%;">
							<div class="btn-group">
							  <a class="btn dropdown-toggle" data-toggle="dropdown" style="width:100px;">
							  	정렬 <span class="caret" style="float:right;"></span>
							  </a>
							  <ul class="dropdown-menu">
							    <li><a href="${pageContext.request.contextPath}/admin/selectProductList.do?sort=all">전체</a></li>
							  	<li><a href="${pageContext.request.contextPath}/admin/selectProductList.do?sort=top">상의</a></li>
							  	<li><a href="${pageContext.request.contextPath}/admin/selectProductList.do?sort=pants">하의</a></li>
							  	<li><a href="${pageContext.request.contextPath}/admin/selectProductList.do?sort=outer">아우터</a></li>
							  </ul>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="span12" id="pHead">
							<div class="span2" style="text-align:center;">
								상품이미지
							</div>
							<div class="span2" style="text-align:center;">
								상품명
							</div>
							<div class="span1" style="text-align:center;">
								상품분류
							</div>
							<div class="span3" style="text-align:center;">
								상품설명
							</div>
							<div class="span1" style="text-align:center;">
								상품금액
							</div>
							<div class="span2" style="text-align:center;">
								보유재고
							</div>
						</div>
					</div>
					<c:if test="${ !empty products }">
						<div class="accordion" id="accordion2">
						<c:forEach items="${ products }" var="p">
							<div class="row pd1" onclick="fn_pDetail(${p.PCODE});">
								<div class="span12" style="padding:10px 0 10px 0; border-bottom : 1px solid grey;">
									<div class="span2" style="text-align:center;">
										<img src="${pageContext.request.contextPath}${p.FILEPATH}${p.NEWFILENAME}"/>
									</div>
									<div class="span2" style="text-align:center; margin-top:3%;">
										${ p.PNAME }
									</div>
									<div class="span1" style="text-align:center; margin-top:3%;">
										<c:if test="${ p.LCNO == 1 }">상의</c:if>
										<c:if test="${ p.LCNO == 2 }">하의</c:if>
										<c:if test="${ p.LCNO == 3 }">아우터</c:if>
									</div>
									<div class="span3" style="text-align:center; margin-top:3%;">
										${ p.PDESCRIPTION }
									</div>
									<div class="span1" style="text-align:center; margin-top:3%;">
										<fmt:formatNumber value="${ p.PPRICE }" pattern="#,###"/> 원
									</div>
									<div class="span2" style="text-align:center; margin-top:3%;">
										${ p.PSTOCK } 개
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
					<c:if test="${ empty products }">
						<div class="row">
							<div class="span12" style="text-align:center; margin:30px">
								<h2>상품정보가 존재하지 않습니다.</h2>
							</div>
						</div>
					</c:if>
					
					
					<!-- 검색 시작 -->
					<div class="row">
						<div class="span12" style="text-align:center;">
							<form action="${pageContext.request.contextPath}/admin/selectProductSearch.do" id="Search">
								<select name="searchCt" class="btn" style="border-radius:10px; width:100px; height:35px;">
									<option value="all" style="background: white; color : black;">전체</option>
									<option value="pname" style="background: white; color : black;">상품명</option>
									<option value="pcontents" style="background: white; color : black;">상품설명</option>
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
			var navBtn = $('#admin_store');
			var otherBtn = $('#admin_main');
			$(otherBtn).removeClass("active");
			$(navBtn).addClass("active");
	    });

		$('#pList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/selectProductList.do";
		});

		$('#addProduct').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/insertProduct.do";
		});

		$('#ioList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/manageIO.do";
		});

		$('#search').keydown(function(e) {
			if(e.keyCode == 13) {
				$('#Search').submit();
			}
		});

		function fn_pDetail(pcode) {
			location.href="${pageContext.request.contextPath}/admin/selectProductDetail.do?pcode="+pcode;
		};
	</script>
</body>
</html>