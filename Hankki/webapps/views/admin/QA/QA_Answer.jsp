<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 관리</title>
<style>
	#box1 {
		background : whitesmoke;
		height : 100%;
	}
	
	#box1 div {
		padding : 10px 30px;
		margin-top : 2px;
		border : 1px solid gray;
	}
	
	#box1 div input {
		width : 90%;
	}
	
	textarea {
		width : 100%;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/adminMenu.jsp" %>
	<hr />
	<br /><br />
	<div class="row">
		<div class="col-md-2 col-md-offset-3" style="font-size : 30px">Q&A 답글달기</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-6 col-md-offset-3" id="box1">
			<div>
				<span>글 제목 : </span><input type="text"/>
			</div>
			<div>
				<span>작성자 : </span><input type="text" value="ㅎㅇ" />
			</div>
			<div>
				<span>작성일 : </span><input type="text" value="2020.11.05" />
			</div>
			<div id="QA_content">
				<span>글 내용</span><br><textarea rows="7" style="resize : none"></textarea>
			</div>
			<hr />
			<div id="QA_answer">
				<span>답글 달기</span><br><textarea rows="7" style="resize : none"></textarea>
			</div>
			<div align="center" style="border : none">
				<button type="submit" class="btn btn-success btn-sm" onclick="location.href='QA_Manage.jsp'">답글 등록</button> &nbsp;
				<button class="btn btn-danger btn-sm" onclick="location.href='QA_Manage.jsp'">취소하기</button>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br>
	
</body>
</html>

















