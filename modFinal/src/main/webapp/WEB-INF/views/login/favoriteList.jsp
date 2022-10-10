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
	<title>찜목록</title>
	<%@ include file="../module/head.jsp" %>
	
    <style type="text/css">
        .pointer {
	  cursor: pointer;
	  }
	  
	 .profile-size{
		margin-top: 8%;
	    margin-bottom: 8%;
	    margin-left: 3%;
	    margin-right: 3%;
	    width: 85%;
	    height: 85%;
	 }
	 
     .product-size{
		margin-top: 7px;
	    margin-bottom: 3px;
	    margin-left: 5px;
	    margin-right: 5px;
	    width: 90%;
	    height: 140%;
	 }
	 
	 .p-edit{
	  margin-bottom:0.6rem;
	  margin-top: 1rem;
	  font-size:18px;
	  border-bottom: 1.3px solid;
	 }
	 
	 .p-price{
	    font-weight: bold;
	    font-size: 120%;
	    margin-top: 7%;
	    margin-left: 5%;
	 }
	 
	 .container-second{
	 display: flex; 
	 gap: 17px 5%;
	 flex-wrap: wrap; 
	 }
	 
	 .list-container{
	     width: 39%;
	     height: 10rem;
	     margin-bottom: 15px; 
	 }
	 
	 .text-price{
	    margin-top: 0.5%;
	    margin-bottom: 3%;
	    margin-right: 4%;
	    margin-left: 5%;
	 }
	 
	 .border-width{
	  width:850px;
	  margin-left : auto;
	  margin-right : auto;
	 }
	 .btn-product{
	   width: 340px;
	   height: 34px;
	   margin-top:4px;
	   margin-bottom:1px;
	   position: relative;
       right: 110px;
	 }
	 
	 .table-product{
	  width:390px;
	  height:140px;
	  background-color: rgba(233,236,239);
	 }
	 .btn-size{
	 width: 100.4%;
	 height: 35px;
	 }
	 
	 .whole-size{
	  margin: auto;
      min-width: 846px;
	 }
	 
	 
</style>	
</head>
<body>
<header>
	<%@ include file="../module/navigation.jsp" %>
</header>
	<%@ include file="../module/categoryNavigation.jsp" %>


<c:if test="${pData == null}">
	 <section class="container whole-size">
	<div id="align-items">
	  <div class="row align-items-start">
	    <div class="mb-4 mt-4 row justify-content-center">
	       <div class="d-flex" style="background-color:rgba(233,236,239); width:700px; height:250px;">
	<!--이미지 경로체크 -->
	         <div class="col-4">
	            <img id="previewImg" class="image-360 profile-size" alt="profile" src="./static/img/modify/profile.png">         
	         </div>
	         
	         <div class="col-8">
	            <div class="mt-4 mb-3 border-bottom border-2 border-secondary">
	              <p><b style="font-size:23px;">닉네임value</b> 님 환영합니다</p>
	             </div>
	             <div>
	              <p style="font-size:17px;"><b style="font-size:20px;">닉네임</b> 님의 총 구매횟수 : 값</p>
	              <p style="font-size:17px;">지구마켓과 함께한 날 : 값 </p>
	            </div>
	<!--개인정보수정버튼 링크설정 -->            
	            <div class="text-end mt-4">
	              <button class="btn btn-primary" type="button" onclick="location.href='https://naver.com'">개인정보 수정</button>
	            </div>
	         </div>
	       </div>
	    </div>
	 </div>
	 
	 
	   <div class="mt-3">
	     <div class="mb-4 border-bottom border-2 border-secondary border-width">
	        <div class="mb-3">
	          <h3> 찜목록 <i class="bi bi-bag-heart icon-size"></i></h3>   
	        </div>
	    </div>
	  </div>
	  
	
	   <div class="row align-items-start">
	    <div class="container-second justify-content-center">    
	    
	 <!-- 반복문 값이 있을때마다  상품목록div 하나씩 추가-->
	 <!-- 클릭시 상품페이지로 이동경로 체크 --> 
	    <table class="table-product mt-2 pointer" onclick="location.href='https://www.naver.com'">
	        <colgroup>
				<col class="col-4">
				<col class="col-8">
			 </colgroup>
	        <tr>
	            <td rowspan="2" style="height:90px;">
	               <img id="previewImg" class="image-360 product-size" alt="profile" src="./static/img/modify/watch.png">  
	            </td>
	            <td colspan="2" class="p-edit">상품명value</td>
	        </tr>
	        <tr>
	            <td colspan="2" class="p-price"> 100.000.000 원</td>   
	        </tr>
	    </table>
	    
	     <table class="table-product mt-2 pointer" onclick="location.href='https://www.naver.com'">
	        <colgroup>
				<col class="col-4">
				<col class="col-8">
			 </colgroup>
	        <tr>
	            <td rowspan="2" style="height:90px;">
	               <img id="previewImg" class="image-360 product-size" alt="profile" src="./static/img/modify/watch.png">  
	            </td>
	            <td colspan="2" class="p-edit">상품명value</td>
	        </tr>
	        <tr>
	            <td colspan="2" class="p-price"> 100.000.000 원</td>   
	        </tr>
	    </table>
	    
	    
	    
	  
	
	 
	 
	<!-- 테이블 정렬을위한 태그 -->                
	       <table class="table-product mt-2 pointer" style="visibility:hidden;">
	        <colgroup>
				<col class="col-4">
				<col class="col-8">
			 </colgroup>
	        <tr>
	            <td rowspan="2" style="height:90px;">
	               <img id="previewImg" class="image-360 product-size" alt="profile" src="./static/img/modify/jewel.png">  
	            </td>
	            <td colspan="2" class="p-edit">상품명value</td>
	        </tr>
	        <tr>
	            <td colspan="2" class="p-price"> 100.000.000 원</td>   
	        </tr>
	    </table>
	    
	    
	        
	
	    </div>
	   </div>
	 </div> 
	</section>
