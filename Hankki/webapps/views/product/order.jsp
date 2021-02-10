<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.product.model.vo.*" %>
<% Product p = (Product)session.getAttribute("product"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<style>
	/* ------------------타이틀 시작------------------- */
	#title>div {
		display : inline-block;
		padding : 10px;
	}
	
	#title>div:last-child {
		float : right;
		font-size : 16px;
		color : #B2B2B2;
		padding : 25px 0px 0px 0px;
	}
	
	#title>div:last-child>b {
		color : black;
	}
	/* ------------------타이틀 끝------------------- */
	
	/* ------------------주문정보 시작------------------- */
	#order-box {
		background-image : url(<%= request.getContextPath() %>/resources/images/order_background.jpg);
	}
	
	#order-info>thead>tr>th {
		text-align : center;
	}
	
	#order-info>tbody>tr>td:not(:nth-child(2)) {
		text-align : center;
	}
	
	#order-info>tbody>tr>td>img {
		width : 80%;
		height : 80px;
	}
	
	#order-info>tbody>tr>td {
		vertical-align : middle;
	}
	
	#order-info>tbody>tr>td:nth-child(2) {
		font-size : 20px;
		font-weight : bold;
	}
	/* ------------------주문정보 끝------------------- */
	
	/* ------------------주문자 정보 시작------------------- */
	#userInfo {
		border : 1px solid #D2D2D2;
		border-radius : 10px;
		box-shadow : 1px 1px 1px black; 
		height : 400px;
		line-height : 3em;
		font-size : 14px;
	}
	/* ------------------주문자 정보 끝------------------- */
	
	/* ------------------배송지 시작------------------- */
	#address {
		border : 1px solid #D2D2D2;
		border-radius : 10px;
		box-shadow : 1px 1px 1px black; 
		height : 400px;
	}
	
	#selectAdd * {
		display : inline-block;
	}
	
	#selectAdd>p {
		float : right;
	}
	
	#originAdd ul li {
		line-height : 2em;
		font-size : 15px;
		margin-left : 7%;
	}
	
	#newAdd * {
		margin-top : 3px;
	}
	/*-------------------배송지 끝----------------------*/
	
	/*-------------------결제 시작----------------------*/
	#payment {
		border : 1px solid #D2D2D2;
		border-radius : 10px;
		box-shadow : 1px 1px 1px black; 
		height : 300px;
		line-height : 3em;
		font-size : 14px;
		margin : 2%;
		width : 96%;
	}
	
	#point>span {
		color : black;
		font-size : 14px;
		float : right;
		padding-right : 5%;
	}
	
	#usePoint {
		padding-left : 8%;
	}
	
	#usePoint input {
		border : none;
		width : 30%;
		height : 20px;
		text-align : right;
		margin-left : 15px;
	}
	
	#payMoney>* {
		display : inline-block;
	}
	
	#payMoney div {
		margin-left : 7%;
		border-bottom : 2px solid black;
		font-size : 30px;
		width : 70%;
	}
	
	#payMoney p {
		margin-left : 26%;
		color : gray;
		line-height : 2em;
	}
	/*--------------------결제 끝-----------------------*/
	
	/*--------------------정규표현식(숫자만) 시작-------------------------*/
	#numChk {
		display : none;
		color : gray;
	}
	
	#numChk2 {
		display : none;
		color : lightgreen;
	}
	/*--------------------정규표현식(숫자만) 끝-------------------------*/
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="container" style="padding-bottom : 5%;">
		<div class="row">
			<div id="order-box" class="col-md-10 col-md-offset-1" style="height : 1200px;">
				<div id="title" style="font-size : 28px; border-bottom : 1px dotted black;">
					<div>
						<strong>주문/결제</strong>
					</div>
					<div>
						장바구니 > <b>주문/결제</b> > 완료
					</div>
				</div>
				<table id="order-info" class="table" style="border-bottom : 2px dashed black;">
					<thead>
						<tr>
							<th width="20%">상품 사진</th>
							<th width="40%">상품 이름</th>
							<th width="10%">수량</th>
							<th width="15%">할인금액</th>
							<th width="15%">주문금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="<%= request.getContextPath() %>/resources/images/chicken2.jpg"/></td>
							<td>Winner Winner Chicken Dinner !</td>
							<td>1</td>
							<td>-</td>
							<td>19,900 원</td>
						</tr>
						<tr>
							<td><img src="<%= request.getContextPath() %>/resources/images/burger.jpg"/></td>
							<td><%=p.getP_name() %></td>
							<td>1</td>
							<td>-</td>
							<td><%=p.getP_price() %>원</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div id="userInfo" class="col-md-5">
					<h3><b>주문자 정보</b></h3>
					<br>
					<div class="col-md-4" style="font-weight:bold; text-align : right;">
						<p>
							주문자 이름 :<br>
							연락처 :<br>
							주소 :<br>
						</p>
					</div>
					<div class="col-md-8" style="">
						<p>
							<%=m.getUserName() %><br>
							<%=m.getUserPhone() %><br>
							<%=m.getUserAddress()%>
						</p>
					</div>
				</div>
				<div id="address" class="col-md-6 col-md-offset-1">
					<h3><b>배송지 정보</b></h3>
					<br>
					<div id="selectAdd">
						<h5 style="margin-left : 10%;"><b>배송지 선택</b></h5>
						<p>
							<input type="radio" name="address" id="originAddress" onchange="setDisplay()" checked/> 기존 배송지
							&nbsp;&nbsp;&nbsp;
							<input type="radio" name="address" id="newAddress" onchange="setDisplay()"/> 신규 배송지
						</p>
					</div>
					<br>
					<div id="originAdd">
						<ul>
							<li><%=m.getUserName() %></li>
							<li><%=m.getUserPhone() %></li>
							<li><%=m.getUserAddress()%></li>
						</ul>
						<br><br><br>
						&nbsp;&nbsp;&nbsp;
						<b>배송 요청 사항</b>
						<select name="" id="post" style="float : right; width : 70%;">
							<option value="">배송 전에 미리 연락 바랍니다.</option>
							<option value="">부재시 경비실에 맡겨 주세요.</option>
							<option value="">부재시 전화 주시거나 문자 남겨 주세요.</option>
							<option value="">부재시 문앞에 두고 가주세요.</option>
							<option value="">무인 택배함에 넣고 문자 남겨주세요.</option>
						</select>
					</div>
					<div id="newAdd" style="display : none;">
						<div class="row">
							<div class="col-md-12" id="new1">
								<b>수령인 : </b> <input type="text" style="width: 50%;" placeholder="수령인 이름을 입력해주세요." /><br>
								<b>연락처 : </b> <input type="text" id="phone" style="width: 50%;" placeholder="연락처를 입력해주세요." maxlength="11" />
								<span id="numChk">숫자만 입력해주세요..</span>
								<span id="numChk2">잘하고 있어요!</span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<b>배송지</b>
							</div>
							<div class="col-md-10">
								<input type="text" id="sample4_postcode" style="width:30%" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
								<input type="text" id="sample4_jibunAddress" placeholder="지번주소"><br>
								<span id="guide" style="color: #999; display: none"></span>
								<input type="text" id="sample4_detailAddress" placeholder="상세주소" style="width : 100%;"><br>
								<input type="text" id="sample4_extraAddress" placeholder="참고항목" style="width : 100%;">
							</div>
						</div>
						<br>
						<div>
							<b>배송 요청 사항</b>
							&nbsp;&nbsp;
							<select id="post" style="text-align : right; width : 70%;">
								<option value="">배송 전에 미리 연락 바랍니다.</option>
								<option value="">부재시 경비실에 맡겨 주세요.</option>
								<option value="">부재시 전화 주시거나 문자 남겨 주세요.</option>
								<option value="">부재시 문앞에 두고 가주세요.</option>
								<option value="">무인 택배함에 넣고 문자 남겨주세요.</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-11" id="payment">
						<h3><b>결제</b></h3>
						<br>
						<div class="col-md-2">
							<h5><b>적립포인트 사용</b></h5>
						</div>
						<div class="col-md-4">
							<p id="point" style="background : #CEFBC9; padding-left:5%; color:gray;">
								<b>보유중인 적립금</b>
								<span><%=m.getUserPoint()%></span>
							</p>
							<p id="usePoint">
								<b>└ 사용할 적립포인트</b>
								<input type="text"  width="100px" placeholder="0" />원
								<button class="btn btn-default btn-sm" style="float:right; margin-right:10%;">전액 사용</button>
							</p>
						</div>
						<div id="payMoney" class="col-md-5 col-md-offset-1">
							<h5><b>결제 금액</b></h5>
							<div>
								<%=p.getP_price() %>원
							</div>
							<p>
								총 상품금액<br>
								배송비<br>
								할인금액<br>
								적립포인트 사용
							</p>
							<p style="text-align:right;">
								<%=p.getP_price() %>원<br>
								0원<br>
								0원<br>
								0원
							</p>
						</div>
					</div>
				</div>
				<br><br><br>
				<div style="text-align:center;">
					<button class="btn btn-success btn-md">결제하기</button> &nbsp;&nbsp;
					<button class="btn btn-danger btn-md">취소하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--------------------- 배송지 선택 스크립트 시작 -------------------->
	<script>
		function setDisplay() {
			if($('input:radio[id=originAddress]').is(':checked')) {
				$('#newAdd').hide();
				$('#originAdd').show();
			} else {
				$('#originAdd').hide();
				$('#newAdd').show();
			}
		}
	</script>
	<!--------------------- 배송지 선택 스크립트 시작 -------------------->
	
	<!------------------------------------- Daum 주소 API 스크립트 시작 ---------------------------------------->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>
	<!------------------------------------- Daum 주소 API 스크립트 끝 ----------------------------------------->
	
	<!------------------------------------- 정규 표현식(숫자만) 스크립트 시작 --------------------------------->
	<script>
		$('#phone').bind("keyup", function(event) {
			var re = /\d/;
			var temp = $('#phone').val();
			
			if(re.test(temp)) {
				$('#numChk2').show();
				$('#numChk2').fadeOut(2000);
				
			} else {
				$('#numChk').show();
				$('#numChk').fadeOut(2000);
				
				$('#phone').val(temp.replace(/[^0-9]/g, ""));
			}
		})
	</script>
	<!------------------------------------- 정규 표현식(숫자만) 스크립트 끝 --------------------------------->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>