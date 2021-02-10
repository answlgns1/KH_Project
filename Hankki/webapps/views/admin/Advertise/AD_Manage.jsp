<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.util.*, com.kh.jsp.advertise.model.vo.*,
				 com.kh.jsp.common.*, com.kh.jsp.member.model.vo.*"
%>
<%
	ArrayList<Advertisement> list = (ArrayList<Advertisement>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 관리</title>
</head>

<style>
	#ad1_img_box {
		width : 100%;
		height : 270px;
	}
	
	#ad1_img_box img {
		width : 100%;
		height : 270px;
	}
	
	#ad1_select_box {
		height : 270px;
		top : 30px;
		display : none;
	}
	
	#ad1_select_box>div {
		margin-top : 50%;
	}

    /* -----------------foot부분 시작------------- */
    #foot button {
        color : black;
        font-size : medium;
        border-radius: 8px 8px;
        cursor : pointer;
        padding : 5px;
        border : none;
    }
    
    #foot button:hover {
    	background : gray;
    	color : snow;
    	transition : 0.7s;
    }
    
	#foot {
		text-align : right;
	}
	
	#delBtn {
		display : none;
		text-align:center;
	}

    /* -----------------foot부분 끝------------- */
    
    /*------------------검색 시작--------------------*/
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
	/*-------------------검색 끝--------------------*/
</style>

<body>
	<%@ include file="/views/common/adminMenu.jsp" %>
	
	<hr>
	
	<div class="container-fluid">
        <div class="row">
            <div class="col-md-2 col-md-offset-3" style="font-size : 30px"><b>광고 관리</b></div>
			<div class="col-md-5" id="search">
        	<select id="searchCondition" name="searchCondition">
				<option value="">---</option>
				<option value="ad_no">광고 번호</option>
				<option value="ad_name">광고 이름</option>
			</select>
            <input type="search" id="keyword" style="width:200px;" placeholder="키워드를 입력해주세요.">
        	<button type="button" id="searchBtn" onclick="search();">검색</button>
			</div>
		</div>
		<br />
		<% for(Advertisement ad : list) { %>
        <div class="row">
	        <div class="col-md-7 col-md-offset-3" style="border-bottom:1px solid #E2E2E2;">
	            <p>No.<%= ad.getAd_no() %></p>
	            <div>
	                <div id="ad1_img_box">
	                    <img src="<%=request.getContextPath()%>/resources/AdvertiseFiles/<%= ad.getAd_attachment() %>">
	                </div>
	                <div style="font-weight:bold; font-size:20px;"><%= ad.getAd_name() %></div> <br>
	                <div><%= ad.getAd_content() %></div>
	            </div>
	        </div>
			<div class="col-md-2" id="ad1_select_box">
				<div>
					<input type="checkbox" id="ad1_select">&nbsp;광고 선택
				</div>
			</div>
		</div>
		<br />
        <% } %>
        <div class="row">
	        <div class="col-md-7 col-md-offset-3" id="foot">
	            <button id="goInsert" class="btn btn-success">광고 등록</button>
	            <button id="goUpdate" class="btn btn-info">광고 수정</button>
	            <button id="adDelete" class="btn btn-danger">광고 삭제</button>
	        </div>
	        <div class="col-md-2" id="delBtn">
	        	<button class="btn btn-danger btn-sm">삭제하기</button> &nbsp; &nbsp;
	        	<button id="deReset" class="btn btn-sm">취소하기</button>
	        </div>
        </div>
        <br><br><br><br>
        <hr>
        <div class="row">
		<div class="col-md-7 col-md-offset-3" style="text-align : center">
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
    <br /><br /><br /><br /><br /><br /><br />
    <script>
    	//----------------------- 버튼 시작 -----------------------------//
    	/* 광고 등록 버튼 */
    	$('#goInsert').on('click', function(){
    		location.href="<%= request.getContextPath() %>/views/admin/Advertise/AD_Insert.jsp";
    	});
    	
    	/* 광고 수정 버튼 */
    	
    	
    	/* 광고 삭제 버튼 */
    	$(function(){
    		$('#adDelete').click(function(){
    			$('#ad1_select_box').toggle();
    			$('#delBtn').toggle();
    			$('#adDelete').toggle();
    		})
    	})
    	
    	$(function(){
    		$('#deReset').click(function(){
    			$('#ad1_select_box').toggle();
    			$('#delBtn').toggle();
    			$('#adDelete').toggle();
    		})
    	})
    	//----------------------- 버튼 끝 -----------------------------//
    	
    	//----------------------- 검색 시작 ------------------------//
		function search() {
			location.href="<%=request.getContextPath()%>/searchAdvertise.ad?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
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