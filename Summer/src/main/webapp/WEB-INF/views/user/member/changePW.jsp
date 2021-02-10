<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>비밀번호 변경</title>

<style>
	
	#cPW p {font-weight : bold; font-size : 18px;}
	input {width:100%;}
	
	#cPWBtn {
		width : 100%;
		height : 46px;
		background : #88c8bc;
		color : white;
		border : 1px solid white;
		border-radius : 5px;
		font-size : 20px;
	}
	
	#cPWBtn:hover {cursor : pointer;}

</style>

</head>

<body>


	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	
	<!-- 상단 페이지 정보 -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col">
					<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>FIND</span></p>
				</div>
			</div>
			<h2>비밀번호 변경</h2>
			<hr style="margin-top:-10px;"/>
		</div>
	</div>
	<br><br>
	
	<div class="container">
		<div class="row text-center">
			<div class="col">
				<h1>SUMMER</h1>
				<br>
			</div>
		</div>
		
		<div class="row justify-content-center" id="cPW">
			<div class="col-md-5" style="border : 1px solid #88c8bc; box-shadow:10px 10px 20px grey; padding : 3%;">
				<form action="${pageContext.request.contextPath}/member/changePwEnd.do" method="post" id="changePW">
					<input type="hidden" name="userId" value="${ userId }"/>
					<div>
						<p>새 비밀번호</p>
						<input type="password" id="password" placeholder="새 비밀번호 입력" required/>
					</div>
					<br>
					<div>
						<p>새 비밀번호 확인</p>
						<input type="password" id="passwordChk" placeholder="새 비밀번호 확인" name="password" required/>
					</div>
					<br><br>
					<button type="button" id="cPWBtn" onclick="fn_changePW();">비밀번호 변경</button>
				</form>
			</div>
		</div>
	</div>
	 
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	
	
	<script>
		function fn_changePW() {
			var password = $('#password').val();
			var passwordChk = $('#passwordChk').val();
			
			if(password == "") {
				alert("새 비밀번호를 입력해주세요.");
				return false;
			}
			if(passwordChk == "") {
				alert("새 비밀번호확인을 입력해주세요.");
				return false;
			}
			if(password != passwordChk) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#password').val('');
				$('#passwordChk').val('');
				$('#password').focus();
				return false;
			}
			if(confirm("비밀번호를 변경하시겠습니까?")) {
				$('#changePW').submit();
			}
		}
	</script>
	
	
	
	
	
	
</body>
</html>

