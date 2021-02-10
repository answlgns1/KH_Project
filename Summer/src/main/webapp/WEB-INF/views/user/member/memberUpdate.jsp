<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="lookbook" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - MyPage</title>
	<meta charset="utf-8">
    <style>
    	
		#MU>div {
			height : 70px;
		}
		
		#MU p {
			margin-top : 20px;
		}
		
		#MU input {
			margin-top : 10px;
		}
		
		#MU>div>div:first-child {
			border : 1px solid #E2E2E2;
			border-left : 0;
		}
		
		#MU>div>div:last-child {
			border : 1px solid #E2E2E2;
			border-right : 0;
		}
		
		.inp {
			border : 1px solid #e2e2e2;
			border-radius : 5px;
			width : 50%;
			height : 40px;
		}
		
		#addressBox {
			height : 1000px;
		}
		
		#addressBox input {
			width : 200px;
			height : 40px;
			margin-bottom : 10px;
			border-radius : 5px;
		}
		
		#addressBox p {
			margin-top : 45px;
		}
    
    </style>
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		<c:import url="/WEB-INF/views/user/myPage/myPageMenu.jsp"/>
			
			<div class="row row-pb-lg justify-content-md-center">
				<div class="col-md-11" style="border-bottom : 3px solid #88c8bc;">
					<h2 style="text-align:center;">회원정보 수정</h2>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/member/mUpdateEnd.do" id="mUpdate" method="post">
				<div class="row row-pb-lg justify-content-md-center">
					<div class="col-md-10" id="MU">
					
					<!-- 아이디 -->
						<div class="row">
							<div class="col-md-3">
								<p>아이디</p>
							</div>
							<div class="col-md-9">
								<input type="text" name="userId" value="${ member.userId }" id="userId" readonly style="border:0;" />
							</div>
						</div>
						
					<!-- 닉네임 -->
						<div class="row">
							<div class="col-md-3">
								<p>닉네임 <span style="float:right; color:red;">필수</span></p>
							</div>
							<div class="col-md-9">
								<input type="text" name="nickName" value="${ member.nickName }" maxlength="10" id="nickName" class="inp" required/>
								<button type="button" class="btn btn-primary" id="nickChk" onclick="fn_nickChk()" value="N">중복확인</button>
								<input type="hidden" value="${ member.nickName }" id="nick"/>
							</div>
						</div>
						
					<!-- 비밀번호 -->
						<div class="row">
							<div class="col-md-3">
								<p>비밀번호</p>
							</div>
							<div class="col-md-9">
								<input type="password" class="inp" id="pw"/>
							</div>
						</div>
						
					<!-- 비밀번호 확인 -->
						<div class="row">
							<div class="col-md-3">
								<p>비밀번호 확인</p>
							</div>
							<div class="col-md-9">
								<input type="password" name="password" class="inp" id="pwChk"/> &nbsp;
								<span id="pwO" style="color:green; display:none;">비밀번호가 일치합니다.</span>
								<span id="pwX" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</span>
								<input type="hidden" id="passCheck" value="N" />
							</div>
						</div>
						
					<!-- 이름 -->
						<div class="row">
							<div class="col-md-3">
								<p>이름</p>
							</div>
							<div class="col-md-9">
								<p>${ member.userName }</p>
							</div>
						</div>
						
					<!-- 생년월일 -->
						<div class="row">
							<div class="col-md-3">
								<p>생년월일</p>
							</div>
							<div class="col-md-9">
								<p>${ member.birth }</p>
							</div>
						</div>
						
					<!-- 성별 -->
						<div class="row">
							<div class="col-md-3">
								<p>성별</p>
							</div>
							<div class="col-md-9">
								<c:if test="${ member.gender eq 'M' }">
									<p>남</p>
								</c:if>
								<c:if test="${ member.gender eq 'F' }">
									<p>여</p>
								</c:if>
							</div>
						</div>
						
					<!-- 이메일 -->
						<div class="row">
							<div class="col-md-3">
								<p>이메일 <span style="float:right; color:red;">필수</span></p>
							</div>
							<div class="col-md-9">
								<input type="text" name="email" value="${ member.email }" id="email" class="inp"/>
								<button type="button" id="emailChk" class="btn btn-primary" style="display:none;">이메일 중복체크</button>
								<button type="button" id="emailChk2" class="btn btn-primary thema" data-toggle="modal" data-target="#emailModal" style="display:none;">이메일 인증</button>
								<span id="ecO" style="color:green; display:none;">O</span>
								<span id="ecX" style="color:red; display:none;">X</span>
								<input type="hidden" id="emailCheck" value="N"/>
								<input type="hidden" id="emailVal" value="${ member.email }" />
							</div>
						</div>
						
					<!-- 연락처 -->
						<div class="row">
							<div class="col-md-3">
								<p>연락처 <span style="float:right; color:red;">필수</span></p>
							</div>
							<div class="col-md-9">
								<input type="text" name="phone" value="${ member.phone }" maxlength="11" id="phone" class="inp" required/>
							</div>
						</div>
						
					<!-- 주소 -->
						<div class="row" id="addressBox">
							<div class="col-md-3">
								<p>주소</p>
							</div>
							<div class="col-md-9">
								<input type="text" id="sample6_postcode" placeholder="우편번호">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-default"><br>
								<input type="text" id="sample6_address" placeholder="주소" name="address1">
								<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address2">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목">
							</div>
						</div>
					</div>
				</div>
				<br><br>
				<div class="row">
					<div class="col" style="text-align:center;">
						<button type="button" class="btn btn-success thema" onclick="fn_submit();">수정하기</button>
						<button type="button" class="btn btn-primary thema" onclick="fn_cancel();">취소하기</button>
					</div>
				</div>
				<div class="row">
					<div class="col" style="text-align:right; margin-right:8%;">
						<button type="button" class="btn btn-danger" onclick="fn_delete();">회원탈퇴</button>
					</div>
				</div>
			</form>

		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
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
		
	</div>
	

	<script>
