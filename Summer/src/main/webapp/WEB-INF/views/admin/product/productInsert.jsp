<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품등록</title>
	<style>
		#pList, #addProduct, #ioList {
			width : 200px;
			height : 40px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 18px;
		}
		
		#addProduct {
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
    		width : 290px;
    		height : 450px;
    	}
    	
    	td {
    		width : 65px;
    		text-align : center;
    		padding : 4px;
    	}
    	
    	td input {
    		width : 40px;
    	}
    	
    	#topSize, #pantsSize {
    		border : 1px solid #e2e2e2;
    		display : none;
    	}
    	
    	caption {
    		background : #88c8bc;
    		color : white;
    		font-size : 16px;
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
			<form action="${pageContext.request.contextPath}/admin/insertProductEnd.do" id="pInsert" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="span12" id="oListBox">
					<div class="row" style="margin-left:1%;padding:3%;">
						<div class="span4" style="text-align:center;">
							<div style="padding:5px; border:2px solid grey; width:295px;" id="thumbImg">
								<img id="imageTag0" onclick="clickFile(0);" class="img-thumbnail">
							</div>
							<br>
							<div>
								<table id="topSize">
								<caption>상품 사이즈</caption>
									<thead>
										<th>사이즈</th>
										<th>총장</th>
										<th>어깨너비</th>
										<th>가슴단면</th>
										<th>소매길이</th>
									</thead>
									<tbody>
										<tr>
											<td>S</td>
											<td><input type="text" name="topS" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="topS" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="topS" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="topS" id="TOP_S" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<input type="hidden" name="topS" value="Top" id="topChk"/>
										</tr>
										<tr>
											<td>M</td>
											<td><input type="text" name="topM" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="topM" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="topM" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="topM" id="TOP_M" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
										</tr>
										<tr>
											<td>L</td>
											<td><input type="text" name="topL" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="topL" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="topL" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="topL" id="TOP_L" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
										</tr>
									</tbody>
								</table>
								<table id="pantsSize">
								<caption>상품 사이즈</caption>
									<thead>
										<th>사이즈</th>
										<th>총장</th>
										<th>허리단면</th>
										<th>허벅지</th>
										<th>밑위</th>
										<th>밑단단면</th>
									</thead>
									<tbody>
										<tr>
											<td>S</td>
											<td><input type="text" name="pantsS" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsS" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsS" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsS" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsS" id="PANTS_S" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<input type="hidden" name="pantsS" value="Pants" id="pantsChk"/>
										</tr>
										<tr>
											<td>M</td>
											<td><input type="text" name="pantsM" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsM" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsM" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsM" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsM" id="PANTS_M" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
										</tr>
										<tr>
											<td>L</td>
											<td><input type="text" name="pantsL" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsL" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsL" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsL" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
											<td><input type="text" name="pantsL" id="PANTS_L" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="span6">
							<select name="lcNo" id="productCt">
								<option selected disabled>카테고리 선택</option>
								<option value="1">상의</option>
								<option value="2">하의</option>
								<option value="3">아우터</option>
							</select>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품명
								</div>
								<div style="width:100%; text-align:center; padding:2% 0% 2% 0%;">
									<input type="text" name="pName" id="pName" placeholder="상품명 입력"/>
								</div>
							</div>
							<br><br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품설명
								</div>
								<div style="width:100%; text-align:center; padding:2% 0 2% 0;">
									<textarea name="pDescription" id="pDescription" rows="5" style="resize : none;" placeholder="상품설명 입력"></textarea>
								</div>
							</div>
							<br><br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품수량
								</div>
								<div style="width:100%; text-align:center; padding:2% 0% 2% 0%;">
									<input type="number" name="pStock" id="pStock" style="text-align:center;" placeholder="상품수량 입력"/>
								</div>
							</div>
							<br><br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품 가격
								</div>
								<div style="width:100%; text-align:center; padding:2% 0% 2% 0%;">
									<input type="text" name="pPrice" id="pPrice" placeholder="상품가격 입력"/>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="span10 offset1" style="text-align:center;">
							<div style="border:1px solid #e2e2e2; padding:1%; font-size:16px;">
								상품 이미지 등록
							</div>
							<div id="image1">
								
							</div>
						</div>
					</div>
					<hr>
					<div class="row" style="margin:3% 0% 2% 0%;">
						<div class="span12" style="text-align:center;" id="btnGroup">
							<button type="button" class="btn" onclick="fn_insert();">등록하기</button> &nbsp; &nbsp;
							<button type="button" class="btn" onclick="fn_goBack();">취소하기</button>
						</div>
					</div>
					<br>
				</div>
				<!-- 첨부파일 시작 -->
				<div id="fileArea">
					<input type="file" name="imageFile" id="imageFile0" onchange="loadImg(this, 0)"/>
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

		<!-------------------------------- 사이즈 시작 ------------------------------------->
		$(document).ready(function() {
			$('#productCt').on('change', function(){
				if( this.value == 1 || this.value == 3 ) {
					$('#topSize').show();
					$('#pantsSize').find('input').each(function(){
						this.value = "";
					});
					$('#pantsSize').hide();
					$('#topChk').val("Top");
					$('#pantsChk').val("");
				} else if( this.value == 2 ) {
					$('#pantsSize').show();
					$('#topSize').find('input').each(function(){
						this.value = "";
					});
					$('#topSize').hide();
					$('#topChk').val("");
					$('#pantsChk').val("Pants");
				}
			});
		});
		<!-------------------------------- 사이즈 끝 ------------------------------------->
		
		function fn_insert() {
			if($('#pName').val() == '') {
				alert("상품명을 입력해주세요.");
				$('#pName').focus();
				return false;
			}
			if($('#pDescription').val() == '') {
				alert("상품설명을 입력해주세요.");
				$('#pDescription').focus();
				return false;
			}
			if($('#pStock').val() == '') {
				alert("상품수량을 입력해주세요.");
				$('#pStock').focus();
				return false;
			}
			if($('#pPrice').val() == '') {
				alert("상품가격을 입력해주세요.");
				$('#pPrice').focus();
				return false;
			}
			if( $('#productCt').val() == 1 || $('#productCt').val() == 3 ) {
				if( $('#TOP_S').val() == '' ) {
					alert("사이즈를 입력해주세요.");
					return false;
				}
				if( $('#TOP_M').val() == '' ) {
					alert("사이즈를 입력해주세요.");
					return false;
				}
				if( $('#TOP_L').val() == '' ) {
					alert("사이즈를 입력해주세요.");
					return false;
				}
			}
			if( $('#productCt').val() == 2 ) {
				if( $('#PANTS_S').val() == '' ) {
					alert("사이즈를 입력해주세요.");
					return false;
				}
				if( $('#PANTS_M').val() == '' ) {
					alert("사이즈를 입력해주세요.");
					return false;
				}
				if( $('#PANTS_L').val() == '' ) {
					alert("사이즈를 입력해주세요.");
					return false;
				}
			}
			if(confirm("등록하시겠습니까?")) {
				$('#pInsert').submit();
			}
		};

		function fn_goBack() {
			if(confirm("돌아가시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/admin/selectProductList.do";
			}
		};

		<!----------------------------------- 파일 첨부 시작 ----------------------------------->
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
				if(idx != 0){
					if(confirm("삭제하시겠습니까?")){
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
		<!----------------------------------- 파일 첨부 끝 ----------------------------------->
	</script>
</body>
</html>