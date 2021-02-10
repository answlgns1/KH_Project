<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>

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
			});
</script>
</head>
<body>


	<div class="container">
		<div class="row">

			<div class="col-xs-12" style="margin-left: 50px;">
				<h1>상품 수정</h1>
			</div>
			<div class="col-xs-12">
				<br /> <br />
			</div>
			<div class="col-xs-6" id="product_title_picture_area">

				<img class="img-rounded" />
			</div>

			<div class="col-xs-6" id="product_detail_explain">

				<div class="row">

					<div class="col-xs-4">
						<h3>카테고리</h3>
					</div>
					<div class="col-xs-8">
						<select id="category_select">
							<option value="select_veg" selected="selected">---선택---</option>
							<option value="select_fruit">과일류</option>
							<option value="select_vegetable">채소류</option>
							<option value="select_meat">육류</option>
							<option value="select_fish">해산물류</option>
							<option value="select_easy_cook">간편식</option>
							<option value="select_meal_kit">밀키트</option>
						</select>

					</div>


					<div class="col-xs-12">
						<hr />
					</div>

					<div class="col-xs-4" id="product_name_label">
						<h3>상품명</h3>
					</div>
					<div class="col-xs-8" id="product_name_text">
						<input type="text" id="product_name" />
					</div>

					<div class="col-xs-12">
						<hr />
					</div>

					<div class="col-xs-4">
						<h3>가격</h3>
					</div>

					<div class="col-xs-8">
						<input type="text" id="product_price" />
					</div>

					<div class="col-xs-12">
						<hr />
					</div>

					<div class="col-xs-4">
						<h3>재고</h3>
					</div>

					<div class="col-xs-8">
						<input type="text" id="product_amount" />
					</div>

					<div class="col-xs-12">
						<hr />
					</div>

					<div class="col-xs-4">
						<h3>상품 설명</h3>
					</div>

					<div class="col-xs-8">
						<input type="text" id="product_explain" />
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
			
			<div class="product_detail_picture col-xs-4">
				<img class="img-rounded" />
			</div>
			<div class="product_detail_picture col-xs-4">
				<img class="img-rounded" />
			</div>
			<div class="product_detail_picture col-xs-4">
				<img class="img-rounded" />
			</div>

			<div class="space_area col-xs-12"></div>

			<div class="col-xs-12">
				<hr />
			</div>
			
			<div class="space_area col-xs-12"></div>
			
			<div class="col-xs-12" id="button_area">
				<div class="col-xs-2 col-xs-offset-3">
				<button class="btn btn-success btn-lg">등록</button>
				</div>
				<div class="col-xs-2"><br /></div>
				<div class="col-xs-2">
				<button class="btn btn-danger btn-lg">취소</button>
				</div>
			</div>
			
			<div class="col-xs-12" id="space_area"><br><br></div>
		</div>
	</div>
	
	
</body>
</html>