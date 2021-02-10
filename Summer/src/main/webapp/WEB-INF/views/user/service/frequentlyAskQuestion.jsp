<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 자주묻는질문</title>
<style>
	/*자주묻는질문작성버튼*/
	input#btn-add{float:right; margin: 0 0 20px;}
</style>
<script>
	function fn_goFaqForm(){
		location.href = "${pageContext.request.contextPath}/service/frequentlyAskQuestionForm.do";
	}
</script>
</head>
<body>

	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	<br />
		<div id="container" style="background:white; padding:5%" >
		<section id="question-container" class="container">
		<c:if test="${ member.membership == 'A' }">
			<input type="button" value="자주묻는질문답변작성" id="btn-add" class="btn btn-outline-success" onclick="fn_goFaqForm();"/>		
		</c:if>
			<table id="tbl-question" class="table table-striped table-hover">
			<h3>자주묻는질문</h3>
				<thead>
					<tr>
						<th>FAQ</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody id="tb">
					<c:forEach items="${list}" var="f"> 
						<tr id="${f.FNO}">
							<td>${f.FTITLE}</td>
							<c:set var="fDate" value="${ f.FDATE }"/>
							<td>${ fn:substring(fDate, 0, 10) }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
        	
				<!-- 페이징 처리 사직-->
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="block-27">
							<c:out value="${pageBar}" escapeXml="false"/>
		            	</div>
					</div>
				</div>
				<!-- 페이징 처리 끝-->
			</section>
		</div>
		
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>

	<script>
	$(function(){
		$("#tb tr").on("click",function(){
			var FNO = $(this).attr("id");
			location.href = "${pageContext.request.contextPath}/service/frequentlyAskQuestionView.do?no="+FNO;
		});
	});
	</script>
	
</body>
</html>