<!------------------------------------ 닉네임 중복확인 시작 --------------------------------------------->
		
		var nickChkVal = $('#nickChk').val();
		$('#nickName').on('keydown', function(){
			$('#nickChk').attr("value", "N");
		});
		
		function fn_nickChk() {
			
			if( nickChkVal == 'N' ) {
				if( $('#nickName').val() == $('#nick').val() ) {
					$('#nickChk').attr("value", "Y");
					alert("회원님의 닉네임입니다.");
				} else {
					$.ajax({
						url : "${pageContext.request.contextPath}/member/nickNameDupChk.do",
						type : "post",
						dataType : "json",
						data : { "nickName" : $('#nickName').val() },
						success : function(data) {
							if( data.isUsable == false ) {
								alert("존재하는 닉네임입니다.")
							} else if( data.isUsable == true ) {
								$('#nickChk').attr("value", "Y");
								alert("사용가능한 닉네임입니다.");
							}
						}
					})
				}
			}
		}

<!------------------------------------ 닉네임 중복확인 끝 --------------------------------------------->

<!------------------------------------ 비밀번호 확인 시작 --------------------------------------------->
		$('#pw').on('keyup', function(){
			if( $('#pw').val() != $('#pwChk').val() ) {
				$('#passCheck').attr("value", "N");
				$('#pwO').hide();
				$('#pwX').show();
			} else {
				$('#passCheck').attr("value", "Y");
				$('#pwO').show();
				$('#pwX').hide();
			}
		});
		
		$('#pwChk').on('keyup', function(){
			if( $('#pw').val() != $('#pwChk').val() ) {
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

<!------------------------------------ 이메일 인증 시작 --------------------------------------------->
		var emailCode;  // 이메일 인증 코드 비교용 전역변수
		//if( $('#email').attr("readonly") == false ) {
			$('#email').on('keydown', function(){
				$('#emailCheck').attr("value", "N");
				$('#ecO').hide();
				$('#ecX').show();
				$('#emailChk').show();
				$('#emailChk2').hide();
			});
		//}
		
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
						alert("사용가능한 이메일입니다. 이메일 인증을 해주세요.");
						$('#emailChk').hide();
						$('#emailChk2').show();
					}
				}
			});
		});
		
		$('#sendMail').on('click', function(){
			$.ajax({
				url : '${pageContext.request.contextPath}/member/sendMail.do',
				type : 'post',
				data : { 'email' : $('#email').val() },
				success : function(data) {
					if( data.length > 0 ) {
						alert("인증코드 전송 성공");
						$('#sendMail').text('인증번호 재전송');
						emailCode = data;
					} else {
						alert("인증코드 전송 실패");
						$('#sendMail').text('인증번호 재전송');
						emailCode = '';
					}
				}
			});
		});
		$('#keyChk').on('click', function() {
			if( $('#key').val() != '' ){
				if( $('#key').val() == emailCode ) {
					alert("인증 성공");
					$('#emailModal').modal("hide");
					$('#ecO').show();
					$('#ecX').hide();
					$('#emailCheck').attr('value', 'Y');
					$('#email').attr('readonly', true);
					$('#emailChk2').hide();
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

<!------------------------------------ 수정/취소/탈퇴 버튼 시작 --------------------------------------------->
		<!-- 수정버튼 -->
		function fn_submit() {
			if($('#nickName').val() == "") {
				alert("닉네임을 입력해주세요.");
				$('#nickName').focus();
				return false;
			}

			if($('#pw').val() != $('#pwChk').val() ) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#pw').val('');
				$('#pwChk').val('');
				$('#pw').focus();
				return false;
			}

			if($('#email').val() == "") {
				alert("이메일을 입력해주세요.");
				$('#email').focus();
				return false;
			}

			if($('#phone').val() == "") {
				alert("연락처를 입력해주세요.");
				$('#phone').focus();
				return false;
			}
			
			if($('#emailVal').val() == $('#email').val()) {
				$('#emailCheck').attr('value', 'Y');
			}

			if($('#emailCheck').val() == 'N') {
				alert("이메일인증을 해주세요.");
				$('#email').focus();
				return false;
			}
				
			if( $('#nickChk').val() == 'N' ) {
				alert("닉네임 중복확인을 해주세요.");
				$('#nickName').focus();
			} else if( $('#nickChk').val() == 'Y' ) {
				if(confirm('수정하시겠습니까?')) {
					$('#mUpdate').submit();
				}
			}
		}

		<!-- 취소버튼 -->
		function fn_cancel() {
			if(confirm('취소하시겠습니까?')) {
				location.href='${pageContext.request.contextPath}/myPage/myPageCart.do?userId=${member.userId}';
			}
		}

		<!-- 탈퇴버튼 -->
		function fn_delete() {
			if(confirm('정말 탈퇴하시겠습니까?')) {
				location.href='${pageContext.request.contextPath}/member/memberDelete.do';
			}
		}
<!------------------------------------ 수정/취소 버튼 끝 --------------------------------------------->
	</script>
	
	<!------------------------------------ 다음 주소 API 시작 --------------------------------------------->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
<!------------------------------------ 다음 주소 API 끝 --------------------------------------------->
	</script>

	</body>
</html>

