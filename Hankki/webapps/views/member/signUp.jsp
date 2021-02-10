<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <style>
        .div_body_container{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            z-index: 97;
            overflow-x:scroll;
        }
        .text{                   /* 회원가입 제목 */
            text-align: center;
            margin-bottom: 10px;
            margin-top: 100px;
            width: 550px
        }
        .div1-1{                /* 회원가입 창 컨테이너 */
            padding: 5px 20px;
           display:flex ;          /* 기본적으로 flex설정시 컨테이너 안에 값들은 inline속성이며
                                flex를 설정한 컨테이너 자체는 block속성으로 차곡차곡 쌓인다 */
           flex-direction: column;    /* 컨테이너 안에 컨텐츠를 수직으로 바꾼다 */
           align-items: center;    /* 수직으로 바뀔시 원래 가로 가운데 정렬의 역할이 세로 가운데 정렬의 역할로 바뀐다 */
           padding-top: 50px;
           padding-bottom: 50px;
           width: 600px;
           border-bottom: gray solid;
           border-top: gray solid;
        }

        .div2-1{               /* 각 입력 항목 상위 컨테이너 */
            
            display: flex;         /* 안에 값들이 inline으로 정렬 */
                                   /* 안에 값들이 좌우 위아래 가운데 정렬 */
            padding: 5px 20px;
            width: 550px;
            align-items: center;
            
            
            
            }
            
        .div2-2{                /* 알림 컨테이너의 상위 컨테이너 */
            display: flex;          /* float를 쓰면 깨진다 */
            padding: 5px 20px;
            width: 550px;
            justify-content: center;
        }

        input{
            width: 300px;
            height: 35px;
            padding-left: 10px;
            border-radius: 5px;
            border: black solid 1px;
            
        }

        label{
            flex: 1;            /* label의 컨테이너가 증가한다 1로 설정시 최대치로 증가
                                 이미 input의 width값이 정해져 있기 때문에
                                 이렇게 모습이 형성되는 것 
                                 상위에서 display : flex를 해놓아야 사용이 가능*/
        
        }

        .divcheck{                /* 입력 항목 아래에 알림 컨테이너 */
            width: 300px;
            height: auto;
            text-align: left;
            font-size: 10px;
            margin-left: 15px;
        }

        .overlap1-1{               /* 중복확인 */
            width: 100px;
            height: 35px;
            border: gray solid 1px;
            border-radius: 5px;
            margin-left: 10px;
        }
        .overlap1-2{               /* 중복확인 */
            width: 100px;
            height: 35px;
            border: white solid 1px;
            border-radius: 5px;
            margin-left: 10px;
            background-color: white;
        }

        /* 여기서부터 이용약관 */
        .divagree1{             /* 이용약관 전체 박스 */
            display: flex;
            flex-direction: column;
            align-items: center;
            border-bottom: gray solid;
            width: 650px;
            
        }
        .divagree2{             /* 각 이용약관 항의 상위 박스 */
            padding: 20px 5px;
            display: flex;
            justify-content:center ;
            align-items: center;
            width: 600px;
        }
        .divagree2-2{             /* 맨 위의 전체동의 상위 박스 */

            padding: 20px 5px;
            display: flex;
            flex-direction: column;
            justify-content:center ;
            align-items: center;
            width: 600px;

        }
        .divagree3-1{            /* 동의선택필수여부 */
            display: flex;
            width: 300px;
            align-items: center;
            flex: 1;
            font-size: 18px;
            margin-left: 150px;
            font-size : 14px
        }
        .divagree3-1>img{
            margin-right: 10px;
        }
        .divagree3-3>img{
            margin-right: 10px;
        }
        .divagree3-2{             /* 약관보기 */

            width: 100px;
            text-align: right;
            font-size: 15px;
        }
        .divagree3-2>a{          /* 약관보기 링크 */
            text-decoration: none;
            color: black;
            flex: 1;
        }
        .divagree3-3{             /* 전체동의 */
            display: flex;

            width: 300px;
            align-items: center;
            font-size: 18px;
            
        }
        .divagree3-4{             /* 전체동의 아래 설명 */
            margin-left: 165px;
            font-size: 10px;
        }
        .button1{
            width: 100px;
            height: 40px;
            background-color: green;
            border: none;
            color: white;
            border-radius: 5px;
        }
        .button2{
            padding: 10px 10px;
            background-color: cornsilk;
            border: none;
            width: 100px;
            height: 40px;
            border-radius: 5px;
        }
       
        .div3-1{
        width: 550px;
        display : flex;
        align-items : center;
        padding : 0px 20px;
        }
        
        .div3-2{
       
        
        }
        .postsearch{
        width : 100px;
        text-align : center;
        padding: 5px;
       
        }
        
        
/*         여기서부터 이용약관 */
        
      #background11{
        visibility: hidden;
        position: fixed; 
        background: #000;
        opacity: 0.5;
        z-index: 99;
        width: 100%;
        height: 2000px;
        margin-top: -500px;
        
       }
       .ximg{

        width: 15px;
        height: 15px;
        cursor: pointer;
       }
       .layerPop{
        width: 450px;
        height: 250px;
        position: absolute;
        top: 50%;
        left:50%;
        transform: translate(-50%, -50%);
        padding: 20px;
        padding-left: 15px;
        background-color: white;
        visibility: hidden;
        position: fixed;
        display: flex;
        flex-direction:column;
        border-radius: 5px;
        z-index: 100;
        border: solid gray 1px;
        
         }
         .layertitle1{
        border: gray solid 1px;
        width: 130px;
        height: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 12px;
        background-color : whitesmoke;
       }
       .layercontent1{
        border: solid gray 1px;
        width: 130px;
        height: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 12px;
       }
         a{
        text-decoration: none;
        color: black;
    }
      
      
