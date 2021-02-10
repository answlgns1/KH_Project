<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 관리</title>
	
	<style>
		/*FAQ작성버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
		
		/*페이징 css*/
		.block-27 ul, .block-27 ul li {
	  		padding: 0;
	  		margin: 0;
	  		list-style: none;
  		}

		.block-27 ul li {
		  display: inline-block;
		  margin-bottom: 4px;
		}
  		.block-27 ul li a, .block-27 ul li span {
		    text-align: center;
		    display: inline-block;
		    width: 40px;
		    height: 40px;
		    line-height: 40px;
		    border-radius: 50%;
		    border: 1px solid #ccc;
		}
  		.block-27 ul li.active a, .block-27 ul li.active span {
		    background: #616161;
		    color: #fff;
		    border: 1px solid transparent;
		}
	</style>
	
</head>

<body>
	<c:import url="../common/header.jsp"/>
	<div id="container" style="background:white; border: 2px solid black; padding:5%" >
		<div class="col" style="text-align:center;"><h3>공지사항 관리 게시판</h3></div>
		<input type="button" value="공지사항작성" id="btn-add" class="btn btn-outline-success" onclick="fn_gonoticeForm();"/>
		<section id="question-container" class="container">
			<p>총 ${totalContents}건의 문의사항이 있습니다.</p>
			<table id="tbl-question" class="table table-striped table-hover">
				<tr>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${list}" var="b"> 
				<tr id="${b.BO}">
					<td>${b.BTITLE}</td>
					<c:set var="bDate" value="${ b.BDATE }"/>
					<td>${ fn:substring(bDate, 0, 10) }</td>
				</tr>
				</c:forEach>
			</table>
				<!-- 페이징 처리 사직-->
				<div class="row">
					<div class="span12">
						<div class="block-27" style="text-align:center;">
							<c:out value="${pageBar}" escapeXml="false"/>
		            	</div>
					</div>
				</div>
				<!-- 페이징 처리 끝-->
		</section> 
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

	// 문의사항
	$(function(){
		$("tr[id]").on("click",function(){
			var BNO = $(this).attr("id");
			console.log("BNO="+BNO);
			location.href = "${pageContext.request.contextPath}/admin/community/noticeView.do?no="+BNO;
		});
	});

	function fn_gonoticeForm(){
		location.href = "${pageContext.request.contextPath}/admin/community/noticeForm.do";
	}

	$(function() {
		var navBtn = $('#admin_community');
		var otherBtn = $('#admin_main');
		$(otherBtn).removeClass("active");
		$(navBtn).addClass("active");
    })
	</script>
</body>
</html>