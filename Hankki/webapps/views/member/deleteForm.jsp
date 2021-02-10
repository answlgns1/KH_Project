<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
   <title>회원탈퇴</title>
   <meta charset="UTF-8">

<style>

.div0{         
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.div0-1{
    width: 1200px;
    display: flex;
    justify-content: center;
}

.loginForm {
   width : 800px;
   height : 600px;
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
}

.title{
   text-align: center;
   margin-bottom: 10px;
   margin-top: 10px;
   width: 650px;
}
.check1{
    width: 110px;
    height: 30px;
}
.div1 { /*탈퇴 목록 큰 영역*/
   padding: 5px 20px;
   display:flex ; 
   flex-direction: column; 
   align-items: center;
   justify-content: center;
   padding-top: 40px;
   padding-bottom: 20px;
   width: 800px;
   border-bottom: gray solid;
   border-top: gray solid;
}

span.guide { /*탈퇴 안내 내용*/
	width: 450px;
	height: 100px;
	padding-left: 20px;
	font-size: 12pt;
	line-height: 30px;
}
input { 
    width: 400px;
    height: 40px;
    padding-left: 20px;
    margin-right: 10px;
    border-radius: 5px;
    border: 1px solid grey;
}

.div2 { /*탈퇴 목록 한 줄씩*/
    display: flex;
    padding: 5px 10px;
    width: 700px;
    align-items: center;
    margin-bottom: 15px;
    justify-content: center;
}

.member { /*탈퇴 목록 이름*/
	flex: 1px;
    font-size: 13pt;
}
.div3{ /*목록 안의 내용*/
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 5px 10px;
    width: 500px;
    align-items: center;
    margin-bottom: 15px;
}

.div3-2{ /*체크박스 영역*/
    display: flex;
    width: 400px;
    flex-direction: column;
    font-size: 12pt;
}

.div4{
    width: 1200px;
    display: flex;
    justify-content: center;
}
input[type="checkbox"]{
    display: none;
}

input[type="checkbox"] + label span {
    display: inline-block;
    width: 50px;
    height: 50px;
    margin: -2px 10px 0 0;
    vertical-align: middle;
    background: url(../../resources/images/checkbtn2.png) left top no-repeat;
    cursor: pointer;
    background-size: cover;
}

input[type="checkbox"]:checked + label span {
    background:url(../../resources/images/checkbtn2.png) -50px top no-repeat;
    background-size: cover;
}

textarea{
	resize: none;
	font-size: 13pt;
}


.ok{ /*확인 버튼*/
    margin: 30px 30px;
	background-color: rgb(46, 143, 88);
	color: white;
	border: none;
	border-radius: 5px;
	margin: 50px;
}

.cancel { /*취소 버튼*/
    margin: 30px 30px;
	background-color: rgb(248, 240, 211);
	border: none;
	border-radius: 5px;	
	margin: 50px;
}

/*side menu*/
div#nav-box {
    padding: 0;
    font-family: "맑은 고딕";
    font-size: 0.9em;
    width : 160px;
}

ul#navi {
    width: 160px;
    text-indent: 10px;
}

ul#navi,
ul#navi ul {
    margin: 0;
    padding: 0;
    list-style: none;
    border : 1px solid black;
}

li.group div.title {
    height: 35px;
    line-height: 35px;
    background: #9ab92e;
    cursor: pointer;
}

ul.sub li {
    height: 35px;
    line-height: 35px;
    background: whitesmoke;;
    cursor: pointer;
}

ul.sub li a {
    display: block;
    width: 100%;
    height: 100%;
    text-decoration: none;
    color: #000;
}

ul.sub li:hover {
    background: gray;
    transition-duration: 0.5s;
}

ul.sub li:hover a {
    color : white;
    transition-duration: 0.5s;
}

li strong {
    float: right;
}

/*회색 상단*/
.rowarea {
  padding-top:250px;
  padding-right: 120px;
  padding-left: 120px;    
}

.column_o {
  float: left;
  width: 33.33%;
  padding: 10px;
  height: 200px;
  border: 1px, solid, black;
}

.rowarea:after {
  content: "";
  display: table;
  clear: both;
}

.button_o {
  background-color: rgb(34, 155, 112);
  border: none;
  color: white;
  padding: 0px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 0px 2px;
  cursor: pointer;
  border-radius: 12px;
  height: 30px; 
  text-align: center;
}

#button_o {margin: 0px auto;}
#button_arrow {border: none; background-color: lightgray;}

.outer{
  width:800px;
  height: 500px;
  background:white;
  color:black;
  margin-left:auto;
  margin-right:auto;
  margin-top:10px;
  padding : 40px 5px;
  padding-top: 10px;
}

.table_top {float: left; display: inline-block;}


/*left-side menu*/
#order_menu_area {
	top: 550px;
	left: 10px;
}