/*    여기서부터 2번째 레이어팝업 */
      .layerPop2{
        width: 450px;
        height: 450px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 20px;
        padding-left: 15px;
        background-color: white;
        visibility: hidden;
        display: flex;
        flex-direction:column;
        border-radius: 5px;
        z-index: 100;
        border-top: 1px solid gainsboro;
    }
    .layertitle2{
        border: gray solid 1px;
        width: 120px;
        height: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 12px;
        background-color: whitesmoke;
        padding: 5px;
    }
    .layercontent2{
        border: solid gray 1px;
        width: 120px;
        height: 200px;
        display: flex;
        text-align: center;
        align-items: center;
        font-size: 12px;
        padding: 5px;
        
    }
    .sublayer{
        display: flex;
        width: 194px;
        height: 40px;
        align-items: center;
        justify-content: center;
        border: solid gray 1px;
        padding: 5px;
    }  
    
/*     여기서부터 3번째 팝업 */
      .layerPop3{
           width: 450px;
           height: 450px;
           position: absolute;
           top: 50%;
           left: 50%;
           transform: translate(-50%, -50%);
           padding: 20px;
           padding-left: 15px;
           background-color: white;
           visibility: hidden;
           display: flex;
           flex-direction:column;
           border-radius: 5px;
           z-index: 100;
           border-top: 1px solid gainsboro;
        
    }



      
    </style>
</head>
<body >
   <header>
      <%@ include file="../common/header.jsp"%>
   </header>
<section>
<form action="<%=request.getContextPath() %>/SingUp.hankki" method="post" id="form" onkeydown="return enter(event)" >
<!-- onkeydown="return event.key!='enter'" 이것도 사용이 가능-->

<div class="background11" id="background11"></div>

<div class="div_body_container" style="overflow:scroll;">

        <div class="text">
        <h2>회원가입</h2>
        </div>

    <div class="div1-1">
            <div class="div2-1">
                <label for="id" >아이디</label>
                <input type="text" id="id"
                 placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"
                 style="margin-right: 0;" name="userId">
                <input type="button" value="중복확인" class="overlap1-1" onclick="idOverlapCheck()">
            </div>
            
            <div class="div2-2">
            <div id=idcheck class="divcheck"></div>
            </div>

            <div class="div2-1">
                <label for="pwd">비밀번호</label>
                <input type="password" id="pwd" placeholder="비밀번호를 입력해주세요" name="userPwd">
               <div class="overlap1-2" ></div>
            </div>
            <div class="div2-2">
            <div id=pwdcheck class="divcheck"></div>
            </div>

            <div class="div2-1">
                <label for="pwd2">비밀번호 확인</label>
                <input type="password" id="pwd2" placeholder="비밀번호를 한번 더 입력해주세요" >
               <div class="overlap1-2"></div>
            </div>
            <div class="div2-2">
            <div id=pwdcheck2 class="divcheck"></div>    
            </div>
            
            <div class="div2-1">
                <label for="name">이름</label>
                <input type="text" id="name" placeholder="이름을 입력해주세요" name="userName">
               <div class="overlap1-2" ></div>
            </div>
            <div class="div2-2">
            <div id="namecheck" class="divcheck"></div>
            </div>

            <div class="div2-1">
                <label for="email">이메일</label>
                <input type="text" id="email"
                 placeholder="예 : cleanmeal@meal.com" name="userEmail">
                <input type="button" value="중복확인" class="overlap1-1" onclick="emailOverlapCheck()">
            </div>
            <div class="div2-2">
            <div id="emailcheck" class="divcheck"></div>
            </div>

            <div class="div2-1">
                <label for="phone">휴대폰</label>
                <input type="text" id="phone" maxlength="11"
                 placeholder="숫자만 입력해주세요" name="userPhone">
               <div class="overlap1-2"></div>
            </div>
            <div class="div2-2" >
            <div id="phonecheck" class="divcheck"></div>
            </div>

            <div class="div2-1" style="padding: 5px 20px;  flex-direction : column;">
            
            
            
            
<div class="div3-1">
<label for="address" class="div3-2" >주소</label>
<input type="text" id="sample6_address" placeholder="주소" name="address1"><br>
<div style="width:10px;"></div>
<input type="button" class="postsearch" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
</div>

