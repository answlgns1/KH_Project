<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는 질문 관리</title>
<style>

	#header * {
		text-align: center;
	}
	
	#header>tr>th:nth-child(1) {
		width: 10%;
	}
	
	#header>tr>th:nth-child(2) {
		width: 30%;
	}
	
	#t-row>td {
		text-align: center;
	}
	
	#t-row>td:nth-child(3) {
		text-align: left;
	}
	
	.hiddenRow>div {
		margin : 3% 25%;
		width : 50%;
		text-align : left;
	}
	
	#t-row:hover {
		cursor : pointer;
		background : #E2E2E2;
	}
	
	#foot {
		float : right;
	}
	
	#foot>li {
		display : inline-block;
		margin-left : 5px;
	}
	
	#paging {
		text-align : center;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/adminMenu.jsp"%>
	<hr />
	<br />
	<br />
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7 col-md-offset-3" style="font-size: 30px">
				자주묻는 질문 관리
				<hr />
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7 col-md-offset-3">
				<table class="table table-condensed" id="myTable">
					<thead id="header">
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
						</tr>
					</thead>
					<tbody class="panel">
					<!------------------ 첫번째 글 ----------------------->
						<tr data-toggle="collapse" data-target="#demo1"
							id="t-row">
							<td>1</td>
							<td>회원문의</td>
							<td>비밀번호를 까먹었어요. 어떻게 해야하나요?</td>
						</tr>
					<!----------------- 첫번째 글 클릭 시 나오는 글 ----------->
						<tr id="demo1" class="collapse">
							<td colspan="3" class="hiddenRow">
								<div>
									중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.
								</div>
							</td>
						</tr>
						
					<!------------------ 두번째 글 ---------------------->
						<tr data-toggle="collapse" data-target="#demo2"
							id="t-row">
							<td>2</td>
							<td>결제문의</td>
							<td>카카오페이로도 결제할 수 있나요?</td>
						</tr>
					<!---------------- 두번째 글 클릭 시 나오는 글 -------------->
						<tr id="demo2" class="collapse">
							<td colspan="3" class="hiddenRow">
								<div>
									국회는 헌법개정안이 공고된 날로부터 60일 이내에 의결하여야 하며, 국회의 의결은 재적의원 3분의 2 이상의 찬성을 얻어야 한다. 근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을 가진다.
								</div>
							</td>
						</tr>
						
					<!------------------- 세번째 글 ---------------------->
						<tr data-toggle="collapse" data-target="#demo3"
							id="t-row">
							<td>3</td>
							<td>치킨문의</td>
							<td>어떤 치킨 좋아하시나요?</td>
						</tr>
					<!----------------- 세번째 글 클릭 시 나오는 글 -------------->
						<tr id="demo3" class="collapse">
							<td colspan="3" class="hiddenRow">
								<div>
									배그치킨
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br />
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7 col-md-offset-3">
				<!--
					<ul id="foot">
						<li><a href="Q_Insert.jsp" class="btn btn-success btn-sm">질문 등록</a></li>
						<li><a href="Q_Update.jsp" class="btn btn-info btn-sm">질문 수정</a></li>
						<li><button class="btn btn-danger btn-sm">질문 삭제</button></li>
					</ul>
				-->
				<br /><br /><br />
				<hr />
				<div id="paging">
					<button><<</button>
					<button><</button>
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button>4</button>
					<button>5</button>
					<button>></button>
					<button>>></button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>








