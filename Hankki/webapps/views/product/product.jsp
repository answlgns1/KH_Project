<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.product.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String keyword = (String)request.getAttribute("keyword");

	String title = "";
		
	for(Product pd : list){
			
		if(title==""){
			title = pd.getP_explain();
		}		
		else{
			break;
		}
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% if(keyword.length() != 0) { %>
<title>검색 결과 : "<%= keyword %>"</title>
<% } else { %>
<title><%= title %>상품</title>
<% } %>
<style>
header {
	height: 230px;
}

#header_text {
	text-align: center;
}

.space_area {
	height: 20px;
}

/*side bar*/
#aside_table {
	width: 110px;
}

#aside>table {
	text-align: center;
}

#aside_table>tbody>tr>td {
	border-left: 2px solid black;
	border-right: 2px solid black;
}

#row1 {
	border-top: 2px solid black;
}

#row3 {
	border-bottom: 2px solid black;
}

#aside_table>tbody>tr>td>a {
	text-decoration: none;
	color: black;
}

/* Dropdown Button */
#dropdown_area {
	text-align: right;
}

.dropdown {
	position: relative;
	display: inline-block;
	float: right;
	margin-top: 0px;
	margin-right: 20px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 10px 14px;
	text-decoration: none;
	display: block;
	text-align: center;
}

#dropdown_area {
	text-align: right;
}

.dropdown-content a:hover, dropdown-menu a:hover {
	background-color: rgb(248, 240, 211);
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: white;
}
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp" %>
	</header>

	<br />
	<!-- right-side fixed bar -->
	<div class="col-xs-1 col-xs-offset-10 affix" id="aside">
		<a href="#"> <img
			src="<%=request.getContextPath()%>/resources/images/grenn_delivery.png" />
		</a>

		<!-- <div class="col-xs-12"><br /> <br /></div>-->

		<table class="table table-hover" id="aside_table">
			<tbody>
				<tr>
					<td id="row1"><a href="#">등급별 혜택</a></td>
				</tr>
				<tr>
					<td id="row2"><a
						href="<%=request.getContextPath()%>/views/recipe/recipeList.jsp">레시피</a>
					</td>
				</tr>
				<tr>
					<td id="row3"><a href="#">베스트 후기</a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- right-side fixed bar End-->

	<div class="container" id="product_search">

		<div class="row">
			<div class="col-xs-12" id="header_text">
				<% if(keyword.length() != 0) { %>
					<h1>검색 결과 : "<%= keyword %>"</h1>
				<% } else { %>
					<h1><%= title %>상품</h1>
				<% } %>
				<br />
			</div>

			<div class="col-xs-10" id="space_area">
				<br />
			</div>

			<div class="col-xs-10">
				<br />
			</div>

			<!-- sidebar dropdown -->
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button"
					id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
					추천순 <span class="caret"></span>
				</button>

				<div class="dropdown-content" role="menu"
					aria-labelledby="dropdownMenu1">
					<a role="menuitem" href="#">인기순</a> <a role="menuitem" href="#">신상품순</a>
					<a role="menuitem" href="#">낮은 가격순</a> <a role="menuitem" href="#">높은
						가격순</a>
				</div>
			</div>
			<!-- End sidebar dropdown -->

			<div class="space_area col-xs-12">
				<br />
			</div>

			<%
				for (Product pd : list) {
			%>
			<div class="col-xs-4" id="pd_tubmnail">
			<% if(keyword.length() != 0) { %>
				<a href="" class="thumbnail" target="_blank"> <img
					src="<%=request.getContextPath()%>/resources/ProductFiles/<%=pd.getP_attachment()%>" />
				</a>
				<div class="caption">
					<h3><%=pd.getP_name()%></h3>
					<p><%=pd.getP_price()%></p>
					<br /> <br />
				</div>
			
			<% } else { %>
				<a href="" class="thumbnail" target="_blank"> <img
					src="<%=request.getContextPath()%>/resources/itemUploadFile/<%=pd.getP_attachment()%>" />
				</a>
				<div class="caption">
					<h3><%=pd.getP_name()%></h3>
					<p><%=pd.getP_price()%></p>
					<br /> <br />
				</div>
			<% } %>
			</div>

			<%
				}
			%>

			<script>
				$('#pd_tubmnail').css('height', '200px');
				$('#pd_tubmnail > a > img').css('height',
						$('#pd_tubmnail').css('height'));
				$('#pd_tubmnail > a > img').css('width',
						$('#pd_tubmnail').css('width'));
			</script>

		</div>
	</div>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>