<input type="text" id="sample6_extraAddress" placeholder="참고항목" 
style="margin-right : 11px; margin-top : 5px" name="address2">
<input type="text" id="sample6_detailAddress" placeholder="상세주소"
 style="margin-right : 11px; margin-top : 5px; margin-bottom : 10px; " name="address3">

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
                
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
            
            
            
            
            
            
            
            </div>

            <div class="div2-1">
                <label for="birth">생년월일</label>
                <input type="text" id="birth" placeholder="YYYY/MM/DD" style="text-align: center;" name="userBirth">
                <div class="overlap1-2"></div>
            </div>
            <div class="div2-2">
            <div id="birthcheck" class="divcheck"></div>
            </div>
    </div>
    <!-- 이용약관 동의 -->
    <div class="divagree1">
   
        <div class="divagree2-2">

            <div class="divagree3-3">
            <img src="<%=request.getContextPath()%>/resources/images/checkbutton.png" alt="" width="30px" height="30px">
            전체동의합니다 <br>
            </div>
            <div class="divagree3-4">
            선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다
            </div>
        
        </div>
        <div class="divagree2">
        
            <div class="divagree3-1">
            <img src="<%=request.getContextPath()%>/resources/images/checkbutton.png" alt="" width="30px" height="30px">
            이용약관 동의(필수)
            </div>
            <div class="divagree3-2">
                <a href="javascript:void(0);" onClick="popUp3()">약관보기></a>
            </div>
        </div>
        <div class="divagree2">
            <div class="divagree3-1">
            <img src="<%=request.getContextPath()%>/resources/images/checkbutton.png" alt="" width="30px" height="30px">
            개인정보처리방침 동의(필수)
            </div>
            <div class="divagree3-2">
                <a href="javascript:void(0);" onClick="popUp2()">약관보기></a>
            </div>
        </div>
        <div class="divagree2">
            <div class="divagree3-1">
            <img src="<%=request.getContextPath()%>/resources/images/checkbutton.png" alt="" width="30px" height="30px">
            개인정보처리방침 동의(선택)
            </div>
            <div class="divagree3-2">
                <a href="javascript:void(0);" onClick="popUp()">약관보기></a>
            </div>
        </div>
        
        <div class="divagree2">
            <div class="divagree3-1">
            <img src="<%=request.getContextPath()%>/resources/images/checkbutton.png" alt="" width="30px" height="30px">
            본인은 만 14세 이상입니다(필수)
        </div>
        </div>
    </div>
    <!-- 회원가입/취소 -->
    <div style="margin-top: 50px; margin-bottom: 50px;">
        <input type="submit" class="button1" value="회원가입"
          onclick="return writecheck()">
        <input type="button" class="button2" value="취소"
        onclick="location.href='/Hankki/index.jsp'" >
    </div>
</div>
<!-- 여기서부터는 레이어 팝업 -->



<div class="layerPop"  id="open">
    <div style="margin-bottom: 20px; margin-top: 20px; display: flex;">
        <div style="flex: 1; font-size: 19px;">
        개인정보 수집 이용 동의(선택)
        </div>
        <div >
        <img src="<%=request.getContextPath()%>/resources/images/ximg.png"
         alt="" onclick="closeabc()" class="ximg"/>
        </div>
    </div>
    <div>
        <div style="display: flex;">
            <div class="layertitle1" style="flex: 1;">수집 목적</div>
            <div class="layertitle1">수집 항목</div>
            <div class="layertitle1">보유 기간</div>
        </div>
        <div style="display: flex;">
            <div class="layercontent1" style="flex: 1;">맞춤형 회원 서비스 제공</div>
            <div class="layercontent1">성별, 생년월일</div>
            <div class="layercontent1" style="font-weight: bolder;">회원 탈퇴<br>즉시 파기</div>
        </div>
    </div>
    <div style="margin-top: 10px; font-size: 14px;">
        동의를 거부하시는 경우에도 서비스는 이용하실 수 있습니다
    </div>
    <div style="display: flex; justify-content:center; margin-top: 20px; border-top: 1px solid gainsboro;">
        <a href="javascript:void(0);" onClick="closeabc()" style="color : black; margin-top : 10px">확인</a>
    </div>
    
<!--     여기서부터 레이어 팝업2 -->

   <div class="layerPop2"  id="open2">
    <div style="margin-bottom: 20px; margin-top: 20px; display: flex;">
        <div style="flex: 1; font-size: 19px;">
        개인정보 수집 이용 동의(필수)
        </div>
        <div >
        <img src="<%=request.getContextPath()%>/resources/images/ximg.png"
         alt="" onclick="closeabc2()" class="ximg"/>
        </div>
    </div>
    <div>
        <div style="display: flex;">
            <div class="layertitle2" style="width: 215px;">수집 목적</div>
            <div class="layertitle2">수집 항목</div>
            <div class="layertitle2">보유 기간</div>
        </div>
        <div style="display: flex;">
            <div class="layercontent2" style="display: flex;
            flex-direction: column; width: 220px; padding:0; height: 200px;">
                <div class="sublayer">이용자 식별 및 본인여부</div>
                <div class="sublayer" >거점 기반 서비스 제공</div>
                <div class="sublayer" style="height: 90px;">계약 이행 및 약관변경 등의 고지를 위한 연락, 본인의사
                    확인 및 민원 등의 고객 고충 처리
                </div>
                <div class="sublayer">부정 이용 방지, 비인가 사용방지 및 서비스 제공
                    및 계약의 이행
                </div>
            </div>
            <div class="layercontent2">이름, 아이디 비밀번호, 휴대폰번호
                이메일, 주소
            </div>
            <div class="layercontent2" style="font-weight: bolder;">회원 탈퇴<br>즉시 파기
            <br><br> 부정이용 방지를 위하여 30일 동안 보관(아이디, 휴대폰 번호) 후 파기
            </div>
        </div>
    </div>
    <div style="margin-top: 10px; font-size: 14px;">
        서비스 제공을 위해서 필요한 최소한의 개인정보입니다. 동의를 해 주셔야
        서비스를 이용하실 수 있으며, 동의하지 않으실 경우 서비스에 제한이 있을 수 있습니다.
    </div>
    <div style="display: flex; justify-content:center; margin-top: 20px; border-top: 1px solid gainsboro;">
        <a href="javascript:void(0);" onClick="closeabc2();" style="margin-top : 10px;">확인</a>
    </div>
    
