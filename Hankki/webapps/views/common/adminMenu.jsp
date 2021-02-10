<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
	#top1 {
		display : inline-block;
		background : #E2E2E2;
		border : 1px solid black;
		text-align : center;
		font-size : 18px;
	}
	
	#top1 a {
		color : black;
		text-decoration : none;
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
	<div class="container-fluid">
        <div class="row">
	        <div class="col-md-6 col-md-offset-3" style="text-align:center;">
		        <a href="<%=request.getContextPath()%>">
		        	<img src="<%=request.getContextPath()%>/resources/images/final_logo.JPG"
		        	 height="140px" width="190px">
				</a>
            </div>
            <div class="col-md-3">
	            <div class="col-md-8" id="top1">
	                <a href="<%= request.getContextPath() %>/index.jsp">관리자 페이지 나가기</a>
	             </div>
	             <div class="col-md-4" id="top1">
	            	<a href="#">로그아웃</a>
	            </div>
            </div>
		</div>
    </div>
    <div class="row">
	    <div id="nav-box" class="col-md-1 col-md-offset-1">
	        <ul id="navi">
	            <ul class="sub">
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/user_Manage.ad">회원 관리</a></li>
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/views/admin/Product/product_manage.jsp">상품 관리</a></li>
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/views/admin/Recipe/recipe_Manage.jsp">레시피 관리</a></li>
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/advertise_Manage.ad">광고 관리</a></li>
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/views/admin/Event/EventManage.jsp">이벤트 관리</a></li>
	                <li><strong>>&nbsp;</strong><a href="#">공지 사항 관리</a></li>
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/views/admin/QA/QA_Manage.jsp">Q&A 관리</a></li>
	                <li><strong>>&nbsp;</strong><a href="<%= request.getContextPath() %>/views/admin/Question/Q_Manage.jsp">자주묻는 질문 관리</a></li>
	            </ul>
	        </ul>
	    </div>
	</div>
</body>
</html>








