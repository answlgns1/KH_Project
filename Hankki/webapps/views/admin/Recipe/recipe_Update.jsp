<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 수정</title>
<style>

   section {
       position : absolute;
       margin : 1% 18%;
       width : 65%;
       height : auto;
       padding-top: 0px;
   }

#title {
	font-size : 25px;
	text-align: left;
}
	
#content img {
	width : 100%;
	height : 350px;
}
	
#result {
	text-align: center;
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

#name-box {
    border-radius: 8px;
    background-color: rgb(46,143,88); 
    color: white;
    text-size: 20px; 
    margin-left: auto;
    margin-right: auto;
    padding: 8px;
}

#result {
		text-align: center;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/adminMenu.jsp" %>
	
	 <hr>
	<section>
	 
	 <!-- upper side content -->
	   <div class="row">
		  <div class="col-md-2"></div>
	       <div class="col-md-8" id="name-box" style="text-align: center;">
             <input type="text" class="" placeholder="레시피 이름" style="width: 70%;">
           </div>
	   </div>
	    <br>
	   <div class="row">
		  <div class="col-md-1"></div>
		   <div class="col-md-10" id="title" style="background: white; padding-left: 30px;">레시피 수정</div>
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
                  <div class="form-group" style="width:400px;">  
                     <form name="add_name" id="add_name">  
                          <div class="table-responsive" style="width:380px;">  
                               <table class="table table-bordered" id="dynamic_field" style="width:380px;">  
                                    <tr>  
                                         <td><input type="text" name="name[]" placeholder="재료를 입력해주세요." class="form-control name_list" style="width:300px;"/></td>  
                                         <td><button type="button" name="add" id="add" class="btn btn-success">+</button></td>  
                                    </tr>  
                                    <tr>  
                                         <td><input type="text" name="name[]" placeholder="재료를 입력해주세요." class="form-control name_list" style="width:300px;"/></td>  
                                         <td><button type="button" name="add" id="add" class="btn btn-success">+</button></td>  
                                    </tr>  
                                    <tr>  
                                         <td><input type="text" name="name[]" placeholder="재료를 입력해주세요." class="form-control name_list" style="width:300px;"/></td>  
                                         <td><button type="button" name="add" id="add" class="btn btn-success">+</button></td>  
                                    </tr>  
                               </table>  
                              <!-- <input type="button" name="submit" id="submit" class="btn btn-info" value="Submit" />  -->  
                          </div>  
                     </form>  
                   </div>  
                 </div>   
		    </div>
		    <br>
		     <h4>조리시간</h4>
		     <input type="text" name="time" placeholder="조리시간을 입력해주세요." class="" style="width:300px;"/>
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
	<br><br>
	
	      <div id="result">
			<input type="submit" class="btn btn-success btn-sm" value="수정하기"/> &nbsp;
		   	<input type="reset" class="btn btn-danger btn-sm" value="취소하기"/>
		  </div>
	 <!-- last content picture End-->
	 
         <!-- scroll box -->
         <!-- 
	     <script>  
           $(document).ready(function(){  
               var i=1;  
               $('#add').click(function(){  
                    i++;  
                    $('#dynamic_field').append('<tr id="row'+i+'"><td><input type="text" name="name[]" placeholder="재료를 입력해주세요." class="form-control name_list" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');  
               });  
               $(document).on('click', '.btn_remove', function(){  
                    var button_id = $(this).attr("id");   
                    $('#row'+button_id+'').remove();  
               });  
               $('#submit').click(function(){            
                    $.ajax({  
                         url:"name.php",  
                         method:"POST",  
                         data:$('#add_name').serialize(),  
                         success:function(data)  
                         {  
                              alert(data);  
                              $('#add_name')[0].reset();  
                         }  
                    });  
               });  
          });  
        </script>
         -->
	</section>

   
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>