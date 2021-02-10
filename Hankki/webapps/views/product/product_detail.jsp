<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jsp.product.model.vo.*"%>
<% Product p = (Product)session.getAttribute("product");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 조회</title>

<style>
header {
	height: 230px;
}

#product_picture {
	min-width: 550px;
	max-width: 550px;
	min-height: 450px;
	max-height: 450px;
}

.product_count {
	width: 45px;
	text-align: center;
}

#total_price_area{
	text-align: right;
}

#button_area {
	text-align: right;
}

#button_area > button{
	width: 200px;
	margin-left: 40px;
}

#space_area{
	height: 50px;
}


#product_detail_picture_area > img{
	height: 600px;
	width: 1100px;
}

#porduct_review_cotent > ul {
	margin-left:15px;
	padding: 0;
}

#picture_space{
	height: 100px;
}

#space_area2{
	height: 30px;
}

#dropdown_area{
	text-align: right;
}

#table_area{
	text-align: center;
}

thead > tr > th{
	text-align: center;
}

.table{
 border: 1px solid black;
}

#space_area3{
	height: 10px;
}

#review_paging{
	text-align: center
}

#reivew_add_btn_area{
	text-align: right;
}

#quesion_add_btn_area{
	text-align: right;
}

#aside{

position : absolute;
position : fixed;
left : 100px;

}

#aside_table{
	width: 110px;
}


#aside > table {
	text-align: center;
}

#aside_table > tbody > tr >td{
	border-left: 2px solid black;
	border-right: 2px solid black;
}

#row1{
	border-top: 2px solid black;
}

#row3{
	border-bottom: 2px solid black;
}

#aside_table > tbody > tr > td > a{
	text-decoration: none;
	color: black;
}

#product_price{
	width: 122px;
}

#product_dc{
	width: 68px;
}

#original_price{
	margin-top: 12px;
}

#heart_icon{
	margin-top:20px;
	font-size: 25px;
}

#share_icon{
	margin-top: 10px;
	font-size: 25px;
}

/*top_button*/
#myBtn {
  position: right;/* Fixed/sticky position */
  bottom: 50px; /* Place the button at the bottom of the page */
  right: 50px; /* Place the button 30px from the right */
  z-index: 99; /* Make sure it does not overlap */
  border: none; /* Remove borders */
  outline: none; /* Remove outline */
  cursor: pointer; /* Add a mouse pointer on hover */
  padding: 15px; /* Some padding */
  background-color: white;
  position: fixed;
}

/* paging */
#pagination {
	text-align: center;	
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	text-align: center;
	border: 1px solid lightgrey;
}

.pagination a.active {
	background-color: rgb(46, 143, 88);
	color: white;
}

.pagination a:hover:not (.active ) {
	background-color: #ddd;
}

input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button {  

   opacity: 1;
   

}
input[type=number] {
     line-height: 30px;
}


</style>
</head>

<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<br />
	
	<!-- left-side fixed bar -->
	<div class="col-xs-1 col-xs-offset-10 affix" id="aside">
		<a href="#">
			<img src="<%= request.getContextPath()%>/resources/images/grenn_delivery.png"/>
		</a>
		
		<table class="table table-hover" id="aside_table">
		<tbody>
			<tr>
				<td id="row1">
					<a href="#">등급별 혜택</a>
				</td>
			</tr>
			<tr>
				<td id="row2">
					<a href="<%= request.getContextPath()%>/views/recipe/recipeList.jsp">레시피</a>
				</td>
			</tr>
			<tr>
				<td id="row3">
					<a href="#">베스트 후기</a>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	<!-- left-side fixed bar End-->
	
	<div class="container">
		<div class="row">
			<div class="col-xs-6" id="picture_area">
				<img id="product_picture"
					src="<%=request.getContextPath()%>/resources/images/sample_images_01.png" />
			</div>
			<div class="col-xs-6">
			
				<div class="col-xs-4">
					<h3>[브랜드명]</h3>
				</div>
				<div class="col-xs-6">
					<h3><%= p.getP_name() %></h3>
				</div>
				<div class="col-xs-2" id="icon_space">
					<span class="glyphicon glyphicon-heart-empty" id="heart_icon"></span>
				</div>
				
				<div class="col-xs-4">
					<h4></h4>
				</div>
				<div class="col-xs-6">
					<h4><%= p.getP_explain() %></h4>
				</div>
				<div class="col-xs-2" >
					<a href="#" style="text-decoration: none; color:black;">
						<span class="fa fa-share-alt" id="share_icon"></span>
					</a>
				</div>
			
				<div class="col-xs-3" id="product_price">
					<h3 id="count"></h3>
				</div>
				<div class="col-xs-2" style="color:red;" id="product_dc">
					<h3>50%</h3>
				</div>
				<div class="col-xs-7" style="color:grey;" id="original_price">
					<h4><%= p.getP_price() %>원
						<span class="glyphicon glyphicon-question-sign"></span>
					</h4>
					
				</div>
			
			
				<div class="col-xs-12">
					<hr />
				</div>

				<div class="col-xs-4">
					<h4>판매단위</h4>
				</div>
				<div class="col-xs-8">
					<h4>박스</h4>
				</div>

				<div class="col-xs-4">
					<h4>중량/용량</h4>
				</div>
				<div class="col-xs-8">
					<h4><%= p.getP_weight() %></h4>
				</div>

				<div class="col-xs-4">
					<h4>배송구분</h4>
				</div>
				<div class="col-xs-8">
					<h4>그린 배송 / 택배 배송</h4>
				</div>

				<div class="col-xs-4">
					<h4>포장타입</h4>
				</div>
				<div class="col-xs-8">
					<h4>상온/종이포장</h4>
				</div>

				<div class="col-xs-4">
					<h4>알레르기 정보</h4>
				</div>
				<div class="col-xs-8">
					<h4>
						본 제품은 알류, 우유, 메밀, 땅콩, 대두,<br /> 밀을 사용한 제품과 같은 제조시설에서<br /> 제조하고
						있습니다.
					</h4>
				</div>

				<div class="col-xs-4">
					<h4>구매수량</h4>
				</div>
				<div class="col-xs-8">
