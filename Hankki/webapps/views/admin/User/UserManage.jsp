<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.util.*, com.kh.jsp.member.model.vo.*,
				 com.kh.jsp.common.*"
%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style>
	#search {
		bottom : 0;
		text-align : right;
	}
	
	#searchCondition {
		width : 110px;
	}
	
	#search>* {
		height : 30px;
	}
	
	#userTable tr td {
		text-align : center;
	}
	
	#thead {
		background : #E2E2E2;
	}
	
	#userTable tr {
		border-bottom : 1px solid black;
		height : 40px;
	}
	
	#btn1 {
		background : white;
		border : 1px solid black;
		width : 100px;
	}
	
	#btn1:hover {
		background : gray;
		color : white;
		font-weight : bold;
		transition : 0.5s;
	}

	#btn1_menu {
		border : 1px solid black;
		left : 30%;
		text-align : center;
	}
	
	#btn1_menu p:hover {
		background : black;
		border : 1px solid black;
		color : snow;
		cursor : pointer;
		transition : 0.7s;
		height : 100%;
		font-weight : bold;
	}
	
	#btn2_menu {
		border : 1px solid black;
		left : 20%;
		text-align : center;
	}
	
	#btn2_menu p:hover {
		background : black;
		border : 1px solid black;
		color : snow;
		cursor : pointer;
		transition : 0.7s;
		height : 100%;
		font-weight : bold;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/views/common/adminMenu.jsp" %>
	<hr />
	<br /><br />
	<div class="row">
		<div class="col-md-2 col-md-offset-3" style="font-size : 30px"><b>회원 관리</b></div>
		<div class="col-md-5" id="search">
        	<select id="searchCondition" name="searchCondition">
				<option value="">---</option>
				<option value="u_name">회원 이름</option>
				<option value="u_id">회원 아이디</option>
			</select>
            <input type="search" id="keyword" style="width:200px;" placeholder="키워드를 입력해주세요.">
        	<button type="button" id="searchBtn" onclick="search();">검색</button>
		</div>
	</div>
	<div class="row">
		<div class="col-md-7 col-md-offset-3">
			<table class="table" id="userTable">
				<tr id="thead">
					<td>회원 아이디</td>
					<td>회원 등급</td>
					<td>회원 이름</td>
					<td>가입 일자</td>
					<td>상태(활동/정지)</td>
				</tr>
				<% for(Member m : list ) {%>
					<% if(!m.getUserId().equals("admin")) { %>
						<tr>
							<td><%= m.getUserId() %></td>
							<td class="dropdown">
								<button id="btn1" type="button" class="dropdown-toggle btn btn-default" data-toggle="dropdown"><%= m.getUserGrade() %><span class="caret"></span></button>
								<div id="btn1_menu" class="dropdown-menu" role="menu">
									<p onclick="GradeUpdate(this, '<%= m.getUserId() %>',4)" >BEGIN</p>
									<p onclick="GradeUpdate(this, '<%= m.getUserId() %>',3)" >SILVER</p>
									<p onclick="GradeUpdate(this, '<%= m.getUserId() %>',2)" >GOLD</p>
									<p onclick="GradeUpdate(this, '<%= m.getUserId() %>',1)" >VIP</p>
								</div>
							</td>
							<td><%= m.getUserName() %></td>
							<td><%= m.getEnrollDate()%></td>
							<td class="dropdown">
								<button id="btn1" type="button" class="dropdown-toggle btn btn-default" data-toggle="dropdown"><%= m.getUserStatus() %><span class="caret"></span></button>
								<div id="btn2_menu" class="dropdown-menu" role="menu">
									<p onclick="StatusUpdate(this, '<%= m.getUserId() %>', '활동중')">활동중</p>
									<p onclick="StatusUpdate(this, '<%= m.getUserId() %>', '정지')">정지</p>
								</div>
							</td>
						</tr>
					<%} %>
				<%} %>
			</table>
		</div>
	</div>
	
	<%-- 페이지 처리 코드 넣기 --%>
		
		<div class="pagingArea" align="center">
			
			<button onclick="location.href='<%= request.getContextPath() %>/user_Manage.ad?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/user_Manage.ad?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/user_Manage.ad?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/user_Manage.ad?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/user_Manage.ad?currentPage=<%= maxPage %>'">>></button>
		</div>
		<br><br><br><br><br><br><br>
	
	<script>
	//------------------ 회원 등급, 회원 상태 수정 끝 ------------------//
		function GradeUpdate(obj, userId, userGrade) {
			
			$.ajax({
				url : "<%= request.getContextPath() %>/Update.um",
				data : {
					'userId' : userId,
					'userGrade' : userGrade
				}, success : function(data){
					var grade = '';
					switch(userGrade){
					case 1 :
						grade = 'VIP';
						break;
					case 2:
						grade = 'GOLD';
						break;
					case 3:
						grade = 'SILVER';
						break;
					case 4:
						grade = 'BEGIN';
						break;
					default :
						alert("회원 등급 변경 실패");
					}
					$(obj).parent().siblings('button').text(grade);
				}
			});
		}
		
		function StatusUpdate(obj, userId, userStatus) {
			$.ajax({
				url : "<%= request.getContextPath() %>/Update.st",
				data : {
					'userId' : userId,
					'userStatus' : userStatus
				}, success : function(data){
					var status = '';
					switch(userStatus){
					case "활동중" :
						status = '활동중';
						break;
					case "정지" :
						status = '정지';
						break;
					default :
						alert("회원 상태 변경 실패");
					}
					$(obj).parent().siblings('button').text(status);
				}
			});
		}
	//------------------ 회원 등급, 회원 상태 수정 끝 ------------------//
	
	//----------------------- 검색 시작 ------------------------//
		function search() {
			location.href="<%=request.getContextPath()%>/searchUser.um?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
	
		$('#keyword').keydown(function(key){
			if(key.keyCode==13){
				$('#searchBtn').click();
				return false;
			}
		});
	//----------------------- 검색 끝 ------------------------//
	</script>
	
</body>
</html>

















