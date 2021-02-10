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
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <style>
    	.img-thumbnail {
    		width : 300px;
    		height : auto;
    		margin : 30px 30px 30px 50px;
    	}
    	
    	#title {
    		margin-left : 10%;
    		margin-top : 5%;
    		padding : 8px;
    		text-align : center;
    		border-radius : 5px;
    		background : #88c8bc;
    		font-weight : bold;
    		width : 80%;
    	}
    	
    	#content {
    		margin-left : 10%;
    		padding : 20px;
    		background : #88c8bc;
    		border-radius : 5px;
    		font-weight : bold;
    		width : 80%;
    		height : 320px;
    	}
    	
    	#content>div:first-child {
    		border : 1px solid black;
    		border-radius : 5px;
    		text-align : center;
    		background : white;
    	}
    	
    	#content>div:nth-child(2n) {
    		margin-top : 10px;
    		border : 1px solid black;
    		border-radius : 5px;
    		background : white;
    		height : 80%;
    	}
    	
    	.carousel,
    	.item,
    	#Image img {
    		text-align : center;
    		height : 650px;
    	}
    	
    	#Image img {
    		min-width : 50%;
    		padding : 3%;
    	}
    	
    	#box2 {
    		text-align : center;
    	}
    	
    	#box2>div {
    		display : inline-block;
    		width : 120px;
    		height : 150px;
    	}
    	
    	#goBack {
    		text-align : center;
    	}
    	
    	#goBack *{
    		border : 1px solid black;
    		border-radius : 5px;
    		padding : 5px 10px 5px 10px;
    		background : white;
    		font-weight : bold;
    		width : 100px;
    		height : auto;
    	}
    	
    	#goBack>button:hover {
    		background : #88c8bc;
    		color : white;
    		transition : 0.4s;
    	}
    	
    	#comment {
    		margin-top : 10px;
    		border-radius : 5px;
    		background : #E2E2E2;
    		width : 80px;
    	}
    	
    	.modal-backdrop {
    		display : none;
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
				<h1>Lookbook 상세조회</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		<div class="colorlib-product" style="margin-top:-80px;" >
			<div class="container">
			
			<!-- 수정버튼 ( 작성자 ) -->
			<c:if test="${member.userId eq list.USERID}">
				<div class="row" style="float:right;">
					<button type="button" class="btn btn-info thema" onclick="fn_update()">수정하기</button>
				</div>
			</c:if>
			
				<div class="row row-pb-md" >
					<div class="col" >
						<div class="col-md-12">
							<div class="col-md-4">
							<img src="${pageContext.request.contextPath}${ list.FILEPATH }${ list.NEWFILENAME }" class="img-thumbnail">							
							</div>
							<div class="col-md-8" style="display:inline-block;">
								<div id="title">${ list.BTITLE }</div>
								<br>
								<div id="content">
									<div>
										설명
									</div>
									<div>
										${ list.BCONTENTS }
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr />
				<br /><br />
				<div class="row row-pb-md">
					<div class="col">
						<div class="col-md-12">
							<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
								<ol class="carousel-indicators">
								    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
								    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
								    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  								</ol>
  								<div id="Image" class="carousel-inner" role="listbox">
	  									<div class="item active">
	  										<img src="${pageContext.request.contextPath}${ list.FILEPATH }${ list.NEWFILENAME }" class="img-responsive center-block"/>
	  										<div class="carousel-caption">
	  											대표 이미지
	  										</div>
	  									</div>
  									<c:forEach items="${ attach }" var="at">
  										<div class="item">
	  										<img src="${pageContext.request.contextPath}${ at.FILEPATH }${ at.NEWFILENAME }" class="img-responsive center-block"/>
	  										<div class="carousel-caption">
	  											${ at.FINDEX }번 이미지
	  										</div>
  										</div>
  									</c:forEach>
  								</div>
  								<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
								    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
  								</a>
  								<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
								    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
  								</a>
							</div>
						</div>
					</div>
				</div>
				<br /><br />
				<div class="row">
					<div class="col" id="box2">
						<div class="border">
							<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/thumbsUp.png" width="50" height="50" style="margin-top:15px;"/><br><br>
							<span>좋아요</span><br>
							<span>${ list.LIKE_COUNT }</span>
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="border">
							<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/warning.png" width="50" height="50" style="margin-top:15px;"/><br><br>
							<span>신고</span><br>
							<span>${ list.REPORT_COUNT }</span>
						</div>
					</div>
				</div>
				<c:if test="${member.userId ne list.USERID && !empty member}">
					<button type="button" class="btn btn-danger btn-sm" style="float:right;" data-toggle="modal" data-target="#reportModal">신고</button>
				</c:if>
				<br /><br />
				<hr />
				<div class="row">
					<div class="col-md-12">
						<div id="goBack">
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/lookbook/selectLookbookList.do'">목록으로</button>
						</div>
					</div>
				</div>
				<hr /> <br>
				
				<div style="padding : 10px;">
					<div style="margin-bottom:20px;">
						<span style="font-size : 17px;">댓글 <b>${list.COMMENT_COUNT}</b></span>
					</div>
					<!-- 댓글 반복 시작 -->
					<c:forEach items="${commentList}" var="comment">
					<div id="${comment.BCNO}" style="padding : 10px; border-top : 1px solid lightgrey">
						<table style="width: 100%; clear: both;">
							<tr>
								<td>${comment.WRITER} ${comment.DATE2CHAR}</td>
								<td style="float:right;">
								<c:if test="${member.userId ne comment.USERID && !empty member}">
									<button type="button" class="btn btn-danger btn-sm" onclick="fn_rpCom(${comment.BCNO});" style="float:right;" data-toggle="modal" data-target="#reportModal">신고</button>
								</c:if>
								<c:if test="${member.userId eq comment.USERID}">
									<button type="button" class="btn btn-primary thema" id="ucC${ comment.BCNO }" onclick="fn_updateLookbookComment(${comment.BCNO});">수정</button>
									<button type="button" class="btn btn-primary thema" onclick="fn_deleteLookbookComment(${comment.BCNO});">삭제</button>
								</c:if>
								</td>
							</tr>
							<tr>
								<td>
									<!-- 댓글 수정 시작 -->
									<form action="${pageContext.request.contextPath}/lookbook/updateLookbookComment.do?bno=${list.BNO}&bcno=${comment.BCNO}" method="post">
										<p id="cContentsVal${ comment.BCNO }">${comment.CCONTENTS}</p>
										<textarea id="cContentsUpd${ comment.BCNO }" name="updateCContents" rows="3"
												  style="width:100%; border:1px solid lightgrey; resize:none; display:none;">${ comment.CCONTENTS }</textarea>
										<button type="button" id="cancelCBtn${ comment.BCNO }" class="btn btn-primary thema" onclick="fn_cancelUcC(${comment.BCNO});" style="float : right; display:none;">취소하기</button>
										<button type="submit" id="updateCBtn${ comment.BCNO }" onclick="fn_updateC(${comment.BCNO});" class="btn btn-primary thema" style="float : right; display:none;">수정하기</button>
									</form>
									<!-- 댓글 수정 끝 -->
								</td>
							</tr>
						</table>
					</div>
					</c:forEach>
					<!-- 댓글 반복 끝 -->
					<!-- 댓글 등록 시작 -->
					<c:if test="${ !empty member }">
						<div style="padding : 10px 10px 0 10px; border : 1px solid lightgrey; clear:both;">
							<form action="${pageContext.request.contextPath}/lookbook/insertLookbookComment.do?bno=${ list.BNO }" method="post" onsubmit="return fn_submit();">
								<input type="hidden" name="userId" value="${member.userId}" required>
								<textarea id="cContents" name="cContents" rows="3" placeholder="댓글을 입력하세요" style="width:100%; border : 1px solid lightgrey; resize:none;"></textarea>
								<button type="submit" class="btn btn-primary thema" style="float : right;">등록</button>
							</form>
							<br /><br />
						</div>
					</c:if>
					<!-- 댓글 등록 끝 -->
				</div>
			</div>
		</div>
		
		
		<!-- Modal시작 -->
		<!-- https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
		<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="reportModalLabel">신고</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					
					<!--신고폼 -->
					<!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
					<form action="${pageContext.request.contextPath}/report/insertReport.do" method="post">
						<div class="modal-body">
							<input type="hidden" name="url" value="/lookbook/selectLookbookDetail.do?bno=${list.BNO}"/>
							<input type="hidden" name="bNo" value="${list.BNO}"/>
							<input type="hidden" id="rp_bcno" name="bcNo" value="0"/>
							<input type="hidden" name="userId" value="${member.userId}"/>
							<input type="text" id="rReason" class="form-control" name="rReason" placeholder="신고사유" required>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary thema" onclick="fn_report();">신고</button>
							<button type="button" class="btn btn-primary thema" data-dismiss="modal" onclick="fn_clear();">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- Modal 끝-->

		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	<script>
		function fn_update() {
			if(confirm('수정 하시겠습니까?')) {
				location.href='${pageContext.request.contextPath}/lookbook/LookbookUpdate.do?bno=${list.BNO}';
			}
		}
		
		function fn_delete() {
			if(confirm('삭제하시겠습니까?')){
				location.href='${pageContext.request.contextPath}/community/deleteFree.do?bno=${list.BNO}';
			}
		}

		function fn_submit() {
			if($('#cContents').val().trim().length==0){
				alert('댓글 내용을 입력해주세요.');
				return false;
			}
			return true
		}

		function fn_updateLookbookComment(bcno){
			$('#cContentsVal'+bcno).hide();
			$('#cContentsUpd'+bcno).show();
			$('#updateCBtn'+bcno).show();
			$('#ucC'+bcno).hide();
			$('#cancelCBtn'+bcno).show();
		}

		function fn_cancelUcC(bcno) {
			$('#cContentsVal'+bcno).show();
			$('#cContentsUpd'+bcno).hide();
			$('#updateCBtn'+bcno).hide();
			$('#ucC'+bcno).show();
			$('#cancelCBtn'+bcno).hide();
		}

		function fn_deleteLookbookComment(bcno){
			if(confirm('삭제하시겠습니까?')){
				location.href='${pageContext.request.contextPath}/lookbook/deleteLookbookComment.do?bno=${list.BNO}&bcNo='+bcno;
			}
		}

		function fn_updateC(bcno) {
			if($('cContentsUpd'+bcno).val().trim().length==0){
				alert('댓글 내용을 입력해주세요.');
				return false;
			}
			return true
		}

		function fn_clear(){
			$('#rReason').val('');
		}

		function fn_report(bno) {
			if(confirm('신고하시겠습니까?')){
				return true;
			}
		}

		function fn_rpCom(bcno) {
			$('#rp_bcno').val(bcno);
			console.log($('#rp_bcno').val());
		}
		
	</script>
	
	</body>
</html>

