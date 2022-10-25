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
		margin-top: 60px;
	    margin-bottom: 5px;	    
	    margin-right: 3%;
	    width: 100%;
	    height: 40%;
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

			<img id="previewImg" class="image-360 profile-size" alt="profile" src="./static/img/newlogo2.png" onclick="location.href='/home'">     
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
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<p style="color:gray; text-align:center;">copyright 지구마켓. All Rights Reserved.</p>
	  </section>
    </body>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<%@ include file="../module/footer.jsp" %>
</html>