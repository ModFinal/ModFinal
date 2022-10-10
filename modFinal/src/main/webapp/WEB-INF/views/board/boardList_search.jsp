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

	
	<section class="container" style="width:1250px;">
		
            <div class="search">
			  <div>
				<h2>'${scri.keyword}'상품 목록</h2>
			  </div>
			 </div> 
			<hr>
				<c:url var="boardDetailUrl" value="./detail">	
				</c:url>
			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="list">

					<div style="width:1250px; height:250px;" onclick="location.href='/home/board/detail?id=${list.bId}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
							 <img src="${list.url}" style="width:250px; height:250px;"> 
							</div>
						
							<div style="width:1000px; height:250px; background-color:darkgray; float:left;">
								<table style="width:1000px; height:250px; text-align:right;">
									<tr>
										<td style="width:100px;">${list.bTitle}</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">${list.pCondition} &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;"></td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">${list.dealMethod} &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width:100px;">${list.accountId}</td>
										<td style="width:750px;"></td>
										<td></td>
										<td></td>
										<td style="width:100px;">${list.price} &nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
					</div>
					<br><br>
					
				</c:forEach>
			</c:if>

			<!-- 데이터가 없을 경우 -->
			<c:if test="${list == null}">
				
					<div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}?id=${list.bId}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${list.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:darkgray; float:left;">
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
					<div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}?id=${list.bId}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${list.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:darkgray; float:left;">
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
					<br><br><div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}?id=${list.bId}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${list.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:darkgray; float:left;">
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
					<br><br><div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}?id=${list.bId}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${list.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:darkgray; float:left;">
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
					<br><br><div style="width:1250px; height:250px;" onclick="location.href='${boardDetailUrl}?id=${list.bId}'">
							<div style="width:250px; height:250px; background-color:skyblue; float:left; vertical-align:middle;">
								<img src="${list.url}" style="width:250px; height:250px;">
							</div>
							
							<div style="width:1000px; height:250px; background-color:darkgray; float:left;">
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
			
			
				<div>
		 <c:forEach begin="1" end="${pageNum}" var="num">
		      <span>
		     <a href="../board/boardList_search?num=${num}">${num}</a>
		  </span>
		 </c:forEach>
		</div>
		
		<section>
		   <div>
		   <ul>
		    <c:if test="${pageMaker.prev}">
		     <li><a href="boardList_search${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if>   
		    
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		     <li><a href="boardList_search${pageMaker.makeSearch(idx)}">${idx}</a></li>
		    </c:forEach>
		      
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		     <li><a href="boardList_search${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if>   
		   </ul>
			</div>
		
		   </section>
		   
		  
		   
	</section>
	
	<footer><%@ include file="../module/footer.jsp" %></footer>
</body>
</html>