<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문작성</title>

<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
	</style>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=fContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	</script>
	
</head>
<body>

<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	<div class="container">
		<div id="faq-container">
		<br /><br />
			<form action="${pageContext.request.contextPath}/service/frequentlyAskQuestionFormEnd.do" method="post" onsubmit="return validate();">
				<select name="qtypeno" class="btn thema" style="color : white;">
				        <option value="1" style="background: white; color : black;">결제</option>
				        <option value="2" style="background: white; color : black;">환불</option>
				        <option value="3" style="background: white; color : black;">배송</option>
				        <option value="4" style="background: white; color : black;">상품</option>
				        <option value="5" style="background: white; color : black;">신고</option>	
				        <option value="6" style="background: white; color : black;">게시글</option>
				        <option value="7" style="background: white; color : black;">포인트</option>
				</select>
				<br /><br /><br />
				<input type="text" class="form-control" placeholder="제목" name="ftitle" id="fTitle" required>
				<br />
			    <textarea class="form-control" style="height:300px" name="fcontents" placeholder="내용" required></textarea>
				<br />
				<input type="submit" class="btn btn-outline-success" value="등록" >
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
</body>
</html>