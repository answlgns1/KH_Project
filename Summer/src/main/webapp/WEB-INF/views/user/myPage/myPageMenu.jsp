<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    	#menu-box {
    		height : 200px;
    		display : flex;
    		align-items : center;
    	}
    	
    	#memberBox {
    		height : 100%;
    		display : flex;
    		align-items : center;
    		text-align : center;
    	}
    	
    	#memberBox a:hover {
    		color : #88c8bc;
    		transition : 0.5s;
    	}
    	
    	#box1>div {
    		display : flex;
    		align-items : center;
    		text-align : center;
    		font-size : 17px;
    		font-weight : bold;
    	}
    	
    	#box1>div:hover {
    		background : #88c8bc;
    		color : white;
    		transition : 0.5s;
    		cursor : pointer;
    	}
    	
</style>
</head>
<body>
		<!-- 상단 페이지 정보 -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col ">
						<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>MyPage</span></p>
					</div>
				</div>
				<h1>MyPage</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		<div class="container">
		
<!-- 마이페이지 상단 메뉴바 시작 -->
			<div class="row">
				<div class="col">
					<div class="col-md-12" id="menu-box">
						<div class="col-md-4 border" id="memberBox">
							<div>
								<p style="font-weight:bold; font-size:24px; margin-left:10px;">${ member.userName }님 환영합니다!</p>
								<span><a href="${pageContext.request.contextPath}/member/mUpdate.do?userId=${member.userId}">> 회원 정보 수정</a></span>
							</div>
						</div>
						<div class="col-8">
							<div class="row" id="box1" style="height:100px;">
								<div class="col-md-3 border" id="myMenu1">
									장바구니
								</div>
								<div class="col-md-3 border" id="myMenu2">
									구매내역
								</div>
								<div class="col-md-3 border" id="myMenu3">
									구매후기
								</div>
								<div class="col-md-3 border" id="myMenu4">
									배송조회
								</div>
							</div>
							<div class="row" id="box1" style="height:100px;">
								<div class="col-md-3 border" id="myMenu5">
									마이사이즈
								</div>
								<div class="col-md-3 border" id="myMenu6">
									좋아요목록
								</div>
								<div class="col-md-3 border" id="myMenu7">
									포인트내역
								</div>
								<div class="col-md-3 border" id="myMenu8">
									문의내역
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 마이페이지 상단 메뉴바 끝 -->
			<br><br><br><br>
			
	<script>
	<!-- 장바구니 -->
		$('#myMenu1').click(function(){
			location.href="${pageContext.request.contextPath}/myPage/myPageCart.do?userId=${member.userId}";
		});

	<!-- 구매내역 -->
		$('#myMenu2').click(function(){
			location.href="${pageContext.request.contextPath}/myPage/myPageOI.do?userId=${member.userId}";
		});

	<!-- 구매후기 -->
		$('#myMenu3').click(function(){
			location.href="${pageContext.request.contextPath}/myPage/myPageReview.do";
		});

	<!-- 배송조회 -->
		$('#myMenu4').click(function(){
			location.href="${pageContext.request.contextPath}/myPage/myPageDeliveryChk.do";
		});

	<!-- 마이사이즈 -->
		$('#myMenu5').click(function(){
			location.href="${pageContext.request.contextPath}/myPage/myPageMySize.do";
		});

	<!-- 좋아요목록 -->
		$('#myMenu6').click(function(){
			location.href="${pageContext.request.contextPath}/myPage/myPageLike.do";
		});

	<!-- 포인트내역 -->
		$('#myMenu7').click(function(){
			location.href="${pageContext.request.contextPath}/myPage/myPagePoint.do";
		});

	<!-- 문의내역 -->
		$('#myMenu8').click(function(){
			location.href="${pageContext.request.contextPath}/myPage/myPageQuestion.do";
		});
		
	</script>

</body>
</html>











