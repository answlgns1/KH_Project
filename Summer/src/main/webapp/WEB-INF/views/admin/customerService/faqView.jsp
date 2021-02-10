<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 상세보기</title>
<style>
</style>


</head>
<body>
	<c:import url="../common/header.jsp"/>

	<div class="container">
		<div class="row">
			<div class="col">
				<h2 style="margin-left:3%;">자주묻는질문</h2>
			</div>
		</div>
		<br>
		<div class="col" style="text-align:center;"><h3>FAQ 상세조회</h3></div>
			<div id="container" style="background:white; border: 2px solid black; padding:5%">
				<div id="question-container">
					<tr>FAQ 번호</tr>
					<input type="text" class="form-control" placeholder="FAQ 번호" name="faqQno" id="faqQno" value="${faq.fno}" readonly required> &nbsp;
					<tr>FAQ 유형 번호</tr>
				    <input type="text" class="form-control" placeholder="FAQ 유형 번호" name="Writer" value="${faq.qtypeno}" readonly required> &nbsp;
				    <tr>작성일</tr>
				    <input type="text" class="form-control" placeholder="작성일" name="faqFdate" id="faqFdate" value="${faq.fdate}" readonly required>
				</div>
				<div>
					<tr>FAQ 제목</tr>
					<input type="text" class="form-control" placeholder="FAQ 제목" name="faqFtitle" id="faqFtitle" value="${faq.ftitle}" style="width:100%;" readonly required>
				</div>
				<div>
					<tr>FAQ 내용</tr>
					<input type="text" class="form-control" placeholder="FAQ 내용" name="faqFcontents" value="${faq.fcontents}" style="width:100%; height:200px;" readonly required>
				</div>
				<br><br>
				<button type="button" class="btn btn-sm btn-primary" onclick="fn_cancle();">목록</button>
				<button type="button" class="btn btn-sm btn-primary" onclick="fn_delete(${faq.fno});">삭제</button>
				
				<!-- <button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button> -->
				<div style="border-bottom:1px solid black;"></div>
				<br><br>
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
	
	<script>
		function fn_cancle() {
			if(confirm("목록으로 돌아가시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/admin/customerService/faqList.do";
			}
		}

		function fn_delete(fno) {
			if(confirm('삭제하시겠습니까?')){
				location.href="${pageContext.request.contextPath}/admin/customerService/faqDelete.do?fNo="+fno;
			}
		}
	</script>

</body>
</html>