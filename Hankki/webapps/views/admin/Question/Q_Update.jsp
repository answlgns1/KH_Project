<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는 질문 수정</title>
</head>
<body>
	<%@ include file="/views/common/adminMenu.jsp" %>
	
	<hr />
	<br />
	<br />
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7 col-md-offset-3" style="font-size: 30px">
				자주묻는 질문 수정
				<hr />
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7 col-md-offset-3">
				<div style="background : #E2E2E2; height : 450px;">
					<div style="padding : 5%;">
						<div style="padding : 5px;">
							<span>카테고리 : </span>
							<select>
								<option value="회원문의" selected>회원문의</option>
								<option value="배송문의">배송문의</option>
								<option value="상품문의">상품문의</option>
								<option value="취소/교환/반품">취소/교환/반품</option>
								<option value="주문/결제">주문/결제</option>
								<option value="기타문의">기타문의</option>
							</select>
						</div>
						<div style="padding : 5px;">
							제목 : <input type="text" style="width : 94%;"/>
						</div>
						<hr />
						<div>
							답글<br>
							<textarea style="resize : none; width : 100%; height : 150px;"></textarea>
						</div>
					</div>
					<div style="text-align : center;">
						<button class="btn btn-success btn-sm"  onclick="location.href='Q_Manage.jsp'">수정하기</button> &nbsp;
						<button class="btn btn-danger btn-sm"  onclick="location.href='Q_Manage.jsp'">취소하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

</body>
</html>