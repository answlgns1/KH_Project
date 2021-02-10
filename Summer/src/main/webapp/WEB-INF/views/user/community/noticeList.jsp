<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 메인</title>

</head>
<body>
	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	<div id="container" style="background:white; padding:5%" >
		<section id="question-container" class="container">
			<table id="tbl-question" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>공지사항</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody id="tb">
					<c:forEach items="${list}" var="b"> 
						<tr id="${b.BNO}">
							<td>${b.BTITLE}</td>
							<c:set var="qDate" value="${ b.BDATE }"/>
							<td>${ fn:substring(bDate, 0, 10) }</td>
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
			var QNO = $(this).attr("id");
			location.href = "${pageContext.request.contextPath}/community/noticeView.do?no="+BNO;
		});
	});
	</script>
	
</body>
</html>