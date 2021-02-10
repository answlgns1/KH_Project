<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="lookbook" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - MyPage</title>
	<meta charset="utf-8">
    <style>
    
    	#em {
    		height : 150px;
    		font-size : 20px;
    		padding-top : 60px;
    	}
    
    	#myMenu6 {
    		background : #88c8bc;
    		color : white;
    	}
    	
    
    </style>
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		<c:import url="/WEB-INF/views/user/myPage/myPageMenu.jsp"/>

			<div class="row row-pb-lg justify-content-md-center">
				<div class="col-md-11" style="border-bottom : 3px solid #88c8bc;">
					<h2 style="text-align:center;">좋아요 목록</h2>
				</div>
			</div>
			<p style="font-size:16px; margin-left:3%;">${ msg }</p>
			<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="product-name d-flex">
							<div class="col-md-2 text-center">
								<span>게시글 번호</span>
							</div>
							<div class="col-md-6 text-center">
								<span>게시글 제목</span>
							</div>
							<div class="col-md-2 text-center">
								<span>작성자</span>
							</div>
							<div class="col-md-2 text-center">
								<span>좋아요 날짜</span>
							</div>
						</div>
						<c:choose>
							<c:when test="${ empty likeList }">
								<div class="product-cart d-flex">
									<div class="col text-center" id="em">
										좋아요가 없습니다.
									</div>
								</div>
							</c:when>
							<c:when test="${ !empty likeList }">
								<c:forEach items="${ likeList }" var="like">
									<div class="product-cart d-flex">
										<div class="col-md-2 text-center">
											<div class="display-tc">
												<h3>${ like.BNO }</h3>
											</div>
										</div>
										<div class="col-md-6 text-center" style="border-left:1px solid #E2E2E2;">
											<div class="display-tc">
												<span>${ like.BTITLE }</span>
											</div>
										</div>
										<div class="col-md-2 text-center" style="border-left:1px solid #E2E2E2;">
											<div class="display-tc">
												<span class="price">${ like.USERID }</span>
											</div>
										</div>
										<div class="col-md-2 text-center" style="border-left:1px solid #E2E2E2;">
											<div class="display-tc">
												<c:set var="lDate" value="${ like.LDATE }"/>
												<span>${ fn:substring(lDate, 0, 10) }</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
				<!-- 페이징 처리 시작-->
				<div class="row justify-content-md-center">
					<div class="col-md-12 text-center">
						<div class="block-27">
							<c:out value="${pageBar}" escapeXml="false"/>
		            	</div>
					</div>
				</div>
				<!-- 페이징 처리 끝-->
				
				
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>

	
	</body>
</html>

