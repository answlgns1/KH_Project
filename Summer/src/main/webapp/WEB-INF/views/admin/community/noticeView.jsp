<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style>
</style>


</head>
<body>

<c:import url="../common/header.jsp"/>

	<div class="container">
		<div class="row">
			<div class="col">
				<h2 style="margin-left:3%;">공지사항</h2>
			</div>
		</div>
		<br>
		<div class="col" style="text-align:center;"><h3>공지사항 상세조회</h3></div>
		<div id="container" style="background:white; border: 2px solid black; padding:5%">
			<div id="question-container">
				<tr>게시글번호</tr>
				<input type="text" class="form-control" placeholder="게시글번호" name="boardBno" id="boardBno" value="${board.bno}" readonly required> &nbsp;
			    <tr>작성일</tr>
			    <input type="text" class="form-control" placeholder="작성일" name="boardBdate" id="boardBdate" value="${board.bdate}" readonly required>
			</div>
			<div>
				<tr>제목</tr>
				<input type="text" class="form-control" placeholder="제목" name="boardBtitle" id="boardBtitle" value="${board.btitle}" style="width:100%;" readonly required>
			</div>
			<div>
				<tr>내용</tr>
				<input type="text" class="form-control" placeholder="내용" name="boardBcontents" value="${board.bcontents}" style="width:100%; height:200px;" readonly required>
			</div>
			<br><br>
		<div style="border-bottom:1px solid black;"></div>
		<br><br>
	
			<div class="container" role="main">
				<div style="text-align:center; width:90%;">
					<div >
						<button type="button" class="btn btn-sm btn-primary" onclick="fn_cancle();">목록</button>
						<button type="button" class="btn btn-sm btn-primary" onclick="fn_submit();">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br /><br />
	
	
	<div class="footer">
	  <div class="footer-inner">
	    <div class="container">
	      <div class="row">
	        <div class="span12"> &copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>. </div>
	        <!-- /span12 --> 
	      </div>
	      <!-- /row --> 
	    </div>
	    <!-- /container --> 
	  </div>
	  <!-- /footer-inner --> 
	</div>
	
	
	<script>
		function fn_cancle() {
			if(confirm("목록으로 돌아가시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/admin/community/noticeList.do";
			}
		}
	</script>
	
</body>
</html>