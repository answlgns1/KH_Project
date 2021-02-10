<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
	<style>
		#mList, #aList {
			width : 200px;
			height : 40px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 18px;
		}
		
		#aList {
			background : #88c8bc;
			color : white;
		}
		
		#mList:hover , #aList:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
		}
		
		#msList li:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
			cursor : pointer;
		}
		
		#mStatus li:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
			cursor : pointer;
		}
		
		#insertBtn {
			background : white;
			color : #88c8bc;
			width : 30%;
			height : 30px;
			border : 1px solid black;
			border-radius : 5px;
			margin-right : 10px;
		}
		
		#insertBtn:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
		}
		
		#adminListBox {
			border:1px solid black;
			border-radius : 0px 0px 30px 30px;
			background:white;
			box-shadow : 10px 10px 20px 5px grey;
		}
		
	</style>
</head>
<body>

<c:import url="../common/header.jsp"/>
<div class="main">
	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span12">
					<h1><i class="shortcut-icon icon-user"></i> 회원관리</h1>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="span8 offset2" style="text-align:center;">
					<button type="button" id="mList">회원목록</button>
					<button type="button" id="aList">관리자목록</button>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="span12" id="adminListBox">
					<div class="row">
						<div class="span12" style="background:#e2e2e2; padding:10px 0 10px 0; border-bottom:1px solid black;">
							<div class="span2" style="text-align:center;">
								아이디
							</div>
							<div class="span2" style="text-align:center;">
								이름
							</div>
							<div class="span2" style="text-align:center;">
								이메일
							</div>
							<div class="span2" style="text-align:center;">
								생성일자
							</div>
							<div class="span1" style="text-align:center;">
								계정상태
							</div>
							<div class="span2" style="text-align:center;">
								삭제일자
							</div>
						</div>
					</div>
					<c:if test="${ !empty admins }">
						<c:forEach items="${ admins }" var="a">
							<div class="row">
								<div class="span12" style="padding:10px 0 10px 0; border-bottom : 1px solid grey;">
									<div class="span2" style="text-align:center;">
										${ a.USERID }
									</div>
									<div class="span2" style="text-align:center;">
										${ a.USERNAME }
									</div>
									<div class="span2" style="text-align:center;">
										${ a.EMAIL }
									</div>
									<div class="span2" style="text-align:center;">
										<c:set var="eDate" value="${ a.ENROLLDATE }"/>
										<span>${ fn:substring(eDate, 0, 10) }</span>
									</div>
									<div class="span1 btn-group" style="text-align:center;">
										<button class="btn dropdown-toggle" data-toggle="dropdown" style="width:100%;">${ a.MSTATUS }</button>
										<ul class="dropdown-menu" id="mStatus">
											<li onclick="mStatusUpdate(this, '${ a.USERID }', 'Y')">Y</li>
											<li onclick="mStatusUpdate(this, '${ a.USERID }', 'N')">N</li>
										</ul>
									</div>
									<div class="span2" style="text-align:center;">
										<c:choose>
											<c:when test="${ !empty a.DELETEDATE }">
												<c:set var="dDate" value="${ a.DELETEDATE }"/>
												<span>${ fn:substring(dDate, 0, 10) }</span>
											</c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					<br>
					<!-- 페이징 처리 시작-->
					<div class="row" style="margin: 10px 0 20px 0;">
						<div class="span12">
							<div class="block-27" style="text-align:center;">
								<c:out value="${pageBar}" escapeXml="false"/>
					        </div>
						</div>
					</div>
					<!-- 페이징 처리 끝-->
					</c:if>
					<c:if test="${ empty admins }">
						<div class="row">
							<div class="span12" style="text-align:center; margin:30px">
								<h2>관리자정보가 존재하지 않습니다.</h2>
							</div>
						</div>
					</c:if>
					
					<!-- 검색 시작 -->
					<div class="row">
						<div class="span4 offset4" style="text-align:center;">
							<form action="${pageContext.request.contextPath}/admin/selectAdminSearch.do" id="Search">
								<select name="searchCt" class="btn" style="border-radius:10px; width:100px; height:35px;">
									<option value="all" style="background: white; color : black;">전체</option>
									<option value="id" style="background: white; color : black;">아이디</option>
									<option value="name" style="background: white; color : black;">이름</option>
								</select>
								<input type="search" id="search" name="search" placeholder="Search" style="border-radius: 30px; width:180px; height:26px; margin-top:8px;">
								<button class="btn" type="submit" style="border-radius:30px; height:35px; background:#88c8bc; color:white;"><i class="icon-search"></i></button>
							</form>
						</div>
						<c:if test="${ member.userId eq 'admin' }">
							<div class="span4" style="text-align:right;">
								<button type="button" id="insertBtn">관리자등록</button>
							</div>
						</c:if>
					</div>
					<!-- 검색 끝 -->
				</div>
			</div>
			<!-- /row --> 
		</div>
		<!-- /container -->
		<br><br>
	</div>
	<!-- /main-inner --> 
</div>
<!-- /main -->
<div class="extra">
  <div class="extra-inner">
    <div class="container">
      <div class="row">
                    <div class="span3">
                        <h4>
                            About Free Admin Template</h4>
                        <ul>
                            <li><a href="javascript:;">EGrappler.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="">Open Source jQuery Plugins</a></li>
                            <li><a href="">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="">Free Contact Form Plugin</a></li>
                            <li><a href="">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /extra-inner --> 
</div>
<!-- /extra -->
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
<!-- /footer -->
	
	<script>
		$(function() {
			var navBtn = $('#admin_member');
			var otherBtn = $('#admin_main');
			$(otherBtn).removeClass("active");
			$(navBtn).addClass("active");
	    });

	    <!-- 계정상태 변경 -->
	    function mStatusUpdate(obj, userId, mstatus) {
		    if(confirm("관리자계정의 상태를 변경하시겠습니까?")) {
		    	$.ajax({
					url : "${pageContext.request.contextPath}/admin/mStatusUpdate.do",
					data : {'userId' : userId, 'mstatus' : mstatus},
					success : function(data){
						var mStatus = '';
						switch(mstatus){
						case 'Y' :
							mStatus = 'Y';
							break;
						case 'N':
							mStatus = 'N';
							break;
						case 'X' :
							alert("관리자계정 상태 변경 실패");
							break;
						default :
							alert("에러가 발생했습니다!! 관리자에게 문의하세요.");
						}
						$(obj).parent().siblings('button').text(mStatus);
					}
				});
			}
		}

	    $('#mList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/selectMemberList.do";
		});

		$('#aList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/selectAdminList.do";
		});

		$('#search').keydown(function(e) {
			if(e.keyCode == 13) {
				$('#Search').submit();
			}
		});

		$('#insertBtn').on('click', function() {
			if(confirm("관리자를 등록하시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/admin/insertAdmin.do";
			}
		});
	</script>
</body>
</html>