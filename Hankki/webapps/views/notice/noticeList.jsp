<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록표</title> 
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
             <!--  /myWeb : 나중에 JSP가 서블릿으로 바뀌면, 얘도 자동으로 바뀜 -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">           
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
          
<style>
.outer {
	width: 800px;
	height: auto;
	background: white;
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	padding: 40px 5px;
	/*border:1px solid black;*/
}

.table {
	width: 800px;
}

.tableArea {
	width: 650px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	padding: 20px 0px;
}

.searchArea {
	width: 650px;
	margin-left: auto;
	margin-right: auto;
}

#check_search {
	position: middle;
}

#table_top {
	display: inline;
}

#userTable tr td {
	text-align: center;
}

#thead {
	background: #E2E2E2;
}

#userTable tr {
	border-bottom: 1px solid black;
	height: 40px;
	cursor: pointer;
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

/*Table*/
.lable_check {
	padding-right: 30px !important;
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

/*left-side menu*/
#order_menu_area{
	top: 280px;
	left: 10px;
}

#order_menu_area > table{
	width: 180px;
	border: 2px solid black;
}

</style>

</head>
<body>

	<%@ include file="../common/header.jsp"%>
	
	 <!-- left-side menu -->
    <div class="col-xs-1 col-xs-offset-1" id="order_menu_area">
				<table class="table table-hover" id="order_menu">
					<tr>
						<td>공지사항</td>
					</tr>
					<tr>
						<td>자주하는 질문</td>
					</tr>
					<tr>
						<td>1:1 문의</td>
					</tr>
				</table>
			</div>
	<!-- left-side menu End -->	
	<!-- <a href="#">1:1 문의</a> -->
    
	<!--notice table-->
	<div class="outer">
		<br>		
		<div id="table_top">
		   <h2 align="left">공지사항 </h2><p>새로운 소식들과 유용한 정보들을 확인하세요.</p>	   
		</div>
				
		<div class="row">
		<div class="col-md-3"></div>
		<div class="table">
			<table class="table table-hover" id="userTable">
				<tr id="thead">
					<td>번호</td>
					<td>제목</td>
					<td>작성일</td>					
				</tr>
				<tr>
					<td>00001</td>
					<td>[가격인상 공지] 사과 1개의 가격에 대해서</td>
					<td>2020.10.26</td>					
				</tr>
				<tr>
					<td>00002</td>
					<td>[주문배송]새벽 배송에 문제가 발생했습니다.</td>
					<td>2020.10.26</td>
				</tr>
				<tr>
					<td>00003</td>
					<td>[가격인상 공지] 호주산 오렌지 물량에 관해서</td>
					<td>2020.10.26</td>
				</tr>
				<tr>
					<td>00004</td>
					<td>[가격인상 공지] 사과 1개의 가격에 대해서</td>
					<td>2020.10.26</td>
				</tr>
				<tr>
					<td>00005</td>
					<td>[가격인상 공지] 사과 1개의 가격에 대해서</td>
					<td>2020.10.26</td>
				</tr>
				<tr>
					<td>00006</td>
					<td>[가격인상 공지] 사과 1개의 가격에 대해서</td>
					<td>2020.10.26</td>
				</tr>
				<tr>
					<td>00007</td>
					<td>[가격인상 공지] 사과 1개의 가격에 대해서</td>
					<td>2020.10.26</td>
				</tr>
				<tr>
					<td>00008</td>
					<td>[가격인상 공지] 사과 1개의 가격에 대해서</td>
					<td>2020.10.26</td>
				</tr>
				<tr>
					<td>00009</td>
					<td>[가격인상 공지] 사과 1개의 가격에 대해서</td>
					<td>2020.10.26</td>
				</tr>
				<tr>
					<td>00010</td>
					<td>[가격인상 공지] 사과 1개의 가격에 대해서</td>
					<td>2020.10.26</td>
				</tr>
			</table>
		<!--notice table End-->
			
		<!--paging-->	
		</div>
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
        <hr>
        <!-- search condition -->
        <div id="check_search" style="text-align: center;">
			 <input type="checkbox" id="check_title" name="check_title" value="">
             <label class="lable_check" for="check_title">제목</label>
             
             <input type="checkbox" id="check_content" name="check_content" value="">
             <label class="lable_check" for="check_content">내용</label>
             
             <input type="checkbox" id="check_both" name="check_both" value="">
             <label class="lable_check" for="check_both">제목+내용</label>
             
			 <input type="search" id="keyword" placeholder="키워드를 입력하세요!"> 
			 <button type="button" onclick="search();">검색하기</button>
		</div>
		<!-- search condition End -->
       </div>
	</div>
		
    <br><br><br><br>
    <%@ include file="../common/footer.jsp"%>
	
</body>
</html>