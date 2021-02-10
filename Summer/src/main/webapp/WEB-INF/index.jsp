<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer</title>
	<meta charset="utf-8">
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(${pageContext.request.contextPath}/resources/user/images/main1.jpg);">
			   		<div class="overlay"></div>
			   	</li>
			   	<li style="background-image: url(${pageContext.request.contextPath}/resources/user/images/main2.jpg);">
			   		<div class="overlay"></div>
			   	</li>
			   	<li style="background-image: url(${pageContext.request.contextPath}/resources/user/images/main3.jpg);">
			   		<div class="overlay"></div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
		<div class="colorlib-intro">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h2 class="intro">It started with a simple idea: Create quality, well-designed products that I wanted myself.</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="colorlib-product">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6 text-center">
						<div class="featured">
							<a href="#" class="featured-img" style="background-image: url(${pageContext.request.contextPath}/resources/user/images/123.jpg);"></a>
							<div class="desc">
								<h2><a href="#">Store</a></h2>
							</div>
						</div>
					</div>
					<div class="col-sm-6 text-center">
						<div class="featured">
							<a href="#" class="featured-img" style="background-image: url(${pageContext.request.contextPath}/resources/user/images/456.jpg);"></a>
							<div class="desc">
								<h2><a href="#">LookBook</a></h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="colorlib-partner">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
						<h2>Trusted Partners</h2>
					</div>
				</div>
				<div class="row">
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-1.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-2.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-3.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-4.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-5.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
				</div>
			</div>
		</div>

		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	</body>
</html>

