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
						<p class="bread"><span><a href="${pageContext.request.contextPath}/community/selectCommunityMain.do">Community</a></span> / <span>Free</span></p>
					</div>
				</div>
				<h1>자유게시판</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>

		<div class="colorlib-product" style="margin-top:-80px; clear: both;">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col" >
					<div style="border : 1px solid lightgrey; padding : 10px; margin-bottom : 10px;">
						<table style="width:100%;">
							<tr>
								<td><h2>${board.BTITLE}</h2></td>
							</tr>
							<tr>
								<td>${board.WRITER} ${board.MEMBERSHIP}</td>
							</tr>
							<tr>
								<td>${board.BDATE2CHAR}</td><td style="text-align: right; width:100px;">댓글 ${board.COMMENTCOUNT}</td><td style="text-align: right; width:100px;">조회 ${board.VIEWS}</td>
							</tr>
						</table>
						
						<hr />
						
						<div style="min-height: 500px;">
							${board.BCONTENTS}
						
							<c:forEach items="${attachmentList}" var="attachment">
							<div class="col partner-col text-center">
								<img src="${pageContext.request.contextPath}${attachment.FILEPATH}${attachment.NEWFILENAME}" class="img-fluid" alt="${attachment.OLDFILENAME}">
							</div>
							</c:forEach>
						</div>
						
						<div style="clear:both">
						댓글 ${board.COMMENTCOUNT}
						<c:if test="${member.userId ne board.USERID}">
						<button type="button" class="btn btn-primary thema btn-sm" style="float:right;" onclick="fn_report();" data-toggle="modal" data-target="#reportModal">신고</button>
						</c:if>
						</div>
						
						<hr style="margin-bottom : 0;"/>
						<div style="padding : 10px;">
							<h6 style="">댓글</h6>
							<!-- 댓글 반복 시작 -->
							<c:forEach items="${commentList}" var="comment">
							<div id="${comment.BCNO}" style="padding : 10px; border-top : 1px solid lightgrey">
								<table style="width: 100%; clear: both;">
									<tr>
										<td>${comment.WRITER} ${comment.DATE2CHAR}</td>
										<td style="float:right;">
										<c:if test="${member.userId eq comment.USERID}">
											<button type="button" class="btn btn-primary thema">수정</button>
											<button type="button" class="btn btn-primary thema" onclick="fn_deleteFreeComment(${comment.BCNO});">삭제</button>
										</c:if>
										</td>
									</tr>
									<tr>
										<td>
											${comment.CCONTENTS}
										</td>
									</tr>
								</table>
							</div>
							</c:forEach>
							<!-- 댓글 반복 끝 -->
							<!-- 댓글 등록 시작 -->
							<div style="padding : 10px 10px 0 10px; border : 1px solid lightgrey; clear:both;">
								<form action="${pageContext.request.contextPath}/community/insertFreeComment.do?bNo=${board.BNO}" method="post" onsubmit="return fn_submit();">
									<input type="hidden" name="userId" value="${member.userId}" required>
									<textarea id="cContents" name="cContents" rows="3" placeholder="댓글을 입력하세요" style="width : 100%; border : 1px solid lightgrey;"></textarea>
									<button type="submit" class="btn btn-primary thema" style="float : right;">등록</button>
								</form>
								<br /><br />
							</div>
							<!-- 댓글 등록 끝 -->
						</div>
					</div>
					<c:if test="${member.userId eq board.USERID}">
					<button type="button" class="btn btn-primary thema" onclick="fn_update();">수정</button>
					<button type="button" class="btn btn-primary thema" onclick="fn_delete();">삭제</button>
					</c:if>
					<button type="button" class="btn btn-primary thema" style="float : right;"
							onclick="location.href='${pageContext.request.contextPath}/community/selectFreeList.do';">목록</button>
					</div>
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
							<input type="hidden" name="url" value="/community/selectFreeDetail.do?no=${board.BNO}"/>
							<input type="hidden" name="bNo" value="${board.BNO}"/>
							<input type="hidden" name="bcNo" value="${comment.BCNO}"/>
							<input type="hidden" name="userId" value="${member.userId}"/>
							<input type="text" id="rReason" class="form-control" name="rReason" placeholder="신고사유" required>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary thema" >신고</button>
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
			if(confirm('수정하시겠습니까?')){
				location.href='${pageContext.request.contextPath}/community/updateFreeView.do?bNo=${board.BNO}';
			}
		}
		
		function fn_delete() {
			if(confirm('삭제하시겠습니까?')){
				location.href='${pageContext.request.contextPath}/community/deleteFree.do?bNo=${board.BNO}';
			}
		}

		function fn_submit() {
			if($('#cContents').val().trim().length==0){
				alert('댓글 내용을 입력해주세요.');
				return false;
			}
			return true
		}

		function fn_deleteFreeComment(bcno){
			if(confirm('삭제하시겠습니까?')){
				location.href='${pageContext.request.contextPath}/community/deleteFreeComment.do?bNo=${board.BNO}&bcNo='+bcno;
			}
		}

		function fn_clear(){
			$('#rReason').val('');
		}
		
	</script>
	
	</body>
</html>

