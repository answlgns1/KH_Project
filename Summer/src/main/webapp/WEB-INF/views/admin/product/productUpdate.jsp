<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품수정</title>
	<style>
		#pList, #addProduct, #ioList {
			width : 200px;
			height : 40px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 18px;
		}
		
		#pList {
			background : #88c8bc;
			color : white;
		}
		
		#pList:hover , #addProduct:hover, #ioList:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
		}
		
		#oListBox {
			border:1px solid black;
			border-radius : 0px 0px 30px 30px;
			background:white;
			box-shadow : 10px 10px 20px 5px grey;
		}
		
		#btnGroup button {
			width : 200px;
			height : 38px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 17px;
		}
		
		#btnGroup button:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
		}
		
		.img-rounded:hover, .img-thumbnail:hover {
    		cursor : pointer;
    	}
    	
    	.img-rounded {
    		width : 200px;
    		height : 250px;
    	}
    	
    	.img-thumbnail {
    		width : 280px;
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
					<h1><i class="shortcut-icon icon-shopping-cart"></i> 상품관리</h1>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="span8 offset2" style="text-align:center;">
					<button type="button" id="pList">상품목록</button>
					<button type="button" id="addProduct">상품등록</button>
					<button type="button" id="ioList">입출고관리</button>
				</div>
			</div>
			<br>
			<form action="${pageContext.request.contextPath}/admin/productUpdateEnd.do" id="pUpdateEnd" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="span12" id="oListBox">
					<p style="margin:2% 0% 0% 7%;">No.${ product.PCODE }</p>
					<input type="hidden" name="pCode" value="${ product.PCODE }"/>
					<div class="row" style="margin-left:1%;padding:3%;">
						<div class="span4" style="text-align:center;">
							<div style="padding:5px; border:2px solid grey; width:285px;" id="thumbImg">
								<img id="imageTag0" onclick="clickFile(0);" class="img-thumbnail" src="${pageContext.request.contextPath}${product.FILEPATH}${product.NEWFILENAME}"/>
							</div>
						</div>
						<div class="span6">
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품명
								</div>
								<div style="width:100%; font-size:14px; text-align:center; padding:2% 0% 2% 0%;">
									<input type="text" name="pName" value="${ product.PNAME }"/>
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품설명
								</div>
								<div style="width:100%; font-size:14px; text-align:center; padding:2% 0% 2% 0%;">
									<input type="text" name="pDescription" value="${ product.PDESCRIPTION }"/>
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									보유중인 상품수량
								</div>
								<div style="width:100%; font-size:14px; text-align:center; padding:2% 0% 2% 0%;">
									${ product.PSTOCK } 개
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품 가격
								</div>
								<div style="width:100%; font-size:14px; text-align:center; padding:2% 0% 2% 0%;">
									<input type="text" name="pPrice" value="${ product.PPRICE }"/>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="span10 offset1" style="text-align:center;">
							<div style="border:1px solid #e2e2e2; padding:1%; font-size:16px;">
								상품 이미지
							</div>
							<div id="image1">
								<c:forEach items="${ attachment }" var="a" begin="0" varStatus="status">
									<img id="imageTag${ status.count }" class="img-rounded" onclick="clickFile(${ status.count });" src="${pageContext.request.contextPath}${ a.FILEPATH }${ a.NEWFILENAME }">
								</c:forEach>
							</div>
						</div>
					</div>
					<hr>
					<div class="row" style="margin:3% 0% 2% 0%;">
						<div class="span12" style="text-align:center;" id="btnGroup">
							<button type="button" class="btn" onclick="fn_update();">수정하기</button> &nbsp; &nbsp;
							<button type="button" class="btn" onclick="fn_goBack();">취소하기</button>
						</div>
					</div>
					<br>
				</div>
				<!-- 첨부파일 시작 -->
				<div id="fileArea">
					<c:forEach items="${ attachment }" var="a" begin="0" varStatus="status">
						<input type="file" name="imageFile" class="orgImage" id="imageFile${ status.count }" onchange="loadImg(this, ${ status.count })"/>
					</c:forEach>
				</div>
				<!-- 첨부파일 끝 -->
			</div>
			</form>
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
			var navBtn = $('#admin_store');
			var otherBtn = $('#admin_main');
			$(otherBtn).removeClass("active");
			$(navBtn).addClass("active");
	    });

		$('#pList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/selectProductList.do";
		});

		$('#addProduct').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/insertProduct.do";
		});

		$('#ioList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/manageIO.do";
		});

		$('#search').keydown(function(e) {
			if(e.keyCode == 13) {
				$('#Search').submit();
			}
		});

		function fn_update() {
			if(confirm("수정하시겠습니까?")) {
				$('#pUpdateEnd').submit();
			}
		};

		function fn_goBack() {
			if(confirm("돌아가시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/admin/selectProductList.do";
			}
		};

		<!----------------------------------- 파일 첨부 시작 ----------------------------------->
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
				
				if( num == 0 ) {
					if($($('#imageTag1')).attr('src') == undefined) {
						$('#image1').append('<img id="imageTag'+fileIndex+'" width="200" height="267" class="img-rounded" onclick="clickFile('+fileIndex+');">')
						$('#imageFile'+num).parent().append('<input type="file" name="imageFile" id="imageFile'+fileIndex+'" onchange="loadImg(this, '+fileIndex+')" style="display:none;"/>');
					}
				} else {
					$('#imageTag'+num).parent().append('&nbsp;<img id="imageTag'+fileIndex+'" width="200" height="267" class="img-rounded" onclick="clickFile('+fileIndex+');">');
					$('#imageFile'+num).parent().append('<input type="file" name="imageFile" id="imageFile'+fileIndex+'" onchange="loadImg(this, '+fileIndex+')"/>');
				}
				
				
				fileIndex++;
			}
		}
		<!----------------------------------- 파일 첨부 끝 ----------------------------------->
	</script>
</body>
</html>