<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품등록</title>
	<style>
		#pList, #addProduct, #ioList {
			width : 200px;
			height : 40px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 18px;
		}
		
		#ioList {
			background : #88c8bc;
			color : white;
		}
		
		#pList:hover , #addProduct:hover, #ioList:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
		}
		
		#oListBox {
			border:1px solid black;
			border-radius : 0px 0px 30px 30px;
			background:white;
			box-shadow : 10px 10px 20px 5px grey;
		}
		
		#btnGroup button {
			width : 200px;
			height : 38px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 17px;
		}
		
		#btnGroup button:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
		}
		
		.img-rounded:hover, .img-thumbnail:hover {
    		cursor : pointer;
    	}
    	
    	.img-rounded {
    		width : 200px;
    		height : 250px;
    	}
    	
    	.img-thumbnail {
    		width : 290px;
    		height : 450px;
    	}
    	
    	td {
    		width : 65px;
    		text-align : center;
    		padding : 4px;
    	}
    	
    	td input {
    		width : 40px;
    	}
    	
    	#topSize, #pantsSize {
    		border : 1px solid #e2e2e2;
    		display : none;
    	}
    	
    	caption {
    		background : #88c8bc;
    		color : white;
    		font-size : 16px;
    	}
    	
		
	</style>
</head>
<body>

<c:import url="../common/header.jsp"/>
<div class="main">
	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span12">
					<h1><i class="shortcut-icon icon-shopping-cart"></i> 상품관리</h1>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="span8 offset2" style="text-align:center;">
					<button type="button" id="pList">상품목록</button>
					<button type="button" id="addProduct">상품등록</button>
					<button type="button" id="ioList">입출고관리</button>
				</div>
			</div>
			<br>
			<form action="${pageContext.request.contextPath}/admin/insertIEnd.do" id="insertI" method="post">
			<div class="row">
				<div class="span12" id="oListBox">
					<div class="row">
						<div class="span12" style="text-align:center; margin-top:2%;">
							<h1>상품입고등록</h1>
						</div>
					</div>
					<div class="row" style="margin-left:1%;padding:3%;">
						<div class="span4" style="text-align:center;">
							<div style="padding:5px; border:2px solid grey; width:295px;" id="thumbImg">
								<img id="thumbnail" class="img-thumbnail">
							</div>
						</div>
						<div class="span6">
							<select name="pcode" id="productCt">
								<option selected disabled>상품 선택</option>
								<c:forEach items="${ pList }" var="p">
									<option value="${ p.PCODE }">${ p.PNAME }</option>
								</c:forEach>
							</select>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품명
								</div>
								<div style="width:100%; text-align:center; padding:2% 0% 2% 0%;" id="pname">
									<input type="hidden" id="pChk" value="0"/>
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품설명
								</div>
								<div style="width:100%; text-align:center; padding:2% 0 2% 0;" id="pcontents">
									
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품수량
								</div>
								<div style="width:100%; text-align:center; padding:2% 0% 2% 0%;" id="pstock">
									
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									상품 가격
								</div>
								<div style="width:100%; text-align:center; padding:2% 0% 2% 0%;" id="pprice">
									
								</div>
							</div>
							<br>
							<div style="border:1px solid grey;">
								<div style="width:100%; font-size:16px; background:#88c8bc; color:white; padding:1% 0% 1% 0%; text-align:center;">
									입고수량
								</div>
								<div style="width:100%; text-align:center; padding:2% 0% 2% 0%;">
									<input type="number" name="addStock" id="addStock" required style="text-align:center;"/>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row" style="margin:3% 0% 2% 0%;">
						<div class="span12" style="text-align:center;" id="btnGroup">
							<button type="button" class="btn" onclick="fn_insert();">등록하기</button> &nbsp; &nbsp;
							<button type="button" class="btn" onclick="fn_goBack();">취소하기</button>
						</div>
					</div>
					<br>
				</div>
			</div>
			</form>
			<!-- /row --> 
		</div>
		<!-- /container -->
		<br><br>
	</div>
	<!-- /main-inner --> 
</div>
<!-- /main -->
<div class="extra">
  <div class="extra-inner">
    <div class="container">
      <div class="row">
                    <div class="span3">
                        <h4>
                            About Free Admin Template</h4>
                        <ul>
                            <li><a href="javascript:;">EGrappler.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="">Open Source jQuery Plugins</a></li>
                            <li><a href="">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="">Free Contact Form Plugin</a></li>
                            <li><a href="">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /extra-inner --> 
</div>
<!-- /extra -->
<div class="footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>
<!-- /footer -->
	
	<script>
		$(function() {
			var navBtn = $('#admin_store');
			var otherBtn = $('#admin_main');
			$(otherBtn).removeClass("active");
			$(navBtn).addClass("active");
	    });

		$('#pList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/selectProductList.do";
		});

		$('#addProduct').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/insertProduct.do";
		});

		$('#ioList').on('click', function() {
			location.href="${pageContext.request.contextPath}/admin/manageIO.do";
		});

		<!-------------------------------- 상품선택 시작 ------------------------------------->
		$(document).ready(function() {
			$('#productCt').on('change', function(){
				pcode = this.value;
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/selectP.do",
					type : "post",
					data : {pcode : pcode},
					success : function(data){
								$('#thumbnail').attr('src', '${pageContext.request.contextPath}'+data.FILEPATH+data.NEWFILENAME);
								$('#pname').append('<span>'+data.PNAME+'</span>');
								$('#pcontents').append('<span>'+data.PDESCRIPTION+'</span>');
								$('#pstock').append('<span>'+data.PSTOCK+'</span>');
								$('#pprice').append('<span>'+data.PPRICE+'</span>');
								$('#pChk').val(1);
							}
				});
			});
		});
		<!-------------------------------- 상품선택 끝 ------------------------------------->

		function fn_insert() {
			if($('#pChk').val() == 0) {
				alert("상품을 선택해주세요.");
				return false;
			}
			if($('#addStock').val() == '') {
				alert("입고수량을 입력해주세요.");
				$('#addStock').focus();
				return false;
			}
			if(confirm("등록하시겠습니까?")) {
				$('#insertI').submit();
			}
		}
		
		function fn_goBack() {
			if(confirm("돌아가시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/admin/manageIO.do";
			}
		};

	</script>
</body>
</html>