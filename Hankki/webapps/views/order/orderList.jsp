<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

.rowarea {
  padding-top:220px;
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

.button_t1 {
  background-color: rgb(46,143,88);
  border: none;
  color: white;
  padding: 0px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 0px 2px;
  cursor: pointer;
  border-radius: 5px;
  height: 20px; 
  text-align: center;
}

.button_t2 {
  background-color: rgb(248,240,211);
  border: none;
  color: black;
  padding: 0px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 0px 2px;
  cursor: pointer;
  border-radius: 5px;
  height: 20px; 
  text-align: center;
}

.table {width: 800px;}

.tableArea {
  width:650px;
  height: auto;
  margin-left:auto;
  margin-right:auto;
  padding : 20px 0px;      
}

#userTable tr td {text-align : center;}
   
#thead {background : #E2E2E2;}
   
#userTable tr {
  border-bottom : 1px solid black;
  height : 40px;
  cursor : pointer;
}
   
.outer{
  width:800px;
  height: 500px;
  background:white;
  color:black;
  margin-left:auto;
  margin-right:auto;
  padding : 40px 5px;
  padding-top: 10px;
  
}

.table_top {float: left; display: inline-block;}

/* Dropdown Button */
.dropdown {
  position: relative;
  display: inline-block;
  float: right;
  margin-top: 30px;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: white;
  min-width: 100px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 10px 14px;
  text-decoration: none;
  display: block;
  text-align: center;
}


#dropdown_area{
   text-align: right;
}

.dropdown-content a:hover, dropdown-menu a:hover {background-color: rgb(248,240,211);}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: white;}

/*side menu*/
div#nav-box {
    margin: 5% 10%;
    padding: 0;
    font-family: "맑은 고딕";
    font-size: 0.9em;
    width : 160px;
    position : absolute;
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

</style>

<body>
    <%@ include file="../common/header.jsp"%>

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
    
     <div id="nav-box">
        <ul id="navi">
            <ul class="sub">
                <li><strong>>&nbsp;</strong><a href="#">주문 내역</a></li>
                <li><strong>>&nbsp;</strong><a href="#">상품 후기</a></li>
                <li><strong>>&nbsp;</strong><a href="#">상품 문의</a></li>
                <li><strong>>&nbsp;</strong><a href="#">적립금</a></li>
                <li><strong>>&nbsp;</strong><a href="#">쿠폰</a></li>
                <li><strong>>&nbsp;</strong><a href="#">개인정보 수정</a></li>
                <li><strong>>&nbsp;</strong><a href="#">회원 탈퇴</a></li>
            </ul>
        </ul>
     </div>
    
    <br><br>
    <div class="outer">
    
        <!-- sidebar dropdown -->
            <div class="dropdown">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                전체기간 <span class="caret"></span>
              </button>
           
              <div class="dropdown-content" role="menu" aria-labelledby="dropdownMenu1">
                <a role="menuitem" href="#">일주일</a>
                <a role="menuitem" href="#">3개월</a>
                <a role="menuitem" href="#">6개월</a>
                <a role="menuitem" href="#">1년</a>
                <a role="menuitem" href="#">3년</a>
              </div>
         </div>
        <!-- End sidebar dropdown -->
 
        <!-- Order table -->
        <div class="table_top">
         <h2 align="left">주문내역 </h2><p>지난 3년간의 주문 내역 조회가 가능합니다.</p>      
      </div>
       <div class="row">
       <div class="col-md-3"></div>
       <div class="table">
            <table class="table table-hover" id="userTable">
              <tr id="thead">
                <td>주문일(결제번호)</td>
                <td>상품명 / 주문옵션 / 주문번호</td>
                <td>주문상태</td>
                
              </tr>
              <tr>
                <td>2020-10-25 <br> 000000000</td>
                <td>테스트 상품1 <br> 수량 1개 <br> 주문번호: 000000000</td>
                <td>결제 완료 <br>
                    <button class="button_t1" type="button" onclick="location.href='#' ">배송 조회</button><br>
                    <button class="button_t2" type="button" onclick="location.href='#' ">주문 취소</button>
                </td>
                
              </tr>
              
              <tr>
                <td>2020-10-26 <br> 000000001</td>
                <td>테스트 상품2 <br> 수량 1개 <br> 주문번호: 000000001</td>
                <td>배송 완료 <br>
                    <button class="button_t1" type="button" onclick="location.href='#' ">구매 후기</button><br>
                    <button class="button_t2" type="button" onclick="location.href='#' ">반품/취소</button>
                </td>               
              </tr>
           </table>
       </div>
       <!-- Order table -->   
     </div>
    </div>
    
    
    <br><br><br><br>
    <%@ include file="../common/footer.jsp"%>

</body>
</html>