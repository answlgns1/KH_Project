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
</head>
<body>

	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	
	<div class="container">
	<br>
	<div class="col" style="text-align:center;"><h3>자주묻는질문</h3></div>
		<div id="container" style="background:white; border: 2px solid black; padding:5%">
			<div id="question-container">	
			    <tr>공지사항</tr>
				<input type="text" class="form-control" placeholder="자주묻는질문" name="boardBtitle" id="boardBtitle" value="${board.btitle}" style="width:100%;" readonly required>
				<br />
				<tr>공지사항 내용</tr>
				<input type="text" class="form-control" placeholder="답변내용" name="boardBcontents" value="${board.bcontents}" style="width:100%; height:auto;" readonly required>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	
</body>
</html>