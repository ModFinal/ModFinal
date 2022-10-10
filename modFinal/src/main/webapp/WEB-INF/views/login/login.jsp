<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
	<title>로그인</title>
	<%@ include file="../module/head.jsp" %>  
	
	<style type="text/css">
	   .profile-size{
		margin-top: 8%;
	    margin-bottom: 3%;	    
	    margin-right: 3%;
	    width: 110%;
	    height: 80%;
	 }
	 
	 .kakao-button{
		 border: none;
	     padding: 0;
	     margin-right: 0.5rem;
	     width: 200px;
	 }
	 

	</style>
</head>
<body>

	<header class="mb-3"></header>
	<c:url var="mainUrl" value="." />
	<section class="container" style="width: 480px;">
		<c:url var="loginUrl" value="/login" />
		<form action="${loginUrl}" method="post" name ="loginForm">
		<div class="center-block">

			<img id="previewImg" class="image-360 profile-size" alt="profile" src="./static/img/logo.png" onclick="location.href='/home'">     
		</div>
			<br><br>
			<input type="hidden" name="url" value="${param.url}">
 			<div class="form-floating mb-2">
				<input class="form-control" type="text" id="id_accountid" name="accountid" value="" placeholder="아이디를 입력하세요">
				<label for="id_accountid">아이디</label>
			</div>
			<br>
			<div class="form-floating mb-2">
				<input class="form-control" type="password" id="id_password" name="password" value="" placeholder="비밀번호를 입력하세요">
				<label for="id_password">비밀번호</label>
			</div>
			<br>
			<div class="mb-2 text-end">
				<button class="btn btn-outline-success bluebtn" type="submit">로그인</button>
			</div>
		</form>
			
			<div class="mb-2 text-end">
				<button class="btn btn-outline-success bluebtn" onclick="location.href='./login/findIdPw'">아이디 비밀번호 찾기</button>
			</div>
			<div class="mb-2 text-end">
				<button class="btn btn-outline-success bluebtn" onclick="location.href='./register'">회원가입</button>
			</div>
	        <div align= 'center' style="display: inline-flex;">
	         <!-- 카카오 로그인 -->
		        <button class="kakao-button" onclick="kakaoLogin();">
		        <a href="javascript:void(0)">
		            <span><img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="210"" alt="카카오계정 로그인" style="height: 50px;"/></span>
		        </a>
		  	   </button>
		  	   
		       <!-- 
		       <button onclick="kakaoLogout();">
		        <a href="javascript:void(0)">
		            <span>카카오 로그아웃</span>
		        </a>
		  	   </button>
		        -->
		  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		  <script type="text/javascript">
		  Kakao.init('d0ef6b76e117277cb82e82d03cff8759'); 
		  console.log(Kakao.isInitialized()); 
		  //카카오로그인
		  function kakaoLogin() {
		      Kakao.Auth.login({
		    	  scope: 'profile_nickname, account_email, gender',
		        success: function (response) {
		          Kakao.API.request({
		            url: '/v2/user/me',
		            success: function (response) {
		          	  console.log(response)
		          	  alert("로그인 성공 !");
		            },
		            fail: function (error) {
		              console.log(error)
		            },
		          })
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		    }
		  //카카오로그아웃 
		  function kakaoLogout() {
		      if (Kakao.Auth.getAccessToken()) {
		        Kakao.API.request({
		          url: '/v1/user/unlink',
		          success: function (response) {
		          	console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		        Kakao.Auth.setAccessToken(undefined)
		      }
		    }  
            </script>
			<!-- 네이버 로그인 -->
			<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>		  
		    <div id ="naverIdLogin" style="margin-left: 1rem"></div>
		    </div>
		   <script type="text/javascript">
		      var naverLogin  = new naver.LoginWithNaverId(
				   {
					   clientId : "q379z6OiAG3HfRfviHRi",
					   callbackUrl : "http://localhost/home/",
					   isPopup: false,
					   loginButton : {color: "green" ,type:3 , height:50}
				   }
		         );
		   
		     naverLogin.init();
           </script>
        
	  </section>
    </body>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<%@ include file="../module/footer.jsp" %>
</html>