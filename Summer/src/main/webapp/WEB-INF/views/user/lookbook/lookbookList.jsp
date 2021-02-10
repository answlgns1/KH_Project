<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="lookbook" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - LOOKBOOK</title>
	<meta charset="utf-8">
    <style>
    	#sort-box {
    		border : 1px solid #E2E2E2;
    		list-style : none;
    		font-weight : bold;
    		padding : 10px 0px 10px 10px;
    	}
    	
    	#sort-box>li {
    		margin-left : 10px;
    		padding : 5px 10px 5px 10px;
    		border : 1px solid #E2E2E2;
    		display : inline-block;
    	}
    	
    	#sort-box>li:hover {
    		background : #E2E2E2;
    		border : 1px solid black;
    		cursor : pointer;
    		transition : 0.5s;
    	}
    	
    	#category>li:hover {
    		background : #E2E2E2;
    		font-weight : bold;
    		transition : 0.5s;
    	}
    	
    	#submitBtn {
    		width : 50px;
    		height : 43px;
    		border : 1px solid gray;
    	}
    	
    	#submitBtn:hover{
    		background : gray;
    		color : snow;
    		cursor : pointer;
    		transition : 0.4s;
    	}
    	
    	.desc>span {
    		font-size : 12px;
    	}
    </style>
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
						<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>LookBook</span></p>
					</div>
				</div>
				<h1>Lookbook</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p style="font-size:16px; font-weight:bold; color:#88c8bc;">${ msg }</p>
					<ul id="sort-box">
						<li onclick="location.href='${pageContext.request.contextPath}/lookbook/selectLookbookList.do?sort=time'">최신순</li>
						<li onclick="location.href='${pageContext.request.contextPath}/lookbook/selectLookbookList.do?sort=views'">조회수</li>
						<li onclick="location.href='${pageContext.request.contextPath}/lookbook/selectLookbookList.do?sort=like'">좋아요</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="colorlib-product" style="margin-top:-80px;" >
			<div class="container">
				<div class="row row-pb-md" style="margin-bottom:-20px">
					<c:forEach items="${ list }" var="b">
						<div class="col-md-3 col-lg-3 mb-4 text-center">
							<div class="product-entry border">
								<i class="icon-heart" aria-hidden="true"> ${ b.LIKE_COUNT }</i> &nbsp;
								<i class="icon-eye" aria-hidden="true"> ${ b.VIEWS }</i>
								<a href="${pageContext.request.contextPath}/lookbook/selectLookbookDetail.do?bno=${ b.BNO }" class="prod-img">
									<img src="${pageContext.request.contextPath}${ b.FILEPATH }${ b.NEWFILENAME }" class="img-fluid" alt="Free html5 bootstrap 4 template">
								</a>
								<div class="desc">
									<h2><a href="${pageContext.request.contextPath}/lookbook/selectLookbookDetail.do?bno=${ b.BNO }">${ b.BTITLE }</a></h2>
									<p style="font-size:10px;">${ b.USERID }</p>
									<span>${ b.BCONTENTS }</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div style="text-align : right;">
			        <button onclick="location.href='${pageContext.request.contextPath}/lookbook/LookbookInsert.do'" class="btn btn-primary thema">글쓰기</button>
			    </div>
				<!-- 페이징 처리 시작-->
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
						<form action="${pageContext.request.contextPath}/lookbook/selectLookbookSearch.do" id="Search">
							<select name="searchCt" class="btn thema" style="color : white;">
								<option value="all" style="background: white; color : black;">전체</option>
								<option value="title" style="background: white; color : black;">제목</option>
								<option value="writer" style="background: white; color : black;">작성자</option>
							</select>
							<input type="search" id="search" name="search" class="form-control" placeholder="Search" style="border-radius: 30px; width:30%; display: inline-block;">
							<button class="btn btn-primary thema" type="submit"><i class="icon-search"></i></button>
						</form>
					</div>
				</div>
				<!-- 검색 끝 -->
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	
	<script>
		$('#search').keydown(function(e) {
			if(e.keyCode == 13) {
				$('#Search').submit();
			}
		});
	</script>
	</body>
</html>

