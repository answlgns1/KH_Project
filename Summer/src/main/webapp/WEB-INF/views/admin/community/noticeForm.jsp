<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>

<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
	</style>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=bContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	</script>
	
</head>
<body>

<c:import url="../common/header.jsp"/>
	<div id="container" style="background:white; border: 2px solid black; padding:5%" >
		<div id="notice-container">
		<br /><br />
			<form action="${pageContext.request.contextPath}/admin/community/noticeFormEnd.do" method="post" onsubmit="return validate();">
				<select name="btno" class="btn thema" style="color : black;">
				        <option value="1" style="background: white; color : black;">공지사항</option>
				        <option value="2" style="background: white; color : black;">스토어</option>
				        <option value="3" style="background: white; color : black;">룩북</option>
				        <option value="4" style="background: white; color : black;">자유</option>
				        <option value="5" style="background: white; color : black;">중고거래</option>	
				</select>
				<br /><br /><br />
				<input type="text" class="form-control" style="width:100%" placeholder="제목" name="btitle" id="bTitle" required>
				<br />
			    <textarea class="form-control" style="height:300px; width:100%" name="bcontents" placeholder="내용" required></textarea>
				<br />
				<input type="submit" class="btn btn-outline-success" value="등록" >
			</form>
		</div>
	</div>
	
	<br /><br />
	
	<div class="footer">
	  <div class="footer-inner">
	    <div class="container">
	      <div class="row">
	        <div class="span12"> &copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>. </div>
	        <!-- /span12 --> 
	      </div>
	      <!-- /row --> 
	    </div>
	    <!-- /container --> 
	  </div>
	  <!-- /footer-inner --> 
	</div>
</body>
</html>