<!--     여기서부터 레이어팝업 3 -->
    
    
    <div class="layerPop3"  id="open3">
    <div style="margin-bottom: 20px; margin-top: 20px; display: flex;">
        <div style="flex: 1; font-size: 19px;">
        이용약관(필수)
        </div>
        <div >
        <img src="<%=request.getContextPath()%>/resources/images/ximg.png"
         alt="" onclick="closeabc()" class="ximg"/>
        </div>
    </div>
    <div style="overflow: scroll;">
        
해외구매(쇼핑몰형 구매대행) 표준약관


표준약관 제10076호
(2016. 10. 14. 제정)


제1조(목적) 이 약관은 OO(이하 “회사”)가 제공하는 쇼핑몰형 구매대행 관련 서비스(이하 “서비스”)를 이용함에 있어 회사와 이용자 간의 권리·의무, 책임사항 및 절차 등을 규정함을 목적으로 합니다.

제2조(정의) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다. 
 1. “몰”은 회사가 이 약관에 의하여 재화 또는 용역(이하 “재화 등”)을 이용자에게 제공하기 위하여 정보통신설비와 정보통신망을 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 “몰”을 운영하는 회사의 의미로도 사용합니다. 
 2. “이용자”라 함은 회사가 제공하는 서비스를 이용하는 자를 말합니다.
 3. “해외사업자”라 함은 대한민국 이외의 국적이거나 대한민국 이외의 국가에 사업자 등록, 법인, 영업소, 호스트서버 소재지 등을 가진 사업자를 의미합니다.
 4. “쇼핑몰형 구매대행”이라 함은 회사가 “몰”을 통해 해외에서 구매 가능한 재화 등에 대하여 정보를 제공하고 이용자의 청약을 받아, 회사가 해당 재화 등을 이용자의 명의로 수입하여 판매하는 것을 의미합니다. 다만, 이 경우 재화 등은 이용자의 자가 소비용에 한정합니다.
 5. “검수”라 함은 이용자가 구매한 재화 등의 누락, 하자, 파손 여부 등을 회사가 정한 기준에 따라 확인하는 서비스를 의미합니다. 

제3조(서비스의 제공) 회사는 다음 각 호의 업무를 수행할 수 있습니다.
 1. 재화 등에 대한 정보제공
 2. 수입 및 통관 관련 업무
 3. 국제반송 관련 업무
 4. 기타 회사가 정하는 업무 

제4조(서비스이용 제한) 
① 회사는 이용자의 서비스 이용 요청이 다음 각 호의 어느 하나에 해당하는 경우 서비스 제공을 거절할 수 있습니다.
 1. 신청내용에 허위, 기재누락, 오기가 있는 경우
 2. 이용자가 요청한 서비스의 제공이 회사의 경영상 또는 기술상의 이유로 현저히 곤란한 경우
 3. 이용자가 불법 또는 부당한 목적을 위해 서비스를 이용하는 것으로 판단되는 경우

② 전항에 따라 서비스 제공을 거절하는 경우, 회사는 이용자에게 거절의 사유 및 근거를 통지하여야 합니다.

제5조(상품가의 구성)
① “몰”에 표시된 재화 등의 판매 가격은 [해외사업자로부터의 해당 재화 등 구매가격, 해외사업자로부터 회사의 해외 수령 장소까지의 운송료, 해외 현지 세금, 해외 구매 계약 체결 수수료, 해외 현지 수령 장소(해외 물류센터) 이용료, 국제운송료와 수입관세, 수입부가세, 국내운송료, 기타세금 등(이하 “관·부가세 등”)]이 포함된 가격입니다.

② 회사는 이용자가 재화 등의 판매가격을 지급하기 전에 전항에 따른 판매가격의 구성 내역을 구분하여 고지하여야 합니다.

③ 판매가격은 해외사업자의 할인 행사, 환율 변화 등의 사유로 변동될 수 있으며, 이로 인하여 회사가 청약을 받은 재화를 공급할 수 없는 경우 그 사유를 이용자에게 알리고 요금을 3영업일 이내에 환급하는 등의 조치를 해야 합니다.

제6조(계약의 성립) 
① 회사는 이용자의 구매의 신청이 있으면 수신확인통지를 합니다. 수신확인통지에는 주문내역, 금액, 수령 주소 등의 신청 정보와 구매 신청의 정정, 취소 등에 관한 정보 등을 포함하여야 합니다.

② 계약은 이용자의 구매신청에 대하여 회사의 수신확인통지가 이용자에게 도달한 때에 성립됩니다.

③ 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우 지체 없이 회사에 구매 신청 변경 또는 취소를 요청할 수 있으며, 회사는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 요금을 지급한 경우에는 제11조의 청약철회 등에 관한 규정에 따릅니다.

제7조(검수 및 재포장)
① 회사는 이용자가 구매 신청한 재화 등에 대하여 동일성 여부 및 하자·파손 여부, 운송물이 수출입 법령 등에 저촉되지 않는지 여부 등의 확인을 위해 해당 운송물의 개봉·검수를 할 수 있습니다. 회사는 검수의 기준 및 범위를 정하여 이용자에게 미리 통지합니다. 

