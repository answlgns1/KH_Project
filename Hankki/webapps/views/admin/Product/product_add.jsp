<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<style>
.img-rounded {
	cursor: pointer;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 이미지 아이콘 사용하기 위한 스타일 시트 가져옴. -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	$(document).ready(
			function() {
				$("header").css("height", "300px");
				$("footer").css("height", "300px");

				$(".col-xs-8").css("height", $(".col-xs-4").css("height"));
				$(".col-xs-8 > input").css("margin-top", "10px");
				$(".col-xs-8 > input").css("width", "300px");
				$(".col-xs-8 > input").css("font-size", "20px");

				$(".col-xs-8 > select").css("height", "30px");
				$(".col-xs-8 > select").css("font-size", "20px");
				$(".col-xs-8 > select").css("margin-top", "12px");
				$(".col-xs-8 > select").css("width", "250px");

				$("#title_picture").css("height",
						$("#product_detail_explain").css("height"));

				$('#title_picture > p').css("line-height",
						$("#product_detail_explain").css("height"));

				$('#product_title_picture_area').css('text-align', 'center');
				$('.col-xs-6 > img').css('border', '1px solid black');
				$('.col-xs-6 > img').css('height',
						$("#product_detail_explain").css("height"));
				$('.col-xs-6 > img').css('width',
						$("#product_detail_explain").css("height"));

				$('.product_detail_picture > img').css('border',
						'1px solid black');
				$('.product_detail_picture > img').css('height', '300px');
				$('.product_detail_picture > img').css('width', '300px');
				$('.product_detail_picture').css('text-align', 'center');
				
				$('.col-xs-2').css('text-align', 'center');
				$('.col-xs-2 > button').css('width', '150px');
				
				$('.space_area').css('height', '20px');

				$('#detail_explaine_title').css('margin-left', '30px');
				
	})

</script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="margin-left: 50px;">
				<h1>상품 등록</h1>
			</div>
			<div class="col-xs-12">
				<br /> <br />
			</div>
			<form action="<%= request.getContextPath() %>/insert.pd"
			  	method="post" enctype="multipart/form-data">
			<div class="col-xs-6" id="product_title_picture_area">	
				<img class="img-rounded" id="titleImg"/>
					
			</div>

			<div class="col-xs-6" id="product_detail_explain">
				
				<div class="row">

					<div class="col-xs-4">
						<h3>카테고리</h3>
					</div>
					<div class="col-xs-8">
						<select id="category_select" name="pType">
							<option value="fruit" selected>과일류</option>
							<option value="veg">채소류</option>
							<option value="meat">육류</option>
							<option value="seafood">해산물류</option>
							<option value="covience">간편식</option>
							<option value="mealkit">밀키트</option>
						</select>

					</div>


					<div class="col-xs-12">
						<hr />
					</div>

					<div class="col-xs-4" id="product_name_label">
						<h3>상품명</h3>
					</div>
					<div class="col-xs-8" id="product_name_text">
						<input type="text" name="pName" placeholder="상품명을 입력해주세요."/>
					</div>

					<div class="col-xs-12">
						<hr />
					</div>

					<div class="col-xs-4">
						<h3>가격</h3>
					</div>

					<div class="col-xs-8">
						<input type="text" name="pPrice" placeholder="상품가격을 입력해주세요."/>
					</div>

					<div class="col-xs-12">
						<hr />
					</div>

					<div class="col-xs-4">
						<h3>재고</h3>
					</div>

					<div class="col-xs-8">
						<input type="text" name="pAmount" placeholder="재고를 입력해주세요."/>
					</div>

					<div class="col-xs-12">
						<hr />
					</div>
					
					<div class="col-xs-4">
						<h3>중량</h3>
					</div>
					
					<div class="col-xs-8">
						<input type="text" name="pWeight" placeholder="중량을 입력해주세요."/>
					</div>

					<div class="col-xs-12">
						<hr />
					</div>

					<div class="col-xs-4">
						<h3>상품 설명</h3>
					</div>

					<div class="col-xs-8">
						<input type="text" name="pExplain" placeholder="상품 설명을 입력해주세요."/>
					</div>
				</div>
			</div>

			<div class="col-xs-12">
				<hr />
			</div>
			
			<div class="space_area2 col-xs-12"></div>

			<div class="col-xs-12" id="detail_explaine_title">
				<h3> 상품 설명 이미지 등록</h3>
			</div>
			
			<div class="space_area col-xs-12"></div>
			
			<div class="product_detail_picture col-xs-4" id="prudouctImgArea1">
				<img class="img-rounded" id="productImg1" />
			</div>
			<div class="product_detail_picture col-xs-4" id="prudouctImgArea2">
				<img class="img-rounded" id="productImg2" />
			</div>
			<div class="product_detail_picture col-xs-4" id="prudouctImgArea3">
				<img class="img-rounded" id="productImg3" />
			</div>
						
			<div class="space_area col-xs-12"></div>

			<div class="col-xs-12">
				<hr />
			</div>
			
			<div class="space_area col-xs-12"></div>
			
			<div class="col-xs-12" id="button_area">
				<div class="col-xs-2 col-xs-offset-3">
				<button type="submit" class="btn btn-success btn-lg">등록</button>
				</div>
				<div class="col-xs-2"><br /></div>
				<div class="col-xs-2">
				<button type="reset" onclick="goBack()" class="btn btn-danger btn-lg">취소</button>
				</div>
			</div>
			<div class="col-xs-12" id="space_area"><br><br></div>	
			<div class="fileArea" id="fileArea">
				<input type="file" name="pImg1" id="pImg1" onchange="loadImg(this,1);" />
				<input type="file" name="pImg2" id="pImg2" onchange="loadImg(this,2);" />
				<input type="file" name="pImg3" id="pImg3" onchange="loadImg(this,3);" />
				<input type="file" name="pImg4" id="pImg4" onchange="loadImg(this,4);" />
			</div>
			</form>		
		</div>		
	</div>
	
	<script>
	$(function(){
		$('#product_title_picture_area').click(function(){
			$('#pImg1').click();
		});
		
		$('#prudouctImgArea1').click(function(){
			$('#pImg2').click();
		});
		
		$('#prudouctImgArea2').click(function(){
			$('#pImg3').click();
		});
		
		$('#prudouctImgArea3').click(function(){
			$('#pImg4').click();
		});
		
		$('#fileArea').hide();
	
	})
	
	function loadImg(img, num){
		if(img.files && img.files[0]) {
			
			var reader = new FileReader();
			
			reader.onload = function(e){
				
				switch(num){
				case 1 : $('#titleImg').attr('src', e.target.result);
						 break;
				case 2 : $('#productImg1').attr('src', e.target.result);
						 break;
				case 3 : $('#productImg2').attr('src', e.target.result);
						 break;
				case 4 : $('#productImg3').attr('src', e.target.result);
						 break;
				}
			}
			
			reader.readAsDataURL(img.files[0]);
		}
		
		function goBack() {
			history.back();
		}
	}
	</script>
	
</body>
</html>