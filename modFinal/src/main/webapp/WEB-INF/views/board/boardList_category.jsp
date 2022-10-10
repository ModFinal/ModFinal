<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인화면</title>
	<%@ include file="../module/head.jsp" %>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
</head>
<body>
	<header><%@ include file="../module/navigation.jsp" %>
	<%@ include file="../module/categoryNavigation.jsp" %>
	</header>

	
	<section class="container" style="width:1250px;" >
		<div>
			<c:url var="boardUrl" value="./list" />
			<form action="${boardUrl}" method="get">
			<div>
				<h2>'${tData.cateName}'상품 목록</h2>
			</div>
			<hr>
			<c:if test="${not empty datas}">
				<c:forEach items="${datas}" var="data">
					<c:url var="boardDetailUrl" value="./detail">
							<c:param name="id">${data.bId}</c:param>
						</c:url>
					<div style="width:1250px; height:250px;" onclick="location.href='/home/board/detail?id=${data.bId}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="<%=request.getContextPath()%>${data.url}" style="width:250px; height:250px;">
							</div>
						
							<div style="width:1000px; height:250px; background-color:gray; float:left;">
								<table style="width:1000px; height:250px; text-align:right;">
									<tr>
										<td style="width:100px;">${data.bTitle}</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">${data.condt} &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;"></td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">${data.dealMethod} &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;">${data.userName}</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;"><fmt:formatNumber value="${data.price}" pattern="#,###원"/> &nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
					</div>
					<br><br>
					
				</c:forEach>
			</c:if>

			<!-- 데이터가 없을 경우 -->
			<c:if test="${datas == null}">
				
					<div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${data.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:gray; float:left;">
								<table style="width:1000px; height:250px; text-align:right;">
									<tr>
										<td style="width:100px;">게시글제목</td>
										<td style="width:750px;">${i}</td>
										<td></td>
										<td></td>
										<td style="width:100px;">새상품 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;"></td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">직거래 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;">판매자이름</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">000,000원 &nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
					</div>
					<br><br>
					<div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${data.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:gray; float:left;">
								<table style="width:1000px; height:250px; text-align:right;">
									<tr>
										<td style="width:100px;">게시글제목</td>
										<td style="width:750px;">${i}</td>
										<td></td>
										<td></td>
										<td style="width:100px;">새상품 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;"></td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">직거래 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;">판매자이름</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">000,000원 &nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
					</div>
					<br><br><div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${data.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:gray; float:left;">
								<table style="width:1000px; height:250px; text-align:right;">
									<tr>
										<td style="width:100px;">게시글제목</td>
										<td style="width:750px;">${i}</td>
										<td></td>
										<td></td>
										<td style="width:100px;">새상품 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;"></td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">직거래 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;">판매자이름</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">000,000원 &nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
					</div>
					<br><br><div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${data.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:gray; float:left;">
								<table style="width:1000px; height:250px; text-align:right;">
									<tr>
										<td style="width:100px;">게시글제목</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">새상품 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;"></td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">직거래 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;">판매자이름</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">000,000원 &nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
					</div>
					<br><br><div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${data.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:gray; float:left;">
								<table style="width:1000px; height:250px; text-align:right;">
									<tr>
										<td style="width:100px;">게시글제목</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">새상품 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;"></td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">직거래 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;">판매자이름</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">000,000원 &nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
					</div>
					<br><br>
			</c:if>
			
			<nav>
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pageData.hasPrevPage()}">
						<li class="page-item">
							<a class="page-link" href="${boardUrl}?type=${tData.cateId}&page=${pageData.prevPageNumber}">Prev</a>
						</li>
					</c:if>
					<c:forEach items="${pageData.getPageNumberList(pageData.currentPageNumber - 2, pageData.currentPageNumber + 2)}" var="num">
						<li class="page-item ${pageData.currentPageNumber eq num ? 'active' : ''}">
							<a class="page-link" href="${boardUrl}?type=${tData.cateId}&page=${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageData.hasNextPage()}">
						<li class="page-item">
							<a class="page-link" href="${boardUrl}?type=${tData.cateId}&page=${pageData.nextPageNumber}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			</nav>
			
			
		</form>
		</div>
	</section>
	
	<footer><%@ include file="../module/footer.jsp" %></footer>
</body>
</html>