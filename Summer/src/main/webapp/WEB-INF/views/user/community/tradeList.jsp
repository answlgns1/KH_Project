<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="community" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - COMMUNITY - TRADE</title> 
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
						<p class="bread"><span><a href="${pageContext.request.contextPath}/community/selectCommunityMain.do">Community</a></span> / <span>Trade</span></p>
					</div>
				</div>
				<h1>거래게시판</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>

		<div class="colorlib-product" style="margin-top:-80px;">
			<div class="container">
				<div class="row row-pb-md" style="margin-bottom: -50px;">
					<div class="col text-center">
						<!-- 게시판 -->
						<table id="tbl-board" class="table table-hover table-striped">
							<tr style="background : #88c8bc; border : #88c8bc; color : white;">
								<th style=" width : 70px;">번호</th>
								<th>제목</th>
								<th style="width : 100px;">작성자</th>
								<th style="width : 100px;">작성일</th>
								<th style="width : 60px;">파일</th>
								<th style="width : 90px;">조회수</th>
							</tr>
							<c:forEach items="${list}" var="b"> 
							<tr id="${b.BNO}" style="border-bottom : 1px solid lightgrey">
								<td>${b.BNO}</td>
								<td style="text-align: left;">${b.BTITLE}<c:if test="${b.COMMENTS>0}"> (${b.COMMENTS})</c:if></td>
								<td>${b.WRITER}</td>
								<td>${b.BDATE2CHAR}</td>
								<td align="center">
									<c:if test="${b.FILECOUNT>0}">
										<i class="icon-large icon-file"></i>
									</c:if>
								</td>
								<td>${b.VIEWS}</td>
							</tr>
							</c:forEach>
							<c:if test="${empty list}">
								<tr style="border-bottom : 1px solid lightgrey"><td colspan="6">조회된 게시글이 없습니다. <br />게시글을 작성해주세요</td></tr>
							</c:if>
						</table>
						<button type="button" class="btn btn-primary thema" style="float : right;"
								onclick="location.href='${pageContext.request.contextPath}/community/insertTradeView.do?'">글쓰기</button>
					</div>
				</div>
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
						<form action="${pageContext.request.contextPath}/community/selectTradeList.do">
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
		</div>

		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	<script>
		$(function(){
			$("tr[id]").on("click",function(){
				var tradeNo = $(this).attr("id");
				console.log("tradeNo="+tradeNo);
				location.href = "${pageContext.request.contextPath}/community/selectTradeDetail.do?no="+tradeNo;
			});
		});
	</script>
	
	</body>
</html>

