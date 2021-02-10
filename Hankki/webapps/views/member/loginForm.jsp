<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
   <title>로그인</title>
   <meta charset="UTF-8">

<style>

.div1 {
display: flex;
align-items: center;
justify-content : center;
}

label {
flex : 0.3;
}

input {
width: 300px;
height : 35px;
}

.find {
text-align: right;
margin-right: 100px;
}

.find>a {
text-decoration: none;
color : black;
}

.div2 {
display: flex;
justify-content : center;
align-items: center;
}

.login {
width:400px;
height : 40px;
background-color: rgb(46, 143, 88);
color : white;
border: none;
border-radius: 3.5px;
font-size: 15pt;
cursor: pointer;
}

.join {
width:400px;
height : 40px;
background-color: rgb(248, 240, 211);
border: none;
border-radius: 3.5px;
font-size: 15pt;
cursor: pointer;
}

button:hover {
background: darkgreen;
color : white;
}

</style>
</head>
<body>
    <header style="height: 230px;">
      <%@ include file="../common/header.jsp" %>
    </header>  
      
      <div class="container">
       <div class="row">
       <div class="col-md-12">
        <div class="col-md-3"></div>
         <div class="col-md-6" style= "margin-top: 20px;">
        
           <div style="text-align: center;">
             <h2>로그인 </h2><br>
           </div>
           <form action="<%= request.getContextPath() %>/login.me" method="post">
             <div class="div1">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요"/> 
             </div>
             <br>   
             <div class="div1"> 
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요"/>
             </div>
             <br><br>
             <div class="find">
                <a href="#"> 아이디 찾기 </a> &nbsp; | 
                <a href="#"> 비밀번호 찾기 </a>
             </div>
             <br><br>
             <div class=div2>
                <button type="submit" class="login">로그인</button>
             </div>
             <br>
             <div class="div2">
                <button type="button" onclick="location.href='<%=request.getContextPath()%>/views/member/signUp.jsp'"
                class="join">회원가입</button>
             </div>
           </form>
             <br><br><br>
           </div>
          </div>
         <div class="col-md-3"></div>
       </div>
      </div>

      <br><br><br><br>
     <%@ include file="../common/footer.jsp" %>
</body>
</html>