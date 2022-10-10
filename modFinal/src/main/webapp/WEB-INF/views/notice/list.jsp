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
	<title>공지사항</title>
	<%@ include file="../module/head.jsp" %>
	
	 <style type="text/css">
	 
	  .pointer:hover {
	    cursor: pointer;
	    background:rgba(175,224,254,.4);;
	  }
	  
	  </style>
</head>
<body>
 <header>
    <%@ include file="../module/navigation.jsp" %>
 </header>
	<%@ include file="../module/categoryNavigation.jsp" %>

<section class="container">
 <div class="mb-2 mt-5">
  <c:url var="noticeUrl" value="/notice"/>
  <form action="${noticeUrl}" method="get">
    <div class="row">
	  <h5 class="col-10 mt-3">공지사항 <i class="bi bi-megaphone"></i></h5> 
	    <div class="col-1 " style="padding-left:18px">

  <c:if test="${loginData.admin == 'Y'}">    
     	    <button class="btn btn-primary" type="button" onclick="location.href='${noticeUrl}/add'">글 작성</button>  	    
 </c:if>
	    </div>
        <div class="col-1 " style="padding-left:0px"> 
         <select class="form-select" onchange="location.href='${noticeUrl}?pageCount=' + this.value">
             <option value="5"  ${sessionScope.pageCount == 5 ? 'selected' : ''}> 5 개</option>
             <option value="10" ${sessionScope.pageCount == 10 ? 'selected' : ''}> 10 개</option>
             <option value="15" ${sessionScope.pageCount == 15 ? 'selected' : ''}> 15 개</option>
             <option value="20" ${sessionScope.pageCount == 20 ? 'selected' : ''}> 20 개</option>
         </select>
        </div> 
    </div> 
  </form>  
 </div> 
 
<!--테이블 -->
<table class="table table-hover">
 <colgroup>
	<col class="col-1">
	<col class="col-auto">
	<col class="col-2">
	<col class="col-2">
 </colgroup>
	<thead>
	  <tr> 
	    <th>번 호</th>
	    <th>제 목</th>
	    <th>작 성 자</th>
	    <th>작 성 일</th> 
	  </tr>
	</thead>
<!-- 로케이션주소 체크 -->
<!-- td 값 -->
	<tbody class="pointer">  	   
	   <c:if test="${not empty datas}">
		   <c:forEach items="${datas}" var="data">
		     <c:url value="/notice/detail" var="noticeDetailUrl" >
		        <c:param name="id">${data.notId}</c:param>
		      </c:url>
			      <tr onclick="location.href='${noticeDetailUrl}'">
			        <td>${data.notId}</td>
			        <td>${data.title}</td> 
			        <td>운영자</td>
			        <td>${data.createDate}</td>
			      </tr>
		   </c:forEach>
		 </c:if>
	 </tbody> 	  
  </table>


   <nav> 
     <div>     	   
       	<ul class="pagination justify-content-center">
       	 <c:url var="noticeUrl" value="/notice">
       	   <c:param name="id">${data.notId}</c:param>
       	</c:url>
			<c:if test="${pageData.hasPrevPage()}">
				<li class="page-item">
				  <a class="page-link" href="${noticeUrl}?page=${pageData.prevPageNumber}">Prev</a>
				</li>
			 </c:if>
				<c:forEach items="${pageData.getPageNumberList(pageData.currentPageNumber - 2, pageData.currentPageNumber + 2)}" var="num">
					<li class="page-item ${pageData.currentPageNumber eq num ? 'active' : ''}">
					   <a class="page-link" href="${noticeUrl}?page=${num}">${num}</a>
					</li>
				 </c:forEach>
				<c:if test="${pageData.hasNextPage()}">
				    <li class="page-item">
					   <a class="page-link" href="${noticeUrl}?page=${pageData.nextPageNumber}">Next</a>
	               </li>
	          </c:if>
           </ul>
     </div>  
    </nav>

 
 
 </section>

<!--하단페이지-->
<%@ include file="../module/footer.jsp" %>

 <script type="text/javascript">

 </script>
</body>
</html>