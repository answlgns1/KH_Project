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
    	
    	#deleteCart:hover {
    		cursor : pointer;
    	}
    	
    	#myMenu1 {
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

<!-- 마이페이지 장바구니 시작 -->
			<div class="row row-pb-lg justify-content-md-center">
				<div class="col-md-11" style="border-bottom : 3px solid #88c8bc;">
					<h2 style="text-align:center;">장바구니</h2>
				</div>
			</div>
			<div class="row row-pb-lg">
				<div class="col-md-10 offset-md-1">
					<div class="process-wrap">
						<div class="process text-center active">
							<p><span>01</span></p>
							<h3>Shopping Cart</h3>
						</div>
						<div class="process text-center">
							<p><span>02</span></p>
							<h3>Checkout</h3>
						</div>
						<div class="process text-center">
							<p><span>03</span></p>
							<h3>Order Complete</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="product-name d-flex">
							<div class="one-forth text-center">
								<span>상품 정보</span>
							</div>
							<div class="one-eight text-center">
								<span>가격</span>
							</div>
							<div class="one-eight text-center">
								<span>수량</span>
							</div>
							<div class="one-eight text-center">
								<span>총 금액</span>
							</div>
							<div class="one-eight text-center px-4">
								<span>삭제</span>
							</div>
						</div>
						<c:choose>
							<c:when test="${ empty c }">
								<div class="product-cart d-flex">
									<div class="col text-center" id="em">
										장바구니가 비었습니다.
									</div>
								</div>
							</c:when>
							<c:when test="${ !empty c }">
								<c:forEach items="${ c }" var="c">
									<div class="product-cart d-flex" id="Cart">
										<div class="one-forth">
											<div class="product-img" style="background-image: url(${pageContext.request.contextPath}${ c.FILEPATH }${ c.NEWFILENAME });">
											</div>
											<div class="display-tc">
												<h3>${ c.PNAME }</h3>
											</div>
										</div>
										<div class="one-eight text-center">
											<div class="display-tc">
												<span class="price"><fmt:formatNumber value="${ c.PPRICE }" pattern="#,###"/> 원</span>
											</div>
										</div>
										<div class="one-eight text-center">
											<div class="display-tc">
												<span>${ c.AMOUNT }</span>
											</div>
										</div>
										<div class="one-eight text-center">
											<div class="display-tc">
												<span class="price"><fmt:formatNumber value="${ c.PPRICE * c.AMOUNT }" pattern="#,###"/> 원</span>
											</div>
										</div>
										<div class="one-eight text-center">
											<div class="display-tc">
												<span class="closed" id="deleteCart" onclick="deleteCart(this, '${ c.CARTNO }')"></span>
											</div>
										</div>
									</div>
								</c:forEach>
							
							</c:when>
						</c:choose>
					<!-- 페이징 처리 시작-->
					<div class="row">
						<div class="col-md-12 text-center">
							<div class="block-27">
								<c:out value="${pageBar}" escapeXml="false"/>
			            	</div>
						</div>
					</div>
					<!-- 페이징 처리 끝-->
					</div>
					<div class="col" style="text-align:center;">
						<button type="button" class="btn btn-primary thema">결제페이지로 이동</button>
					</div>
				</div>
<!-- 마이페이지 장바구니 끝 -->
			
		</div>

		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	<script>
		function deleteCart(obj, cartNo) {
			if(confirm("정말 삭제하시겠습니까?") == true) {
				$.ajax({
					url : "${pageContext.request.contextPath}/myPage/cartDelete.do",
					data : {cartNo : cartNo},
					dataType : 'json',
					success : function(data) {
						if( data == true ) {
							alert("삭제되었습니다.");
							$(obj).parent().parent().parent().remove();
						} else {
							alert("삭제 실패!");
						}
					}
				})
			}
		}

	</script>
	
	</body>
</html>