② 회사가 재화 등의 하자, 파손 등을 발견한 경우, 이용자에게 이를 통보하고 이용자의 요청에 따라 계약을 해제 또는 해지, 청약철회(이하 “청약철회 등”)하거나, 재화 등의 인도를 진행합니다.

③ 이용자가 구매 신청한 재화 등에 대하여 회사가 검수를 통해 악취, 액체누수 등의 이상이 있다고 판단한 경우 이용자에게 이러한 사실을 통지하고 해당 재화 등을 별도 보관하는 등 임시조치를 취할 수 있습니다.

④ 제3항의 경우 회사는 이용자의 요구에 따라 해당 재화 등을 처분하며, 해당 재화의 판매가를 배상하고 처분에 소요되는 비용을 부담합니다. 

⑤ 회사는 포장이 운송에 적합하지 아니한 때에는 운송 중 발생될 수 있는 충격의 정도를 고려하여 추가 포장을 할 수 있습니다.

제8조(배송) 이용자가 복수의 재화 등을 구매하고, 각 재화 등을 공급하는 해외사업자가 다를 경우에는 해당 재화 등을 회사의 해외 수령 장소에 도착하는 순서대로 배송할 수 있으며, 관·부가세 회피를 위한 분할배송 및 가격허위 신고 등 이용자의 불법행위 요청에는 협조하지 않습니다. 

제9조(통관) 
① 회사는 이용자를 위하여 회사가 정한 운송 및 통관 업무 위탁사를 통해 통관절차를 수행합니다. 이 때 발생하는 관·부가세 등은 이용자 또는 수하인이 부담합니다. 

② 제1항의 통관 업무를 수행할 때에, 회사가 정한 운송 및 통관 업무 위탁사가 관·부가세 등을 이용자를 대신하여 납부하면, 회사는 이용자가 재화 등의 구매 계약 체결 시 미리 지급한 관·부가세 등을 운송 및 통관 업무 위탁사와 정산합니다.

제10조(긴급조치) 
① 회사는 재화 등에 관하여 이용자의 책임 있는 사유로 인하여 관할관청 등의 관련법령에 근거한 적법한 인도 요구가 있는 경우 해당 재화 등을 관할 기관에 인도합니다. 이 경우 회사는 지체 없이 이를 이용자에게 통지합니다. 

② 전항의 조치로 인하여 이용자가 손해를 입은 경우 회사는 그 손해를 배상합니다. 

③ 제1항의 관할관청 등이 재화 등을 반환한 경우, 회사는 지체 없이 구매계약에 따른 채무를 계속해서 이행해야 합니다.  

제11조(청약철회 등) 회사의 “몰”에 소개된 해외에서 구매 가능한 재화 등의 구매에 관한 계약을 체결한 이용자는 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회 등을 할 수 있습니다. 

제12조(청약철회 등의 제한)
① 이용자는 재화 등을 배송 받은 경우 다음 각 호의 어느 하나에 해당하는 경우에는 청약철회 등을 할 수 없습니다.
 1. 이용자에게 책임 있는 사유로 재화 등이 분실 또는 파손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
 2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
 3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
 4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
 5. 그 밖에 이용자의 주문에 따라 개별적으로 생산되는 재화 등 또는 이와 유사한 재화 등에 대하여 청약철회를 인정하는 경우 쇼핑몰형 구매대행업체에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 해당 거래에 대하여 별도로 그 사실을 고지하고 이용자의 서면(전자문서를 포함한다)에 의한 동의를 받은 경우

② 전항 제2호 내지 제4호의 경우에 회사가 “몰”에 사전에 청약철회 등이 제한되는 사실을 이용자가 쉽게 알 수 있는 곳에 표시하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등은 제한되지 않습니다.

제13조(상품상이, 하자, 파손 등) 이용자는 제12조에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 해당 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

제14조(청약철회의 효과)
① 회사는 이용자로부터 재화 등을 반품 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 요금을 환급합니다. 이 경우 회사가 이용자에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 연 100분의 20의 지연이자율을 곱하여 산정한 지연이자를 지급합니다.

② 회사는 제1항의 요금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 지급수단으로 재화 등의 요금을 지급한 때에는 지체 없이 해당 지급수단을 제공한 사업자로 하여금 재화 등의 요금의 청구를 정지 또는 취소하도록 요청합니다.

제15조(반품)
① 이용자가 구매한 재화 등에 대하여 회사와 해외사업자간의 매매계약이 체결되어 해당 재화가 회사의 해외 현지 수령 장소로 발송된 이후 이용자가 청약철회 등을 한 경우, 해외 현지 운송료 및 구매 수수료, 해외 현지 반송료는 이용자가 부담합니다. 이 경우, 회사는 이용자에게 해당 매매계약이 체결된 일시 및 발송의 일시를 증빙하는 자료를 제시하여야 합니다.  

② 이용자가 구매한 재화 등에 대하여 회사가 이용자의 국내 수령 장소로 발송한 이후 이용자가 청약철회 등을 하는 경우, 해당 재화 등의 수입 시 발생한 해외 현지 운송료, 해외 세금, 해외 현지 수령 장소 이용료, 선적비용, 항공운송료, 통관 업무 위탁 수수료, 관·부가세 등 해당 재화 등을 수입하기 위해 들어간 비용과 회사의 국내주소지로 해당 재화를 반송하는 운송료는 이용자가 부담합니다.

