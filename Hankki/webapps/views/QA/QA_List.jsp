<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.qa.model.vo.Qa" %>
<% ArrayList<Qa> list2 = (ArrayList<Qa>)request.getAttribute("list2"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1질문 목록표</title> 
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
            
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
<<<<<<< HEAD
	padding-top: 230px;
=======
>>>>>>> branch 'develop' of https://github.com/SemiHankki/testTeamGit.git
	/*border:1px solid black;*/
}

.table {
	width: auto;	
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
	text-align: center;
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

div#nav-box {
		margin : 10% 10%;
        padding: 0;
        font-family: "맑은 고딕";
        font-size: 0.9em;
        width : 200px;
        position : absolute;
    }

    ul#navi {
        width: 200px;
        text-indent: 10px;
    }

    ul#navi,
    ul#navi ul {
        margin: 0;
        padding: 0;
        list-style: none;
        border : 1px double black;
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

</head>
<body>

	<%@ include file="../common/header.jsp"%>
	<br><br><br><br><br><br> 
	 <!-- left-side menu -->
	 
	 <div class="container" style="display:grid; width: auto;">
	 	
     <div class="row">
	    <div id="nav-box" class="col-md-1 col-md-offset-1">
	        <ul id="navi">
	            <ul class="sub">	               
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/SelectList.no">공지 사항</a></li>
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/qSelectList.qu">자주 묻는 질문</a></li>
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/SelectList.qa">1:1 문의</a></li>
	            </ul>
	        </ul>
	    </div>
	</div>
	<!-- left-side menu End -->	
	
    
	<!--notice table-->
	<div class="outer" style="margin-top : 50px;">
		<br>						
		<div class="row">
		<div class="col-md-3"></div>
		
		<div id="table_top">
		   <h2 align="left">1:1 문의 </h2>  
		</div>
		
		<div class="table">
			<table class="table table-hover" id="userTable">
				<tr id="thead">
					<th width="70px" style="text-align: center;">번호</th>
					<th width="70px" style="text-align: center;">작성자</th>
					<th width="200px" style="text-align: center;">제목</th>
					<th width="200px" style="text-align: center;">내용</th>
					<th width="100px" style="text-align: center;">날짜</th>			
				</tr>
				<% for(Qa q : list2) { %>
				<tr>
	               <td><%= q.getQa_no() %></td>
	               <td><%= q.getQa_writer() %></td>
	               <td><%= q.getQa_title() %></td>
	               <td><%= q.getQa_content() %></td>
	               <td><%= q.getQa_date() %></td>	                			
				</tr>
				<% } %>
			</table>
		<!--notice table End-->
		
		<br><br><br>
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
		</div>
    <br><br><br><br>
    
    <script>  
		$(function(){
			
			$("#userTable td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				var qa_no = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/SelectOne.qa?qa_no=" + qa_no;
			});
		});
		
		function search(){
			location.href="<%=request.getContextPath()%>/Search.qa?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
	</script>	
    <%@ include file="../common/footer.jsp"%>
	
</body>
</html>