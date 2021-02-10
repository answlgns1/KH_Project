<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
</head>
<body>
	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	
	<div class="colorlib-loader"></div>

	<div id="page" >
		<div class="row row-pb-lg justify-content-md-center">
			<div class="col-md-11 text-center" style="margin-top:5%">
				<h1 style="color:red; text-align:center;">404 ERROR !!</h1>
				<img src="${pageContext.request.contextPath}/resources/user/images/error.jpg"/>
				<h2>${ msg }</h2><br>
				<button type="button" class="btn btn-primary thema" onclick="location.href='${pageContext.request.contextPath}'">메인으로 돌아가기</button>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
</body>
</html>