#order_menu_area > table{
	width: 180px;
	border: 2px solid black;
}

button#ok{ /* 완료 버튼 */
   margin : 30px 30px;
   width: 250px;
   height: 40px;
   background-color: rgb(46, 143, 88);
   color: white;
   font-size: 15px;
   cursor: pointer;
   border: none;
   border-radius: 5px;
}

button#cancel{  /*취소 버튼*/
   margin : 30px 30px;
   width: 250px;
   height: 40px;
   background-color: rgb(248, 240, 211);
   font-size: 15px;
   cursor: pointer;
   border: none;
   border-radius: 5px;
}
</style>
</head>

<body>
<%@ include file="../common/header.jsp" %>

<!-- left-side menu -->
    <div class="col-xs-1 col-xs-offset-1" id="order_menu_area">
				<table class="table table-hover" id="order_menu">
					<tr>
						<td>주문 내역</td>
					</tr>
					<tr>
						<td>상품 후기</td>
					</tr>
					<tr>
						<td>상품 문의</td>
					</tr>
					<tr>
						<td>적립금</td>
					</tr>
					<tr>
						<td>쿠폰</td>
					</tr>
					<tr>
						<td>개인정보 수정</td>
					</tr>
					<tr>
						<td>회원 탈퇴</td>
					</tr>
				</table>
			</div>
	<!-- left-side menu End -->
	
     <!-- 상단 회색 박스 -->
    <div class="container">
    <div class="rowarea">
      <div class="column_o" style="background-color:lightgray;">
      <div class="row">
      	<h3 align="center">________ 님</h3>
          <br>
          <h4 align="center">적립 0%</h4>
          <br>
      </div>
          
        <div id="button_o" class="row" style="text-align:center;">
          <button class="button_o" type="button" onclick="location.href='#' ">전체 등급 보기</button>
          <button class="button_o" type="button" onclick="location.href='#' ">다음 달 예상 등급</button>
        </div>
      </div>
      <div class="column_o" style="background-color:lightgray; border-left: 1px solid black; border-right: 1px solid black;">
           <h3 align="center">적립금</h3>
          <br>
           <h4 align="center">0 원</h4>
          <br>
           <p align="center">소멸예정 0원</p>
      </div>
      <div class="column_o" style="background-color:lightgray;">
          <br>
          <h3 align="center">쿠폰</h3>
          <br>
           <div id="button_o" class="row" style="text-align:center;">
             <button id="button_arrow" type="button" onclick="location.href='#' ">0 개 ></button>
           </div>
      </div>
    </div>
    </div>
    <!-- 상단 회색 박스 끝-->

 <div class="container">
<form id="updateForm" action="/hankki/delete.me" method="post">
<div class="div0">
   <div class="title">
   <h2>회원 탈퇴</h2>
   </div>
<div class="div1">
      <div class="div2">
         <label for="id" class=member>회원 탈퇴 안내</label>
         <div class="div3">
	         <span class="guide"> 고객님께서 회원탈퇴를 원하신다니, <br>
	         		저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다.<br>
	         		불편하셨던 점이나 불만 사항을 알려주시면 적극 반응하여<br>
	         		고객님의 불편함을 해겯해 드리고자 노력하겠습니다.
	         </span>
         </div>
      </div>

      <div class="div2"> 
         <label for="pw" class=member>비밀번호 확인</label>
         <div class="div3">
         	<input type="password" id="pw" placeholder="비밀번호를 입력해주세요"/>
         </div>	
      </div>
      <div class="div2">
         <label for="check" class=member>무엇이 불편하셨나요?</label>
         <div class="div3">
             <div class="div3-2">
                <input type="checkbox" id="box1"/>
                <label for="box1"><span></span>고객 서비스(상담, 포장 등) 불만</label>
                <br>
                <input type="checkbox" id="box2"/>
                <label for="box2"><span></span>교환 / 환불 / 반품 불만</label>
                <br>
                <input type="checkbox" id="box3"/>
                <label for="box3"><span></span>배송 불만</label>
                <br>
                <input type="checkbox" id="box4">
                <label for="box4"><span></span>방문 빈도가 낮음</label>
                <br>
                <input type="checkbox" id="box5"/>
                <label for="box5"><span></span>개인 정보 유출 우려</label>
             </div>
         </div>
      </div>
      
      <div class="div2">
      	<label for="etc" class=member>기타 의견</label>
      	<div class="div3">
      	<textarea cols="60" rows="8" placeholder="기타 의견이 있다면 작성해주세요."></textarea>
      	</div>
         </div>
      </div>
  </div>      
    <div class=div4>
     <button type="submit" id="ok" onclick="deleteMember();)">확인</button>
     <button type="submit" id="cancel" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">취소</button>
 	</div>   
 </form>
</div>

<br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>