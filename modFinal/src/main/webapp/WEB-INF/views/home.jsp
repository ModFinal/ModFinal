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
	 
	 
	</style>
</head>
<body>
	<header><%@ include file="./module/navigation.jsp" %></header>
	<br><br><br><br><br><br>
	<section class="container">
	<div class="mb-1 category-position">
		
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
				<td class="" onclick="location.href='${mainDigital}'"><span class="material-symbols-outlined ">photo_camera</span>
					<br><label class="font-large">가전/디지털</label></td>
				<td class="" onclick="location.href='${mainClothes}'"><span class="material-symbols-outlined">laundry</span>
					<br><label>의류</label></td>
				<td class="" onclick="location.href='${mainBag}'"><span class="material-symbols-outlined">shopping_bag</span>
					<br><label>가방</label></td>
				<td class="" onclick="location.href='${mainAccessories}'"><span class="material-symbols-outlined">headphones</span>
					<br><label>액세서리</label></td>
				<td class="" onclick="location.href='${mainBaby}'"><span class="material-symbols-outlined">pregnant_woman</span>
					<br><label>유아/출산</label></td>
			</tr>
	
			<tr class="text-center">
				<td class="" onclick="location.href='${mainPet}'"><span class="material-symbols-outlined">pets</span>
					<br><label>반려동물상품</label></td>
				<td class="" onclick="location.href='${mainFurniture}'"><span class="material-symbols-outlined">bed</span>
					<br><label>가구</label></td>
				<td class="" onclick="location.href='${mainBeauty}'"><span class="material-symbols-outlined">face_retouching_natural</span>
					<br><label>뷰티/미용</label></td>
				<td class="" onclick="location.href='${mainOffice}'"><span class="material-symbols-outlined">print</span>
					<br><label>사무용품</label></td>
				<td class="" onclick="location.href='${mainArt}'"><span class="material-symbols-outlined">image</span>
					<br><label>예술/악기</label></td>
			</tr>
	
		</table>
		
		<br><br>
	
	
		<div style="margin-left:3rem;">
			<h2><b>실시간 상품</b></h2>
		</div>
		
		<table class="table">
		<c:if test="${not empty datas}">
			<tr class="text-center">
				<c:forEach items="${datas}" var="data" begin="0" end="4">
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
	
	</div>
	</section>
	
	<%@ include file="./module/footer.jsp" %>
	<!-- 네이버 로그인 callback URL -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>	
<script type="text/javascript">
		      var naverLogin  = new naver.LoginWithNaverId(
				   {
					   clientId : "q379z6OiAG3HfRfviHRi",
					   callbackUrl : "http://localhost/home/",
					   isPopup: false,
					   CallbackHandle:true
				   }
		   );
		   
		   naverLogin.init();
		   
		   window.addEventListener('load', function () {
				naverLogin.getLoginStatus(function (status) {
					if (status) {
						
						var email = naverLogin.user.getEmail();
						alert(email);
						console.log(naverLogin.user);
						if( email == undefined || email == null) {
							alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
							
							naverLogin.reprompt();
							return;
						}

					} else {
						console.log("callback 처리에 실패하였습니다.");
					}
					 //로그아웃을 위한 토큰
					 //https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_secret=zhGwpKJh8Z_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY&service_provider=NAVER
				});
			});
		   
		   
		   </script>
		    
</body>
</html>