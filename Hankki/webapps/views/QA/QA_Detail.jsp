<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.qa.model.vo.*"%>
<%
	Qa q = (Qa)request.getAttribute("Qa");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 1:1문의 세부내용</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
           
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">           
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<style>
.outer{
		width:800px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	.tableArea > table {
		width: 650px;
		padding: 20px;
		color: black;
		border:1px solid white;
	}

	.tableArea {
		background:white;
		width:650px;
		height:350px;
		margin:auto;
	}
	span {
		font-size:21pt;
		background: black;
		color: white;
	}
 
</style>  
 
</head>
<body>

    <%@ include file="../common/header.jsp"%>

     <div class="outer">
		<br>
		<h2 align="center">1:1문의 내용</h2>
		<div class="tableArea">
				<table>
					<tr>
						<td>제목 : </td>
						<td colspan="3"><%= q.getQa_title() %></td>
					</tr>
					<tr>
						<td>작성자 :</td>
						<td>
							<%= q.getQa_writer() %>
						</td>
						<td>작성일 : </td>
						<td><%= q.getQa_date() %></td>
					</tr>
					<tr>
						<td>내용 </td>
					</tr>
					<tr>
						<td colspan="4"><br>
							<span><%= q.getQa_content().charAt(0) %></span><%= q.getQa_content().substring(1) %>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					
					<button onclick="location.href='SelectList.qa'">메뉴로 돌아가기</button>

				</div>
		</div>
	</div>


    <br><br><br><br>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>