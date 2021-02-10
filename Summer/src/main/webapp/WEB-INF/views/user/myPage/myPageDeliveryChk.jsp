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
    
    	#myMenu4 {
    		background : #88c8bc;
    		color : white;
    	}
    	
    	#tekbeCompnayList, #invoiceNumberText {
		    width: 500px;
		    height: 30px;
		    padding-left: 10px;
		    font-size: 18px;
		    color: #black;
		    border: 1px solid black;
		    border-radius: 3px;
		}

		#tekbeCompnayName, #invoiceNumber{
		  	color:black; 
		  	font-weight: bold; 
		  	margin-right: 20px;
		  	font-size: 18px;
		}
		
		#myButton1 {
			width: 180px;
			height : 50px;
		  	background: snow;
		  	color : #88c8bc;
		  	border : 2px solid #88c8bc;
			border-radius: 5px;
			font-family: Arial;
			font-size: 18px;
			padding: 10px 10px 10px 10px;
		}
		
		#myButton1:hover {
			cursor : pointer;
			background : #88c8bc;
			color : snow;
			transition : 0.4s;
		}
		
		table {
		    font-family: arial, sans-serif;
		    border-collapse: collapse;
		    width: 100%;
		}
		
		td, th {
		    border: 1px solid #dddddd;
		    text-align: left;
		    padding: 8px;
		}
		
		tr:nth-child(even) {
		    background-color: #dddddd;
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
					<h2 style="text-align:center;">배송조회</h2>
				</div>
			</div>
			<div class="row justify-content-md-center">
				<div class="col-md-10">
					<span id="tekbeCompnayName">택배회사명 : </span>
					<select id="tekbeCompnayList" name="tekbeCompnayList"></select><br>
					<span id="invoiceNumber">운송장번호 : </span>
					<input type="text" id="invoiceNumberText" name="invoiceNumberText">
					<button id="myButton1">택배 조회하기</button>
					<br/>
					<br/>
					<div>
						<table id="myPtag"></table>
					</div>
					<br/>
					<div>
						<table id="myPtag2"></table>
					</div>
				</div>
			</div>
			<br><br><br>
			<div class="row justify-content-md-center">
				<div class="col-md-11" style="border-bottom : 3px solid #88c8bc;">
				</div>
			</div>
				
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>


	<script>
	
	$(document).ready(function(){
		var myKey = "PF4u82q4N39at4bbe9CBGg"; // sweet tracker에서 발급받은 자신의 키 넣는다.
		
			// 택배사 목록 조회 company-api
	        $.ajax({
	            type:"GET",
	            dataType : "json",
	            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
	            success:function(data){
	            		
	            		// 방법 1. JSON.parse 이용하기
	            		var parseData = JSON.parse(JSON.stringify(data));
	             		console.log(parseData.Company); // 그중 Json Array에 접근하기 위해 Array명 Company 입력
	            		
	            		// 방법 2. Json으로 가져온 데이터에 Array로 바로 접근하기
	            		var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
	            		console.log(CompanyArray); 
	            		
	            		var myData="";
	            		$.each(CompanyArray,function(key,value) {
		            			myData += ('<option value='+value.Code+'>' +'key:'+key+', Code:'+value.Code+',Name:'+value.Name + '</option>');        				
	            		});
	            		$("#tekbeCompnayList").html(myData);
	            }
	        });
	
			// 배송정보와 배송추적 tracking-api
	        $("#myButton1").click(function() {
	        	var t_code = $('#tekbeCompnayList option:selected').attr('value');
	        	var t_invoice = $('#invoiceNumberText').val();
	            $.ajax({
	                type:"GET",
	                dataType : "json",
	                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
	                success:function(data){
	                	console.log(data);
	                	var myInvoiceData = "";
	                	if(data.status == false){
	                		myInvoiceData += ('<p>'+data.msg+'<p>');
	                	}else{
		            		myInvoiceData += ('<tr>');            	
		            		myInvoiceData += ('<th>'+"보내는사람"+'</td>');     				
		            		myInvoiceData += ('<th>'+data.senderName+'</td>');     				
		            		myInvoiceData += ('</tr>');     
		            		myInvoiceData += ('<tr>');            	
		            		myInvoiceData += ('<th>'+"제품정보"+'</td>');     				
		            		myInvoiceData += ('<th>'+data.itemName+'</td>');     				
		            		myInvoiceData += ('</tr>');     
		            		myInvoiceData += ('<tr>');            	
		            		myInvoiceData += ('<th>'+"송장번호"+'</td>');     				
		            		myInvoiceData += ('<th>'+data.invoiceNo+'</td>');     				
		            		myInvoiceData += ('</tr>');     
		            		myInvoiceData += ('<tr>');            	
		            		myInvoiceData += ('<th>'+"송장번호"+'</td>');     				
		            		myInvoiceData += ('<th>'+data.receiverAddr+'</td>');     				
		            		myInvoiceData += ('</tr>');           	                		
	                	}
	        			
	                	
	                	$("#myPtag").html(myInvoiceData)
	                	
	                	var trackingDetails = data.trackingDetails;
	                	
	                	
	            		var myTracking="";
	            		var header ="";
	            		header += ('<tr>');            	
	            		header += ('<th>'+"시간"+'</th>');
	            		header += ('<th>'+"장소"+'</th>');
	            		header += ('<th>'+"유형"+'</th>');
	            		header += ('<th>'+"전화번호"+'</th>');     				
	        			header += ('</tr>');     
	            		
	            		$.each(trackingDetails,function(key,value) {
		            		myTracking += ('<tr>');            	
	            			myTracking += ('<td>'+value.timeString+'</td>');
	            			myTracking += ('<td>'+value.where+'</td>');
	            			myTracking += ('<td>'+value.kind+'</td>');
	            			myTracking += ('<td>'+value.telno+'</td>');     				
		            		myTracking += ('</tr>');        			            	
	            		});
	            		
	            		$("#myPtag2").html(header+myTracking);
	                	
	                }
	            });
	        });
			
	});
	
	
	</script>
	
	</body>
</html>

