<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 수정</title>
<style>
	#title {
		font-size : 30px;
	}
	
	#content img {
		width : 100%;
		height : 350px;
	}
	
	#result {
		text-align : center;
	}
	
	#content>input {
		width : 70%;
	}
	
	#content>* {
		line-height : 20px;
	}
	
	td input {
		width : 455px;
	}
	
	td {
		line-height : 1.5em;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/adminMenu.jsp" %>
	<hr />
	<br><br>
	<div class="row">
		<div class="col-md-7 col-md-offset-3" id="title" style="background : white">광고 수정</div>
	</div>
	<div class="row">
		<div class="col-md-7 col-md-offset-3" id="content">
			<img src="<%=request.getContextPath()%>/resources/images/sample_images_01.png" >
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-5 col-md-offset-4">
			<form action="AD_Manage.jsp">
				<table>
					<tr>
						<td>광고 제목 : </td>
						<td><input type="text" id="AD_title" placeholder="제목을 입력해주세요." /></td>
					</tr>
					<tr>
						<td>사이트 링크 : </td>
						<td><input type="text" id="AD_link" placeholder="사이트 링크를 입력해주세요." /></td>
					</tr>
					<tr>
						<td>광고 설명 : </td>
						<td><textarea id="AD_content" cols="60" rows="3" style="resize: none;" placeholder="광고 설명을 입력해주세요."></textarea></td>
					</tr>
				</table>
				<br><br>
				<div id="result">
					<button type="submit" class="btn btn-success btn-md">수정하기</button> &nbsp;
					<button class="btn btn-danger btn-md">취소하기</button>
				</div>
			</form>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>