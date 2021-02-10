<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세보기</title>
<c:import url="../common/header.jsp"/>
<style>
</style>


</head>
<body>
<div class="container">
	<div class="row">
		<div class="col">
			<h2 style="margin-left:3%;">고객센터</h2>
		</div>
	</div>
	<br>
	<div class="col" style="text-align:center;"><h3>1:1문의 상세조회</h3></div>
	<div id="container" style="background:white; border: 2px solid black; padding:5%">
		<div id="question-container">
			<tr>문의번호</tr>
			<input type="text" class="form-control" placeholder="문의번호" name="questionQno" id="questionQno" value="${question.qno}" readonly required> &nbsp;
			<tr>작성자</tr>
		    <input type="text" class="form-control" placeholder="작성자" name="questionWriter" value="${question.userid}" readonly required> &nbsp;
		    <tr>작성일</tr>
		    <input type="text" class="form-control" placeholder="작성일" name="questionQdate" id="questionQdate" value="${question.qdate}" readonly required>
		</div>
		<div>
			<tr>문의제목</tr>
			<input type="text" class="form-control" placeholder="문의제목" name="questionTitle" id="questionTitle" value="${question.qtitle}" style="width:100%;" readonly required>
		</div>
		<div>
			<tr>문의내용</tr>
			<input type="text" class="form-control" placeholder="문의내용" name="questionQcontents" value="${question.qcontents}" style="width:100%; height:200px;" readonly required>
		</div>
		<br><br>
	<div style="border-bottom:1px solid black;"></div>
	<br><br>

	
	<article>
		<div class="container" role="main">
			<div style="text-align:center; width:90%;">
				<h3>문의사항 답변</h3>
			</div>
			<form name="form" id="replySubmit" role="form" method="post" action="${pageContext.request.contextPath}/admin/customerService/replyQuestion.do?qno=${question.qno}"> 
				<div class="mb-3">
					<span>답변등록</span>
					<textarea class="form-control" style="width:64%; height:200px; resize:none;" name="content" id="content" placeholder="답변을 입력해 주세요" ></textarea>
					
				</div>
			</form>
			<div >
				<button type="button" class="btn btn-sm btn-primary" onclick="fn_submit();">답변등록</button>
				<button type="button" class="btn btn-sm btn-primary" onclick="fn_cancle();">목록</button>
			</div>
		</div>
	</article>
	<br /><br />
	
	<h3>답변 등록 내역</h3>
	<div>
		<input type="text" class="form-control" placeholder="답변을 등록해 주세요" name="questionAcontents" value="${question.acontents}" style="width:72%; height:200px;" readonly required>
		<button type="button" id="btnDelete">삭제</button>
	</div>
	
	</div>
	
	<br><br><br><br><br><br><br><br><br>
	
	<script>
		function fn_submit() {
			if(confirm("등록하시겠습니까?")) {
				$('#replySubmit').submit();
			}
		}

		function fn_cancle() {
			if(confirm("목록으로 돌아가시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/admin/customerService/customerService.do";
			}
		}
		$("#btnDelete").click(function(){
			var qno = $('#questionQno').val();
			if(confirm("답변을지우시겠습니까?")){
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/customerService/answerDelete",
				data : {qno:qno},
				success: function(data){
							if(data.result == true){
								alert("삭제되었습니다");
							} else {
								alert("삭제 실패");
							}
					}
				});
			}
		});
	</script>
	<!-- 	function fn_delete() {
			var msg = confirm("답변을지우시겠습니까?");
			if(msg = true) {
				answerDelete(acontents);
				} else {
					return false;
					}
			} -->
	
</body>
</html>