</c:if>




<c:if test="${not empty pData}">
	 <section class="container whole-size">
	<div id="align-items">
	  <div class="row align-items-start">
	    <div class="mb-4 mt-4 row justify-content-center">
	       <div class="d-flex" style="background-color:rgba(233,236,239); width:700px; height:250px;">
	<!--이미지 경로체크 -->
	         <div class="col-4">
	            <img id="previewImg" class="image-360 profile-size" alt="profile" src="<%=request.getContextPath()%>${photo.url}">         
	         </div>
	         
	         <div class="col-8">
	            <div class="mt-4 mb-3 border-bottom border-2 border-secondary">
	              <p><b style="font-size:23px;">${loginData.name}</b> 님 환영합니다</p>
	             </div>
	             <div>
	              <c:if test="${empty dData.buyCnt}">
	             <p style="font-size:17px;"><b style="font-size:20px;">${loginData.name}</b> 님의 총 구매횟수 : 0회</p>
	             </c:if>
	             <c:if test="${not empty dData.buyCnt}">
	              <p style="font-size:17px;"><b style="font-size:20px;">${loginData.name}</b> 님의 총 구매횟수 : ${dData.buyCnt}회</p>
	             </c:if>
	              <p style="font-size:17px;">지구마켓과 함께한 날 :<fmt:formatNumber value="${pData.regDate}" pattern="#,###일째"/></p>
	            </div>
	<!--개인정보수정버튼 링크설정 -->            
	            <div class="text-end mt-4">
	              <button class="btn btn-primary" type="button" onclick="location.href='./usermodify?id=${loginData.accountid}'">개인정보 수정</button>
	            </div>
	         </div>
	       </div>
	    </div>
	 </div>
	 
	 
	   <div class="mt-3">
	     <div class="mb-4 border-bottom border-2 border-secondary border-width">
	        <div class="mb-3">
	          <h3> 찜목록 <i class="bi bi-bag-heart icon-size"></i></h3>   
	        </div>
	    </div>
	  </div>
	  
	
	   <div class="row align-items-start">
	    <div class="container-second justify-content-center">    
	    
	 <!-- 반복문 값이 있을때마다  상품목록div 하나씩 추가-->
	 <!-- 클릭시 상품페이지로 이동경로 체크 --> 
	 
	 <c:forEach items="${datas}" var="data">
	    <table class="table-product mt-2 pointer" onclick="location.href='/home/board/detail?id=${data.bId}'">
	        <colgroup>
				<col class="col-4">
				<col class="col-8">
			 </colgroup>
	        <tr>
	            <td rowspan="2" style="height:90px;">
	               <img id="previewImg" class="image-360 product-size" alt="profile" src="<%=request.getContextPath()%>${data.url}">  
	            </td>
	            <td colspan="2" class="p-edit">${data.bTitle}</td>
	        </tr>
	        <tr>
	            <td colspan="2" class="p-price"> ${data.price} 원</td>   
	        </tr>
	    </table>
	   </c:forEach> 
	    <nav>
			<div>
				<ul class="pagination justify-content-center">
					<c:url var="boardUrl" value="/favoriteList"/>
					
					<c:if test="${favoriteListPage.hasPrevPage()}">
						<li class="page-item">
							<a class="page-link" href="${boardUrl}&page=${favoriteListPage.prevPageNumber}">Prev</a>
						</li>
					</c:if>
					<c:forEach items="${favoriteListPage.getPageNumberList(favoriteListPage.currentPageNumber - 2, favoriteListPage.currentPageNumber + 2)}" var="num">
						<li class="page-item ${favoriteListPage.currentPageNumber eq num ? 'active' : ''}">
							<a class="page-link" href="${boardUrl}&page=${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${favoriteListPage.hasNextPage()}">
						<li class="page-item">
							<a class="page-link" href="${boardUrl}&page=${favoriteListPage.nextPageNumber}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>
	    
	
	    </div>
	   </div>
	 </div> 
	</section>
</c:if>


<!--하단-->
 <%@ include file="../module/footer.jsp" %>

<script type="text/javascript">

</script>
</body>
</html>