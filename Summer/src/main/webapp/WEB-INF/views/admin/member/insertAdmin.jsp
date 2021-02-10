<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 등록</title>
	<style>
		#mList, #aList {
			width : 200px;
			height : 40px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 18px;
		}
		
		.inp {
			width : 70%;
			height : 16px;
		}
		
		#mainBox {
			padding:1% 5% 5% 5%;
			border:1px solid black;
			background:white;
			border-radius:30px;
			box-shadow : 10px 10px 20px 5px grey;
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
					<h1><i class="shortcut-icon icon-user"></i> 회원관리</h1>
				</div>
			</div>
			<br>
			<div class="span8 offset1" id="mainBox">
				<div class="row">
					<div class="span8" style="text-align:center; border:1px solid black; background:#e2e2e2;">
						<h2>관리자 등록</h2>
					</div>
				</div>
				<br><br>
				<div class="row" style="font-size:16px;">
				<form action="${pageContext.request.contextPath}/admin/insertAdminEnd.do" id="insertAdmin" method="post">
					<!----------------------- 아이디 -------------------->
					<div class="span2 offset1" style="border-right:2px solid grey;">
						<span style="margin-left:14px;">아이디</span>
					</div>
					<div class="span4">
						<input type="text" name="userId" id="userId" class="inp" placeholder="아이디 입력(4자~11자)" maxlength="11" required/>
						<button type="button" id="idChk" class="btn" style="height:26px; margin-bottom:8px;">중복체크</button>
						<span id="icO" style="color:green; display:none;">O</span>
						<span id="icX" style="color:red;">X</span>
						<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
					</div>
					<br><br>
					<!----------------------- 비밀번호 -------------------->
					<div class="span2 offset1" style="border-right:2px solid grey;">
						<span style="margin-left:14px;">비밀번호</span>
					</div>
					<div class="span4">
						<input type="text" name="password" id="password" class="inp" placeholder="비밀번호를 입력해주세요."/>
					</div>
					<br><br>
					<!----------------------- 비밀번호 확인 -------------------->
					<div class="span2 offset1" style="border-right:2px solid grey;">
						<span style="margin-left:14px;">비밀번호 확인</span>
					</div>
					<div class="span4">
						<input type="text" name="passwordChk" id="passwordChk" class="inp" placeholder="비밀번호 확인을 입력해주세요."/>
						<span id="pwO" style="color:green; display:none;">O</span>
						<span id="pwX" style="color:red; display:none;">X</span>
						<input type="hidden" id="passCheck" value="N" />
					</div>
					<br><br>
					<!----------------------- 닉네임 -------------------->
					<div class="span2 offset1" style="border-right:2px solid grey;">
						<span style="margin-left:14px;">닉네임</span>
					</div>
					<div class="span4">
						<input type="text" name="nickName" id="nickName" class="inp" placeholder="닉네임 입력(10자 이하)" maxlength="10" required/>
					</div>
					<br><br>
					<!----------------------- 이름 -------------------->
					<div class="span2 offset1" style="border-right:2px solid grey;">
						<span style="margin-left:14px;">이름</span>
					</div>
					<div class="span4">
						<input type="text" placeholder="이름 입력" class="inp" name="userName" id="userName" maxlength="20"
							   oninput="this.value = this.value.replace(/[^A-Za-zㄱ-ㅎ가-힣.]/g, '').replace(/(\..*)\./g, '$1');"/>
					</div>
					<br><br>
					<!----------------------- 이메일 -------------------->
					<div class="span2 offset1" style="border-right:2px solid grey;">
						<span style="margin-left:14px;">이메일</span>
					</div>
					<div class="span4">
						<input type="text" name="email" id="email" class="inp" placeholder="이메일 입력 ex)oooo@example.com"/>
						<button type="button" id="emailChk" class="btn" style="height:26px; margin-bottom:8px;">중복체크</button>
						<span id="ecO" style="color:green; display:none;">O</span>
						<span id="ecX" style="color:red;">X</span>
						<input type="hidden" id="emailCheck" value="N"/>
					</div>
					<br><br>
					<!----------------------- 연락처 -------------------->
					<div class="span2 offset1" style="border-right:2px solid grey;">
						<span style="margin-left:14px;">연락처</span>
					</div>
					<div class="span4">
						<input type="text" name="phone" placeholder="연락처를 입력해주세요." maxlength="11" id="phone" class="inp"
							   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
					</div>
				</form>
				</div>
				<br><br><br>
				<div class="row">
					<div class="span8" style="text-align:center;">
						<button type="button" class="btn" onclick="fn_submit();">등록하기</button>
						<button type="button" class="btn" onclick="fn_cancle();">취소하기</button>
					</div>
				</div>
			</div>
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
			var navBtn = $('#admin_member');
			var otherBtn = $('#admin_main');
			$(otherBtn).removeClass("active");
			$(navBtn).addClass("active");
	    });
	    
		<!------------------------------------ 아이디 중복체크 시작 --------------------------------------------->
		if( $('#userId').attr("readonly") == false ) {
			$('#userId').on('keydown', function(){
				$('#idDuplicateCheck').attr("value", "N");
				$('#icO').hide();
				$('#icX').show();
			});
		}

		$('#idChk').on('click', function(){
			$.ajax({
				url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
			    data : {"userId" : $('#userId').val()},
			    dataType: "json",
			    success : function(data){
			    		console.log(data);
			            if(data.isUsable==true){
				             alert("사용가능한 아이디입니다.");
			                 $("#icX").hide();
			                 $("#icO").show();
			                 $("#idDuplicateCheck").val(1);
			                 $('#userId').attr('readonly', true);
			                 $('#idChk').hide();
			            } else {
				             alert("사용중인 아이디입니다.");
			                 $("#icX").show();
			                 $("#icO").hide();
			                 $("#idDuplicateCheck").val(0);
			            }
			            }, error : function(jqxhr, textStatus, errorThrown){
			                 	console.log("ajax 처리 실패");
			                	console.log(jqxhr);
			                	console.log(textStatus);
			                	console.log(errorThrown);
			            }
		        });
			});
		<!------------------------------------ 아이디 중복체크 끝 --------------------------------------------->
	    
		<!------------------------------------ 비밀번호 확인 시작 --------------------------------------------->
		$('#password').on('keyup', function(){
			if( $('#password').val() != $('#passwordChk').val() ) {
				$('#passCheck').attr("value", "N");
				$('#pwO').hide();
				$('#pwX').show();
			} else {
				$('#passCheck').attr("value", "Y");
				$('#pwO').show();
				$('#pwX').hide();
			}
		});

		$('#passwordChk').on('keyup', function(){
			if( $('#password').val() != $('#passwordChk').val() ) {
				$('#passCheck').attr("value", "N");
				$('#pwO').hide();
				$('#pwX').show();
			} else {
				$('#passCheck').attr("value", "Y");
				$('#pwO').show();
				$('#pwX').hide();
			}
		});

	<!------------------------------------ 비밀번호 확인 끝 --------------------------------------------->

	<!------------------------------------ 이메일 중복체크 시작 --------------------------------------------->
	if( $('#email').attr("readonly") == false ) {
		$('#email').on('keydown', function(){
			$('#emailCheck').attr("value", "N");
			$('#ecO').hide();
			$('#ecX').show();
		});
	}

	$('#emailChk').on('click', function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/member/emailCheck.do',
			type : "post",
			dataType : 'json',
			data : { "email" : $('#email').val() },
			success : function(data) {
				if( data.isUsable == false ) {
					alert("사용중인 이메일입니다.");
					return false;
				} else if( data.isUsable == true ) {
					alert("사용가능한 이메일입니다.");
					$('#emailCheck').attr("value", "Y");
					$('#ecO').show();
					$('#ecX').hide();
					$('#email').attr('readonly', true);
					$('#emailChk').hide();
				}
			}
		});
	});
	<!------------------------------------ 이메일 중복체크 끝 --------------------------------------------->

	<!------------------------------------ 전송버튼 시작 --------------------------------------------->
	function fn_submit() {
		if( $('#idDuplicateCheck').val() == "0" ) {
			alert("아이디가 올바르지 않습니다.");
			$('#userId').focus();
			return false;
		}

		if( $('#nickName').val() == '' ) {
			alert("닉네임을 입력해주세요.");
			$('#nickName').focus();
			return false;
		}

		if( $('#passCheck').val() == 'N' ) {
			alert("비밀번호가 올바르지 않습니다.");
			$('#password').val('');
			$('#passwordChk').val('');
			$('#password').focus();
			return false;
		}

		if( $('#userName').val() == "" ) {
			alert("이름을 입력해주세요.");
			$('#userName').focus();
			return false;
		}

		if( $('#emailCheck').val() == 'N' ) {
			alert("이메일인증을 해주세요.");
			$('#email').focus();
			return false;
		}

		if( $('#phone').val() == "" ) {
			alert("연락처를 입력해주세요.");
			$('#phone').focus();
			return false;
		}
		
		if( confirm('등록하시겠습니까?') ) {
			$('#insertAdmin').submit();
		}
	}

	function fn_cancle() {
		if(confirm("취소하시겠습니까?")) {
			location.href="${pageContext.request.contextPath}/admin/selectAdminList.do";
		}
	}
	</script>
</body>
</html>