<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="${ requestScope.selectMenu }"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/icomoon.css">
	<!-- Ion Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/ionicons.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/bootstrap.min.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/style.css">

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/user/js/jquery.min.js"></script>
	<!-- popper -->
	<script src="${pageContext.request.contextPath}/resources/user/js/popper.min.js"></script>
	<!-- bootstrap 4.1 -->
	<script src="${pageContext.request.contextPath}/resources/user/js/bootstrap.min.js"></script>
	<!-- jQuery easing -->
	<script src="${pageContext.request.contextPath}/resources/user/js/jquery.easing.1.3.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/resources/user/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="${pageContext.request.contextPath}/resources/user/js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="${pageContext.request.contextPath}/resources/user/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/resources/user/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="${pageContext.request.contextPath}/resources/user/js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="${pageContext.request.contextPath}/resources/user/js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="${pageContext.request.contextPath}/resources/user/js/main.js"></script>

	<style>
		
		body * {
			font-family: 'Open Sans';
		}
		
		.thema {
			background : #88c8bc;
			border : #88c8bc;
		}
		
	</style>
	</head>
	<body>
	<header>
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<!-- 로고 시작 -->
						<div class="col-sm-7 col-md-9">
							<div id="colorlib-logo">
								<img src="${pageContext.request.contextPath}/resources/user/images/logo1.jpg" id="logoImg" width="100px;"/>
								<a href="${pageContext.request.contextPath}">Summer</a>
							</div>
						</div>
						<!-- 로고 끝 -->
						<!-- 검색 시작 -->
						<div class="col-sm-5 col-md-3">
							<form action="#" class="search-wrap">
								<div class="form-group">
									<input type="search" class="form-control search" placeholder="Search">
									<button class="btn btn-primary submit-search text-center" type="submit"><i class="icon-search"></i></button>
								</div>
							</form>
						</div>
						<!-- 검색 끝 -->
					</div>
					
					<div class="row">
						<!-- 메뉴 시작 -->
						<div class="col-sm-12 text-left menu-1">
							<ul>
								<li id="navHome" class=${ selectMenu eq null ? "'active'" : "" }><a href="${pageContext.request.contextPath}">Home</a></li>
								<li id="navStore" class=${ selectMenu ne null and selectMenu eq "store" ? "'has-dropdown active'" : "'has-dropdown'" }>
									<a href="${pageContext.request.contextPath}/store/selectStoreMain.do">STORE</a>
									<ul class="dropdown">
										<li><a href="product-detail.html">Best</a></li>
										<li><a href="cart.html">New</a></li>
										<li><a href="checkout.html">Top</a></li>
										<li><a href="order-complete.html">Pants</a></li>
										<li><a href="add-to-wishlist.html">Outer</a></li>
									</ul>
								</li>
								<li id="navLookBook" class=${ selectMenu ne null and selectMenu eq "lookbook" ? "'has-dropdown active'" : "'has-dropdown'" }><a href="${pageContext.request.contextPath}/lookbook/selectLookbookList.do">LOOKBOOK</a></li>
								<li id="navCommunity" class=${ selectMenu ne null and selectMenu eq "community" ? "'has-dropdown active'" : "'has-dropdown'" }>
									<a href="${pageContext.request.contextPath}/community/selectCommunityMain.do">COMMUNITY</a>
									<ul class="dropdown">
										<li><a href="${pageContext.request.contextPath}/community/selectFreeList.do">Free</a></li>
										<li><a href="${pageContext.request.contextPath}/community/selectTradeList.do"">Trade</a></li>
										<li><a href="${pageContext.request.contextPath}/community/noticeList.do">Notice</a></li>
										<c:if test="${ member.membership eq 'A' }">
											<li><a href="${pageContext.request.contextPath}/admin/selectAdminMain.do">Admin</a></li>
										</c:if>
									</ul>
								</li>
	
								<li id="navCS" class=${ selectMenu ne null and selectMenu eq "cs" ? "'has-dropdown active'" : "'has-dropdown'" }><a href="${pageContext.request.contextPath}/service/inquiryBoard.do">SERVICE</a>
									<ul class="dropdown">
										<li><a href="${pageContext.request.contextPath}/service/frequentlyAskQuestion.do">FAQ</a></li>
										<li><a href="${pageContext.request.contextPath}/service/inquiryBoard.do">Inquiry</a></li>
									</ul>
								</li>
								
								<c:if test="${empty member}">
									<li style="float : right;"><a href="#" data-toggle="modal" data-target="#loginModal">login</a></li>
									<li style="float : right;"><a href="${pageContext.request.contextPath}/member/memberEnroll.do">Join</a></li>
								</c:if>
								<c:if test="${!empty member}">
									<li style="float : right;"><a href="${pageContext.request.contextPath}/member/memberLogout.do">logout</a></li>
									<li style="float : right;" class=${ selectMenu ne null and selectMenu eq "mypage" ? "'has-dropdown active'" : "'has-dropdown'" }><a href="${pageContext.request.contextPath}/myPage/myPageCart.do?userId=${member.userId}">${member.nickName}님</a></li>
								</c:if>
							</ul>
						</div> 
						<!-- 메뉴 끝 -->
					</div>
				</div>
			</div>
			<div class="sale">
				<!-- <div class="container">
					<div class="row">
						<div class="col-sm-8 offset-sm-2 text-center">
							<div class="row">
								<div class="owl-carousel2">
									<div class="item">
										<div class="col">
											<h3><a href="#">25% off (Almost) Everything! Use Code: Summer Sale</a></h3>
										</div>
									</div>
									<div class="item">
										<div class="col">
											<h3><a href="#">Our biggest sale yet 50% off all summer shoes</a></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> -->
			</div>
		</nav>
	</header>

	<!-- Modal시작 -->
	<!-- https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!--로그인폼 -->
				<!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
				<form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
					<div class="modal-body">
						<input type="text" class="form-control" name="userId" placeholder="아이디" required>
						<br />
						<input type="password" class="form-control" name="password" placeholder="비밀번호" required>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="fn_find();" class="btn btn-primary thema" >아이디 / 비밀번호 찾기</button>
						<button type="submit" class="btn btn-primary thema" >로그인</button>
						<button type="button" class="btn btn-primary thema" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal 끝-->

	<!-- 사이드바 시작 -->
	<div>
		
	</div>
	<!-- 사이드바 끝 -->
	
	<!-- 화면 상단으로 이동 -->
	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
	</div>
	
	</body>
	
	<script>
		function fn_find() {
			location.href="${pageContext.request.contextPath}/member/findInfo.do";
		}

		$('#logoImg').on('click', function(){
			location.href="${pageContext.request.contextPath}/";
		});
	</script>
</html>

