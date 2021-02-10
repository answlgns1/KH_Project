<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="store" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - STORE</title>
	<meta charset="utf-8">
	</head>
	<body>	
	<div class="colorlib-loader"></div>
	<div id="page">
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		<!-- 상단 페이지 정보 -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>Store</span></p>
					</div>
				</div>
				<h1>Store</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		<div class="breadcrumbs-two">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="breadcrumbs-img" style="background-image: url(${pageContext.request.contextPath}/resources/user/images/store-1.jpg);height:500px">
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="colorlib-featured">
			<div class="container">
				<div class="row">
					<div class="col-sm-4 text-center">
						<div class="featured">
							<div class="featured-img featured-img-2" style="background-image: url(${pageContext.request.contextPath}/resources/user/images/top.jpg);">
								<h2>TOP</h2>
								<p><a href="${pageContext.request.contextPath}/store/selectStoreTop.do" class="btn btn-primary btn-lg">Shop now</a></p>
								
							</div>
						</div>
					</div>
					<div class="col-sm-4 text-center">
						<div class="featured">
							<div class="featured-img featured-img-2" style="background-image: url(${pageContext.request.contextPath}/resources/user/images/pants.jpg);">
								<h2>PANTS</h2>
								<p><a href="${pageContext.request.contextPath}/store/selectStorePants.do" class="btn btn-primary btn-lg">Shop now</a></p>
							</div>
						</div>
					</div>
					<div class="col-sm-4 text-center">
						<div class="featured">
							<div class="featured-img featured-img-2" style="background-image: url(${pageContext.request.contextPath}/resources/user/images/outer.jpg);">
								<h2>OUTER</h2>
								<p><a href="${pageContext.request.contextPath}/store/selectStoreOuter.do" class="btn btn-primary btn-lg">Shop now</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="colorlib-product">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
						<h2>BEST ITEMS</h2>
					</div>
				</div>
				<div class="row row-pb-md">
				<c:forEach items="${list}" var="b" begin="0" end="11"> 
				<div class="col-md-3 col-lg-3 mb-4 text-center main" id="${ b.BNO }">
					<div class="product-entry border" id="${b.BNO}">
						<img src="${pageContext.request.contextPath}${ b.FILEPATH }${ b.NEWFILENAME }" class="img-fluid" alt="Free html5 bootstrap 4 template">
						<div class="desc">
							<h2>${b.BTITLE}</h2>
							<div class="desc_price">
								￦${b.PPRICE}원
							</div>
							<div class="desc_like">
								<i class="icon-heart" aria-hidden="true"></i>${b.BLIKE} &nbsp;
								<i class="icon-eye" aria-hidden="true"></i>${b.VIEWS} 
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	</div>
	
	<script>
		$(function(){
			$(".main").on("click",function(){
				var storeNo = $(this).attr("id");
				var userId = '${member.userId}';
				console.log("storeNo="+storeNo);
				location.href = "${pageContext.request.contextPath}/store/storeDetail.do?no="+storeNo+"&Id="+userId;
			});
		});

		
	</script>
	
	</body>
</html>

