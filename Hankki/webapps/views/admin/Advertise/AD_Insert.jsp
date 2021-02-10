<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.member.model.vo.*"%>
<%
	Member m = (Member) session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 등록</title>
<style>
	#title {
		font-size : 30px;
	}
	
	#ImgArea img {
		width : 100%;
		height : 350px;
		cursor : pointer;
	}
	
	#result {
		text-align : center;
	}
	
	#ImgArea>input {
		width : 70%;
	}
	
	#ImgArea {
		border : 1px solid black;
	}
	
	td input {
		width : 90%;
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
	<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-2" id="title" style="background : white">광고 등록</div>
	</div>
	<form action="<%= request.getContextPath() %>/AD_Insert.ad"
	 	  method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-8 col-md-offset-2" id="ImgArea">
				<img id="adImage" src="<%= request.getContextPath() %>/resources/images/sample_images_01.png" >
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-9 col-md-offset-3">
				<table>
					<tr>
						<td>광고 제목 : </td>
						<td><input type="text" name="adTitle" placeholder="제목을 입력해주세요." /></td>
					</tr>
					<tr>
						<td>사이트 링크 : </td>
						<td><input type="text" name="adLink" placeholder="사이트 링크를 입력해주세요." /></td>
					</tr>
					<tr>
						<td>광고 설명 : </td>
						<td><textarea name="adContent" cols="60" rows="3" style="resize: none;" placeholder="광고 설명을 입력해주세요."></textarea></td>
					</tr>
				</table>
			</div>
			<div id="result" class="col-md-12">
				<button type="submit" class="btn btn-success btn-md">등록하기</button> &nbsp;
				<button type="reset" onclick="goBack()"class="btn btn-danger btn-md">취소하기</button>
			</div>
			<div class="fileArea" id="fileArea">
				<!-- 첨부할 사진 추가 영역 -->
				<input type="file" name="ImgBtn" id="ImgBtn" onchange="loadImg(this)" />
			</div>
		</div>
	</form>
	<br />
	<br />
	<br />
	<br />
	<br />
	</div>
	
	<script>
		// 사진 게시글 미리보기 기능 구현
		$(function(){
			$('#ImgArea').click(function(){
				$('#ImgBtn').click();
			})
			
			$('#fileArea').hide();
		})
	
		function loadImg(img) {
			if( img.files && img.files[0]) {
				
				var reader = new FileReader();
				
				reader.onload = function(e) {
				
					$('#adImage').attr('src', e.target.result);
				
				}
				reader.readAsDataURL(img.files[0]);
			}
			
		}
		
		function goBack() {
			history.back();
		}
		
	</script>
	
</body>
</html>