<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 관리</title>
</head>

<style>
	section {
        position : absolute;
        margin : 5% 27%;
        width : 65%;
        height : auto;
    }

    #title_bar * {
        display : inline-block;
    }

    #title_bar>ul {
        float : right;
    }

    /* -----------------이벤트1 시작------------------ */

    #ad_content1 {
        margin-top : 20px;
    }

    #ad_content1>p {
        font-size: large;
        margin : 0;
    }

    #ad1_box {
        width : 100%;
        display : inline-block;
    }

    #ad1_box div {
        display : inline-block;
    }

    #ad1_img_box {
        width : 100%;
        height : 200px;
    }

    #ad1_img_box img {
        width : 80%;
        height : 200px;
    }

    #ad1_selct_box {
        position : absolute;
        width : 20%;
        height : 200px;
    }

    #ad1_selct_box p {
        position: relative;
        width : 100%;
        margin-top : 90px;
        text-align: center;
    }

    /* -----------------이벤트1 끝------------------ */

    /* -----------------이벤트2 시작------------------ */

    #ad_content2 {
        margin-top : 20px;
    }

    #ad_content2>p {
        font-size: large;
        margin : 0;
    }

    #ad2_box {
        width : 100%;
        display : inline-block;
    }

    #ad2_box div {
        display : inline-block;
    }

    #ad2_img_box {
        width : 100%;
        height : 200px;
    }

    #ad2_img_box img {
        width : 80%;
        height : 200px;
    }

    #ad2_selct_box {
        position : absolute;
        width : 20%;
        height : 200px;
    }

    #ad2_selct_box p {
        position: relative;
        width : 100%;
        margin-top : 90px;
        text-align: center;
    }

    /* -----------------이벤트2 끝------------------ */

    /* -----------------foot부분 시작------------- */

    #foot>ul {
        float : right;
    }

    #foot>ul>li {
        display : inline-block;
        margin-left : 10px;
        margin-top : 10px;
    }

    #foot>ul>li>a,
    #foot>ul>li>button {
        color : black;
        font-size : medium;
        border-radius: 8px 8px;
        cursor : pointer;
        padding : 5px;
    }

    /* -----------------foot부분 끝------------- */
</style>

<body>
	<%@ include file="/views/common/adminMenu.jsp" %>
	
	<hr>
	
	<section>
        <div id="title_bar">
            <div id="title">
                <strong style="font-size: x-large;">이벤트 관리</strong>
            </div>
            <ul>
                <li><input type="checkbox" id="ad_no">이벤트번호</li>
                <li><input type="checkbox" id="ad_name">이벤트명</li>
                <li><input type="text" id="ad_search"><input type="submit" value="검색"></li>
            </ul>
        </div>
        <div id="ad_content1">
            <p>No.1</p>
            <div id="ad1_box">
                <div id="ad1_img_box">
                    <img src="<%=request.getContextPath()%>/resources/images/sample_images_01.png">
                    <div id="ad1_selct_box">
                        <p><input type="checkbox" id="ad1_select">&nbsp;이벤트 선택</p>
                    </div>
                </div>
                <br>
                <div>
				          국회의원의 선거구와 비례대표제 기타 선거에 관한 사항은 법률로 정한다.
				          제3항의 승인을 얻지 못한 때에는 그 처분 또는 명령은 그때부터 효력을 상실한다.
				          이 경우 그 명령에 의하여 개정 또는 폐지되었던 법률은 그 명령이 승인을 얻지 못한 때부터 당연히 효력을 회복한다.
                </div>
            </div>
        </div>
        
        <div id="ad_content2">
            <p>No.2</p>
            <div id="ad2_box">
                <div id="ad2_img_box">
                    <img src="<%=request.getContextPath()%>/resources/images/sample_images_02.png">
                    <div id="ad2_selct_box">
                        <p><input type="checkbox" id="ad2_select">&nbsp;이벤트 선택</p>
                    </div>
                </div>
                <br>
                <div>
			                 국회의원의 선거구와 비례대표제 기타 선거에 관한 사항은 법률로 정한다.
				          제3항의 승인을 얻지 못한 때에는 그 처분 또는 명령은 그때부터 효력을 상실한다.
				          이 경우 그 명령에 의하여 개정 또는 폐지되었던 법률은 그 명령이 승인을 얻지 못한 때부터 당연히 효력을 회복한다.
                </div>
            </div>
        </div>
        <div id="foot">
            <ul>
                <li><a href="EventInsert.jsp" class="btn btn-success">이벤트 등록</a></li>
                <li><a href="EventUpdate.jsp" class="btn btn-info">이벤트 수정</a></li>
                <li><button class="btn btn-danger">이벤트 삭제</button></li>
            </ul>
        </div>
        <br><br><br><br>
        <hr>
        <div class="row">
		<div class="col-md-7 col-md-offset-2" style="text-align : center">
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
		
    </section>

</body>
</html>