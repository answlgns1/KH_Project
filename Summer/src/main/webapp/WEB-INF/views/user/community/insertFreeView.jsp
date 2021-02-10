<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="community" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - COMMUNITY</title> 
	<meta charset="utf-8">
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
						<p class="bread"><span><a href="${pageContext.request.contextPath}/community/selectCommunityMain.do">Community</a></span> / <span>Free</span></p>
					</div>
				</div>
				<h1>게시글 작성</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>

		<div class="colorlib-product" style="margin-top:-80px; clear: both;">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col" >
						<div style="padding : 10px; margin-bottom : 10px;">
						<!-- 폼 시작 -->
							<form id="freeBoard" action="${pageContext.request.contextPath}/community/insertFreeEnd.do" method="post" onsubmit="return fn_submit();" enctype="multipart/form-data">
								<!-- 게시글정보 시작 -->
								<input type="hidden" name="userId" value="${member.userId}" required>
								<table style="width : 100%">
									<tr>
										<td><input type="text" id="title" name="bTitle" placeholder="제목을 입력해주세요" required style="width : 100%"/></td>
									</tr>
									<tr>
										<td><br /><textarea rows="20" id="contents" name="bContents" placeholder="내용을 입력해주세요" required style="width : 100%"></textarea></td>
									</tr>
									<tr>
										<td>파일첨부 <img id="imageTag0" width="100" height="100" onclick="clickFile(0);"></td>
									</tr>
									<tr>
										<td style="text-align: center;">
										<br />
											<button type="submit" class="btn btn-primary thema">등록</button>
											<button type="button" class="btn btn-primary thema" onclick="fn_cancel();">취소</button>							
										</td>
									</tr>
								</table>
								<!-- 게시글정보 끝 -->
								<!-- 첨부파일 시작 -->
								<div id="fileArea">
									<input type="file" name="imageFile" id="imageFile0" onchange="loadImg(this, 0)"/>
								</div>
								<!-- 첨부파일 끝 -->
							</form>
							<!-- 폼 끝 -->
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
		
	<script>
		var fileIndex = 1;
		
		$(function(){
			$('#fileArea').hide();
		});

		// 이미지 클릭 시 파일추가 클릭
		function clickFile(idx){
			// 이미지가 없으면 추가, 있으면 삭제
			if($($('#imageTag'+idx)).attr('src') == undefined){
				$('#imageFile'+idx).click();
			} else {
				if(confirm("삭제하시겠습니까?")){
					$($('#imageTag'+idx)).detach();
					$($('#imageFile'+idx)).detach();
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
				$('#imageTag'+num).parent().append('<img id="imageTag'+fileIndex+'" width="100" height="100" onclick="clickFile('+fileIndex+');">');
				$('#imageFile'+num).parent().append('<input type="file" name="imageFile" id="imageFile'+fileIndex+'" onchange="loadImg(this, '+fileIndex+')"/>');
				fileIndex++;
			}
		}

		function fn_submit() {
			if($('#contents').val().trim().length==0){
				alert('게시글 내용을 입력해주세요.');
				return false;
			}
			return confirm('등록 하시겠습니까?');
		}

		function fn_cancel() {
			if(confirm('작성 취소하시겠습니까?')) {
				location.href='${pageContext.request.contextPath}/community/selectFreeList.do?';
			}
		}
		
	</script>
	
	</body>
</html>

