<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세보기 유저</title>

<style>
	input#btn-add{float:right; margin: 0 0 15px;}
</style>


</head>
<body>
	<c:import url="/WEB-INF/views/user/common/header.jsp"/>

	<div class="container">
	<br>
	<div class="col" style="text-align:center;"><h3>1:1문의 상세조회</h3></div>
		<div id="container" style="background:white; border: 2px solid black; padding:5%">
			<div id="question-container">	
				<tr>작성자</tr>
			    <input type="text" class="form-control" placeholder="작성자" name="questionWriter" value="${question.userid}" style="width:72%;" readonly required> &nbsp;
			    <br />
			    <tr>문의제목</tr>
				<input type="text" class="form-control" placeholder="문의제목" name="questionTitle" id="questionTitle" value="${question.qtitle}" style="width:72%;" readonly required>
				<br />
				<tr>문의내용</tr>
				<input type="text" class="form-control" placeholder="문의내용" name="questionQcontents" value="${question.qcontents}" style="width:72%; height:200px;" readonly required>
				<br />
				<hr />
				<c:if test="${ !empty question.acontents }">
					<tr>답변 내용</tr>
					<input type="text" class="form-control" placeholder="답변내용" name="questionQcontents" value="${question.acontents}" style="width:72%; height:200px;" readonly required>
				</c:if>
			</div>
			<br />
			<br />
			<br />
			 <!-- 자신이 쓴 글 삭제 -->
			<c:if test="${member.userId eq question.userid}"> 
				<input type="button" value="삭제" id="btn-add" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/service/deleteInquiryBoard.do?qNo=${question.qno}'"/>	
			</c:if>
		</div>
	</div>
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	
</body>
</html>