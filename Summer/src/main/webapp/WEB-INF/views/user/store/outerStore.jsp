<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer-STORE-TOP</title>
	<meta charset="utf-8">
	</head>
	<style>
		#bordercategory{
			border: none;
			height : 100px;
			text-align: center;
			font-size : 30px;		
		}
		#borderorder{
			text-align : left;
			font-size : 20px;
		}
		#nowpage{
			text-decoration: underline;
		}
		#nowpage a{
			color : #88c8bc;
		}
		.category{
			width : 300px;
			display: inline-block;	
		}
		.category a{
			color : black;
		}
		.borderdiv{
			border-top : 1px solid grey;
			border-bottom : 1px solid grey;
			padding-bottom : 15px;
		}
		.orderdiv{
			border-top : 1px solid grey;
			border-bottom : 1px solid grey;
		}
		.order{
			width : 110px;
			padding-left : 20px;
			display: inline-block;
			cursor : pointer;
			color : black;
		}
		.order:hover{
			color : #88c8bc;
		}
		#noworder a{
			color : #88c8bc;
		}
		
	</style>
	<body>	
	<div id="page">
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		<!-- 상단 페이지 정보 -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread">
							<span><a href="${pageContext.request.contextPath}">Home</a></span> 
							/ <span><a href="${pageContext.request.contextPath}/store/selectStoreMain.do">Store</a></span> 
							/ <span>OTUER</span>
						</p>
					</div>
				</div>
				<h1>Store</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="border" id="bordercategory">
							<div class="borderdiv">
								<div class=category><a href="${pageContext.request.contextPath}/store/selectStoreTop.do">TOP</a></div>
								<div class=category><a href="${pageContext.request.contextPath}/store/selectStorePants.do">PANTS</a></div>
								<div class=category id = nowpage><a href="${pageContext.request.contextPath}/store/selectStoreOuter.do">OUTER</a></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
						<h2>BEST ITEMS</h2>
					</div>
				</div>
				<div class="row row-pb-md">
					<c:forEach items="${list}" var="b" begin="0" end="3"> 
						<div class="col-md-3 col-lg-3 mb-4 text-center p123" id="${ b.BNO }">
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
			<br>
			<div class="row">
				<div class="col">
					<div class="border" id="borderorder">
						<div class="orderdiv">
							<div class=order id = noworder onclick="location.href='${pageContext.request.contextPath}/store/selectStoreOuter.do?sortVal=time'">신상품</div>
							<div class=order onclick="location.href='${pageContext.request.contextPath}/store/selectStoreOuter.do?sortVal=views'">조회순</a></div>
							<div class=order onclick="location.href='${pageContext.request.contextPath}/store/selectStoreOuter.do?sortVal=like'">좋아요순</a></div>
						</div>
					</div>
				</div>
			</div>
			<br><br><br><br>
			<!--  상품8개 시작-->
			<div class="row row-pb-md">
				<c:forEach items="${list}" var="b"> 
				<div class="col-md-3 col-lg-3 mb-4 text-center p123" id="${ b.BNO }">
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
			<!--  상품8개 끝-->
			<!-- 페이징 처리 사직-->
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="block-27">
							<c:out value="${pageBar}" escapeXml="false"/>
		            	</div>
					</div>
				</div>
				<!-- 페이징 처리 끝-->
				<!-- 검색 시작 -->
				<div class="row">
					<div class="col-md-12 text-center">
						<form action="${pageContext.request.contextPath}/community/selectFreeList.do">
							<select name="search" id="" class="btn thema" style="color : white;">
								<option value="all" style="background: white; color : black;">전체</option>
								<option value="title" style="background: white; color : black;">제목</option>
								<option value="writer" style="background: white; color : black;">작성자</option>
							</select>
							<input type="search" name="search" class="form-control" placeholder="Search" style="border-radius: 30px; width:30%; display: inline-block;">
							<button class="btn btn-primary thema" type="submit"><i class="icon-search"></i></button>
						</form>
					</div>
				</div>
				<!-- 검색 끝 -->
		</div>
	
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	</div>
	
	<script>
		$(function(){
			$(".p123").on("click",function(){
				var storeNo = $(this).attr("id");
				var userId = '${member.userId}';
				console.log("storeNo="+storeNo);
				location.href = "${pageContext.request.contextPath}/store/storeDetail.do?no="+storeNo+"&Id="+userId;
			});
		});
	</script>
	</body>
</html>

