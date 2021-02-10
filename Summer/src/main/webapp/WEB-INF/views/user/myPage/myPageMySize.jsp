<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="lookbook" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - MyPage</title>
	<meta charset="utf-8">
    <style>
    	
    	
    	#myMenu5 {
    		background : #88c8bc;
    		color : white;
    	}
    	
    	.Btn {
    		width : 200px;
    		height : 40px;
    		background : white;
    		border : 1px solid #88c8bc;
    		border-radius : 5px;
    		font-size : 18px;
    	}
    	
    	.Btn:hover {
    		cursor : pointer;
    		background : #88c8bc;
    		color : white;
    		transition : 0.4s;
    	}
    	
    	.IMG {
    		width : 500px;
    	}
    	
    	#BG {
    		width : 100%;
    		padding : 5%;
    		background-image : url('${pageContext.request.contextPath}/resources/user/images/mysize/background-color.jpg');
    	}
    	
    	#BG input {
    		width : 120px;
    		text-align : right;
    	}
    	
    	#BG span {
    		font-size : 16px;
    	}
    
    </style>
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		<c:import url="/WEB-INF/views/user/myPage/myPageMenu.jsp"/>

		<div class="row row-pb-lg justify-content-md-center">
			<div class="col-md-11" style="border-bottom : 3px solid #88c8bc;">
				<h2 style="text-align:center;">마이사이즈</h2>
			</div>
		</div>
		<br>
		<div class="container" id="BG">
			<div class="row justify-content-md-center">
				<div class="col text-center">
					<button type="button" class="Btn" id="topBtn">상의</button>
					<button type="button" class="Btn" id="bottomBtn">하의</button>
				</div>
			</div>
		<!-- 상의 -->
			<div class="container" id="Top">
				<div class="row align-items-center" style="margin-top:50px;">
					<div class="col-md-8 text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/mysize/top-size.jpg" class="IMG"/>
					</div>
					<div class="col-md-4">
						<div class="col text-right">
							<form action="${pageContext.request.contextPath}/myPage/insertMySize.do" id="saveTop">
							<input type="hidden" name="sort" value="top" />
								<div class="col">
									<span>총장</span>
									<c:choose>
										<c:when test="${ !empty topSize }"><input type="text" name="total" id="t_total" value="${ topSize.total }" maxlength="3"/> cm</c:when>
										<c:otherwise><input type="text" name="total" id="t_total" maxlength="3"/> cm</c:otherwise>
									</c:choose>
								</div>
								<br>
								<div class="col">
									<span>어깨너비</span>
									<c:choose>
										<c:when test="${ !empty topSize }"><input type="text" name="shoulder" id="shoulder" value="${ topSize.shoulder }" maxlength="3"/> cm</c:when>
										<c:otherwise><input type="text" name="shoulder" id="shoulder" maxlength="3"/> cm</c:otherwise>
									</c:choose>
								</div>
								<br>
								<div class="col">
									<span>가슴단면</span>
									<c:choose>
										<c:when test="${ !empty topSize }"><input type="text" name="chest" id="chest" value="${ topSize.chest }" maxlength="3"/> cm</c:when>
										<c:otherwise><input type="text" name="chest" id="chest" maxlength="3"/> cm</c:otherwise>
									</c:choose>
								</div>
								<br>
								<div class="col">
									<span>소매길이</span>
									<c:choose>
										<c:when test="${ !empty topSize }"><input type="text" name="sleeve" id="sleeve" value="${ topSize.sleeve }" maxlength="3"/> cm</c:when>
										<c:otherwise><input type="text" name="sleeve" id="sleeve" maxlength="3"/> cm</c:otherwise>
									</c:choose>
								</div>
							</form>
						</div>
					</div>
				</div>
				<br><br>
				<div class="row justify-content-md-center">
					<div class="col text-center">
						<button type="button" class="Btn" onclick="fn_saveTop();">저장</button>
					</div>
				</div>
			</div>
			
		<!-- 하의 -->
			<div class="container" id="Bottom" style="display:none;">
				<div class="row align-items-center" style="margin-top:50px;">
					<div class="col-md-8 text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/mysize/pants-size.jpg" class="IMG"/>
					</div>
					<div class="col-md-4">
						<div class="col text-right">
							<form action="${pageContext.request.contextPath}/myPage/insertMySize.do" id="saveBottom">
							<input type="hidden" name="sort" value="pants" />
								<div class="col">
									<span>총장</span>
									<c:choose>
										<c:when test="${ !empty pantsSize }"><input type="text" name="total" id="b_total" value="${ pantsSize.total }" maxlength="3"/> cm</c:when>
										<c:otherwise><input type="text" name="total" id="b_total" maxlength="3"/> cm</c:otherwise>
									</c:choose>
								</div>
								<br>
								<div class="col">
									<span>허리단면</span>
									<c:choose>
										<c:when test="${ !empty pantsSize }"><input type="text" name="waist" id="waist" value="${ pantsSize.waist }" maxlength="3"/> cm</c:when>
										<c:otherwise><input type="text" name="waist" id="waist" maxlength="3"/> cm</c:otherwise>
									</c:choose>
								</div>
								<br>
								<div class="col">
									<span>허벅지단면</span>
									<c:choose>
										<c:when test="${ !empty pantsSize }"><input type="text" name="thigh" id="thigh" value="${ pantsSize.thigh }" maxlength="3"/> cm</c:when>
										<c:otherwise><input type="text" name="thigh" id="thigh" maxlength="3"/> cm</c:otherwise>
									</c:choose>
								</div>
								<br>
								<div class="col">
									<span>밑위</span>
									<c:choose>
										<c:when test="${ !empty pantsSize }"><input type="text" name="rise" id="rise" value="${ pantsSize.rise }" maxlength="3"/> cm</c:when>
										<c:otherwise><input type="text" name="rise" id="rise" maxlength="3"/> cm</c:otherwise>
									</c:choose>
								</div>
								<br>
								<div class="col">
									<span>밑단단면</span>
									<c:choose>
										<c:when test="${ !empty pantsSize }"><input type="text" name="hem" id="hem" value="${ pantsSize.hem }" maxlength="3"/> cm</c:when>
										<c:otherwise><input type="text" name="hem" id="hem" maxlength="3"/> cm</c:otherwise>
									</c:choose>
								</div>
							</form>
						</div>
					</div>
				</div>
				<br><br>
				<div class="row justify-content-md-center">
					<div class="col text-center">
						<button type="button" class="Btn" onclick="fn_saveBottom();">저장</button>
					</div>
				</div>
			</div>
			
		</div>
			
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	<script>
		function fn_saveTop() {
			if( $('#t_total').val() == "" ) {
				alert("총장을 입력해주세요.");
				$('#t_total').focus();
				return false;
			}

			if( $('#shoulder').val() == "" ) {
				alert("어깨너비를 입력해주세요.");
				$('#shoulder').focus();
				return false;
			}

			if( $('#chest').val() == "" ) {
				alert("가슴단면을 입력해주세요.");
				$('#chest').focus();
				return false;
			}

			if( $('#sleeve').val() == "" ) {
				alert("소매길이을 입력해주세요.");
				$('#sleeve').focus();
				return false;
			}
			$('#saveTop').submit();
		}

		function fn_saveBottom() {
			if( $('#b_total').val() == "" ) {
				alert("총장을 입력해주세요.");
				$('#b_total').focus();
				return false;
			}

			if( $('#waist').val() == "" ) {
				alert("허리단면을 입력해주세요.");
				$('#waist').focus();
				return false;
			}

			if( $('#thigh').val() == "" ) {
				alert("허벅지단면을 입력해주세요.");
				$('#thigh').focus();
				return false;
			}

			if( $('#rise').val() == "" ) {
				alert("밑위를 입력해주세요.");
				$('#rise').focus();
				return false;
			}
			if( $('#hem').val() == "" ) {
				alert("밑단단면을 입력해주세요.");
				$('#hem').focus();
				return false;
			}
			$('#saveBottom').submit();
		}

		$('#topBtn').on('click', function(){
			$('#Top').show();
			$('#Bottom').hide();
		});

		$('#bottomBtn').on('click', function() {
			$('#Bottom').show();
			$('#Top').hide();
		});
	</script>

	</body>
</html>

