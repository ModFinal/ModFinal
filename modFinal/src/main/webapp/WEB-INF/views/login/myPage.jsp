<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.*" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<%@ include file="../module/head.jsp" %>
	
<style type="text/css">
 .shopmenu{
   height:280px;
 }
 
 .icon-size{
 font-size:80px;
 margin-bottom:3px;
 }
 
 .icon-font{
   font-weight:bold;
   font-size:25px;
 }
 
 .pointer {
 cursor: pointer;
 }
 
 .image-size{
	margin-top: 8%;
    margin-bottom: 10%;
    margin-left: 3%;
    margin-right: 3%;
    width: 85%;
    height: 85%;
 }
  
  .container-second{
   display: flex; 
   gap: 17px 5%;
   flex-wrap: wrap; 
  }
.border-width{
  width:900px;
  margin-left : auto;
  margin-right : auto;
 }
 
 .whole-size{
  margin: auto;
  min-width: 995px;
 }

 
</style>	
</head>
<body>
<header>
	<%@ include file="../module/navigation.jsp" %>
</header>
	<%@ include file="../module/categoryNavigation.jsp" %>


<!-- 목업 -->
<c:if test="${loginData == null}">
	 <section class="container whole-size">
	  <div class="mt-5">
	     <div class="mb-5 border-bottom border-2 border-secondary border-width">
	        <div class="mb-3">
	          <h3> 마이페이지 <i class="bi bi-pencil-square"></i></h3>   
	        </div>
	    </div>
	  </div> 
	
	<c:url var="myinfoMain" value="/myinfo/main"/>
	  <form action="${myinfoMain}" method="post" enctype="multipart/form-data">
	<div id="align-items ">
	  <div class="row align-items-start">
	    <div class="mb-4 mt-4 row justify-content-center">
	       <div class="d-flex" style="background-color:rgba(233,236,239); width:700px; height:25%;">
	<!--이미지 경로체크 -->
	         <div class="col-4">
	            <img id="previewImg" class="image-360 image-size" alt="profile" src="./static/img/modify/profile.png">         
	         </div>
	<!--닉네임value 체크 -->         
	         <div class="col-8">
	            <div class="mt-4 mb-3 border-bottom border-2 border-secondary ">
	              <p><b style="font-size:23px;">닉네임value</b> 님 환영합니다</p>
	             </div>
	<!--닉네임value 체크 -->             
	             <div>
	              <p style="font-size:17px;"><b style="font-size:20px;">닉네임</b> 님의 총 구매횟수 : 값</p>
	              <p style="font-size:17px;">지구마켓과 함께한 날 : 값 </p>
	            </div>
	<!--개인정보수정버튼 경로설정 -->            
	            <div class="text-end mt-4">
	              <button class="btn btn-primary" type="button" onclick="location.href='https://naver.com'">개인정보 수정</button>
	            </div>
	         </div>
	       </div>
	    </div>
	 </div>
	
	 
	  <div class="mt-5">
	     <div class="mb-5 border-bottom border-2 border-secondary border-width">
	        <div class="mb-3">
	        </div>
	    </div>
	  </div> 
	 
	 
	 <!--onclick 링크주소 설정--> 
	 
	 <div class="row align-items-start">
	  <div class="container-second justify-content-center">
	   <div class="col-sm-2  text-center shopmenu pointer " onclick="location.href='https://www.naver.com'">
	     <div>
	       <i class="bi bi-house-door icon-size"></i>
	     </div>
	      <div>
	        <p class="icon-font">내 상점</p>
	      </div>
	   </div>
	  
	   <div class="col-sm-2 text-center shopmenu pointer" onclick="location.href='https://www.naver.com'">
	     <div>
	       <i class="bi bi-chat-dots icon-size"></i>
	     </div>
	      <div>
	        <p class="icon-font">채 팅</p>
	      </div>
	   </div>
	  
	   <div class="col-sm-2 text-center shopmenu pointer" onclick="location.href='https://www.naver.com'">
	     <div>
	       <i class="bi bi-cart-check icon-size"></i>
	     </div>
	      <div>
	        <p class="icon-font">구매목록</p>
	      </div>
	   </div>
	  
	   <div class="col-sm-2 text-center shopmenu pointer" onclick="location.href='https://www.naver.com'">
	     <div>
	       <i class="bi bi-bag-heart icon-size"></i>
	     </div>
	      <div>
	        <p class="icon-font">찜</p>
	      </div>
	   </div>
	  </div>
	 </div> 
	</div>
	</form>
	</section>
