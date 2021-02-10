<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="community" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - COMMUNITY</title>
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
						<p class="bread"><span><a href="${pageContext.request.contextPath}/community/selectCommunityMain.do">Community</a></span> / <span>Main</span></p>
					</div>
				</div>
				<h1>Community</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>

		<div class="colorlib-product" style="margin-top:-80px;">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col-md-6 text-center">
						<!-- 게시판 -->
						<table id="tbl-board" class="table table-hover table-striped">
							<tr style="background : #88c8bc; border : #88c8bc;">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>첨부파일</th>
								<th>조회수</th>
							</tr>
							<c:forEach items="${list}" var="b"> 
							<tr id="${b.boardNo}">
								<td>${b.boardNo}</td>
								<td>${b.boardTitle}</td>
								<td>${b.boardWriter}</td>
								<td>${b.boardDate}</td>
								<td align="center">
									<c:if test="${b.fileCount>0}">
										<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
									</c:if><c:if test="${b.fileCount eq 0}">
										<i class="icon-large icon-file"></i>
									</c:if>
								</td>
								<td>${b.boardReadCount }</td>
							</tr>
							</c:forEach>
							
						</table>
					</div>
					<div class="col-md-6 text-center">
						<!-- 게시판 -->
						<table id="tbl-board" class="table table-hover table-striped">
							<tr style="background : #88c8bc; border : #88c8bc;">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>첨부파일</th>
								<th>조회수</th>
							</tr>
							<c:forEach items="${list}" var="b"> 
							<tr id="${b.boardNo}">
								<td>${b.boardNo}</td>
								<td>${b.boardTitle}</td>
								<td>${b.boardWriter}</td>
								<td>${b.boardDate}</td>
								<td align="center">
									<c:if test="${b.fileCount>0}">
										<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
									</c:if><c:if test="${b.fileCount eq 0}">
										<i class="icon-large icon-file"></i>
									</c:if>
								</td>
								<td>${b.boardReadCount }</td>
							</tr>
							</c:forEach>
							
						</table>
					</div>
				</div>
				<div class="row row-pb-md">
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-1.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-2.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Minam Meaghan</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-3.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Men's Taja Commissioner</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-4.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Russ Men's Sneakers</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="w-100"></div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-5.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-6.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-7.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-8.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="w-100"></div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-9.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-10.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-11.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-12.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="w-100"></div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-13.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-14.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-15.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/item-16.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="block-27">
		               <ul>
			               <li><a href="#"><i class="ion-ios-arrow-back"></i></a></li>
		                  <li class="active"><span>1</span></li>
		                  <li><a href="#">2</a></li>
		                  <li><a href="#">3</a></li>
		                  <li><a href="#">4</a></li>
		                  <li><a href="#">5</a></li>
		                  <li><a href="#"><i class="ion-ios-arrow-forward"></i></a></li>
		               </ul>
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

