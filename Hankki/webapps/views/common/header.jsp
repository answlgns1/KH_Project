<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@
	page import="java.util.*, com.kh.jsp.member.model.vo.*,
				 com.kh.jsp.common.*, com.kh.jsp.product.model.vo.*"
%>
<%
	Member m = (Member) session.getAttribute("member");
%>

<!-- 제이쿼리 불러오기 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 이미지 아이콘 사용하기 위한 스타일 시트 가져옴. -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
#container {
   width: 100%;
   height: 140px;
   z-index: 999999;
   background-color: white;
}

#headmenu {
   font-size: 16px;
   padding: 10px;
}

/*menu css*/
#nav_container {
   height: 58px;
   line-height: 58px;
   background-color: rgb(46, 143, 88);
   border-radius: 8px;
}

.nav-item {
   height: 58px;
   width: 160px;
   font-size: 20px;
   text-align: center;
}

.search_area {
   height: 58px;
   width: 300px;
}

.nav-item>a {
   text-decoration: none;
   color: black;
}

#dropdown_category > ul{
margin:0;
padding: 0;
list-style: none;
visibility: hidden;
}

#dropdown_category {
   text-align: center;
   font-size: 20px;
   
}

#dropdown_category > a{
   text-decoration:none;
   color: black;
}
#dropdown_category > ul > li > a {
   font-size: 20px;
   text-decoration: none;
}

#dropdown_category:hover #dropdown_item{
   visibility: visible;
   display: block;
   background-color: white;
   border: 1px solid black;
}

#dropdown_category > #dropdown_item > li:hover{
   background-color: rgb(248,240,211);
}

</style>


</head>
<body>

   <header class="main_menu_area">
      <div class="container" data-spy="affix" id="container">
         <div class="row">
            <!-- logo's area -->
            <div class="col-md-2 col-md-offset-5" id="logojpg"
               style="text-align: center;">
               <a href="<%=request.getContextPath()%>"><img
                  src="<%=request.getContextPath()%>/resources/images/final_logo.JPG"
                  height="140px" width="190px"> </a>
            </div>
            <!-- logo's area End-->

            <%
               if (m == null) {
            %>
            <!-- top-right menu area -->
            <div class="col-md-offset-8" id="headmenu">
               <ul class="list-inline">
                  <li><a
                     href="<%=request.getContextPath()%>/views/member/signUp.jsp">회원가입</a></li>
                  <li><a
                     href="<%=request.getContextPath()%>/views/member/loginForm.jsp">로그인</a></li>
                  <li><a href="<%=request.getContextPath()%>/selectList.no">고객센터</a></li>
                  <li><a
                     href="<%=request.getContextPath()%>/views/shoppingCart/shopping_cart.jsp"><img
                        src="<%=request.getContextPath()%>/resources/images/shopping_cart.png"
                        width="20px" height="20px"></a></li>
               </ul>
            </div>
            <script> 
              if (self.name != 'reload') {
                  self.name = 'reload';
                  self.location.reload(true);
              }
               else self.name = ''; 
            </script>
            
            
            <%
               } else if (m.getUserNo() == 0) {
            %>

            <div class="col-md-offset-8" id="headmenu">
               <ul class="list-inline">
                  <li><a href="<%=request.getContextPath()%>/user_Manage.ad">관리자
                        페이지</a></li>
                  <li onclick="logout()">로그아웃</li>
               </ul>
            </div>
            <%
               } else {
            %>
            <div class="col-md-offset-8" id="headmenu">
               <ul class="list-inline">
                  
                  <li> <%= m.getUserName() %>님</li>
                  <li onclick="logout()">로그아웃</li>
                  <li><a href="<%=request.getContextPath()%>/views/order/orderList.jsp">마이 페이지</a></li>
                  <li><a href="<%=request.getContextPath()%>/views/order/orderList.jsp">주문배송</a></li>
                  <li><a href="<%=request.getContextPath()%>/selectList.no">고객센터</a></li>
                  <li><a
                     href="<%=request.getContextPath()%>/views/shoppingCart/shopping_cart.jsp"><img
                        src="<%=request.getContextPath()%>/resources/images/shopping_cart.png"
                        width="20px" height="20px"></a></li>

               </ul>
            </div>
            <%
               }
            %>


         </div>

         <!-- top-right menu area End-->

         <!-- middle menu area -->
         <div class="col-xs-12" id="nav_area"></div>
         <div class="container" id="nav_container">

            <div class="col-xs-2" id="dropdown_category">
               <a>
                  <img
                  src="<%=request.getContextPath()%>/resources/images/three_line.png"
                  width="20px" height="20px"
                  style="margin-bottom: 5px; margin-right: 10px;">카테고리
               </a>

               <ul id="dropdown_item">
                  <li onclick="ProductList_move('fruit');">과일류</li>
                  <li onclick="ProductList_move('veg')">채소류</li>
                  <li onclick="ProductList_move('meat')">육류</li>
                  <li onclick="ProductList_move('seafood')">해산물류</li>
                  <li onclick="ProductList_move('covience')">간편식</li>
                  <li onclick="ProductList_move('mealkit')">밀키트</li>
               </ul>
            </div>

            <div class="nav-item col-xs-2" onclick="ProductList_move('new_product')" id="newproduct">
               	신상품
            </div>
            <div class="nav-item col-xs-2" onclick="ProductList_move('best_product')" id="bestproduct">
              	 베스트
            </div>
            <div class="nav-item col-xs-2" onclick="ProductList_move('discount_product')" id="discount">
               	알뜰쇼핑
            </div>
            <div class="nav-item col-xs-2">
               <a href="<%=request.getContextPath()%>/views/event/eventPage.jsp">이벤트</a>
            </div>
            <div class="search_area col-xs-2">
               <div class="input-group">
                  <span class="input-group-btn">
                     <button class="btn btn-default" type="button" id="searchBtn"
                     		 style="margin-top: 2px;">Go!</button>
                  </span> <input type="text" class="form-control" id="product_search"
                     placeholder="Search for..." style="margin-top: 13px;">
               </div>
            </div>
         </div>
         <!-- middle menu area End-->
      </div>

      <script>
      function logout(){ 
    	  location.href="<%=request.getContextPath()%>/logout.me";
   	  }
   	  
      function ProductList_move(type){
    	  location.href="<%=request.getContextPath()%>/product.pd?type="+type;
      }
   
      $('#searchBtn').on('click', function(){
         var temp = $('#product_search').val();
         
         if(temp == '') {
            alert("검색어를 입력해주세요.");
         } else if(temp.length < 2) {
            alert("두글자 이상 입력해주세요.");
         } else {
        	 $('#searchBtn').on('click', function(){
        		 location.href="<%=request.getContextPath()%>/productSearch.pd?con="+$('#product_search').val();
        	 });
         }
      });
      
      $('#product_search').keydown(function(key){
         if(key.keyCode==13){
            $('#searchBtn').click();
            return false;
         }
      });
   </script>
   </header>

</body>
</html>