</c:if>



<!-- 로그인데이터가 있을 경우 -->
<c:if test="${not empty loginData}">
	 <section class="container whole-size">
	  <div class="mt-5">
	     <div class="mb-5 border-bottom border-2 border-secondary border-width">
	        <div class="mb-3">
	          <h3> 마이페이지 <i class="bi bi-pencil-square"></i></h3>   
	        </div>
	    </div>
	  </div> 
	
	<c:url var="myinfoMain" value="/myinfo/main"/>
	  <form action="${myinfoMain}" method="post" enctype="multipart/form-data">
	<div id="align-items ">
	  <div class="row align-items-start">
	    <div class="mb-4 mt-4 row justify-content-center">
	       <div class="d-flex" style="background-color:rgba(233,236,239); width:700px; height:25%;">
	<!--이미지 경로체크 -->
	         <div class="col-4">
	            <img id="previewImg" class="image-360 image-size" alt="profile" src="<%=request.getContextPath()%>${photo.url}">         
	         </div>
	<!--닉네임value 체크 -->         
	         <div class="col-8">
	            <div class="mt-4 mb-3 border-bottom border-2 border-secondary ">
	              <p><b style="font-size:23px;">${loginData.name}</b> 님 환영합니다</p>
	             </div>
	<!--닉네임value 체크 -->             
	             <div>
	             <c:if test="${empty dData.buyCnt}">
	             <p style="font-size:17px;"><b style="font-size:20px;">${loginData.name}</b> 님의 총 구매횟수 : 0회</p>
	             </c:if>
	             <c:if test="${not empty dData.buyCnt}">
	              <p style="font-size:17px;"><b style="font-size:20px;">${loginData.name}</b> 님의 총 구매횟수 : ${dData.buyCnt}회</p>
	             </c:if>
	              <p style="font-size:17px;">지구마켓과 함께한 날 : <fmt:formatNumber value="${pData.regDate}" pattern="#,###일째"/></p>
	            </div>
	<!--개인정보수정버튼 경로설정 -->            
	            <div class="text-end mt-4">
	              <button class="btn btn-primary" type="button" onclick="location.href='/home/myinfo/modify?id=${loginData.accountid}'">개인정보 수정</button>
	            </div>
	         </div>
	       </div>
	    </div>
	 </div>
	
	 
	  <div class="mt-5">
	     <div class="mb-5 border-bottom border-2 border-secondary border-width">
	        <div class="mb-3">
	        </div>
	    </div>
	  </div> 
	 
	 
	 <!--onclick 링크주소 설정--> 
	 
	 <div class="row align-items-start">
	  <div class="container-second justify-content-center">
	   <div class="col-sm-2  text-center shopmenu pointer " onclick="location.href='./myStore?id=${loginData.accountid}'">
	     <div>
	       <i class="bi bi-house-door icon-size"></i>
	     </div>
	      <div>
	        <p class="icon-font">내 상점</p>
	      </div>
	   </div>
	  
	   <div class="col-sm-2 text-center shopmenu pointer" onclick="location.href='https://www.naver.com'">
	     <div>
	       <i class="bi bi-chat-dots icon-size"></i>
	     </div>
	      <div>
	        <p class="icon-font">채 팅</p>
	      </div>
	   </div>
	  
	   <div class="col-sm-2 text-center shopmenu pointer" onclick="location.href='./shoppinglist?id=${loginData.accountid}'">
	     <div>
	       <i class="bi bi-cart-check icon-size"></i>
	     </div>
	      <div>
	        <p class="icon-font">구매목록</p>
	      </div>
	   </div>
	  
	   <div class="col-sm-2 text-center shopmenu pointer" onclick="location.href='./favoritelist?id=${loginData.accountid}'">
	     <div>
	       <i class="bi bi-bag-heart icon-size"></i>
	     </div>
	      <div>
	        <p class="icon-font">찜</p>
	      </div>
	   </div>
	  </div>
	 </div> 
	</div>
	</form>
	</section>
</c:if>

<!--하단-->
<%@ include file="../module/footer.jsp" %>
<script type="text/javascript">

function showImagePreview(e){
	 var file = e.target.files[0];
	 var imgUrl = URL.createObjectURL(file);
	 previewImg.src = imgUrl;	 
}
</script>
</body>
</html>