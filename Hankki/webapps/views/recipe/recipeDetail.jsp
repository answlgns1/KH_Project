<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세 페이지</title>
<style>

header {
	height: 230px;
}
#title {
	font-size : 25px;
	text-align: left;
}
	
#content img {
	width : 100%;
	height : 350px;
}
	
	
#content>input {
	width : 70%;
}
	
#content>* {
	line-height : 20px;
}
	
table {
      border-collapse: separate;
      border-spacing: 0 10px;
}
	
td input {width : 455px;}
	
td {line-height : 1.5em;}


</style>
</head>
<body>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>

	 
	 <!-- upper side content -->
	 <div class="container">
	   <div class="row">
		  <div class="col-md-2"></div>
	       <div class="col-md-8" id="name-box" style="text-align: center;"><h3>레시피 이름</h3></div>
	   </div>
	    <br>
	   <div class="row">
		  <div class="col-md-1"></div>
		   <div class="col-md-10"><br></div>
	   </div>
	   <!-- upper side content End-->
	   
	     <!-- second content picture -->
	   <div class="row">
		 <div class="col-md-1"></div>
		 <div class="col-md-5" id="content" style="padding-left: 30px;">
			<img src="<%=request.getContextPath()%>/resources/images/sample_images_01.png" >
		 </div>
		 <!-- second content picture End-->
		 
		 <!-- second content input -->
		 <div class="col-md-6" style="padding-left: 60px;">
		    <h4>재료</h4>
		    <div style="height:200px;width:410px;border:1px solid #ccc;font:16px/26px /*Georgia, Garamond, Serif*/;overflow:auto;">
	
		        <div class="container" style="width:400px;">  
                <br />  
                  <div class="form-group" style="width:380px;">  
                     <form name="add_name" id="add_name">  
                          <div class="table-responsive" style="width:380px;">  
                            <p>음식 재료</p>
                          </div>  
                     </form>  
                   </div>  
                 </div>   
		    </div>
		    <br>
		     <h4>조리시간</h4>
		    <p> 약 40분</p>
		 </div>
	   </div>
	   <!-- second content input End-->
	<br><br>
	<hr>
	
	 <!-- last content picture -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		   <div>
				<img src="<%=request.getContextPath()%>/resources/images/sample_images_01.png" style="width: 100%; padding-left: 10px;">
			</div>		
		</div>
		<div class="col-md-1"></div>
	</div>	
	<br><br><br>
	
	 <!-- last content picture End-->
    </div>
         
		<%@ include file="../common/footer.jsp"%>

</body>
</html>