<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="lookbook" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - LOOKBOOK</title>
	<meta charset="utf-8">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <style>
    	.img-thumbnail {
    		width : 300px;
    		height : auto;
    		margin : 30px 30px 30px 50px;
    	}
    	
    	#title {
    		margin-left : 10%;
    		margin-top : 5%;
    		padding : 8px;
    		text-align : center;
    		border-radius : 5px;
    		background : #88c8bc;
    		width : 80%;
    	}
    	
    	#title>input {
    		border-radius : 5px;
    		width : 95%;
    	}
    	
    	#content {
    		margin-left : 10%;
    		padding : 20px;
    		background : #88c8bc;
    		border-radius : 5px;
    		width : 80%;
    		height : 300px;
    	}
    	
    	#content>div:first-child {
    		border : 1px solid black;
    		border-radius : 5px;
    		text-align : center;
    		background : white;
    	}
    	
    	#content>div:nth-child(2n) {
    		margin-top : 10px;
    	}
    	
    	#box2 {
    		text-align : center;
    	}
    	
    	.img-rounded:hover, .img-thumbnail:hover {
    		cursor : pointer;
    	}
    	
    	#imageTag0 {
    		width : 300px;
    		height : 400px;
    	}
    </style>
	</head>
	<body>
		
	<div class="colorlib-loader"></div>
	
	<div id="page">
	
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		
		<!-- 상단 페이지 정보 -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>LookBook</span></p>
					</div>
				</div>
				<h1>Lookbook 수정</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		<div class="colorlib-product" style="margin-top:-80px;" >
			<div class="container">
			<form action="${pageContext.request.contextPath}/lookbook/LookbookUpdateEnd.do" id="updateLookbook" method="post" enctype="multipart/form-data">
				<div class="row row-pb-md">
					<div class="col">
						<div class="col-md-12">
						<input type="hidden" name="bNo" value="${ list.BNO }"/>
							<div class="col-md-4" id="thumbImg">
								<img id="imageTag0" onclick="clickFile(0);" class="img-thumbnail" src="${pageContext.request.contextPath}${ list.FILEPATH }${ list.NEWFILENAME }">
							</div>
							<div class="col-md-8" style="display:inline-block;">
								<div id="title">
									<input type="text" name="bTitle" value="${ list.BTITLE }" placeholder="제목을 입력해주세요."/>
								</div>
								<br>
								<div id="content">
									<div>
										설명
									</div>
									<div>
										<textarea name="bContents" style="resize:none; width:100%; height:220px;" placeholder="설명을 입력해주세요.">${ list.BCONTENTS }</textarea>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<div style="text-align:center; border:2px solid #E2E2E2;">
					<h2>파일 첨부</h2>
				</div>
				<br /><br />
				<div id="image1">
					<c:forEach items="${ attach }" var="at" begin="0" varStatus="status">
						<img id="imageTag${ status.count }" class="img-rounded" onclick="clickFile(${ status.count });" src="${pageContext.request.contextPath}${ at.FILEPATH }${ at.NEWFILENAME }" width="200" height="267">
					</c:forEach>
				</div>
				<br /><br />
				<hr />
				<div class="row">
					<div class="col-md-12">
						<div id="box2"">
							<div style="text-align:right;">
								<button type="button" class="btn btn-danger thema" onclick="fn_delete();">삭제하기</button>
							</div>
							<button type="button" class="btn btn-primary thema" onclick="fn_submit();">수정하기</button>
							<button type="button" class="btn btn-primary thema" onclick="fn_cancel();">취소하기</button>
						</div>
					</div>
				</div>
				<!-- 첨부파일 시작 -->
				<div id="fileArea">
					<c:forEach items="${ attach }" var="at" begin="0" varStatus="status">
						<input type="file" name="imageFile" class="orgImage" id="imageFile${ status.count }" onchange="loadImg(this, ${ status.count })"/>
					</c:forEach>
				</div>
				<!-- 첨부파일 끝 -->
			</form>
			</div>
		</div>

		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	<script>
		var fileIndex = $('.orgImage').length+1;
		
		$(function(){
			$('#fileArea').hide();
		});

		$(function(){
//			$('#thumbImg').append('<img id="imageTag0" onclick="clickOriginFile(0, ${ list.ANO }, ${ list.NEWFILENAME });" class="img-thumbnail" src="${pageContext.request.contextPath}${ list.FILEPATH }${ list.NEWFILENAME }">');
			$('#thumbImg').append('<input type="file" name="imageFile" id="imageFile0" onchange="loadImg(this, 0)" style="display:none"/>');
		});

		$(function(){
			$('#image1').append('&nbsp;<img id="imageTag'+fileIndex+'" width="200" height="267" class="img-rounded" onclick="clickFile('+fileIndex+');">');
			$('#fileArea').append('<input type="file" name="imageFile" id="imageFile'+fileIndex+'" onchange="loadImg(this, '+fileIndex+')"/>');
			fileIndex++;
		});
		
		function clickFile(idx){
			// 이미지가 없으면 추가, 있으면 삭제
			if($($('#imageTag'+idx)).attr('src') == undefined){
				$('#imageFile'+idx).click();
			} else {
				if(idx != 0){
					if(confirm("첨부파일을 삭제하시겠습니까?")){
						$($('#imageTag'+idx)).detach();
						$($('#imageFile'+idx)).detach();
					}
				} else {
					$('#imageTag0').removeAttr('src');
					$('#imageFile0').click();
				}
			}
		}

		// 파일 선택 시 이미지 불러오기
		function loadImg(img, num){
			if(img.files && img.files[0]) {
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					
					$($('#imageTag'+num)).attr('src', e.target.result);
				}
				reader.readAsDataURL(img.files[0]);
				// 파일을 불러왔으면 태그 추가
				// $('.imageArea').parent().append($($imageTag).clone(true));
				
				if( num == 0 ) {
					if($($('#imageTag1')).attr('src') == undefined) {
						$('#image1').append('<img id="imageTag'+fileIndex+'" width="200" height="267" class="img-rounded" onclick="clickFile('+fileIndex+');">')
						$('#imageFile'+num).parent().append('<input type="file" name="imageFile" id="imageFile'+fileIndex+'" onchange="loadImg(this, '+fileIndex+')"/>');
					}
				} else {
					$('#imageTag'+num).parent().append('&nbsp;<img id="imageTag'+fileIndex+'" width="200" height="267" class="img-rounded" onclick="clickFile('+fileIndex+');">');
					$('#imageFile'+num).parent().append('<input type="file" name="imageFile" id="imageFile'+fileIndex+'" onchange="loadImg(this, '+fileIndex+')"/>');
				}
				
				
				fileIndex++;
			}
		}

	<!-- 
		function fn_submit() {
			if($('.img-rounded').length > 1) {
				if(confirm('수정 하시겠습니까?')) {
					$('#updateLookbook').submit();
				}
			} else {
				alert("이미지가 한 장 이상 있어야합니다.");
				return false;
			}
		}
	 -->

		function fn_cancel() {
			if(confirm('작성 취소하시겠습니까?')) {
				location.href='${pageContext.request.contextPath}/lookbook/selectLookbookList.do?';
			}
		}

		function fn_delete() {
			if(confirm('게시글을 삭제하시겠습니까?')) {
				location.href='${pageContext.request.contextPath}/lookbook/deleteLookbook.do?bno=${list.BNO}';
			}
		}
		
	</script>
	
	</body>
</html>

