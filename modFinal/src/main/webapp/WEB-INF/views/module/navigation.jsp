<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../module/head.jsp" %>

<head profile="http://www.w3.org/2005/10/profile">
   <meta charset="UTF-8">
	<style type="text/css">
	   .profile-size{
		margin-top: 40px;
		margin-bottom:-30px;
		margin-right: 3280px;
		width: 230px;
		
	   }
	
	  .top-menu{
       margin-top: -22px;
       margin-botton:820px; 
       text-align: right;
	   text: bold;
	  }
	 
	 .button-color {
	 
	  background-color: #00B050 !important;
	  border-color : #00B050 !important;
	  margin-left : 0.5rem !important;
	 
	 }
	  .font-color{
	  color:#00B050;
	  font-weight: bolder;
	  }
	  
	
	
	 .hr-style{
	  margin-bottom: 2px;
      color: #00B050;
      height: 1px;
      opacity: .5;
     } 
     
  
    .search{
     margin-top: -20px;
     margin-botton:600px;
     margin-right: 250px;
     }
     
     .item-sell{
     margin-top: -40px;
     margin-left: 340px;
     }
	 }
	</style>
</head>  
    
<script type="text/javascript">
 $(function(){
  $('#searchBtn').click(function() {
     window.location = "/home/board/boardList_search"
     + "?keyword="
     + encodeURIComponent($('#keywordInput').val());
     + '${pageMaker.makeQuery(1)}'
    });
 });   
 </script>
<br><br>

<div class="container  text-center">
   	<div class="align-items-start top-menu">		
   	       	
			<c:if test="${not empty sessionScope.loginData}">
                     <b style="color:gray;">${sessionScope.loginData.accountid}</b> 님 환영합니다! &nbsp;&nbsp;&nbsp; 
	                <a style="color:#00B050;" href="/home/notice">공지사항</a>		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a style="color:#00B050;" href="/home/myinfo/main">마이페이지</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a style="color:#00B050;" href="/home/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a style="color:#00B050;" href="/home/board/upload"> 판매하기</a> 
			</c:if>
			 	
			<c:if test="${empty sessionScope.loginData}">
				    <a style="color:#00B050;" href="/home/notice">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a style="color:#00B050;" href="/home/login">로그인</a>
			</c:if>
     </div>

	<div class="align-items-start">
	
			<img id="previewImg" class="image-360 profile-size" alt="profile" src="./static/img/newlogo2.png" onerror="this.src='../static/img/newlogo2.png'"  onclick="location.href='/home'">
	
	</div>	
     <div class="search">
			<input class="text_wide" style="height:39px" type="text" id="keywordInput" name="keyword" value="${scri.keyword}">			   
			<button class="btn btn-secondary button-color" id="searchBtn">검 색</button>
	  </div>
</div>

<br>
<hr class="hr-style">