<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>비밀번호 찾기 성공</title>
	 <%@ include file="../module/head.jsp" %>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
			     <h3>비밀번호 찾기 검색결과</h3>
	         <div>
			 	<div align ="center">
			    <c:if test="${not empty sessionScope.passData}">
	          회원님의   비밀번호는 ${sessionScope.passData.password} 입니다.
	             </c:if>
		<div class="form-label-group">
				</div>
					<button type="button" onclick= "location.href='/home/login'" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">확인</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</div>
			   </div>
		</div>
</body>
</html>