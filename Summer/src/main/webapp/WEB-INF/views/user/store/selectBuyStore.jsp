<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyStore</title>
</head>
<style>
	.product-wrap{
	width : 100%;
	}
	.product-title{
		color : black;
		font-weight: bold;
	}
	.product-contents{
	}
	#tbl-product{
		width : 100%;
		text-align : center;
		border: 1px solid grey;
	}
	
	#product-top{
		background : #88c8bc;
		border-bottom : 2px solid grey;
		height : 50px;
	}
	#product-top th{
		border: 1px solid grey;
	}
	.product-bottom, .product-bottom td{
		border : 1px solid grey;
	}
	.product-1{width : 40%;}
	.product-2{width : 12%;}
	.product-3{width : 12%;}
	.product-4{width : 12%;}
	.product-5{width : 12%;}
	.product-6{width : 12%;}
	.productInfo-img{
		width : 130px;
		height : 130px;
		margin-left : auto;
		margin-right : auto;
		
	}
	.productInfo-contents{
		width : 310px;
		height : 130px;
		margin-right : 20px;
		
	
	}
	.product-img{
		margin-top : 15px;
		
		width : 100%;
		height : 100%;
	}

	.productInfo-wrap div{
		display : inline-block;
	}
	#productInfo-wrap{
		width : 460px;
		height : 160px;
		margin-left : auto;
		margin-right : auto;
		
	}
	.t {
		margin-top : 10px;
		width : 300px;
		height : 130px;	
		
	}
	.t-title{
		font-size : 20px;
		padding : 5px;
	}
	.t-contents{
		font-size : 13px;
		padding : 5px;
	}
	.br{
	padding-top : 30px;
	}
	.recipient-wrap{
		
		margin-left : -15px;
		width : 560px;
	}
	.buyer-wrap{
		
		margin-left : 15px;
		width : 100%;
	}
	
	.recipientInfo{
		font-weight : bold;
		color : black;
	}
	.buyerInfo{
		font-weight : bold;
		color : black;
	}
	.recipient-title{
		font-weight : bold;
		text-align : center;
		background : #88c8bc;
		border : 1px solid grey;
	}
	.buyer-title{
		font-weight : bold;
		text-align : center;
		background : #88c8bc;
		border : 1px solid grey;
	}
	.recipient-conttents{
		border : 1px solid grey;
	}
	.buyer-conttents{
		border : 1px solid grey;
	}
	.phone{
		width : 80px;
	}
	#address_3, #sample6_extraAddress{
		width : 80px;
	}
	.center{
	text-align : center;
	
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
							/ <span>Buy</span>
						</p>
					</div>
				</div>
				<h1>Store</h1>
				<hr style="margin-top:-10px;"/>
				<!-- 페이지 정보 -->
				<div class="container">
					<div class="row">
						<!-- 상품 정보 -->
						<div class="product-wrap">
							<div class="product-title">ProductInfo</div>
								<div class="product-contents">
									<table id="tbl-product">
										<tr id="product-top">
											<th class="product-1">상품 정보</th>
											<th class="product-2">사이즈</th>
											<th class="product-3">수량</th>
											<th class="product-4">적립 포인트</th>
											<th class="product-5">배송비</th>
											<th class="product-6">주문 금액</th>
										</tr>
										<c:choose>
											<c:when test="${ sAmount == 0 }">
												<tr class="product-bottom" id="small-ProductInfo" style="display:none;">
											</c:when>
											<c:otherwise>
												<tr class="product-bottom" id="small-ProductInfo">
											</c:otherwise>
										</c:choose>
													<td>
														<div class = "row" id="productInfo-wrap">
															<div class="productInfo-img">
																<img src="${pageContext.request.contextPath}${ store.FILEPATH }${ store.NEWFILENAME }" class="product-img" alt="product-img">
															</div>
															<div class="productInfo-contents">
																<table class="t">
																	<tr class="t-title">
																		<th>상품명</th>
																		<th>${ store.PNAME }</th>
																	</tr>
																	<tr class="t-contents">
																		<th>상품설명</th>
																		<th>${ store.PDESCRIPTION }</th>
																	</tr>
																									
																</table>
															</div>
														</div>
													</td>
													<td>S</td>
													<td>${ sAmount }</td>
													<td>ⓟ${ sAmount * store.PPRICE / 10 }</td>
													<td>무료</td>
													<td>${ sAmount * store.PPRICE }원</td>
												</tr>
										<c:choose>
											<c:when test="${ mAmount == 0 }">
												<tr class="product-bottom" id="medium-ProductInfo" style="display:none;">
											</c:when>
											<c:otherwise>
												<tr class="product-bottom" id="medium-ProductInfo">
											</c:otherwise>
										</c:choose>
													<td>
														<div class = "row" id="productInfo-wrap">
															<div class="productInfo-img">
																<img src="${pageContext.request.contextPath}${ store.FILEPATH }${ store.NEWFILENAME }" class="product-img" alt="product-img">
															</div>
															<div class="productInfo-contents">
																<table class="t">
																	<tr class="t-title">
																		<th>상품명</th>
																		<th>${ store.PNAME }</th>
																	</tr>
																	<tr class="t-contents">
																		<th>상품설명</th>
																		<th>${ store.PDESCRIPTION }</th>
																	</tr>
																									
																</table>
															</div>
														</div>
													</td>
													<td>M</td>
													<td>${ mAmount }</td>
													<td>ⓟ${ mAmount * store.PPRICE / 10 }</td>
													<td>무료</td>
													<td>${ mAmount * store.PPRICE }원</td>
												</tr>
										<c:choose>
											<c:when test="${ lAmount == 0 }">
												<tr class="product-bottom" id="large-ProductInfo" style="display:none;">
											</c:when>
											<c:otherwise>
												<tr class="product-bottom" id="large-ProductInfo">
											</c:otherwise>
										</c:choose>
													<td>
														<div class = "row" id="productInfo-wrap">
															<div class="productInfo-img">
																<img src="${pageContext.request.contextPath}${ store.FILEPATH }${ store.NEWFILENAME }" class="product-img" alt="product-img">
															</div>
															<div class="productInfo-contents">
																<table class="t">
																	<tr class="t-title">
																		<th>상품명</th>
																		<th>${ store.PNAME }</th>
																	</tr>
																	<tr class="t-contents">
																		<th>상품설명</th>
																		<th>${ store.PDESCRIPTION }</th>
																	</tr>
																									
																</table>
															</div>
														</div>
													</td>
													<td>L</td>
													<td>${ lAmount }</td>
													<td>ⓟ${ lAmount * store.PPRICE / 10}</td>
													<td>무료</td>
													<td>${ lAmount * store.PPRICE}원</td>
												</tr>
										<c:forEach items="${list}" var="b"> 
										<tr id="product-bottom">
											<td>${b.boardNo}</td>
											<td>${b.boardTitle}</td>
											<td>${b.boardWriter}</td>
											<td>${b.boardReadCount }</td>
											<td>${b.boardReadCount }</td>
										</tr>
										</c:forEach>
										
									</table>
								</div>
						</div>
					</div>
				</div>
		<div class="br">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-sm-6 mb-3">
						<!-- 수령자 정보 -->
						<div class="recipient-wrap">
							<div class="recipientInfo">
								RecipientInfo
							</div>
							<div class="recipient-title">
								수령자 정보
							</div>
							<div class="recipient-conttents">
								 <!--테이블 시작 -->
						         <table width="600px" class="recipient-table">
						         <thead>
							         <tr>
								         <th>배송지 선택</th>
								         <td class="s">
								            <input type="radio" name="destination" id="memAddress" checked> 회원 배송지
								            <input type="radio" name="destination" id="newAddress"> 신규 배송지 
								         </td>
								      </tr>
						         </thead>
							      <tbody id="mAdd">
							         <tr>
							           <th>수령인</th>
							           <td><input type="text" name="username" value="${member.userName}"></td>
							         </tr>
							         <tr>
								         <th>연락처</th>
								         <c:set var="p" value="${ member.phone }"/>
								         <td>
								         	<input type="text" name="phone1" class="phone" value="${ fn:substring(p, 0, 3)}"> - 
								            <input type="text" name="phone2" class="phone" value="${ fn:substring(p, 3, 7)}"> -
								            <input type="text" name="phone3" class="phone" value="${ fn:substring(p, 7, 11)}">
								         </td>
								     </tr>
								     <tr>
							            <th>주소</th>
							            <td>
							               <input type="text" name="zip_code" id="sample6_postcode" placeholder="우편번호"> 
							               <button onclick="sample6_execDaumPostcode()" class="btn btn-primary thema" id="shopping-basket">우편번호 찾기</button><br>
							               <input type="text" class = "address" name="address_1" id = "sample6_address" value="${member.address}">
							               <input type="text" class = "address" name="address_2" id = "sample6_detailAddress" value="${member.address}">
							               <input type="text" class = "address" name="address_3" id = "sample6_extraAddress" placeholder="참고항목">
							            </td>
							         </tr>
							      </tbody>
							      
							      <tbody id="nAdd" style="display : none;">
							         <tr>
							           <th>수령인</th>
							           <td><input type="text" name="username"></td>
							         </tr>
							         <tr>
								         <th>연락처</th>
								         <td>
								         	<input type="text" name="phone1" class="phone"> - 
								            <input type="text" name="phone2" class="phone"> -
								            <input type="text" name="phone3" class="phone">
								         </td>
								     </tr>
								     <tr>
							            <th>주소</th>
							            <td>
							               <input type="text" name="zip_code" id="sample6_postcode" placeholder="우편번호"> 
							               <button onclick="sample6_execDaumPostcode()" class="btn btn-primary thema" id="shopping-basket">우편번호 찾기</button><br>
							               <input type="text" class = "address" name="address_1" id = "sample6_address">
							               <input type="text" class = "address" name="address_2" id = "sample6_detailAddress">
							               <input type="text" class = "address" name="address_3" id = "sample6_extraAddress" placeholder="참고항목">
							            </td>
							         </tr>
							      </tbody>
						  		</table>
						   <!--테이블 끝-->		   
						   </div>
						</div>
					</div>
					
					
					
					
					<div class="col-sm-6">
						<!-- 구매자 정보 -->
						<div class="buyer-wrap">
							<div class="BuyerInfo">
								BuyerInfo
							</div>
							<div class="buyer-title">
								구매자 정보
							</div>
							<div class="buyer-conttents">
							<!--테이블 시작 -->
						         <table width="600px" class="recipient-table">		
						         <tr>
						           <th>회원명</th>
						           <td><input type="text" name="username" value="${ member.userName }"></td>
						         </tr>
						         <tr>
							         <th>연락처</th>
							         <td>
							         	<input type="text" name="phone1" class="phone" value="${ fn:substring(p, 0, 3)}"> - 
								        <input type="text" name="phone2" class="phone" value="${ fn:substring(p, 3, 7)}"> -
								        <input type="text" name="phone3" class="phone" value="${ fn:substring(p, 7, 11)}">
							         </td>
							     </tr>
							     <tr>
						            <th>이메일 주소</th>					          
						            <td>
						               <input type="text" name="email" value="${member.email}">
						            </td>
						            
						         </tr>  
						  		</table>
						   <!--테이블 끝-->
						   </div>
						  
						   <c:set var = "totalprice" value="${(sAmount + mAmount + lAmount) * store.PPRICE }" />
						   <div id="old">
						   		<form action="${pageContext.request.contextPath}/store/successBuyStore.do?userid=" 
						   		+ ${ member.userId };
											 
						   						style="display:none;" method="post" id="successPay">
						   	    	
						   	    	수신자명 <input type="text" name="rName" value="${ member.userName }"/>
						 	  	    배송주소 <input type="text" name="rAddress" value="${member.address}"/>
						 	  		연락처  <input type="text" name="rPhone" value="${ member.phone }" />
						 	 		총 가격 <input type="text" name="totalPrice" value="${ totalprice}"/>
						 	 		아이디  <input type="text" name="userId" value="${ member.userId }"/>
						 	 		<!--  주문날짜 <input type="text" name="orderDate" value=""/> -->
						 	 		주문정보 <input type="text" name="orderInfo" value="${ store.PNAME }"/>
						 	 		<button type="submit">gogo</button>
						   		</form>
						   </div>
						</div>
					</div>
				</div>
				<div class="center">
					<button class="btn btn-primary thema" id="payBtn">결제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="location.href='#'" class="btn btn-primary thema" id="shopping-basket">취소하기</button>
				</div>
			</div>
		</div>
			</div>
		</div>
         <c:import url="/WEB-INF/views/user/common/footer.jsp"/>
         
         <!------------------------------------ 다음 주소 API 시작 --------------------------------------------->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
<!------------------------------------ 다음 주소 API 끝 --------------------------------------------->



<!--------------------------------------- 결제 api --------------------------------------------------> 

var IMP = window.IMP; // 생략가능

$(function() {
	IMP.init('imp54566140');
}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
 	// 내 REST API 키를 찾아서 수정하기 // 1178841415834492

$('#payBtn').on('click', function(){
	// 문서 로딩될 때 바로 호출
		IMP.request_pay({
			pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
			name : '${ store.PNAME }',
			amount : 100, // 판매 가격
			//amount : ${(sAmount + mAmount + lAmount) * store.PPRICE },
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울시 강남구 역삼동',
			buyer_postcode : '01234'
		},  function(rsp) {
		    if ( rsp.success ) {
		    	 var msg = '결제가 완료되었습니다.';
		    	 /*
		    	 
			        $.ajax({
					url : '${pageContext.request.contextPath}/store/successBuyStore.do',
					type : 'POST',
					dataType : 'json',
					data : {
						
						imp_uid : rsp.imp_uid,
						pay_method : rsp.pay_method,
						price : rsp.paid_amount,
						status : rsp.status,
						title : rsp.name,
						pg_tid : rsp.pg_tid,
						buyer_name : rsp.buyer_name,
						paid_at : rsp.paid_at,
						receipt_url : rsp.receipt_url
					//기타 필요한 데이터가 있으면 추가 전달
					}
				});
				*/
			        $('#successPay').submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '\n에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
});

$('#memAddress').on('click', function(){
	$('#mAdd').show();
	$('#nAdd').hide();
});

$('#newAddress').on('click', function(){
	$('#mAdd').hide();
	$('#nAdd').show();
});


</script>
		
	

    
</body>
</html>