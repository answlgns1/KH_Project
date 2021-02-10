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
    	
    	#myMenu2 {
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
					<h2 style="text-align:center;">구매내역</h2>
				</div>
			</div>
			<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="product-name d-flex">
							<div class="col-md-2 text-center">
								<span>주문번호</span>
							</div>
							<div class="col-md-4 text-center">
								<span>주문정보</span>
							</div>
							<div class="col-md-2 text-center">
								<span>주문금액</span>
							</div>
							<div class="col-md-2 text-center">
								<span>주문날짜</span>
							</div>
							<div class="col-md-2 text-center px-4">
								<span>주문상태</span>
							</div>
						</div>
						<c:choose>
							<c:when test="${ empty oi }">
								<div class="product-cart d-flex">
									<div class="col text-center" id="em">
										구매내역이 없습니다.
									</div>
								</div>
							</c:when>
							<c:when test="${ !empty oi }">
								<c:forEach items="${ oi }" var="oi">
									<div class="product-cart d-flex row align-items-center">
										<div class="col-md-2">
											<div class="display-tc col text-center">
												<h3>${ oi.ONO }</h3>
											</div>
										</div>
										<div class="col-md-4">
											<div class="display-tc">
												<span>${ oi.ORDERINFO }</span>
											</div>
										</div>
										<div class="col-md-2">
											<div class="col justify-content-md-center text-center">
												<span class="price">${ oi.TOTALPRICE }원</span>
											</div>
										</div>
										<div class="col-md-2 text-center">
											<div class="col justify-content-md-center text-center">
												<c:set var="odate" value="${ oi.ORDERDATE }"/>
												<span>${ fn:substring(odate, 0, 10) }</span>
											</div>
										</div>
										<div class="col-md-2 text-center">
											<div class="col justify-content-md-center text-center">
												<span>${ oi.OSNAME }</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			
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

