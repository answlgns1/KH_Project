<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    	.categories_widget ul li {
    		width : 150px;
    	}
    	
    	.categories_widget p {
    		color : black;
    	}
    	
    	.contact_widget span {
    		color : white;
    	}
    	
    	#footer_container{
    	background-color: rgb(22, 18, 39);
    	/*rgb(248,240,211);*/
    	}
    	
    	#copy_area_container{
    	text-align: center;
    	background-color: rgb(22, 18, 39);
    	}
    	
    	footer {color: white;}
    	
    	.f_w_title>p>a {padding-right: 5px;}
    	
    </style>
    	<br /><br /><br /><br /><br /><br />
    
        <!--================Footer Area =================-->
        <footer class="footer_area">
            <div class="footer_widgets_area">
                <div class="container" id="footer_container">
                    <div class="f_widgets_inner row">
                        <div class="col-lg-3 col-md-6">
                            <aside class="f_widget subscribe_widget">
                                <div class="f_w_title">
                                    <h3 align="center">고객센터</h3>
                                </div>
                                <p>
                                	1556-1655 <br>
                                	365 고객센터 <br>
                                	오전 7시 ~ 오후 8시 <br>
                                </p>
                                <div class="f_w_title">
                                    <h3>Social</h3>
	                                <p>
	                                    <a href="#"><img alt="twitter" src="<%=request.getContextPath()%>/resources/images/twitter.png" width="31" height="31"></a>
	                                    <a href="#"><img alt="facebook" src="<%=request.getContextPath()%>/resources/images/facebook.png" width="28" height="28"></a>
	                                    <a href="#"><img alt="instagram" src="<%=request.getContextPath()%>/resources/images/instagram.png" width="30" height="30"></a>
	                                    
	                                </p>
                                </div>
                            </aside>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <aside class="f_widget subscribe_widget">
                                <div class="f_w_title">
                                    <h3 align="center">사업자 정보 확인</h3>
                                </div>
                                <p>
                                	대표이사 : 한끼대표 OOO<br>
                                	법인명(상호): 주식회사 한끼<br>
                                	사업자등록번호 :<br>
                                	000-00-00000<br>
                                	통신판매업 :<br>
                                	제 2020-서울강남-00000호<br>
                                	개인정보보호책임자 : 김OO <br>
                                	주소 : 서울시 테헤란로 1길 10, 한끼빌딩
                                </p>
                            </aside>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <aside class="f_widget contact_widget">
                                <div class="f_w_title">
                                    <h3 align="center">기타 문의</h3>
                                </div>
                                
                                <span>제휴문의 : </span>
                                <a href="#" style="color: white;">business@HanMealcorp.com</a>
                                <span>채용문의 : </span>
                                <a href="#" style="color: white;">recruit@HanMealcorp.com</a>
                                <br>
                                <span>이메일 : </span>
                                <a href="#" style="color: white;">Nowaste@HanMealcorp.com</a>
                                <br><br>
                                <span>팩스 : </span>
                                <a href="#" style="color: white;">000-0000-0000</a>
                            </aside>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <aside class="f_widget categories_widget">
                                <div class="f_w_title">
                                    <h3 align="center">Link Categories</h3>
                                </div>
                                <ul>
                                    <li><a href="#" style="color: white;"><i class="fa fa-angle-double-right" aria-hidden="true"></i>회사 소개</a></li>
                                    <li><a href="#" style="color: white;"><i class="fa fa-angle-double-right" aria-hidden="true"></i>이용 약관</a></li>
                                    <li><a href="#" style="color: white;"><i class="fa fa-angle-double-right" aria-hidden="true"></i>1:1 문의</a></li>
                                </ul>
                                <ul>
                                    <li><a href="#" style="color: white;"><i class="fa fa-angle-double-right" aria-hidden="true"></i>개인정보처리방침</a></li>
                                    <li><a href="#" style="color: white;"><i class="fa fa-angle-double-right" aria-hidden="true"></i>이용 안내</a></li>
                                    <li><a href="#" style="color: white;"><i class="fa fa-angle-double-right" aria-hidden="true"></i>카카오톡 문의</a></li>
                                </ul>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copy_area">
                <div class="container" id="copy_area_container">
                    <div class="float-none">
                        <h5>&copy; Copyright (C) <script>document.write(new Date().getFullYear());</script> HANMEAL CORP - All Rights Reserved</h5>
                    </div>
                </div>
            </div>
        </footer>
        
        <!--================End Footer Area =================-->