③ 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반품에 필요한 비용은 회사가 부담합니다.

④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 회사는 청약철회 등의 경우 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.

⑤ 회사는 제1항 및 제2항의 사실을 사전에 “몰”에 이용자가 쉽게 알 수 있는 곳에 표시하는 등의 조치를 취해야 합니다.

제16조(교환과 수리)
① 회사는 재화 등의 재고를 보유하고 있지 않으므로 교환은 불가능하나, 청약철회 등에 따른 반품 및 환불은 가능합니다. 

② 회사는 재화 등의 수리(A/S) 업무를 수행하지 않습니다.  

③ 제1항 및 제2항의 사항을 회사가 “몰”에 사전에 이용자가 쉽게 알 수 있는 곳에 표시하는 등의 조치를 취하지 않았다면, 회사는 이용자의 교환과 수리 요구에 협조하여야 합니다.

제17조(분쟁해결)
① 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.

② 회사는 이용자로부터 제출되는 불만사항 및 의견을 다른 사안에 우선하여 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 지체 없이 통지하여야 합니다. 

③ 회사와 대한민국 국민 또는 대한민국에 사무소를 가지는 이용자 간에 발생한 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.

제18조(관할법원 및 준거법)
① 회사와 대한민국 국민 또는 대한민국에 사무소를 가지는 이용자 간에 발생한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.

② 회사와 대한민국 국민 또는 대한민국에 사무소를 가지는 이용자 간에 발생한 소송의 준거법은 대한민국법으로 합니다.
        
    </div>
    <div style="margin-top: 10px;">
        
    </div>
    <div style="display: flex; justify-content:center; margin-top: 20px; border-top: 1px solid gainsboro;">
        <a href="javascript:void(0);" onClick="closeabc3();" style="margin-top : 10px;">확인</a>
    </div>
    
    
    
    
</div>

