<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>successBuyStore</title>
</head>
<style>
.title{
	text-align : center;
}
.contents{
	text-align : center;
}
.center{
	text-align : center;
}
</style>
<body>
	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	<br>
	<div class="container">
		<div class="title">
			<h3>결제 완료 페이지</h3>
		</div>
		<hr>
		<div class="contents">
			결제가 완료되었습니다.
		</div>
		<br><br><br><br><br>
		<div class="center">
					<button onclick="location.href='${pageContext.request.contextPath}'" class="btn btn-primary thema">메인으로</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="location.href='${pageContext.request.contextPath}/myPage/myPageOI.do?userId=${member.userId}'" class="btn btn-primary thema">구매내역</button>
		</div>
	</div>
	

	
	
	
	
	
	
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
</body>
</html>