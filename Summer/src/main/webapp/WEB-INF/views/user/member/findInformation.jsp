<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>아이디 비밀번호 찾기 창 </title>

<style>
	#idTAP {
		width : 235px;
		height : 40px;
		border : 1px solid #88c8bc; 
		background : #88c8bc;
		color : white;
		font-size : 18px;
	}
	
	#pwTAP {
		width : 235px;
		height : 40px;
		border : 1px solid #88c8bc;
		background : white;
		color : #88c8bc;
		font-size : 18px;
	}
	
	#id p, #pw p {font-weight : bold; font-size : 18px;}
	input {width:100%;}
	
	#findId, #findPw {
		width : 100%;
		height : 46px;
		background : #88c8bc;
		color : white;
		border : 1px solid white;
		border-radius : 5px;
		font-size : 20px;
	}
	
	#findId, #findPw, #idTAP, #pwTAP:hover {cursor : pointer;}
	
	#loading {
			position : absolute;
			left : 210px;
			display : none;
		}

</style>

</head>

<body>


	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	
	<!-- 상단 페이지 정보 -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col">
					<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>FIND</span></p>
				</div>
			</div>
			<h2>아이디 / 비밀번호 찾기</h2>
			<hr style="margin-top:-10px;"/>
		</div>
	</div>
	<br><br>
	
	<div class="container">
		<div class="row text-center">
			<div class="col">
				<h1>SUMMER</h1>
				<br>
				<button type="button" id="idTAP">아이디 찾기</button>
				<button type="button" id="pwTAP">비밀번호 찾기</button>
			</div>
		</div>
		<div class="row justify-content-center" id="id">
			<div class="col-md-5" style="border : 1px solid #88c8bc; padding : 3%;">
				<form action="${pageContext.request.contextPath}/member/findID.do" method="post">
					<div>
						<p>이름</p>
						<input type="text" placeholder="이름 입력" maxlength="20" name="userName"
							   oninput="this.value = this.value.replace(/[^A-Za-zㄱ-ㅎ가-힣.]/g, '').replace(/(\..*)\./g, '$1');" required/>
					</div>
					<br>
					<div>
						<p>생년월일</p>
						<input type="text" placeholder="생년월일 입력 ex)19980101" maxlength="8" name="birth"
							   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required/>
					</div>
					<br>
					<div>
						<p>이메일</p>
						<input type="text" placeholder="이메일 입력 ex)oooo@example.com" name="email" required/>
					</div>
					<br><br>
					<button type="submit" id="findId">아이디 찾기</button>
				</form>
			</div>
		</div>
		
		<div class="row justify-content-center" id="pw" style="display : none;">
			<div class="col-md-5" style="border : 1px solid #88c8bc; padding : 3%;">
				<form action="${pageContext.request.contextPath}/member/changePW.do" method="post" id="changePW">
					<div>
						<p>아이디</p>
						<input type="text" id="userId" placeholder="아이디 입력" maxlength="11" name="userId" required/>
					</div>
					<br>
					<div>
						<p>이메일</p>
						<input type="text" id="email" placeholder="이메일 입력 ex)oooo@example.com" name="email" required/>
					</div>
					<br><br>
					<button type="button" id="findPw" onclick="fn_findPW();">비밀번호 찾기</button>
				</form>
			</div>
		</div>
	</div>
	
	<button type="button" id="emailChk2" class="btn btn-primary thema" data-toggle="modal" data-target="#emailModal" style="display:none;">이메일 인증</button>
	
	<!-- 이메일 Modal시작 -->
	<div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="emailCheckModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="emailCheckModalLabel">이메일 인증</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- 이메일인증 -->
				<div class="modal-body" style="text-align:right;">
					<div id="loading">
						<img src="${pageContext.request.contextPath}/resources/user/images/Loading.gif"/>
					</div>
					<input type="text" class="form-control" id="key" placeholder="인증번호" required>
					<button type="button" class="btn btn-info" id="sendMail">인증번호 전송</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary thema" id="keyChk">인증하기</button>
					<button type="button" class="btn btn-primary thema" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 이메일 Modal 끝-->
	 
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	
	
	<script>
		$('#idTAP').on('click', function() {
			$('#idTAP').css('background', '#88c8bc').css('color', 'white');
			$('#pwTAP').css('background', 'white').css('color', '#88c8bc');
			$('#id').show();
			$('#pw').hide();
		});

		$('#pwTAP').on('click', function() {
			$('#pwTAP').css('background', '#88c8bc').css('color', 'white');
			$('#idTAP').css('background', 'white').css('color', '#88c8bc');
			$('#pw').show();
			$('#id').hide();
		});

		function fn_findPW() {
			var userId = $('#userId').val();
			var email = $('#email').val();
			
			if(userId == "") {
				alert("아이디를 입력해주세요.");
				return false;
			}
			if(email == "") {
				alert("이메일을 입력해주세요.");
				return false;
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/member/findInfoCheck.do",
				data : {userId:userId, email:email},
				dataType : "json",
				success : function(data) {
							if(data.result == true) {
								$('#emailModal').modal();
							} else {
								alert("일치하는 정보가 없습니다.");
								$('#userId').val('');
								$('#email').val('');
								$('#userId').focus();
							}
						}
			});
		}

	<!------------------------------------ 이메일 인증 시작 --------------------------------------------->
		var emailCode;  // 이메일 인증 코드 비교용 전역변수

		$('#sendMail').on('click', function(){
			$('#loading').show();
			$.ajax({
				url : '${pageContext.request.contextPath}/member/sendMail.do',
				type : 'post',
				data : { 'email' : $('#email').val() },
				success : function(data) {
					if( data.length > 0 ) {
						alert("인증코드 전송 성공");
						$('#sendMail').text('인증번호 재전송');
						emailCode = data;
						$('#loading').hide();
					} else {
						alert("인증코드 전송 실패");
						$('#sendMail').text('인증번호 재전송');
						emailCode = '';
						$('#loading').hide();
					}
				}
			});
		});
		$('#keyChk').on('click', function() {
			if( $('#key').val() != '' ){
				if( $('#key').val() == emailCode ) {
					alert("인증 성공");
					$('#changePW').submit();
				} else {
					alert("인증 실패");
					$('#key').focus();
					return false;
				}
			} else {
				alert("인증번호를 입력해주세요.");
			}
		});
	<!------------------------------------ 이메일 인증 끝 --------------------------------------------->

	</script>
	
	
	
	
	
	
</body>
</html>