<!-- 					<button type="button" class="btn btn-secondary">-</button> -->
					<input type="number" max="100" min="1" step="1"
					 value ="1" id="product_count" style="width:50px
					 class="product_count"/>
<!-- 					<button type="button" class="btn btn-secondary">+</button> -->
				</div>
			</div>
		</div>

		<div class="col-xs-12">
			<br /> <br /> 
		</div>

		<div class="col-xs-12" id="total_price_area">
			
			<br />
		</div>
<%  if(m==null){ %>
	
	<div class="col-xs-12" id="button_area">
	<button type="button" class="btn btn-light btn-lg"
	 onclick="location.href='/Hankki/views/shoppingCart/shopping_cart.jsp'">장바구니</button>
	<button type="button" class="btn btn-success btn-lg" onclick="loginUp()">구매하기</button>
	<br />
</div>
	
<% }else{  %>
<div class="col-xs-12" id="button_area">
	<button type="button" class="btn btn-light btn-lg"
	 onclick="location.href='/Hankki/views/shoppingCart/shopping_cart.jsp'">장바구니</button>
	<button type="button" class="btn btn-success btn-lg"
	 onclick="location.href='/Hankki/views/order/order.jsp'">구매하기</button>
	<br />
</div>
<%		}%>
		
		<div class="col-xs-12" id="space_area1">
		</div>
	</div>
	
	<div class="container" id="container2">
		<div class="row">
			<ul class="nav nav-tabs">
  				<li role="presentation" class="active"><a href="#">상품 상세 정보</a></li>
  				<li role="presentation"><a href="#review">고객후기</a></li>
  				<li role="presentation"><a href="#qa">상품문의</a></li>
			</ul>		
			<br />
		</div>
		
		<div class="col-xs-12" id="picture_space"><br /><br /></div>
		
		<div class="col-xs-12" id="product_detail_picture_area">
			<img src="<%=request.getContextPath()%>/resources/images/sample_images_01.png" class="img-rounded"/>
		</div>
		
		<div class="col-xs-12" id="picture_space"><br /><br /></div>
			
		<div class="col-xs-12" id="product_detail_picture_area">
			<img src="<%=request.getContextPath()%>/resources/images/sample_images_02.png" class="img-rounded"/>
		</div>

		<div class="col-xs-12" id="picture_space"><br /><br /></div>

		<div class="col-xs-12" id="product_detail_picture_area">
			<img src="<%=request.getContextPath()%>/resources/images/sample_images_03.png" class="img-rounded"/>
		</div>
		
		<div class="col-xs-12" id="picture_space"><br /><br /></div>
		
		<ul class="nav nav-tabs" >
  			<li role="presentation"><a href="#">상품 상세 정보</a></li>
  			<li role="presentation" class="active"><a href="#review">고객후기</a></li>
  			<li role="presentation"><a href="#qa">상품문의</a></li>
		</ul>		
		
		<div class="col-xs-12" id="space_area2"> <br /></div>
		
		<div class="col-xs-12">
			<p id="review">PRODUCT REVIEW</p>
		</div>
		<div class="col-xs-10" id="porduct_review_cotent">
			<ul>
				<li>상품에 대한 리뷰를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전 동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
				<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 1:1문의에 남겨주세요.</li>
			</ul>
		</div>

		<div class="col-xs-2" id="dropdown_area">
			<div class="dropdown">
  				
  				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
    				최근 등록순
    				<span class="caret"></span>
  				</button>
  				
  				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">좋아요 만은 순</a></li>
    				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">조회 수 많은 순</a></li>
				</ul>
			</div>
		</div>
		
		<div class="col-xs-12" id="space_area2"><br /></div>
		
		<div class="col-xs-12" id="table_area">
			<table class="table" id="review_table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회 수</th>
					</tr>
				</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>test1</td>
							<td>test1</td>
							<td>test-date</td>
							<td>0</td>
						</tr>
						<tr>
							<td>2</td>
							<td>test2</td>
							<td>test2</td>
							<td>test-date</td>
							<td>0</td>
						</tr>
					</tbody>
			</table>
		</div>
		
		<div class="col-xs-12" id="space_area3"></div>
		
		<div class="col-xs-12" id="reivew_add_btn_area">
			<button type="button" class="btn btn-default">후기 쓰기</button>
		</div>
		
		<div class="col-xs-12" id="review_paging">
				
		<!--paging-->	
         <div class="col-md-12" id="pagination">
		   <div class="pagination" style="text-align: center;">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a class="active" href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&raquo;</a>
          </div>
        </div>
        <!--paging End-->
	  <br><br>
	  
		</div>
		
		<div class="col-xs-12" id="space_area2"><br /></div>
		
		<ul class="nav nav-tabs" id="qa">
  			<li role="presentation"><a href="#">상품 상세 정보</a></li>
  			<li role="presentation"><a href="#review">고객후기</a></li>
  			<li role="presentation"  class="active"><a href="#qa">상품문의</a></li>
		</ul>		
		
		<div class="col-xs-12" id="space_area2"> <br /></div>
		
		<div class="col-xs-12">
			<p >PRODUCT Q&A</p>
		</div>
		<div class="col-xs-12" id="porduct_review_cotent" >
			<ul>
				<li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전 동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
				<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 1:1문의에 남겨주세요.</li>
			</ul>
		</div>
		
		<div class="col-xs-12" id="space_area2"><br /></div>
		
		<div class="col-xs-12" id="table_area">
			<table class="table" id="quesion_table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회 수</th>
					</tr>
				</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>test1</td>
							<td>test1</td>
							<td>test-date</td>
							<td>0</td>
						</tr>
						<tr>
							<td>2</td>
							<td>test2</td>
							<td>test2</td>
							<td>test-date</td>
							<td>0</td>
						</tr>
					</tbody>
			</table>
		</div>
		
		<div class="col-xs-12" id="space_area3"></div>

		<div class="col-xs-12" id="quesion_add_btn_area">
				<button type="button" class="btn btn-default">문의 작성하기</button>
		</div>
		
		<!--paging-->	
         <div class="col-md-12" id="pagination">
		   <div class="pagination" style="text-align: center;">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a class="active" href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&raquo;</a>
          </div>
        </div>
        <!--paging End-->
	  <br><br>
     </div>
     
     <!-- top_button -->
	  <div class="myBtn">
	   <button onclick="topFunction()" id="myBtn" title="Go to top"><img src="<%=request.getContextPath()%>/resources/images/top_arrow.png" width="70px" height="70px"/></button>
	  </div>
	 <!-- top_button End-->


	<%@ include file="../common/footer.jsp"%>
	
	<script>
	<!--top_button-->
	// Get the button:
	mybutton = document.getElementById("myBtn");

	// When the user scrolls down 100px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
	  if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
	    mybutton.style.display = "block";
	  } else {
	    mybutton.style.display = "none";
	  }
	}
	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	  document.body.scrollTop = 0; // For Safari
	  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
	}
	
	
	
function loginUp(){
	
		window.alert("로그인이 필요합니다");
		location.href="/Hankki/views/member/loginForm.jsp";

		}
	
	var totalQuantity = <%=p.getP_amount()%>;
	var price = <%=p.getP_price()%>;
	var quantity = $("#product_count").val();
	var totalPrice = price*quantity
	var product_count = document.getElementById('product_count');
	
	product_count.addEventListener('click',function(){
		
		console.log(product_count.value);
		
	})
	
	$("input[type=number]").on("click",function(){
		
		console.log(price*quantity);
		
		$("#total_price_area").html()=price*quantity ;
		
		
	})
	
	
	</script>
	

</body>
</html>