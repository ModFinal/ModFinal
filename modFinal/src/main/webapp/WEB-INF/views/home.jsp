<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>홈</title>
	<%@ include file="./module/head.jsp" %>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
	<style type="text/css">
	   .category-position{
		margin-top: -8rem;	
	 }
	 
	  .font-color{
	  color:#00B050;
	  font-weight: bolder;
	 }
	
	.slides input{
	 display:none;
	}
	
	
	
	.slide img{
	  width: 1800px;
	  height: 800px;
	   justify-content:center;
	}
	
	.navigation-manual{
	  position :absolute;
	  width : 800px;
	  margin-top: 650px;
	  display: flex;
	  justify-content: center;
	}
	
	.manual-btn{
	  border: 4px solid #00B050;
	  padding :5px;
	  border-radius: 20px;
	  cursor: pointer;
	  transition: 1s;
	}
	
	.manual-btn:not(:last-child){
	  margin-right:40px;
	}
	
	.manual-btn:hover{
	 background: #00B050;
	}
	
	
	
	.navigation-auto{
	  position :absolute;
	  display : flex;
	  width : 800px;
	  justify-content: center;
	  margin-top: 460px;
	}
	
	
	
	</style>
</head>

<body>
	<header><%@ include file="./module/navigation.jsp" %></header>
	<br><br><br><br><br><br>
	<section class="container">
	<div class="mb-1 category-position" style="color:green; cursor:pointer;">
		<c:url var="mainDigital" value="/main/list?type=1" />
		<c:url var="mainClothes" value="/main/list?type=2" />
		<c:url var="mainBag" value="/main/list?type=3" />
		<c:url var="mainAccessories" value="/main/list?type=4" />
		<c:url var="mainBaby" value="/main/list?type=5" />
		<c:url var="mainPet" value="/main/list?type=6" />
		<c:url var="mainFurniture" value="/main/list?type=7" />
		<c:url var="mainBeauty" value="/main/list?type=8" />
		<c:url var="mainOffice" value="/main/list?type=9" />
		<c:url var="mainArt" value="/main/list?type=10" />
		
		
		<table class="table">
		
			<tr class="text-center">
				<td class="" onclick="location.href='${mainDigital}'"><span class="material-symbols-outlined" style="color:green;">photo_camera</span>
					<br><label class="font-large">가전/디지털</label></td>
				<td class="" onclick="location.href='${mainClothes}'"><span class="material-symbols-outlined" style="color:green;" >laundry</span>
					<br><label>의류</label></td>
				<td class="" onclick="location.href='${mainBag}'"><span class="material-symbols-outlined" style="color:green;" >shopping_bag</span>
					<br><label>가방</label></td>
				<td class="" onclick="location.href='${mainAccessories}'"><span class="material-symbols-outlined" style="color:green;" >headphones</span>
					<br><label>액세서리</label></td>
				<td class="" onclick="location.href='${mainBaby}'"><span class="material-symbols-outlined" style="color:green;">pregnant_woman</span>
					<br><label>유아/출산</label></td>
			</tr>
	
			<tr class="text-center">
				<td class="" onclick="location.href='${mainPet}'"><span class="material-symbols-outlined" style="color:green;" >pets</span>
					<br><label>반려동물상품</label></td>
				<td class="" onclick="location.href='${mainFurniture}'"><span class="material-symbols-outlined" style="color:green;" >bed</span>
					<br><label>가구</label></td>
				<td class="" onclick="location.href='${mainBeauty}'"><span class="material-symbols-outlined" style="color:green;" >face_retouching_natural</span>
					<br><label>뷰티/미용</label></td>
				<td class="" onclick="location.href='${mainOffice}'"><span class="material-symbols-outlined" style="color:green;" >print</span>
					<br><label>사무용품</label></td>
				<td class="" onclick="location.href='${mainArt}'"><span class="material-symbols-outlined" style="color:green;">image</span>
					<br><label>예술/악기</label></td>
			</tr>
	
		</table>

		 <div class="slide_box">

     <br><br><br><br><br><br>
     <div class="slides">
      <input type="radio" name="radio-btn" id="radio1">
       </div>
  
      
      <div class="slide first">
        <img src="./static/img/image2.png" alt="">
      </div>
      </div>
  
        
	<br><br><br><br><br><br>
     </div>
     <div style="margin-left:3rem;">
		<h2><b style="color:green;"> 실시간 상품</b></h2>
	</div>
		<hr>
		<table class="table">
		<c:if test="${not empty datas}">
			<tr class="text-center">
				<c:forEach items="${datas}" var="data" begin="0" end="6">
				<td onclick="location.href='/home/board/detail?id=${data.bId}'">
					<img src="<%=request.getContextPath()%>${data.url}" alt="Nothing" width="200px" height="200px"><br>
					${data.bTitle}<br>
					<fmt:formatNumber value="${data.price}" pattern="#,###원"/><br>
					${data.dealMethod}
				</td>
				</c:forEach>
			</tr>
			</c:if>
		<c:if test="${datas == null}">
			
		<tr class="text-center">
			<td>
				<div style="background-color:skyblue; width:200px; height:200px"></div>
				상품을 찾을수 없음<br>
				0원<br>
				택배배송
			</td>
			<td>
				<div style="background-color:skyblue; width:200px; height:200px"></div>
				상품을 찾을수 없음<br>
				0원<br>
				택배배송
			</td>
			<td>
				<div style="background-color:skyblue; width:200px; height:200px"></div>
				상품을 찾을수 없음<br>
				0원<br>
				택배배송
			</td>
			<td>
				<div style="background-color:skyblue; width:200px; height:200px"></div>
				상품을 찾을수 없음<br>
				0원<br>
				택배배송
			</td>
			<td>
				<div style="background-color:skyblue; width:200px; height:200px"></div>
				상품을 찾을수 없음<br>
				0원<br>
				택배배송
			</td>
		</tr>
		</c:if>
		</table>

	 <br><br><br><br><br><br>
	 <br><br><br><br><br><br>
	</section>
	<%@ include file="./module/footer.jsp" %>
</body>
</html>