</form>
</section>
   <footer>
      <%@ include file="../common/footer.jsp"%>
   </footer>
    <script>
        var userid =document.getElementById('id');
        var userpwd =document.getElementById('pwd');
        var userpwd2 =document.getElementById('pwd2');
        var username =document.getElementById('name');
        var userphone =document.getElementById('phone');
        var userbirth =document.getElementById('birth');
        var useremail =document.getElementById('email');
        var useraddress=document.getElementById('sample6_address');
        var useraddress2=document.getElementById('sample6_extraAddress');

        var useridck =document.getElementById('idcheck');
        var userpwdck =document.getElementById('pwdcheck');
        var userpwdck2 =document.getElementById('pwdcheck2');
        var usernameck = document.getElementById('namecheck');
        var userphoneck = document.getElementById('phonecheck');
        var userbirthck =document.getElementById('birthcheck');
        var useremailck =document.getElementById('emailcheck');

        userid.addEventListener('click',function(){
            var useridv=userid.value
            let messages =[];
            if(useridv.length!=0&&(/[a-z0-9]/ig).test(useridv)&&(/[a-z]/ig).test(useridv)
            &&useridv.length>=6){
                    
                useridck.innerHTML='';

            }else{
                
                messages.push('6자 이상의 영문 혹은 영문과 숫자를 조합<br>');
                useridck.innerHTML=messages.join('');
            }
        })
        userid.addEventListener('keyup',function(){
            var useridv=userid.value
            let messages = [];
            if(useridv.match(/[a-zA-Z0-9]/)&&useridv.match(/[a-zA-Z]/)
                &&useridv.length>=6){
                    messages.push('');
                    useridck.innerHTML=messages.join('');
            }else{
                useridck.innerHTML='6자 이상의 영문 혹은 영문과 숫자를 조합<br>';
            }

        })

        userpwd.addEventListener('click',function(){
            var userpwdv = userpwd.value;
            if(userpwdv!=0&&userpwdv.match(/[a-zA-z]/)&&userpwdv.match(/[0-9]/)
            &&userpwdv.match(/[!@#$%^&*()~?]/)&&userpwdv.length>=10&&userpwdv.length<=20){
                
                userpwdck.innerText ='';

            }else{
                
                let messages = [];
                messages.push('10자 이상 입력<br>');
                messages.push('영문/숫자/특수문자(공백제외)만 허용하며, 2개 이상 조합<br>');
                userpwdck.innerHTML = messages.join(' ');
            }
        })
        userpwd.addEventListener('keyup',function(){
            var userpwdv=userpwd.value;
            if(userpwdv.match(/[a-zA-Z]/)&&userpwdv.match(/[0-9]/)  //여기서 str.match()함수를 사용하는 이유
                &&userpwdv.length>=10 && userpwdv.length<=20          // 만일 매개로 받은 값이 조건의 값을 하나라도 없다면 null을 반환
                &&userpwdv.match(/[!@#$%^&*()?_~]/)){                    // 이는 null이 false이기 때문에 결국 조건문 성립이 안됨
                let messages = [];
                messages.push('');
                userpwdck.innerHTML = messages.join(' ');

                // (/[a-z]/ig).test(userpwdv)이런식으로 사용해도 된다 test()함수는 어차피 true false를 반환하므로         

            }else{
                let messages = [];
                messages.push('10자 이상 입력<br>');
                messages.push('영문/숫자/특수문자(공백제외)만 허용하며, 2개 이상 조합<br>');
                userpwdck.innerHTML = messages.join(' ');
            }

        })

        
        userpwd2.addEventListener('change',function(){
            var userpwdv2 = userpwd2.value
            var userpwdv= userpwd.value
            if(userpwdv != userpwdv2){
                let messages = [];
                messages.push('비밀번호가 다릅니다');
                userpwdck2.innerText = messages.join(' ');
            }else{
                let messages = [];
                messages.push('');
                userpwdck2.innerText = messages.join(' ');
            }
        })
        userpwd2.addEventListener('keyup',function(){
            var userpwdv2 = userpwd2.value
            var userpwdv= userpwd.value
            if(userpwdv != userpwdv2){
                let messages = [];
                messages.push('비밀번호가 다릅니다');
                userpwdck2.innerText = messages.join(' ');
            }else{
                let messages = [];
                messages.push('');
                userpwdck2.innerText = messages.join(' ');
            }
        })
        
        username.addEventListener('keyup',function(){
            var usernamev = username.value;
            if(usernamev.length>=7){
                let messages = [];
                messages.push('정말이세요?');
                usernameck.innerHTML=messages.join('');
            }else{
                usernameck.innerHTML='';
            }
        })

        userphone.addEventListener('keyup',function(){
            this.value=this.value.replace(/[^0-9]/,'')

        })

        userbirth.addEventListener('keyup',function(){
            this.value=this.value.replace(/[^0-9]/,'');
            var userbirthv=userbirth.value;
            var  today = new Date();
            var yearnow = today.getFullYear();
            var monthnow = today.getMonth()+1;
            var datenow = today.getDate();
            if(userbirthv.substr(0,4)>=yearnow 
                  && userbirthv.substr(4,2)>=monthnow 
                  && userbirthv.substr(6,2)>datenow){
                /* substring 대신 substr사용해야함 substring(6,2)이 사용시 작은수가 시작위치로 가기 때문 */
                let messages = [];
                messages.push('미래에서 오셨군요^^');
                userbirthck.innerHTML = messages.join('');

            }else if((yearnow - userbirthv.substr(0,4))>=100
                  && userbirthv.length>=8){

                let messages = [];
                messages.push('정말이세요?');
                userbirthck.innerHTML = messages.join('');

            }else if((yearnow-userbirthv.substr(0,4))<=14
                  &&userbirthv.substr(4,2)>=monthnow
                  &&userbirthv.substr(6,2)>datenow){

                let messages = [];
                messages.push('만 14세 미만은 가입이 불가능합니다');
                userbirthck.innerHTML = messages.join('');

            }else if(userbirthv.length<8){

                let messages = [];
                messages.push('예 : 19940101');
                userbirthck.innerHTML = messages.join('');

            }else{

                userbirthck.innerHTML='';
            }

            })

        useremail.addEventListener('keyup', function(){
            var useremailv=useremail.value;
            var emailregex = /^[a-z0-9_\-.]{1,20}@[a-z0-9.-_]{1,}\.[a-z]{2,6}$/ig;
            if(emailregex.test(useremailv)){
                useremailck.innerHTML='';
            }else{

                let messages = [];
                messages.push('이메일 형식이 맞지 않습니다');
                useremailck.innerHTML = messages.join('');
            
            }

        })
        
//         여기서부터는 레이어 팝업
        
       function popUp(){
            document.getElementById('open').style.visibility="visible";
            document.getElementById('background11').style.visibility="visible";
        }
        function closeabc(){
            document.getElementById('open').style.visibility='hidden';
            document.getElementById('background11').style.visibility="hidden";
        }
        
        function popUp2(){
            document.getElementById('open2').style.visibility="visible";
            document.getElementById('background11').style.visibility="visible";
        }
        function closeabc2(){
            document.getElementById('open2').style.visibility='hidden';
            document.getElementById('background11').style.visibility="hidden";
        }
        function popUp3(){
            document.getElementById('open3').style.visibility="visible";
            document.getElementById('background11').style.visibility="visible";
        }
        function closeabc3(){
            document.getElementById('open3').style.visibility='hidden';
            document.getElementById('background11').style.visibility="hidden";
        }
        
//         여기서부터 회원가입 버튼
          function enter(event){
         console.log("test");
         if(event.keyCode===13){
         return false}
         }   
         
//       아이디 중복확인용 전역변수   
         var pf=0;
         var pf2=0;
         
         //이메일 확인용 전역변수
         var emailregex = /^[a-z0-9_\-.]{1,20}@[a-z0-9.-_]{1,}\.[a-z]{2,6}$/ig;
         
        // 여기서부터 다시 회원가입 창에서 입력 제대로 안하면 false 뜨게 만드는 거
        
        function writecheck(){
            console.log("test");
        var useridv=userid.value;
        var userpwdv = userpwd.value;
        var userpwdv2 = userpwd2.value;
        var usernamev = username.value;
        var useremailv =useremail.value;
        var userphonev = userphone.value;
        var userbirthv=userbirth.value;
        var useraddressv=useraddress.value;
        var useraddress2v=useraddress2.value;

        var emailregex = /^[a-z0-9_\-.]{1,20}@[a-z0-9.-_]{1,}\.[a-z]{2,6}$/ig;
        var  today = new Date();
        var yearnow = today.getFullYear();
        var monthnow = today.getMonth()+1;
        var datenow = today.getDate();
        
        

            if(!(useridv.length!=0&&(/[a-z0-9]/ig).test(useridv)&&(/[a-z]/ig).test(useridv)
            &&useridv.length>=6)){

                console.log("아이디");
                window.alert("아이디가 올바르지 않습니다");
                return false;

            }else if(pf!=1){
               
               console.log("중복확인")
               window.alert("아이디 중복확인을 해주십시오")
               return false;
               
           }else if(!(userpwdv.match(/[a-zA-Z]/)&&userpwdv.match(/[0-9]/)  //여기서 str.match()함수를 사용하는 이유
                &&userpwdv.length>=10 && userpwdv.length<=20          // 만일 매개로 받은 값이 조건의 값을 하나라도 없다면 null을 반환
                &&userpwdv.match(/[!@#$%^&*()?_~]/))){
                
                console.log("비번");
                window.alert("비밀번호가 올바르지 않습니다");
                return false;

            }else if(userpwdv != userpwdv2){
                console.log("비번확인");
                window.alert("비밀번호 확인이 올바르지 않습니다");
                return false;

            }else if(usernamev.length==0 | usernamev.length>=7){
                console.log("이름");
                window.alert("이름이 올바르지 않습니다");
                return false;
            }else if(!(emailregex.test(useremailv))){
            
                console.log("이메일");
                window.alert("이메일이 올바르지 않습니다");
                return false;

            }else if(pf2!=1){
               
               window.alert("이메일 중복확인을 해주십시오");
               return false;
               
            }else if(userphonev.length<=10){

                console.log("이름");
                window.alert("번호가 올바르지 않습니다");
                return false;

            }else if(useraddressv.length==0){

                console.log("1번째 주소칸");
                window.alert("주소가 올바르지 않습니다");
                return false;

            }else if(useraddress2v==0){

                console.log("2번째 주소칸");
                window.alert("주소가 올바르지 않습니다");
                return false;

            }else if(userbirthv.substr(0,4)>=yearnow 
                  && userbirthv.substr(4,2)>=monthnow 
                  && userbirthv.substr(6,2)>datenow){

                        console.log("미래에서 오셨군요^^");
                window.alert("생년월일이 올바르지 않습니다");
                return false;


            }else if((yearnow - userbirthv.substr(0,4))>=100
                  && userbirthv.length>=8){

                        console.log("정말이에요?");
                window.alert("생년월일이 올바르지 않습니다");
                return false;


            }else if((yearnow-userbirthv.substr(0,4))<=14
                  &&userbirthv.substr(4,2)>=monthnow
                  &&userbirthv.substr(6,2)>datenow){

                        console.log("만14세");
                window.alert("만 14세 미만은 가입이 불가능합니다");
                return false;


            }else if(userbirthv.length==0){

                console.log("만14세");
                window.alert("생년월일이 올바르지 않습니다");
                return false;

            }


            }
        
//      여기서부터 아이디 중복체크
//      크로스 브라우징
      var httpRequest;
      
      function getHttpRequest(){
         
         if(window.ActiveXObject){
            
            try {
               return new ActiveXObject("Msxml2.XMLHTTP");
            } catch(e1) {
               return new ActiveXObject("Microsoft.XMLHTTP");
            }
         } else if(window.XMLHttpRequest) {
            return new XMLHttpRequest();
         } else {
            return null;
         }
          }


         
         // 아이디 중복체크
            function idOverlapCheck(){
            var userid = document.getElementById('id').value;
            if(!(userid.length!=0&&(/[a-z0-9]/ig).test(userid)&&(/[a-z]/ig).test(userid)
                    &&userid.length>=6)){alert("아이디가 올바르지 않습니다")}else{

            httpRequest = getHttpRequest();
         
         httpRequest.open("get", "/Hankki/idOverlapCheck.me?userid="+userid, true);
         
         httpRequest.onreadystatechange = function(){

                if(httpRequest.readyState == 4 && httpRequest.status == 200){

                    console.log("ajax 통신성공");
                    var result = httpRequest.responseText;
                    if(result==1){

                        alert('아이디가 중복됩니다');
                        
                        
                    }else{
                       
                       alert('이 아이디는 사용이 가능합니다');
                       pf=1;
                       
                    
                    }
                };
            };
                    
            console.log("스크립트문 실행은 됨");
            
            
            console.log(userid);
            
         httpRequest.send();

         
            };
         };
            // 이메일 중복체크
           
            
            function emailOverlapCheck(){
               //이메일 형식체크 후
               var useremail = document.getElementById('email').value
               
               if(!(emailregex.test(useremail))){alert("이메일이 올바르지 않습니다");}else{
               
               // 여기서부터 이메일 전송
               httpRequest = getHttpRequest();
               
               console.log(useremail); //값을 받았는지 확인
               
               httpRequest.open("get", "/Hankki/emailOverlapCheck.me?useremail="+useremail, true);
               
               httpRequest.onreadystatechange = function(){
                  
                  if(httpRequest.readyState==4 && httpRequest.status == 200){
                     
                     console.log("ajax 통신 성공")
                     
                     var result = httpRequest.responseText;
                     
                     if(result==1){
                        
                        alert("이메일이 중복됩니다")
                        
                     }else{
                        
                        alert("이 이메일은 사용이 가능합니다")
                        
                        pf2=1;
                        
                     }
                     
                     
                  }
                  
               }
               
               httpRequest.send();
               
            };
            };
    
        
    </script>

</body>
</html>