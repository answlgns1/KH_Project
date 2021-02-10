<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 관리</title>

<style>

section {
     position : absolute;
     margin : 0% 18%;
     width : 65%;
     height : auto;
     padding-top: 0px;
}

#space_area {
	height: 30px;
}

#space_area2{
	height: 70px;
}

#admin_menu_area{
	top: 100px;
	left: 10px;
}

#admin_menu_area > table{
	width: 180px;
	border: 2px solid black;
}

#admin_menu > tr > td > a{
	text-decoration: none;
	color: black;
}

#admin_menu > tr > td:hover{
	background-color: rgb(248,240,211);
	color: black;
}

#title_content, #product_select_area{
	left: 80px;
}

#select_product_option{
	margin-top: 33px;
}

#select_product_search{
	margin-top: 33px;
	text-align: right;
}

#button_area{
	float: right;
}

.button>button{
	width: 100px;
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

#r_picture {}
</style>

</head>
<body>

		<%@ include file="/views/common/adminMenu.jsp" %>

        <hr>
         <section>
			<div class="col-xs-11" id="title_content">
				<div class="col-xs-3" id="title">
					<h2>레시피 관리</h2>
				</div>
				<div class="col-xs-8" id="checkbox_top">
				    <div style="float:right; padding-top: 20px;">
					<input type="checkbox" id="ad_num"
						style="width: 20px; height: 16px;" /> &nbsp; <label
						for="ad_num"> 레시피 번호</label>
						
					<input type="checkbox" id="ad_name"
						style="width: 20px; height: 16px;" /> &nbsp; <label
						for="ad_name"> 레시피 이름</label>
						
                    <input type="text" placeholder="Search" style="height: 30px; width: 200px;">
				    <button type="submit" style="height: 30px">Go!</button>			
				</div>
			   </div>
			</div>


			    
		<div class="col-xs-12" id="space_area">
			<br />
		</div>
            <div class="col-xs-1"></div>
			<div class="col-xs-5">
				<a href="#" class="thumbnail" target="_blank">
				  <img id="r_picture" src="<%=request.getContextPath()%>/resources/images/sample_images_01.png" />
				</a>
				<div class="caption">
						<h3>test caption1</h3>
						<p>test comment1</p>
						<input type="checkbox" id="product_num" style="width: 20px; height: 16px;" /> &nbsp;
						<label for="product_num"> 상품 선택</label>
				</div>
			</div>
			<div class="col-xs-5">
				<a href="#" class="thumbnail"> 
				  <img id="r_picture" src="<%=request.getContextPath()%>/resources/images/sample_images_01.png" />
				</a>
				<div class="caption">
						<h3>test caption2</h3>
						<p>test comment2</p>
						<input type="checkbox" id="product_num" style="width: 20px; height: 16px;" /> &nbsp;
						<label for="product_num"> 상품 선택</label>
				</div>
			</div>
			<div class="col-xs-1"></div>
			<div class="col-xs-12" id="space_area">
				<br />
			</div>
             <br>
             <div class="col-xs-1"></div>
			<div class="col-xs-5">
				<a href="#" class="thumbnail"> 
				  <img id="r_picture" src="<%=request.getContextPath()%>/resources/images/sample_images_01.png" />
				</a>
				<div class="caption">
						<h3>test caption3</h3>
						<p>test comment3</p>
						<input type="checkbox" id="product_num" style="width: 20px; height: 16px;" /> &nbsp;
						<label for="product_num"> 상품 선택</label>
				</div>
			</div>
			<div class="col-xs-5">
			    <a href="#" class="thumbnail"> 
				  <img id="r_picture" src="<%=request.getContextPath()%>/resources/images/sample_images_01.png" />
				</a>
				<div class="caption">
						<h3>test caption4</h3>
						<p>test comment4</p>
						<input type="checkbox" id="product_num" style="width: 20px; height: 16px;" /> &nbsp;
						<label for="product_num"> 상품 선택</label>
				</div>
			</div>
			<div class="col-xs-1"></div>
	
	<br />
	<br />

				<div class="space_area col-xs-12"><br /></div>
                
				<div class="col-xs-10" id="button_area">
				        <br>
					    <div style="float: right; padding-right: 70px;">
						<button type="button" class="btn btn-success btn-lg">등록</button>
				
				
						<button type="button" class="btn btn-warning btn-lg">수정</button>
			
					
						<button type="button" class="btn btn-danger btn-lg">삭제</button>
						</div>
					</div>
				<div class="col-xs-2"></div>
				
				<div class="space_area col-xs-12" style="padding-bottom:10px; padding-top:10px;"></div>

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

	<div class="col-xs-12" id="space_area"></div>
	
 </section>

</body>
</html>