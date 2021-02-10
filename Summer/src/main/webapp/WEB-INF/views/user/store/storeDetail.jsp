<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
	<head>
	<title>storeDetail</title>
   <meta charset="utf-8">
	</head>
	<style>
		.title-wrap{
			
			height : 60px;
			font-size : 30px;
			padding-rigth : -20px;
			border-bottom : 2px solid black;
			
		}
		.title{
		display: inline-block;
		}
		.size{
		display: inline-block;
		}
		#title{
		font-weight: bold;
		width : 325px;
		}
		#like-box {
    		font-weight : bold;
    		padding-left : 28px;
    		font-size : 20px;
    		width : 150px
    	}
    	
    	#like-box>div {
    		margin-left : 10px;
    		padding : 0px 10px 0px 10px;
    		border : 1px solid #E2E2E2;
    		display : inline-block;
    		margin : 10px;
    	}
    	
    	#like-box>div:hover {
    		background : #E2E2E2;
    		border : 1px solid black;
    		cursor : pointer;
    		transition : 0.5s;
    	}
    	.contents{
    		border-bottom : 1px solid grey;
    		color : grey;
    		height : 50px;
    		padding-top : 10px;
    		
    	}
    	.contents_1{
    		display : inline-block;
    	}
    	.contents_2{
    		display : inline-block;
    		float: right;
    		font-weight : bold;
    		font-size : 15px;
    		margin-right : 10px;
    	}
    	.information{
    		border-bottom : 1px solid grey;
    		height : 150px;
    		padding-top : 20px;
    	}
    	.information tr, .information th {
    		
    		padding-right : 60px;
    		padding-bottom : 10px;
  		}
  		.price table{
  			margin-top : 10px;
  			border-top: 3px solid grey;
    		
  		}
  		.price-tr-1{
  			background-color : #e9e9e9;
  		}
  		.price tr, .price th {
  			width : 484px;
    		border-bottom: 1px solid grey;
    		text-align : center;
  		}
  		.size-wrap{
    		border-bottom : 1px solid grey;
    		height : 180px;
    		padding-top : 10px;
    		font-weight : bold;
    		padding-left : 10px;
    	}
    	.totalprice-wrap{
			height : 65px;
			width : 484px;
			padding-top : 10px;
			padding-left : 10px;
			border-top : 2px solid grey;
			border-bottom : 3px solid grey;
			font-weight : bold;
		}
		.totalprice{
			display: inline-block;
		}
		#totalprice-title{
		
			width : 350px;
			font-size : 20px;
		}
		#totalprice-contents{
			
			font-size : 20px;
		}
		.size-information table{
			width : 400px;
			border-top: 1px solid grey;
    		text-align : center;
		}
		.size-information tr{
			border-bottom: 1px solid grey;
		}
    	
  
  
    	
	  .abtn{
	  height:40px;
	  line-height:40px;  
	  border-radius:3px;
	  border:1px solid grey;
	  background-color: transparent;
	  font-size:13px;    
	  
	}
	
	.abtn ul {
	  border:1px solid grey;  
	  border-bottom-left-radius: 3px;  
	  border-bottom-right-radius:3px;
	  border-top:0;
	  bottom:40px;  
	  padding-left:0px;
	 
	}
	
	.abtn,
	.abtn ul li {
	  width:200px;
	  margin : 0 auto;
	  text-align : center;
	}
	
	
	
	.abtn ul li:hover{
	   background-color:#e9e9e9;
	}
	
	.opt-sel {
	  position:absolute;  
	  outline: none;
	  cursor:pointer;
	}
	
	.opt-sel ul{
	  width:200px;
	  left:-1px; 
	  list-style:none;
	  margin:0;    
	}
	
	.sel-icon {
	  float:right;  
	  font-size:10px;
	}
	
	.sel-icon:after {    
	  content:'▼';
	}
	
	.opt-sel:focus .sel-icon:after{
	  content:'▲';
	}
	
	.opt-sel ul li{    
	  cursor:pointer;
	}
	.abtn:focus {
	  border-top-left-radius: 0px;  
	  border-top-right-radius:0px;
	  margin-top:1px;
	  cursor:default;  
	}
	.opt-sel:focus ul {
	  display:block;  
	}
	.opt-sel:not(:focus) ul {  
	  <!--display:none; --> 
	}
	
	#size-title{
		position: absolute;
	 	top: 270px;
	 	font-size : 20px;
	}
	#size-contents{
	position : absolute;
	right : 245px;
	}
	
	
	
	#close {
	float:left;
	display:inline-block; 
	text-shadow: 0 1px 0 #fff; 
	
	} 
	#close:hover {
	border: 0; 
	cursor:pointer; 
	opacity: .75; 
	}
	.order-wrap{
		padding-top : 20px;
		text-align : center;
	}
	.shopping-basket{
		width : 484px;
		font-weight:bold;
	}
	.order{
		margin-top : 15px;
		width : 484px;
		font-weight:bold;
	}
	.tab-wrap{

	border-bottom : 2px solid grey;
	width :100%;
	
	}
	.tab-wrap div{
		
		height : 40px;
		display : inline-block;
		text-align : center;
		
		margin-top : 20px;
		margin-bottom : 20px;
		border-top : 1px solid black;
		border-bottom : 1px solid black;
		font-weight: bold;
		font-size : 20px;
	}
	.tab-description{
		width : 33.3%;
	}
	.tab-description:hover{
		background : #88c8bc;
		color : white;
	}
	
	.tab-graph{
		width : 33.3%;
		margin-left : -4px;
		border: 1px solid black;
	}
	.tab-graph:hover{
		background : #88c8bc;
		color : White;
	}
	.tab-review{
		margin-left : -8px;
		width : 384px;
	}
	.tab-review:hover{
		background : #88c8bc;
		color : White;
	}
	.all-wrap{
		margin-top : 20px;
		border : 1px solid grey;
		width : 100%;
		padding-bottom : 20px;
		height : auto;
		
	}
	.description-wrap{
		width : 100%;

	}
	.description-title{
		text-align : center;
		width : 100%;
		height : 60px;
		padding-top:5px;
		font-size : 25px;
		color : black;
		font-weight : bold;
	}
	.description-contents{
		width : 100%;
		padding-bottom : 20px;
		border-bottom : 1px solid grey;
	}
	.graph-title{
		text-align : center;
		width : 100%;
		height : 60px;
		padding-top:5px;
		font-size : 25px;
		color : black;
		font-weight : bold;
	}
	.graph-contents{
		width : 100%;
		padding-bottom : 20px;
		border-bottom : 1px solid grey;
	}
	.review-title{
		text-align : center;
		width : 100%;
		height : 60px;
		padding-top:5px;
		font-size : 25px;
		color : black;
		font-weight : bold;
	}
	.review-contents{
		width : 95%;
		padding-bottom : 20px;
		border-bottom : 1px solid grey;
		border : 1px solid grey;
		margin : 20px;
	}
	.dropbox{
	font-weight: bold;
	font-size : 13px;
	}
	

	

	</style>
	<body>
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		<!-- 상단 페이지 정보 -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread">
							<span><a href="${pageContext.request.contextPath}">Home</a></span> 
							/ <span><a href="${pageContext.request.contextPath}/store/selectStoreMain.do">Store</a></span> 
							/ <span>TOP</span>
						</p>
					</div>
				</div>
				<h1>Store</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		
		<div class="colorlib-about">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-sm-6 mb-3">
						<div class="video colorlib-video" height:540px;">
							<img src="${pageContext.request.contextPath}${ store.FILEPATH }${ store.NEWFILENAME }" class="img-fluid" alt="Free html5 bootstrap 4 template">
							<div class="overlay"></div>
						</div>
						<br>
						<div class=size-information>
							사이즈 정보
							<table>
								<tr class="price-tr-1">
									<th>cm</th>
									<th>총장</th>
									<th>어깨너비</th>
									<th>가슴단면</th>
									<th>소매길이</th>
								</tr>
								<tr>
									<th>MY</th>
									<th>${mySize.TOTAL}</th>
									<th>${mySize.SHOULDER}</th>
									<th>${mySize.CHEST}</th>
									<th>${mySize.SLEEVE}</th>
								</tr>
								<c:forEach items="${size}" var="s">
								
								<tr>
									<th>${s.TSIZE}</th>
									<th>${s.TOTAL}</th>
									<th>${s.SHOULDER}</th>
									<th>${s.CHEST}</th>
									<th>${s.SLEEVE}</th>
								</tr> 
								</c:forEach>					
							</table>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="about-wrap">
							<div class="title-wrap">
								<div class="title" id="title">${store.PNAME}</div>
								<div class="title" id="like-box">
									<div class="p1234" id="${ store.BNO }"><i class="icon-heart" aria-hidden="true"></i>좋아요</div>
								</div>
							</div>
							<div class="contents">
								<div class="contents_1">
									${store.PDESCRIPTION}
								</div>
								<div class="contents_2">
									리뷰 ${store.COMMENTCOUNT} 조회 ${store.VIEWS} 
								</div>
							</div>
							<div class="information">
								<table>
									<tr>
										<th>제조회사 / 품번</th>
										<th>${store.COMNAME} / ${store.PCODE}</th>
									</tr>
									<tr>
										<th>판매가</th>
										<th>${store.PPRICE}원</th>
									</tr>
									<tr>
										<th>좋아요</th>
										<th><i class="icon-heart" aria-hidden="true"></i>${store.BLIKE}</th>
									</tr>								
								</table>
							</div>
							
							<div class="size-wrap">
								<div class="size" id="size-title">사이즈</div>
									<div class="size" id="size-contents">
										<div class="opt-sel abtn" tabindex="1">
									 		사이즈를 선택해주세요 <div class="sel-icon">
									 	</div>
										<ul tabindex="1">
									    	<li class="small" onclick="fn_size('S');" id="S"><div class="dropbox">S</div></li>
									    	<li class="medium" onclick="fn_size('M');" id="M">M</li>
									    	<li class="large" onclick="fn_size(L);" id="L">L</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="price">
							
								<table>
									<thead>
										<tr class="price-tr-1">
											<th>사이즈</th>
											<th>수량</th>
											<th>금액</th>
										</tr>
									</thead>
								</table>
								<table>
									<tbody id="sizeDiv">
										
									
										
									</tbody>			
								</table>
							</div>
							<div class="totalprice-wrap">
								<div class="totalprice" id="totalprice-title">총 상품 금액</div>
								<div class="totalprice" id="totalprice-contents"></div>
							</div>
							<div class="order-wrap">
			       		 		<button onclick="location.href='#'" class="btn btn-primary thema shopping-basket" id="shopping-basket">장바구니</button>
			       		 		<button class="btn btn-primary thema order" id="${ store.BNO }">주문하기</button>
			    			</div>
			    			
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 상세 설명 -->
		<div class="container">
				<div class="row">
					<div class="tab-wrap">
						<div class="tab-description" onclick="location.href='#description-title';">
							상세 설명
						</div>
						<div class="tab-graph" onclick="location.href='#graph-title';">
							구매 현황
						</div>
						<div class="tab-review" onclick="location.href='#review-title';">
							리뷰
						</div>
					</div>
					<div class="all-wrap">
						<div class="description-wrap">
							<div class="description-title" id="description-title">
								상품 상세 설명
							</div>
							<div class="description-contents">
								<img src="${pageContext.request.contextPath}/resources/user/images/store/boots-0.jpg" class="img-boots" 
								alt="boots-0" style="width:1130px;">
								<img src="${pageContext.request.contextPath}/resources/user/images/store/boots-1.jpg" class="img-boots" 
								alt="boots-1" style="width:1130px;">
								<img src="${pageContext.request.contextPath}/resources/user/images/store/boots-2.jpg" class="img-boots" 
								alt="boots-2" style="width:1130px;">
								<img src="${pageContext.request.contextPath}/resources/user/images/store/boots-3.jpg" class="img-boots" 
								alt="boots-3" style="width:1130px;">
							</div>
						</div>
						<div class="graph-wrap">
							<div class="graph-title" id="graph-title">
								구매 현황
							</div>
							<div class="graph-contents">
								<img src="${pageContext.request.contextPath}/resources/user/images/store/graph-1.jpg" class="img-boots" alt="boots-1">
							</div>
						</div>
						<div class="review-wrap">
							<div class="review-title"  id="review-title">
								리뷰
							</div>
							<div class="review-contents">
							
							
							
							
							
								<!-- 댓글 반복 시작 -->
							<c:forEach items="${commentList}" var="comment">
							<div id="${comment.BCNO}" style="padding : 10px; border-top : 1px solid lightgrey">
								<table style="width: 100%; clear: both;">
									<tr>
										<td>${comment.WRITER} ${comment.DATE2CHAR}</td>
										<td style="float:right;">
										<c:if test="${member.userId eq comment.USERID}">
											
											<button type="button" class="btn btn-primary thema" onclick="fn_deleteStoreComment(${comment.BCNO});">삭제</button>
										</c:if>
										</td>
									</tr>
									<tr>
										<td>
											${comment.CCONTENTS}
										</td>
									</tr>
								</table>
							</div>
							</c:forEach>
							<!-- 댓글 반복 끝 -->
							<!-- 댓글 등록 시작 -->
							<div style="padding : 10px 10px 0 10px; border : 1px solid lightgrey; clear:both;">
								<form action="${pageContext.request.contextPath}/store/insertStoreComment.do?bNo=${store.BNO}" method="post" onsubmit="return fn_submit();">
									<input type="hidden" name="userId" value="${member.userId}" required>
									<textarea id="cContents" name="cContents" rows="3" placeholder="댓글을 입력하세요" style="width : 100%; border : 1px solid lightgrey;"></textarea>
									<button type="submit" class="btn btn-primary thema" style="float : right;">등록</button>
								</form>
								<br /><br />
							</div>
							<!-- 댓글 등록 끝 -->
							
							
							
							
							
							
							</div>
						</div>
					</div>
				
				</div>
		</div>	
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	<script>
	
		$(function(){
			$(".p1234").on("click",function(){
				var storeNo = $(this).attr("id");
				var userId = '${member.userId}';
				
				$.ajax({
					url : '${pageContext.request.contextPath}/store/updateLike.do',
					data : { no : storeNo, userId : userId }, 
					dataType : 'json',
					success : function(data){
						if(data == true) {
							alert("좋아요 등록 완료!");
							// 좋아요 수 증가
							
						} else {
							alert("좋아요 등록 실패!");
						}
					}, error : function(req, status, error){
						console.log(req);
						console.log(status);
						console.log(error);
					}
				});
			});
		});
		
		$(function(){
			$(".order").on("click",function(){
				var storeNo = $(this).attr("id");
				
				console.log("storeNo="+storeNo);
				location.href = "${pageContext.request.contextPath}/store/selectBuyStore.do?no="
									+ storeNo + "&sAmount=" + sAmount + "&mAmount=" + mAmount + "&lAmount=" + lAmount;
			});
		});
		
		var sAmount = 0;
		var mAmount = 0;
		var lAmount = 0;
		function fn_size(size) {

			var totalprice = 0;
		var pPrice = ${store.PPRICE};
			if( size == "S" ) {
				if(sAmount == 0) {
					sAmount++;
				}
				if( $('#sizeDiv').find('#small').length > 0 ) {
					
					var sa = parseInt($('#sAmount').text());
					Number($('#sAmount').text(sa + 1));
					sAmount = sa +1;

					var sp = parseInt($('#sPrice').text());
					Number($('#sPrice').text(sp + pPrice));
					var sPrice = sp + pPrice;
					console.log("sPrice="+sPrice);
					console.log(typeof(sPrice));
					
					$('#sPrice').text(sPrice + "원");
					  
					console.log("sAmount="+sAmount);
					console.log("sPrice="+sPrice);
				} else {
					var small = "";
	
					small += "<tr id='small'>";
					small += "<th id='sSize'>S</th>";
					small += "<th id='sAmount'>" + sAmount + "</th>";
					small += "<th id='sPrice'>" + ${store.PPRICE} + "원</th>";
					small += "</tr>";
					
					$("#sizeDiv").append(small);
					
					sPrice = pPrice;
					console.log("sPrice="+sPrice);
					console.log(typeof(sPrice));
				}
			}else if(size == "M"){
				if(mAmount == 0) {
					mAmount++;
				}
				if( $('#sizeDiv').find('#medium').length > 0 ) {
					
					var ma = parseInt($('#mAmount').text());
					Number($('#mAmount').text(ma + 1));
					mAmount = ma +1;

					var mp = parseInt($('#mPrice').text());
					Number($('#mPrice').text(mp + pPrice));
					mPrice = mp + pPrice;
					
					$('#mPrice').text(mPrice + "원");
					
					console.log("mAmount="+mAmount);
					console.log("mPrice="+mPrice);
					
				} else {
					var medium = "";
	
					medium += "<tr id='medium'>";
					medium += "<th id= 'mSize' >M</th>";
					medium += "<th id='mAmount'>" + mAmount + "</th>";
					medium += "<th id='mPrice'>" + ${store.PPRICE} + "원</th>";
					medium += "</tr>";
					
					$("#sizeDiv").append(medium);

					mPrice = pPrice;
					console.log("mPrice="+mPrice);
					console.log(typeof(mPrice));
				}
			}else {
				if(lAmount == 0) {
					lAmount++;
				}
				if( $('#sizeDiv').find('#large').length > 0 ) {
					
					var la = parseInt($('#lAmount').text());
					Number($('#lAmount').text(la + 1));
					lAmount = la +1;

					var lp = parseInt($('#lPrice').text());
					Number($('#lPrice').text(lp + pPrice));
					lPrice = lp + pPrice;
					
					$('#lPrice').text(lPrice + "원");
					  
					console.log("lAmount="+lAmount);
					console.log("lPrice="+lPrice);
					
				} else {
					var large = "";
	
					large += "<tr id='large'>";
					large += "<th id='lSize'>L</th>";
					large += "<th id='lAmount'>" + lAmount + "</th>";
					large += "<th id='lPrice'>" + ${store.PPRICE} + "원</th>";
					large += "</tr>";
					
					$("#sizeDiv").append(large);

					lPrice = pPrice;
					console.log("lPrice="+lPrice);
					console.log(typeof(lPrice));
				}
			}
			
			totalprice = 0;

			for(var i = 0; i < $('th[id*=Price]').length; i++ ){
			    var price =  parseInt($($('th[id*=Price]')[i]).text());
			    console.log("price : " + price);
			    if(price != NaN) totalprice += price;
			}
			
			$("#totalprice-contents").text(totalprice + "원");
		}

		//댓글 삭제
		function fn_deleteStoreComment(bcno){
			if(confirm('삭제하시겠습니까?')){ 
				location.href='${pageContext.request.contextPath}/store/deleteStoreComment.do?bNo=${store.BNO}&bcNo='+bcno;
			}
		}
		
	</script>
	</body>
</html>

