<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 상세조회</title>
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
		
		#btnGroup button {
			width : 200px;
			height : 38px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 17px;
		}
		
		#btnGroup button:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
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
					<p style="margin:2% 0% 0% 7%;">No.${ product.PCODE }</p>
					<div class="row" style="margin-left:1%;padding:3%;">
						<div class="span4" style="text-align:center;">
							<div style="padding:5px; border:2px solid grey; width:285px;">
								<img src="${pageContext.request.contextPath}${product.FILEPATH}${product.NEWFILENAME}" width="280px;"/>
							</div>
						</div>
						<div class="span6">
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품명
								</div>
								<div style="width:100%; font-size:14px; text-align:center; padding:2% 0% 2% 0%;">
									${ product.PNAME }
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품설명
								</div>
								<div style="width:100%; font-size:14px; text-align:center; padding:2% 0% 2% 0%;">
									${ product.PDESCRIPTION }
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									보유중인 상품수량
								</div>
								<div style="width:100%; font-size:14px; text-align:center; padding:2% 0% 2% 0%;">
									${ product.PSTOCK } 개
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품 가격
								</div>
								<div style="width:100%; font-size:14px; text-align:center; padding:2% 0% 2% 0%;">
									<fmt:formatNumber value="${ product.PPRICE }" pattern="#,###"/> 원
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="span10 offset1" style="text-align:center;">
							<div style="border:1px solid #e2e2e2; padding:1%; font-size:16px;">
								상품 이미지
							</div>
							<c:forEach items="${ attachment }" var="a">
								<img src="${pageContext.request.contextPath}${a.FILEPATH}${a.NEWFILENAME}" width="70%;" style="margin:1% 0% 1% 0%;"/>
							</c:forEach>
						</div>
					</div>
					<hr>
					<div class="row" style="margin:3% 0% 2% 0%;">
						<div class="span12" style="text-align:center;" id="btnGroup">
							<button type="button" class="btn" onclick="fn_update(${product.PCODE});">수정하기</button> &nbsp; &nbsp;
							<button type="button" class="btn" onclick="fn_goBack();">목록으로</button>
						</div>
					</div>
					<br>
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

		function fn_update(pcode) {
			if(confirm("수정하시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/admin/updateProduct.do?pcode="+pcode;
			}
		};

		function fn_goBack() {
			if(confirm("돌아가시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/admin/selectProductList.do";
			}
		};
	</script>
</body>
</html>