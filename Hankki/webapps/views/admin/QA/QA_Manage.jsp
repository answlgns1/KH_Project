<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 관리</title>
<style>
	#search>ul>li {
		display : inline-block;
		padding-top : 20px;
	}
	
	#search {
		bottom : 0;
	}
	
	#search>ul {
		float : right;
	}
	
	#userTable tr td {
		text-align : center;
	}
	
	#thead {
		background : #E2E2E2;
	}
	
	#userTable tr {
		border-bottom : 1px solid black;
		height : 40px;
		cursor : pointer;
	}
	
	#userTable tr td {
		border-right : 1px solid snow;
		border-bottom : 1px solid gray;
	}
	
	#QAno {
		width : 10%;
	}
	
	#QAwriter {
		width : 10%;
	}
	
	#QAdate {
		width : 20%;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/adminMenu.jsp" %>
	<hr />
	<br /><br />
	<div class="row">
		<div class="col-md-2 col-md-offset-3" style="font-size : 30px">Q&A 관리</div>
		<div class="col-md-5" id="search">
			<ul>
                <li><input type="checkbox">&nbsp;Q&A 글번호&nbsp;</li>
                <li><input type="checkbox">&nbsp;Q&A 글제목&nbsp;</li>
                <li><input type="text" id="user_search"><input type="submit" value="검색"></li>
            </ul>
		</div>
	</div>
	<div class="row">
		<div class="col-md-7 col-md-offset-3">
			<table class="table table-hover" id="userTable">
				<tr id="thead" style="cursor : default">
					<td id="QAno">글 번호</td>
					<td id="QAtitle">글 제목</td>
					<td id="QAwriter">작성자</td>
					<td id="QAdate">작성일</td>
				</tr>
				<tr onclick="location.href='QA_Answer.jsp'">
					<td>1</td>
					<td>안녕하세요</td>
					<td>홍길동</td>
					<td>2020.11.05</td>
				</tr>
				<tr>
					<td>2</td>
					<td>css가 너무</td>
					<td>동길홍</td>
					<td>2020.11.02</td>
				</tr>
				<tr>
					<td>3</td>
					<td>말을안들어요..</td>
					<td>동홍길</td>
					<td>2020.11.03</td>
				</tr>
				<tr>
					<td>4</td>
					<td>살려주세요,,</td>
					<td>길홍동</td>
					<td>2020.11.01</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-7 col-md-offset-3" style="text-align : center">
			<button><<</button>
			<button><</button>
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>></button>
			<button>>></button>
			<hr />
		</div>
	</div>
	<br><br><br><br><br><br><br>
	
</body>
</html>

















